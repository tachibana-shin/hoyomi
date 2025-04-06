import 'dart:convert';
import 'dart:math';

import 'package:hoyomi/core_services/comic/ab_comic_service.dart';
import 'package:hoyomi/core_services/comic/interfaces/main.dart';
import 'package:hoyomi/core_services/comic/mixin/comic_auth_mixin.dart';
import 'package:hoyomi/core_services/exception/user_not_found_exception.dart';
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

class TruyenGGService extends ABComicService with ComicAuthMixin {
  @override
  final init = ServiceInit(
    name: 'TruyenGGP',
    faviconUrl: OImage(src: '/favicon.ico'),
    rootUrl: 'https://truyengg.com',
    rss: '/rss.html',
    onBeforeInsertCookie: (cookie) {
      cookie ??= '';

      return 'type_comic=1; $cookie';
    },
  );

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
      headers: {'referer': referer},
    );
    final String name = itemComic.queryOne('.comic_name').textRaw() ??
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
    );

    final timeAgoElement = itemComic.queryOne('.time-ago');
    final timeAgo = timeAgoElement.isNotEmpty
        ? convertTimeAgoToUtc(timeAgoElement.text())
        : null;
    final String notice = itemComic.queryOne('.type-label').text();

    final rateValueText = itemComic.queryOne('.rate-star').text();
    final double? rate =
        rateValueText.isNotEmpty ? double.tryParse(rateValueText) : null;

    return Comic(
      image: image,
      lastChap: lastChap,
      timeAgo: timeAgo,
      notice: (notice.isEmpty ? null : notice),
      name: name,
      comicId: comicId,
      rate: rate,
      originalName: null,
    );
  }

  // Main
  @override
  Future<List<HomeComicCategory>> home() async {
    final $ = await fetch$(baseUrl);

    final categories = $('.list_item_home');

    return [
      HomeComicCategory(
        items: categories
            .first()
            .query('.item_home')
            .map((element) => parseComic(element, baseUrl))
            .toList(),
        name: 'Mới Cập Nhật',
        categoryId: 'truyen-moi-cap-nhat',
      ),
      HomeComicCategory(
        items: categories
            .eq(1)
            .query('.item_home')
            .map((element) => parseComic(element, baseUrl))
            .toList(),
        name: 'Bình Chọn',
        categoryId: 'top-binh-chon',
      ),
      HomeComicCategory(
        items: categories
            .eq(2)
            .query('.item_home')
            .map((element) => parseComic(element, baseUrl))
            .toList(),
        name: 'Xem Nhiều',
        categoryId: 'top-thang',
      ),
    ];
  }

  @override
  Future<MetaComic> getDetails(String comicId) async {
    final $ = parse$(
      _comicCachedStore[comicId] = await fetch(getURL(comicId)),
    );

    final String name = $('h1[itemprop=name]', single: true).text();
    final OImage image = OImage(
      src: $('.thumbblock > img', single: true).attr('src'),
      headers: {'referer': baseUrl},
    );

    final tales = $('.info_tale > .row');

    final author = _getInfoTale(tales, 'Tác Giả:')?.textRaw();
    final translator = _getInfoTale(tales, 'Dịch Giả:')?.textRaw();
    final status$ =
        _getInfoTale(tales, 'Trạng Thái:')?.textRaw()?.toLowerCase() ??
            'Unknown';
    final status = status$ == 'đang cập nhật'
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

    final rate$ = JsonDecoder().convert(
      $('script[type=\'application/ld+json\']', single: true).textRaw() ?? '{}',
    ) as Map<String, dynamic>;

    final rate = rate$.containsKey('aggregateRating')
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
    final chaps = $('.item_chap').map((chap) {
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

      return ComicChapter(name: name, chapterId: chapterId, time: time);
    });
    final lastModified = rate$.containsKey('dateModified')
        ? DateTime.parse(rate$['dateModified'])
        : DateFormat('dd/MM/yyyy')
            .parse($('div.w110.text-right > span > em', single: true).text());

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
      chapters: chaps.toList().reversed.toList(),
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

    return null;
  }

  DQuery? _getInfoTale(DQuery tales, String name) {
    return tales.findOne(
        (element) => element.queryOne('.name-title').text().contains(name));
  }

  @override
  String getURL(comicId, {chapterId}) {
    return '$baseUrl/truyen-tranh/$comicId${chapterId != null ? '-$chapterId' : ''}.html';
  }

  @override
  parseURL(url) {
    final pathname = url.split('/').last.replaceFirst('.html', '');
    final index = pathname.indexOf('chap-');
    final chapterId = index == -1 ? null : pathname.substring(index + 5);
    final comicId = index == -1 ? pathname : pathname.substring(0, index);

    return ComicParam(comicId: comicId, chapterId: chapterId);
  }

  @override
  Future<List<OImage>> getPages(String manga, String chap) async {
    final $ = await fetch$(getURL(manga, chapterId: chap));

    _episodeIdStore[chap] = $('#episode_id', single: true).val();

    return $('.content_detail_manga > img').map((img) {
      final src = img.attr('src');

      return OImage(src: src, headers: {'referer': baseUrl});
    }).toList();
  }

  @override
  get getComments => ({required comicId, chapterId, parent, page = 1}) async {
        final parentId = parent?.id ?? 0;

        if (chapterId != null) {
          // pre-fetch
          chapterId = _episodeIdStore[chapterId] ??= (await fetch$(
            getURL(comicId, chapterId: chapterId),
          ))('#episode_id', single: true)
              .val();
        }

        final docB = parse$(
          _comicCachedStore[comicId] ?? await fetch(getURL(comicId)),
        );
        final $ = page == 1
            ? docB
            : await fetch$(
                '$baseUrl/frontend/comment/list',
                body: {
                  'comic_id': RegExp(r'(\d+)$').firstMatch(comicId)!.group(1)!,
                  'parent_id': parentId,
                  'team_id': docB('#team_id', single: true).val(),
                  'token': docB('#csrf-token', single: true).val(),
                  'page': page,
                  'episode_id': chapterId,
                },
              );

        final items = $('.info-comment').map((element) {
          final id =
              RegExp(r'child_(\d+)').firstMatch(element.className())!.group(1)!;

          final photoUrl = element.queryOne('.avartar-comment img').attr('src');
          final name = element.queryOne('.avartar-comment img').attr('alt');
          final time = convertTimeAgoToUtc(element.queryOne('.time').text());

          final content = element.queryOne('.content-comment').html();

          final like =
              int.parse(element.queryOne('.total-like-comment').text());
          final dislike = int.parse(
              element.queryOne('.total-dislike-comment').textRaw() ?? '0');

          final countReply$ = element.queryOne('.text-list-reply').text();
          final countReply = countReply$.isNotEmpty
              ? int.parse(
                  RegExp(r'(\d+)').firstMatch(countReply$)?.group(0) ?? '0',
                )
              : 0;

          final canDelete = element.queryOne('.remove_comnent').isNotEmpty;

          return ComicComment(
            id: id,
            comicId: comicId,
            chapterId: chapterId,
            userId: name,
            name: name,
            photoUrl: OImage(src: photoUrl, headers: {'referer': baseUrl}),
            content: content,
            countLike: like,
            countDislike: dislike,
            countReply: countReply,
            timeAgo: time,
            canDelete: canDelete,
          );
        });

        final totalItems =
            int.parse(docB('.comment-count', single: true).text());
        final totalPages = int.parse(
          RegExp(r'loadComment\((\d+)\);')
                  .firstMatch($('.page-item').last().attr('onclick'))
                  ?.group(1) ??
              '1',
        );

        return ComicComments(
          items: items.toList(),
          page: page!,
          totalItems: totalItems,
          totalPages: totalPages,
        );
      };

  @override
  get deleteComment => ({
        required comicId,
        chapterId,
        parent,
        required comment,
      }) async {
        final docB = parse$(
          _comicCachedStore[comicId] ?? await fetch(getURL(comicId)),
        );

        await fetch(
          '$baseUrl/frontend/comment/remove',
          body: {
            'id': comment.id,
            'comic_id': comicId,
            'token': docB('#csrf-token', single: true).val(),
            'episode_id': chapterId,
          },
        );
      };

  @override
  get setLikeComment => ({
        required comicId,
        chapterId,
        parent,
        required comment,
        required value,
      }) async {
        if (value) {
          final json = jsonDecode(
            await fetch('$baseUrl/frontend/comment/like',
                body: {'id': comment.id}),
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
      };

  @override
  get getSuggest => (comic, {page = 1}) async {
        return getCategory(
          categoryId: 'tim-kiem-nang-cao',
          page: page!,
          filters: {
            'category': comic.genres
                .toList()
                .sublist(0, min(3, comic.genres.length))
                .map((e) => RegExp(r'\d+').allMatches(e.genreId).last.group(0)!)
                .toList(),
          },
        );
      };

  @override
  search(
      {required keyword,
      required page,
      required filters,
      required quick}) async {
    final url =
        '$baseUrl/tim-kiem${page > 1 ? '/trang-$page' : ''}.html?q=${Uri.encodeComponent(keyword)}';

    final $ = await fetch$(url);

    final categories = $('.list_item_home');

    final data = categories
        .first()
        .query('.item_home')
        .map((element) => parseComic(element, baseUrl));

    final lastPageLink =
        $('.pagination > a:last-child', single: true).attr('href');
    final maxPage = lastPageLink.isNotEmpty
        ? int.parse(
            RegExp(r'trang-(\d+)').firstMatch(lastPageLink)!.group(1)!,
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

    final $ = await fetch$(
      buildQueryUri(url, filters: filters).toString(),
    );

    final data = $('.list_item_home, .list_grid', single: true)
        .query('.item_home')
        .map((element) => parseComic(element, baseUrl));

    final lastPageLink =
        $('.pagination > a:last-child', single: true).attr('href');
    final maxPage = lastPageLink.isNotEmpty
        ? int.parse(
            RegExp(r'trang-(\d+)').firstMatch(lastPageLink)!.group(1)!,
          )
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

  // auth service
  @override
  getUser({required cookie}) async {
    final $ = await fetch$(
      '$baseUrl/thiet-lap-tai-khoan.html',
      cookie: cookie,
    );

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
  Future<bool> isLiked({required comicId}) async {
    final $ = await fetch$('$baseUrl/truyen-tranh/$comicId.html');

    return $('body').text().contains('Bỏ Theo Dõi');
    // ok
    // final csrf = document.querySelector('#csrf-token')!.attributes['value']!;
  }

  @override
  Future<bool> setLike({required comicId, required value}) async {
    final $ = await fetch$('$baseUrl/truyen-tranh/$comicId.html');

    final id = $('.subscribe_button', single: true).attr('data-id');
    final csrf = $('#csrf-token', single: true).val();

    final data = await fetch(
      '$baseUrl/frontend/user/regiter-subscribe',
      headers: {'x-requested-with': 'XMLHttpRequest'},
      body: {'id': id, 'token': csrf},
    );

    return data != '0';
  }
}
