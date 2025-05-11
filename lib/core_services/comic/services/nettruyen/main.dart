import 'dart:convert';

import 'package:hoyomi/core_services/comic/main.dart';
import 'package:hoyomi/utils/d_query.dart';
import 'package:intl/intl.dart';

import 'package:hoyomi/utils/time_utils.dart';

final List<Filter> globalFilters = [
  Filter(
    name: 'Trạng thái',
    key: 'status',
    multiple: false,
    options: [
      Option(name: 'Đang tiến hành', value: '0'),
      Option(name: 'Hoàn thành', value: '1'),
    ],
  ),
  Filter(
    name: 'Quốc Gia',
    key: 'country',
    multiple: false,
    options: [
      Option(name: 'Trung Quốc', value: '1'),
      Option(name: 'Hàn Quốc', value: '2'),
      Option(name: 'Nhật Bản', value: '3'),
      Option(name: 'Việt Nam', value: '4'),
      Option(name: 'Hoa Kỳ', value: '5'),
    ],
  ),
  Filter(
    name: 'Sắp Xếp',
    key: 'sort',
    multiple: false,
    options: [
      Option(name: 'Ngày đăng giảm dần', value: '0'),
      Option(name: 'Ngày đăng tăng dần', value: '1'),
      Option(name: 'Ngày cập nhật giảm dần', value: '2'),
      Option(name: 'Ngày cập nhật tăng dần', value: '3'),
      Option(name: 'Lượt xem giảm dần', value: '4'),
      Option(name: 'Lượt xem tăng dần', value: '5'),
    ],
  ),
];

class NetTruyenService extends ABComicService with ComicWatchPageGeneralMixin {
  @override
  bool? get $isAuth => false;

  @override
  final init = ServiceInit(
    name: 'NetTruyen',
    faviconUrl: OImage(src: '/favicon.ico'),
    rootUrl: 'https://nettruyenvio.com/',
    rss: '/rss.html',
  );

  // Utils
  Comic _parseComic(DQuery itemComic, String referer) {
    final comicId = itemComic.queryOne('a').attr('href').split('/').last;
    final $image = itemComic.queryOne('img');
    final image = OImage(
      src: $image.data('original'),
      headers: Headers({'referer': referer}),
    );
    final name =
        itemComic.queryOne('h3').textRaw() ??
        itemComic.queryOne('img').attr('alt');

    final chapter$ = itemComic.queryOne('.slide-caption > a, .chapter > a');
    final lastChap =
        chapter$.isNotEmpty
            ? ComicChapter(
              name: chapter$.text().trim(),
              chapterId: chapter$.attr('href').split('/').last,
            )
            : null;

    final timeAgoElement = itemComic.queryOne('.time');
    final timeAgo =
        timeAgoElement.isNotEmpty
            ? convertTimeAgoToUtc(timeAgoElement.text().trim())
            : null;

    final description = itemComic.queryOne('.box_text').text();

    final message$ = itemComic.query('.message_main > p');

    final originalName = message$
        .containsOne('Thể loại:')
        .text()
        .replaceFirst('Thể loại:', '');
    final notice = message$
        .containsOne('Tình trạng:')
        .text()
        .replaceFirst('Tình trạng:', '');

    return Comic(
      image: image,
      lastChap: lastChap,
      lastUpdate: timeAgo,
      notice: (notice.isEmpty ? null : notice),
      name: name,
      originalName: originalName,
      comicId: comicId,
      description: description,
    );
  }

  // Main
  @override
  home() async {
    final $ = await fetch$(baseUrl);

    return ComicHome(
      // carousel: ComicCarousel(
      //   aspectRatio: 679 / 350,
      //   maxHeightBuilder: 0.4,
      //   items:
      //       $('#ctl00_divAlt1 .item').map((element) {
      //         final item = _parseComic(element, baseUrl);

      //         return ComicCarouselItem(
      //           image: item.image,
      //           description: item.description,
      //           notice: item.notice,
      //           comicId: item.comicId,
      //           name: item.name,
      //           originalName: item.originalName,
      //         );
      //       }).toList(),
      // ),
      categories: [
        HomeComicCategory(
          items:
              $(
                '#ctl00_divAlt1 .item',
              ).map((element) => _parseComic(element, baseUrl)).toList(),
          // gridView: true,
          name: 'Đề cử',
        ),
        HomeComicCategory(
          items:
              $(
                '#ctl00_divCenter .row > .item',
              ).map((element) => _parseComic(element, baseUrl)).toList(),
          gridView: true,
          name: 'Mới Cập Nhật',
          categoryId: 'truyen-moi-cap-nhat',
        ),
        HomeComicCategory(
          items:
              $(
                '#topMonth li',
              ).map((element) => _parseComic(element, baseUrl)).toList(),
          name: 'Top tháng',
        ),
        HomeComicCategory(
          items:
              $(
                '#topWeek li',
              ).map((element) => _parseComic(element, baseUrl)).toList(),
          name: 'Top tuần',
        ),
        HomeComicCategory(
          items:
              $(
                '#topDay li',
              ).map((element) => _parseComic(element, baseUrl)).toList(),
          name: 'Top ngày',
        ),
      ],
    );
  }

  @override
  Future<MetaComic> getDetails(String comicId) async {
    final $ = await fetch$('$baseUrl/truyen-tranh/$comicId');

    final String name = $('.title-detail', single: true).text();
    final OImage image = OImage(
      src: $('.col-image > img', single: true).data('src'),
      headers: Headers({'referer': baseUrl}),
    );

    final tales = $('.list-info > li');

    final author = tales.containsOne('Tác giả').queryOne('.col-xs-8').textRaw();
    // final translator = _getInfoTale(tales, 'Dịch Giả:')?.textRaw();
    final status$ =
        tales
            .containsOne('Tình trạng')
            .queryOne('.col-xs-8')
            .textRaw()
            ?.toLowerCase() ??
        'Unknown';
    final status =
        status$ == 'đang cập nhật'
            ? StatusEnum.ongoing
            : status$ == 'unknown'
            ? StatusEnum.unknown
            : StatusEnum.completed;
    // final views = int.tryParse(
    //   _getInfoTale(tales, 'Lượt Xem:')?.textRaw()?.replaceAll(',', '') ?? '',
    // );
    // final likes = int.tryParse(
    //   _getInfoTale(tales, 'Theo Dõi:')?.textRaw()?.replaceAll(',', '') ?? '',
    // );

    // final rate$ =
    //     JsonDecoder().convert(
    //           $(
    //                 'script[type=\'application/ld+json\']',
    //                 single: true,
    //               ).textRaw() ??
    //               '{}',
    //         )
    //         as Map<String, dynamic>;

    final rate = RateValue(
      best: int.parse($('[itemprop="bestRating"]').text()),
      count: int.parse($('[itemprop="ratingCount"]').text()),
      value: double.parse($('[itemprop="ratingValue"]').text()),
    );

    final genres = tales
        .containsOne('Thể loại')
        .query('a')
        .map(
          (anchor) => Genre(
            name: anchor.text(),
            genreId: 'tim-truyen_${anchor.attr('href').split('/').last}',
          ),
        );
    final description = $('.detail-content', single: true).html();

    final chaptersJson =
        jsonDecode(
              await fetch(
                '$baseUrl/Comic/Services/ComicService.asmx/ChapterList?slug=$comicId',
              ),
            )['data']
            as List;

    final chaps = chaptersJson.map((chapter) {
      final name = chapter['chapter_name'];
      final chapterId = chapter['chapter_slug'];

      final time$ = chapter['updated_at'] as String?;
      final time =
          time$ != null ? DateFormat('yyyy-MM-dd hh:mm:ss').parse(time$) : null;

      return ComicChapter(name: name, chapterId: chapterId, time: time);
    });
    final lastModified = DateFormat(
      'yyyy-MM-dd hh:mm:ss',
    ).parse($('time').text().split(': ').last.split(']').first.trim());

    return MetaComic(
      name: name,
      image: image,
      author: author,
      // translator: translator,
      status: status,
      // views: views,
      // likes: likes,
      rate: rate,
      genres: genres.toList(),
      description: description,
      chapters: chaps.toList(),
      lastModified: lastModified,
      originalName: null,
    );
  }

  @override
  getComicModes(comic) {
    if (comic.genres.any(
      (genre) => genre.name == 'Manga' || genre.name == 'Anime',
    )) {
      return ComicModes.rightToLeft;
    }

    return ComicModes.webToon;
  }

  @override
  String getURL(comicId, {chapterId}) {
    return '${baseUrl}truyen-tranh/$comicId${chapterId != null ? '/$chapterId' : ''}';
  }

  @override
  Future<List<OImage>> getPages(String manga, String chap) async {
    final $ = await fetch$(getURL(manga, chapterId: chap));

    return $('.page-chapter > img').map((img) {
      final src =
          img.attrRaw('data-sv2') ?? img.attrRaw('data-sv1') ?? img.attr('src');

      return OImage(src: src, headers: Headers({'referer': baseUrl}));
    }).toList();
  }

  @override
  getSuggest(comic, {page = 1}) async {
    final metaSlugs =
        comic.genres
            .map((c) => c.genreId.replaceFirst('tim-truyen_', ''))
            .toSet();

    final pageData = await getCategory(
      categoryId: metaSlugs.first,
      page: 1,
      filters: {},
    );

    return pageData.items.take(30).toList();
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

    final categories = $('.list_item_home');

    final data = categories
        .first()
        .query('.item_home')
        .map((element) => _parseComic(element, baseUrl));

    final lastPageLink = $('.pagination > a:last-child', single: true);
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
      '.list_item_home, .list_grid',
      single: true,
    ).query('.item_home').map((element) => _parseComic(element, baseUrl));

    final lastPageLink = $(
      '.pagination > a:last-child',
      single: true,
    ).attr('href');
    final maxPage =
        lastPageLink.isNotEmpty
            ? int.tryParse(
                  RegExp(r'trang-(\d+)').firstMatch(lastPageLink)?.group(1) ??
                      '1',
                ) ??
                1
            : 1;

    return ComicCategory(
      name: $('.title_cate', single: true).text(),
      url: url,
      items: data.toList(),
      page: page,
      totalItems: data.length * maxPage,
      totalPages: maxPage,
      filters: globalFilters,
    );
  }

  @override
  ComicParam parseURL(String url) {
    // TODO: implement parseURL
    throw UnimplementedError();
  }
}
