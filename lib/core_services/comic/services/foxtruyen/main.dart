import 'dart:convert';
import 'dart:math';

import 'package:dio/dio.dart' show DioException;
import 'package:hoyomi/core_services/comic/main.dart';
import 'package:hoyomi/core_services/exception/user_not_found_exception.dart';
import 'package:hoyomi/core_services/exception/captcha_required_exception.dart';
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

class FoxTruyenService extends ABComicService
    with ComicAuthMixin, ComicCommentMixin, ComicFollowMixin {
  @override
  bool? get $isAuth => true;

  @override
  final init = ServiceInit(
    name: 'FoxTruyen',
    faviconUrl: OImage(src: '/favicon.ico'),
    rootUrl: 'https://foxtruyen.com',
    customCookie: 'type_comic=1; {OLD_COOKIE}',
  );

  @override
  fetch(
    String url, {
    String? method,
    String? cookie,
    UrlSearchParams? query,
    Map<String, dynamic>? body,
    Headers? headers,
    bool notify = true,
    bool headless = true,
    bool cache = true,
  }) async {
    for (int i = 0; i < 5; i++) {
      try {
        return await super.fetch(
          url,
          method: method,
          cookie: cookie,
          query: query,
          body: body,
          headers: headers,
          notify: false,
        );
      } on CaptchaRequiredException {
        if (i == 4) {
          rethrow;
        } else {
          await Future.delayed(
            Duration(milliseconds: Random().nextInt(100) + 100),
          );
          continue;
        }
      } catch (error) {
        rethrow;
      }
    }

    throw UnimplementedError();
  }

  final Map<String, String> _comicCachedStore = {};
  final Map<String, String> _episodeIdStore = {};

  // Utils
  Comic parseComic(DQuery itemComic, String referer) {
    final String comicId = itemComic
        .queryOne('a')
        .attr('href')
        .split('/')
        .last
        .replaceFirst('.html', '');
    final $image = itemComic.queryOne('img');
    final OImage image = OImage(
      src: $image.attr('data-src'),
      headers: Headers({'referer': referer}),
    );
    final String name =
        itemComic.queryOne('.comic_name').textRaw() ??
        itemComic.queryOne('img').attr('alt');

    final ComicChapter lastChap = ComicChapter(
      name: itemComic.queryOne('.cl99').text(),
      chapterId: itemComic
          .queryOne('.cl99')
          .attr('href')
          .split('/')
          .last
          .replaceFirst('.html', '')
          .replaceFirst('Chapter', 'chap'),
      order: -1,
    );

    final timeAgoElement = itemComic.queryOne('.time-ago');
    final timeAgo =
        timeAgoElement.isNotEmpty
            ? convertTimeAgoToUtc(timeAgoElement.text())
            : null;
    final String notice = itemComic.queryOne('.type-label').text();

    final rateValueText = itemComic.queryOne('.rate-star').text();
    final double? rate =
        rateValueText.isNotEmpty ? double.tryParse(rateValueText) : null;

    return Comic(
      image: image,
      lastChap: lastChap,
      lastUpdate: timeAgo,
      notice: (notice.isEmpty ? null : notice),
      name: name,
      comicId: comicId,
      rate: rate,
      originalName: null,
    );
  }

  // Main
  @override
  home() async {
    final $ = await fetch$(baseUrl);

    final categories = $('.list_item_home');

    return ComicHome(
      categories: [
        HomeComicCategory(
          items:
              categories
                  .first()
                  .query('.item_home')
                  .map((element) => parseComic(element, baseUrl))
                  .toList(),
          name: 'Mới Cập Nhật',
          categoryId: 'truyen-moi-cap-nhat',
        ),
        HomeComicCategory(
          items:
              categories
                  .eq(1)
                  .query('.item_home')
                  .map((element) => parseComic(element, baseUrl))
                  .toList(),
          name: 'Bình Chọn',
          categoryId: 'top-binh-chon',
        ),
        HomeComicCategory(
          items:
              categories
                  .eq(2)
                  .query('.item_home')
                  .map((element) => parseComic(element, baseUrl))
                  .toList(),
          name: 'Xem Nhiều',
          categoryId: 'top-thang',
        ),
      ],
    );
  }

  @override
  Future<MetaComic> getDetails(String comicId) async {
    final $ = parse$(
      _comicCachedStore[comicId] = await fetch(await getURL(comicId)),
    );

    final String name = $('h1[itemprop=name]', single: true).text();
    final OImage image = OImage(
      src: $('.thumbblock > img', single: true).attr('src'),
      headers: Headers({'referer': baseUrl}),
    );

    final tales = $('.info_tale > .row');

    final author = _getInfoTale(tales, 'Tác Giả:')?.textRaw();
    final translator = _getInfoTale(tales, 'Dịch Giả:')?.textRaw();
    final status$ =
        _getInfoTale(tales, 'Trạng Thái:')?.textRaw()?.toLowerCase() ??
        'Unknown';
    final status =
        status$ == 'đang cập nhật'
            ? StatusEnum.ongoing
            : status$ == 'unknown'
            ? StatusEnum.unknown
            : StatusEnum.completed;
    final views = int.tryParse(
      _getInfoTale(tales, 'Lượt Xem:')?.textRaw()?.replaceAll(',', '') ?? '',
    );
    final likes = int.tryParse(
      _getInfoTale(tales, 'Theo Dõi:')?.textRaw()?.replaceAll(',', '') ?? '',
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

    final genres = $('.clblue').map(
      (anchor) => Genre(
        name: anchor.text(),
        genreId:
            'the-loai*${anchor.attr('href').split('/').last.replaceFirst('.html', '')}',
      ),
    );
    final description = $('.story-detail-info', single: true).text();
    final chaps = $('.item_chap').toList().toList().reversed.indexed.map((
      entry,
    ) {
      final (index, chap) = entry;

      final name = chap.queryOne('a').text();
      final chapterId = chap
          .queryOne('a')
          .attr('href')
          .split('/')
          .last
          .replaceFirst('$comicId-', '')
          .replaceFirst('.html', '');

      final time$ = chap.queryOne('.cl99').textRaw();
      final time = time$ != null ? DateFormat('dd/MM/yyyy').parse(time$) : null;

      return ComicChapter(
        name: name,
        chapterId: chapterId,
        time: time,
        order: index,
      );
    });
    final lastModified =
        rate$.containsKey('dateModified')
            ? DateTime.parse(rate$['dateModified'])
            : DateFormat(
              'dd/MM/yyyy',
            ).parse($('div.w110.text-right > span > em', single: true).text());

    return MetaComic(
      name: name,
      image: image,
      author: author,
      translator: translator,
      status: status,
      views: views,
      likes: likes,
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

  DQuery? _getInfoTale(DQuery tales, String name) {
    return tales
        .findOne(
          (element) => element.queryOne('.name-title').text().contains(name),
        )
        .queryOne('p:last-child');
  }

  @override
  getURL(comicId, {chapterId}) async {
    return '$baseUrl/truyen-tranh/$comicId${chapterId != null ? '-$chapterId' : ''}.html';
  }

  @override
  Future<List<OImage>> getPages(String manga, String chap) async {
    final $ = await fetch$(await getURL(manga, chapterId: chap));

    _episodeIdStore[chap] = $('#episode_id', single: true).val();

    return $('.content_detail_manga > img').map((img) {
      final src = img.attr('src');

      return OImage(src: src, headers: Headers({'referer': baseUrl}));
    }).toList();
  }

  @override
  getComments(context, {page = 1}) async {
    final parentId = context.parent?.id ?? 0;

    var chapterId = context.chapterId;
    if (chapterId != null) {
      // pre-fetch
      chapterId =
          _episodeIdStore[chapterId] ??=
              (await fetch$(
                await getURL(context.comicId, chapterId: chapterId),
              ))('#episode_id', single: true).val();
    }

    final docB = parse$(await fetch(await getURL(context.comicId)));
    final $ =
        page == 1 && parentId == 0
            ? docB
            : await fetch$(
              '$baseUrl/frontend/comment/list',
              body: {
                (baseUrl.contains('gg') ? 'comic_id' : 'book_id'):
                    RegExp(r'(\d+)$').firstMatch(context.comicId)!.group(1)!,
                'parent_id': parentId,
                'team_id': docB('#team_id', single: true).val(),
                'token': docB('#csrf-token', single: true).val(),
                'page': page,
                'episode_id': chapterId,
              },
              headers: Headers({'x-requested-with': 'XMLHttpRequest'}),
            );

    final items = $('.info-comment').map((element) {
      final id =
          RegExp(r'child_(\d+)').firstMatch(element.className())!.group(1)!;

      final photoUrl =
          element.queryOne('.avartar-comment> img').attrRaw('data-src') ??
          element.queryOne('.avartar-comment> img').attr('src');
      final name = element.queryOne('.avartar-comment img').attr('alt');
      final time = convertTimeAgoToUtc(element.queryOne('.time').text());

      final content$ = element.queryOne('.content-comment').get(0);
      content$.querySelectorAll('img').forEach((image) {
        image.attributes['src'] =
            (image.attributes['data-src'] ?? image.attributes['src'])!;
      });

      final content = DQuery([content$]).html();

      final like = int.parse(element.queryOne('.total-like-comment').text());
      final dislike = int.parse(
        element.queryOne('.total-dislike-comment').textRaw() ?? '0',
      );

      final countReply$ = element.queryOne('.text-list-reply').text();
      final countReply =
          countReply$.isNotEmpty
              ? int.parse(
                RegExp(r'(\d+)').firstMatch(countReply$)?.group(0) ?? '0',
              )
              : 0;

      final canDelete = element.queryOne('.remove_comnent').isNotEmpty;

      return ComicComment(
        id: id,
        chapterId: chapterId,
        userId: name,
        name: name,
        photoUrl: OImage(src: photoUrl, headers: Headers({'referer': baseUrl})),
        content: content,
        countLike: like,
        countDislike: dislike,
        countReply: countReply,
        timeAgo: time,
        canDelete: canDelete,
      );
    });

    final totalItems = int.parse(docB('.comment-count', single: true).text());
    final totalPages = int.parse(
      RegExp(
            r'loadComment\((\d+)\);',
          ).firstMatch($('.page-item').last().attr('onclick'))?.group(1) ??
          '1',
    );

    return ComicComments(
      items: items.toList(),
      page: page!,
      totalItems: totalItems,
      totalPages: totalPages,
    );
  }

  @override
  deleteComment(context, {required comment}) async {
    final docB = parse$(
      _comicCachedStore[context.comicId] ??
          await fetch(await getURL(context.comicId)),
    );

    await fetch(
      '$baseUrl/frontend/comment/remove',
      body: {
        'id': comment.id,
        (baseUrl.contains('gg') ? 'comic_id' : 'book_id'): context.comicId,
        'token': docB('#csrf-token', single: true).val(),
        'episode_id': context.chapterId,
      },
    );
  }

  @override
  setLikeComment(context, {required comment, required value}) async {
    if (value) {
      final json = jsonDecode(
        await fetch('$baseUrl/frontend/comment/like', body: {'id': comment.id}),
      );

      if (json['success'] == 0) throw Exception(json['error']);
    } else {
      final json = jsonDecode(
        await fetch(
          '$baseUrl/frontend/comment/dislike',
          body: {'id': comment.id},
        ),
      );

      if (json['success'] == 0) throw Exception(json['error']);
    }

    return value;
  }

  @override
  getSuggest({required metaComic, required comicId, page = 1}) async {
    return (await getCategory(
      categoryId: 'tim-kiem-nang-cao',
      page: page!,
      filters: {
        'category':
            metaComic.genres
                .toList()
                .sublist(0, min(3, metaComic.genres.length))
                .map((e) => RegExp(r'\d+').allMatches(e.genreId).last.group(0)!)
                .toList(),
      },
    )).items;
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
        .map((element) => parseComic(element, baseUrl));

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
    ).query('.item_home').map((element) => parseComic(element, baseUrl));

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
  getExplorer({required page, required filters}) async {
    return getCategory(
      categoryId: 'tim-kiem-nang-cao',
      page: page,
      filters: filters,
    );
  }

  // auth service
  @override
  getUser({required cookie}) async {
    late final DollarFunction $;
    try {
      $ = await fetch$(
        '$baseUrl/thiet-lap-tai-khoan.html',
        cookie: cookie,
        cache: false,
      );
    } on DioException catch (error) {
      if (error.response?.statusCode == 302 ||
          error.response?.statusCode == 403) {
        throw UserNotFoundException();
      }
      rethrow;
    }

    if ($('title', single: true).text() != 'Thông Tin Tài Khoản') {
      throw UserNotFoundException(); // Not logged in
    }

    final txtCms = $('input.txt_cm');
    final user = txtCms.eq(0).val();
    final email = txtCms.eq(1).val();
    final photoUrl = $('.image-avatar', single: true).attr('src');
    final fullName =
        '${$('#first_name', single: true).attr('value')} ${$('#last_name', single: true).val()}';

    return User(
      user: user,
      email: email,
      photoUrl: photoUrl,
      fullName: fullName.isEmpty ? email : fullName,
    );
  }

  @override
  Future<bool> isFollow({required comicId}) async {
    final $ = await fetch$('$baseUrl/truyen-tranh/$comicId.html');

    return $('body').text().contains('Bỏ Theo Dõi');
    // ok
    // final csrf = document.querySelector('#csrf-token')!.attributes['value']!;
  }

  @override
  setFollow({required comicId, required metaComic, required value}) async {
    final $ = await fetch$('$baseUrl/truyen-tranh/$comicId.html');

    final id = $('.subscribe_button', single: true).attr('data-id');
    final csrf = $('#csrf-token', single: true).val();

    await fetch(
      '$baseUrl/frontend/user/regiter-subscribe',
      headers: Headers({'x-requested-with': 'XMLHttpRequest'}),
      body: {'id': id, 'token': csrf},
    );
  }

  @override
  getFollows({required int page}) async {
    final category = await getCategory(
      categoryId: 'tu-truyen',
      page: page,
      filters: {},
    );

    return Paginate(
      items:
          category.items
              .map((item) => ComicFollow(sourceId: uid, item: item))
              .toList(),
      page: page,
      totalPages: category.totalPages,
      totalItems: category.totalItems,
    );
  }
}
