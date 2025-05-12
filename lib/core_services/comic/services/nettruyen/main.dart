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
      Option(name: 'Tất cả', value: '-1'),
      Option(name: 'Hoàn thành', value: '2'),
      Option(name: 'Đang tiến hành', value: '1'),
    ],
  ),
  Filter(
    name: 'Sắp xếp',
    key: 'sort',
    multiple: false,
    options: [
      Option(name: 'Ngày cập nhật', value: ''),
      Option(name: 'Truyện mới', value: '15'),
      Option(name: 'Top all', value: '10'),
      Option(name: 'Top tháng', value: '11'),
      Option(name: 'Top tuần', value: '12'),
      Option(name: 'Top ngày', value: '13'),
      Option(name: 'Theo dõi', value: '20'),
      Option(name: 'Bình luận', value: '25'),
      Option(name: 'Số chapter', value: '30'),
      Option(name: 'Top follow', value: '19'),
    ],
  ),
];

class NetTruyenService extends ABComicService with ComicWatchPageGeneralMixin {
  @override
  bool? get $isAuth => false;

  @override
  final init = ServiceInit(
    name: 'NetTruyen',
    faviconUrl: OImage.from('https://i.imgur.com/idvPTML.png'),
    rootUrl: 'https://nettruyenvio.com/',
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
    return getCategory(
      categoryId: 'tim-truyen',
      page: page,
      filters: {
        'keyword': [keyword],
      },
    );
  }

  @override
  getCategory({required categoryId, required page, required filters}) async {
    if (filters['category']?.firstOrNull != null) {
      categoryId = 'tim-truyen/${filters['category']!.first}';
    }

    final url =
        '$baseUrl/${categoryId.replaceAll('_', '/')}${page > 1 ? '?page=$page' : ''}';

    final $ = await fetch$(
      buildQueryUri(url, filters: filters).toString(),
      headless: true,
      query: UrlSearchParams.fromMap({
        'sort': filters['sort'],
        'status': filters['status'],
        'keyword': filters['keyword'],
      }),
    );

    final data = $(
      '.row > .item',
    ).map((element) => _parseComic(element, baseUrl));

    final lastPageLink = $('.pagination li a').eq(-2).attr('href');
    final maxPage =
        lastPageLink.isNotEmpty
            ? int.tryParse(
                  RegExp(r'page=(\d+)').firstMatch(lastPageLink)?.group(1) ??
                      '1',
                ) ??
                1
            : 1;

    return ComicCategory(
      name: $('h1', single: true).text(),
      url: url,
      items: data.toList(),
      page: page,
      totalItems: data.length * maxPage,
      totalPages: maxPage,
      filters: [
        Filter(
          name: 'Thể loại',
          key: 'category',
          multiple: false,
          options:
              $('.dropdown-genres option').map((option) {
                final name = option.text();
                var value = option.attr('value').split('/').last;
                if (value == 'tim-truyen') value = '';

                return Option(
                  name: name,
                  value: value,
                  selected: filters['category']?.first == value,
                );
              }).toList(),
        ),
        ...globalFilters,
      ],
    );
  }

  @override
  ComicParam parseURL(String url) {
    // TODO: implement parseURL
    throw UnimplementedError();
  }
}
