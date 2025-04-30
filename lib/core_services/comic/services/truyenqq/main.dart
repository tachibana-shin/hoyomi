import 'dart:convert';
import 'dart:math';

import 'package:hoyomi/core_services/comic/interfaces/main.dart';
import 'package:hoyomi/core_services/comic/services/truyengg/main.dart';
import 'package:hoyomi/core_services/service.dart';
import 'package:hoyomi/utils/d_query.dart';
import 'package:hoyomi/utils/time_utils.dart';
import 'package:intl/intl.dart';

String _generateRandomHex(int length) {
  const hexChars = '0123456789abcdef';
  final random = Random();
  return List.generate(
    length,
    (_) => hexChars[random.nextInt(hexChars.length)],
  ).join();
}

class TruyenQQService extends TruyenGGService {
  @override
  // ignore: overridden_fields
  final init = ServiceInit(
    name: 'TruyenQQ',
    faviconUrl: OImage(src: 'https://i.imgur.com/yX8CCPe.png'),
    rootUrl: 'https://truyenqqgo.com',
    rss: '/rss.html',
    settings: [
      FieldInput(
        name: 'Visit Read ID',
        key: 'visit_read',
        placeholder: '<13 char>-<13 char>',
        defaultFn: (_) => '${_generateRandomHex(13)}-${_generateRandomHex(13)}',
        maxLines: 1,
        appear: true,
        description: 'The cookie value to use when reading comics.',
      ),
    ],
    onBeforeInsertCookie: (String? cookie) {
      cookie ??= '';

      return 'visit-read=${_generateRandomHex(13)}-${_generateRandomHex(13)}; $cookie';
    },
    webRules: [
      WebRule(
        shortRegexFilter: 'i\\.hinhhinh\\.com',
        referer: 'https://truyenqqgo.com',
      ),
      WebRule(regexFilter: '#truyenqq|', referer: 'https://truyenqqgo.com'),
    ],
  );

  // Utils
  @override
  Comic parseComic(DQuery itemComic, String referer) {
    final String comicId = itemComic
        .queryOne('a')
        .attr('href')
        .split('/')
        .last
        .replaceFirst('.html', '');
    final $image = itemComic.queryOne('img');
    final OImage image = OImage(
      src: $image.attr('src'),
      headers: Headers({'referer': referer}),
    );
    final String name =
        (itemComic.queryOne('.book_name a').textRaw() ??
            itemComic.queryOne('img').attr('alt'));

    final ComicChapter lastChap = ComicChapter(
      name: itemComic.queryOne('.last_chapter > a').text(),
      chapterId: itemComic
          .queryOne('.cl99, .last_chapter > a')
          .attr('href')
          .split('/')
          .last
          .replaceFirst('$comicId-', '')
          .replaceFirst('.html', ''),
    );

    final timeAgoElement = itemComic.queryOne('.time-ago');
    final timeAgo =
        timeAgoElement.isNotEmpty
            ? convertTimeAgoToUtc(timeAgoElement.text())
            : null;
    final String? notice = itemComic.queryOne('.type-label').textRaw();

    final rateValueText = itemComic.queryOne('.rate-star').textRaw();
    final double? rate =
        rateValueText != null ? double.tryParse(rateValueText) : null;

    return Comic(
      image: image,
      lastChap: lastChap,
      lastUpdate: timeAgo,
      notice: notice,
      name: name,
      comicId: comicId,
      rate: rate,
      originalName: null,
    );
  }

  @override
  home() async {
    final $ = await fetch$(baseUrl);

    return ComicHome(categories: [
      HomeComicCategory(
        items:
            $(
              '#list_suggest > li',
            ).map((element) => parseComic(element, baseUrl)).toList(),
        name: 'Truyện Hay',
      ),
      HomeComicCategory(
        items:
            $(
              '#list_new > li',
            ).map((element) => parseComic(element, baseUrl)).toList(),
        name: 'Truyện Mới Cập Nhật',
        categoryId: 'truyen-moi-cap-nhat',
      ),
    ]);
  }

  @override
  Future<MetaComic> getDetails(String comicId) async {
    final $ = await fetch$('$baseUrl/truyen-tranh/$comicId.html');

    final String name = $('h1[itemprop=name]', single: true).text();
    final OImage image = OImage(
      src: $('.book_avatar img', single: true).attr('src'),
      headers: Headers({'referer': baseUrl}),
    );

    final tales = $('.list-info > li');

    final originalName = _getInfoTale(tales, 'Tên khác')?.textRaw();
    final author = _getInfoTale(tales, 'Tác giả')?.textRaw();
    final translator = _getInfoTale(tales, 'Dịch giả')?.textRaw();
    final status$ =
        _getInfoTale(tales, 'Tình trạng')?.textRaw()?.toLowerCase() ??
        'unknown';
    final status =
        status$ == 'đang cập nhật'
            ? StatusEnum.ongoing
            : status$ == 'unknown'
            ? StatusEnum.unknown
            : StatusEnum.completed;

    final views = int.tryParse(
      _getInfoTale(tales, 'Lượt xem')?.textRaw()?.replaceAll(',', '') ?? '',
    );
    final likes = int.tryParse(
      _getInfoTale(tales, 'Lượt theo dõi')?.textRaw()?.replaceAll(',', '') ??
          '',
    );

    final rate$ =
        JsonDecoder().convert(
              $(
                    'script[type=\'application/ld+json\']',
                    single: true,
                  ).textRaw() ??
                  '{}',
            )
            as Map<String, dynamic>;

    final rate =
        rate$.containsKey('aggregateRating')
            ? RateValue(
              best: int.parse('${rate$['aggregateRating']['bestRating']}'),
              count: int.parse(rate$['aggregateRating']['ratingCount']),
              value: double.parse(rate$['aggregateRating']['ratingValue']),
            )
            : null;

    final genres = $('.list01 a').map(
      (anchor) => Genre(
        name: anchor.text(),
        genreId:
            'the-loai*${anchor.attr('href').split('/').last.replaceFirst('.html', '')}',
      ),
    );
    final description = $('.story-detail-info', single: true).text();
    final chapters = $('.works-chapter-item').map((chap) {
      final name = chap.queryOne('a').text();
      final chapterId = chap
          .queryOne('a')
          .attr('href')
          .split('/')
          .last
          .replaceFirst('$comicId-', '')
          .replaceFirst('.html', '');

      final time$ = chap.queryOne('.time-chap').textRaw();
      final time =
          time$ != null ? DateFormat('dd/MM/yyyy').tryParse(time$) : null;

      return ComicChapter(name: name, chapterId: chapterId, time: time);
    });
    final lastModified =
        rate$.containsKey('dateModified')
            ? DateTime.parse(rate$['dateModified'])
            : DateFormat(
              'dd/MM/yyyy',
            ).parse($('.time-chap', single: true).text());

    return MetaComic(
      name: name,
      originalName: originalName,
      image: image,
      author: author,
      translator: translator,
      status: status,
      views: views,
      likes: likes,
      rate: rate,
      genres: genres.toList(),
      description: description,
      chapters: chapters.reversed.toList(),
      lastModified: lastModified,
    );
  }

  @override
  Future<List<OImage>> getPages(String manga, String chap) async {
    final $ = await fetch$(getURL(manga, chapterId: chap));

    return $('.chapter_content img').map((img) {
      final src = img.attr('src') + (kIsWeb ? '#truyenqq' : '');

      return OImage(src: src, headers: Headers({'referer': baseUrl}));
    }).toList();
  }

  DQuery? _getInfoTale(DQuery tales, String name) {
    return tales
        .findOne(($el) => $el.queryOne('.name').text().contains(name))
        .queryOne('.name');
  }

  @override
  search({
    required keyword,
    required page,
    required filters,
    required quick,
  }) async {
    final url =
        '$baseUrl/tim-kiem${page > 1 ? '/trang-$page' : ''}.html?q=$keyword';
    final $ = await fetch$(url);

    final data = $(
      '.list_grid_out li',
    ).map((element) => parseComic(element, baseUrl));

    final lastPageLink = $('.page_redirect > a:last-child', single: true);
    final lastPageLinkText =
        lastPageLink.attrRaw('href') ?? lastPageLink.textRaw();
    final maxPage =
        lastPageLinkText?.isNotEmpty == true
            ? int.parse(
              !lastPageLinkText!.contains('javascript')
                  ? RegExp(
                    r'trang-(\d+)',
                  ).firstMatch(lastPageLinkText)!.group(1)!
                  : lastPageLink.textRaw() ?? '1',
            )
            : 1;

    return ComicCategory(
      name: '',
      url: url,
      items: data.toList(),
      page: page,
      totalItems: data.length * maxPage,
      totalPages: maxPage,
    );
  }

  @override
  getCategory({required categoryId, required page, required filters}) async {
    final url =
        '$baseUrl/${categoryId.replaceAll('*', '/')}${page > 1 ? '/trang-$page' : ''}.html';

    final $ = await fetch$(buildQueryUri(url, filters: filters).toString());

    final data = $(
      '.list_grid_out li',
    ).map((element) => parseComic(element, baseUrl));

    final lastPageLink = $(
      '.page_redirect > a:last-child',
      single: true,
    ).attrRaw('href');
    final maxPage =
        lastPageLink != null
            ? int.parse(
              RegExp(r'trang-(\d+)').firstMatch(lastPageLink)!.group(1)!,
            )
            : 1;

    return ComicCategory(
      name: $('.title_cate, .text_list_update', single: true).text(),
      url: url,
      description: $('tags_detail', single: true).text(),
      items: data.toList(),
      page: page,
      totalItems: data.length * maxPage,
      totalPages: maxPage,
      filters: globalFilters,
    );
  }
}
