import 'dart:convert';

import 'package:hoyomi_bridge/export.dart';

import 'compiler/lib_eval.dart';

const List<Filter> globalFilters = [
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

class NetTruyenService extends ABComicService {
  @override
  ServiceInit get init => ServiceInit(
    name: 'NetTruyen',
    faviconUrl: OImage.from('https://i.imgur.com/idvPTML.png'),
    rootUrl: 'https://nettruyenvio.com/',
    captchaUrl: () => '/tim-truyen?keyword=tonikaku',
  );

  // Utils
  Comic _parseComic(DQuery itemComic, String referer) {
    final comicId = itemComic.queryOne('a').attr('href').split('/').last;
    final dimage = itemComic.queryOne('img');
    final image = OImage(
      src: dimage.data('original'),
      headers: Headers({'referer': referer}),
    );
    final name =
        itemComic.queryOne('h3').textRaw() ??
        itemComic.queryOne('img').attr('alt');

    final chapterd = itemComic.queryOne('.slide-caption > a, .chapter > a');
    final lastChap =
        chapterd.isNotEmpty
            ? ComicChapter(
              name: chapterd.text().trim(),
              chapterId: chapterd.attr('href').split('/').last,
              order: -1,
            )
            : null;

    final timeAgoElement = itemComic.queryOne('.time');
    final timeAgo =
        timeAgoElement.isNotEmpty
            ? TimeUtils.convertTimeAgoToUtc(timeAgoElement.text().trim())
            : null;

    final description = itemComic.queryOne('.box_text').text();

    final messaged = itemComic.q('.message_main > p');

    final originalName = messaged
        .containsOne('Thể loại:')
        .text()
        .replaceFirst('Thể loại:', '');
    final notice = messaged
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
    final d = (await fetchQ(baseUrl));
    return ComicHome(
      carousel: ComicCarousel(
        aspectRatio: 679 / 350,
        maxHeightBuilder: 0.4,
        items:
            d.q('#ctl00_divAlt1 .item').map((element) {
              final item = _parseComic(element, baseUrl);

              return ComicCarouselItem(
                image: item.image,
                description: item.description,
                notice: item.notice,
                comicId: item.comicId,
                name: item.name,
                originalName: item.originalName,
              );
            }).toList(),
      ),
      categories: [
        HomeComicCategory(
          items:
              d
                  .q('#ctl00_divAlt1 .item')
                  .map((element) => _parseComic(element, baseUrl))
                  .toList(),
          gridView: true,
          name: 'Đề cử',
        ),
        HomeComicCategory(
          items:
              d
                  .q('#ctl00_divCenter .row > .item')
                  .map((element) => _parseComic(element, baseUrl))
                  .toList(),
          gridView: true,
          name: 'Mới Cập Nhật',
          categoryId: 'truyen-moi-cap-nhat',
        ),
        HomeComicCategory(
          items:
              d
                  .q('#topMonth li')
                  .map((element) => _parseComic(element, baseUrl))
                  .toList(),
          name: 'Top tháng',
        ),
        HomeComicCategory(
          items:
              d
                  .q('#topWeek li')
                  .map((element) => _parseComic(element, baseUrl))
                  .toList(),
          name: 'Top tuần',
        ),
        HomeComicCategory(
          items:
              d
                  .q('#topDay li')
                  .map((element) => _parseComic(element, baseUrl))
                  .toList(),
          name: 'Top ngày',
        ),
      ],
    );
  }

  @override
  Future<MetaComic> getDetails(String comicId) async {
    final d = (await fetchQ('$baseUrl/truyen-tranh/dcomicId'));

    final String name = d.q('.title-detail', single: true).text();
    final OImage image = OImage(
      src: d.q('.col-image > img', single: true).data('src'),
      headers: Headers({'referer': baseUrl}),
    );

    final tales = d.q('.list-info > li');

    final author = tales.containsOne('Tác giả').queryOne('.col-xs-8').textRaw();
    // final translator = _getInfoTale(tales, 'Dịch Giả:')?.textRaw();
    final statusd =
        tales
            .containsOne('Tình trạng')
            .queryOne('.col-xs-8')
            .textRaw()
            ?.toLowerCase() ??
        'unknown';
    final status =
        statusd == 'đang cập nhật'
            ? StatusEnum.ongoing
            : statusd == 'unknown'
            ? StatusEnum.unknown
            : StatusEnum.completed;
    // final views = int.tryParse(
    //   _getInfoTale(tales, 'Lượt Xem:')?.textRaw()?.replaceAll(',', '') ?? '',
    // );
    // final likes = int.tryParse(
    //   _getInfoTale(tales, 'Theo Dõi:')?.textRaw()?.replaceAll(',', '') ?? '',
    // );

    // final rated =
    //     JsonDecoder().convert(
    //           d.q(
    //                 'script[type=\'application/ld+json\']',
    //                 single: true,
    //               ).textRaw() ??
    //               '{}',
    //         )
    //         as Map<String, dynamic>;

    final rate = RateValue(
      best: int.parse(d.q('[itemprop="bestRating"]').text()),
      count: int.parse(d.q('[itemprop="ratingCount"]').text()),
      value: double.parse(d.q('[itemprop="ratingValue"]').text()),
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
    final description = d.q('.detail-content', single: true).html();

    final chaptersJson =
        jsonDecode(
              await fetch(
                '/Comic/Services/ComicService.asmx/ChapterList?slug=dcomicId',
              ),
            )['data']
            as List;

    final chaps = chaptersJson.map((chapter) {
      final name = chapter['chapter_name'];
      final chapterId = chapter['chapter_slug'];

      final timed = chapter['updated_at'] as String?;
      final time =
          timed != null ? DateFormat('yyyy-MM-dd hh:mm:ss').parse(timed) : null;

      return ComicChapter(
        name: name,
        chapterId: chapterId,
        time: time,
        order: (chapter['chapter_num'] as num).toInt(),
      );
    });
    final lastModified = DateFormat(
      'yyyy-MM-dd hh:mm:ss',
    ).parse(d.q('time').text().split(': ').last.split(']').first.trim());

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
  String getComicModes(MetaComic comic) {
    for (final genre in comic.genres) {
      if (genre.name == 'Manga' || genre.name == 'Anime') {
        return ComicModes.rightToLeft;
      }
    }

    return ComicModes.webToon;
  }

  @override
  String getURL(comicId, {chapterId}) {
    return '${baseUrl}truyen-tranh/dcomicId${chapterId != null ? '/dchapterId' : ''}';
  }

  @override
  Future<List<OImage>> getPages(String manga, String chap) async {
    final d = (await fetchQ(getURL(manga, chapterId: chap)));

    return d.q('.page-chapter > img').map((img) {
      final src =
          img.attrRaw('data-sv2') ?? img.attrRaw('data-sv1') ?? img.attr('src');

      return OImage(src: src, headers: Headers({'referer': baseUrl}));
    }).toList();
  }

  @override
  Future<List<Comic>> getSuggest(MetaComic comic, {int? page}) async {
    final metaSlugs =
        (comic.genres as List<Genre>)
            .map((c) => (c.genreId as String).replaceFirst('tim-truyen_', ''))
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
  Future<ComicCategory> getCategory({
    required String categoryId,
    required int page,
    required Map<String, List<String>?> filters,
  }) async {
    if (filters['category']?.firstOrNull != null) {
      categoryId = 'tim-truyen/${filters['category']!.first}';
    }

    final url = '$baseUrl/${categoryId.replaceAll('_', '/')}';

    if (page > 1) filters['page'] = ['$page'];

    final d = (await fetchQ(
      url + '?' + UrlSearchParams(params: filters).toQuery(),
      headless: true,
      query: UrlSearchParams.fromMap({
        'sort': filters['sort'],
        'status': filters['status'],
        'keyword': filters['keyword'],
      }),
    ));

    final data = d
        .q('.row > .item')
        .map((element) => _parseComic(element, baseUrl));

    final lastPageLink = d.q('.pagination li a').eq(-2).attr('href');
    final maxPage =
        lastPageLink.isNotEmpty
            ? int.tryParse(
                  RegExp(r'page=(\d+)').firstMatch(lastPageLink)?.group(1) ??
                      '1',
                ) ??
                1
            : 1;

    final options = <Option>[];

    for (final option in d.q('.dropdown-genres option').toList()) {
      final name = (option as DQuery).text();
      var value = (option as DQuery).attr('value').split('/').last;
      if (value == 'tim-truyen') value = '';

      options.add(
        Option(
          name: name,
          value: value,
          selected: filters['category']?.first == value,
        ),
      );
    }

    return ComicCategory(
      name: d.q('h1', single: true).text(),
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
          options: options,
        ),
      ]..addAll(globalFilters),
    );
  }

  @override
  ComicParam parseURL(String url) {
    // TODO: implement parseURL
    throw UnimplementedError();
  }
}
