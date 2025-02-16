import 'dart:convert';
import 'dart:math';

import 'package:hoyomi/core_services/comic/comic_service.dart';
import 'package:hoyomi/core_services/comic/interfaces/comic_comments.dart';
import 'package:hoyomi/core_services/comic/interfaces/comic_chapter.dart';
import 'package:hoyomi/core_services/comic/interfaces/comic_comment.dart';
import 'package:hoyomi/core_services/exception/user_not_found_exception.dart';
import 'package:hoyomi/core_services/interfaces/genre.dart';
import 'package:hoyomi/core_services/comic/interfaces/status_enum.dart';
import 'package:hoyomi/core_services/mixin/auth_mixin.dart';
import 'package:html/dom.dart';
import 'package:intl/intl.dart';

import 'package:hoyomi/core_services/comic/mixin/comic_auth_mixin.dart';
import 'package:hoyomi/core_services/comic/interfaces/comic_section.dart';
import 'package:hoyomi/core_services/comic/interfaces/comic.dart';
import 'package:hoyomi/core_services/interfaces/filter.dart';
import 'package:hoyomi/core_services/interfaces/o_image.dart';
import 'package:hoyomi/core_services/comic/interfaces/home_comic_section.dart';
import 'package:hoyomi/core_services/interfaces/user.dart';
import 'package:hoyomi/core_services/comic/interfaces/comic_param.dart';
import 'package:hoyomi/core_services/comic/interfaces/comic_modes.dart';
import 'package:hoyomi/core_services/comic/interfaces/meta_comic.dart';
import 'package:hoyomi/core_services/comic/interfaces/rate_value.dart';
import 'package:hoyomi/utils/time_utils.dart';

final List<Filter> globalFilters = [
  Filter(name: 'Trạng thái', key: 'status', multiple: false, options: [
    Option(name: 'Đang tiến hành', value: '0'),
    Option(name: 'Hoàn thành', value: '1')
  ]),
  Filter(name: 'Quốc Gia', key: 'country', multiple: false, options: [
    Option(name: 'Trung Quốc', value: '1'),
    Option(name: 'Hàn Quốc', value: '2'),
    Option(name: 'Nhật Bản', value: '3'),
    Option(name: 'Việt Nam', value: '4'),
    Option(name: 'Hoa Kỳ', value: '5'),
  ]),
  Filter(name: 'Sắp Xếp', key: 'sort', multiple: false, options: [
    Option(name: 'Ngày đăng giảm dần', value: '0'),
    Option(name: 'Ngày đăng tăng dần', value: '1'),
    Option(name: 'Ngày cập nhật giảm dần', value: '2'),
    Option(name: 'Ngày cập nhật tăng dần', value: '3'),
    Option(name: 'Lượt xem giảm dần', value: '4'),
    Option(name: 'Lượt xem tăng dần', value: '5')
  ]),
];

class TruyenGGService extends ComicService with AuthMixin, ComicAuthMixin {
  @override
  final String name = "TruyenGGP";
  @override
  final String baseUrl = "https://truyengg.com";
  @override
  get faviconUrl => "$baseUrl/favicon.ico";
  @override
  get signInUrl => "$baseUrl/";
  @override
  get rss => "$baseUrl/rss.html";

  final Map<String, String> _comicCachedStore = {};
  final Map<String, String> _episodeIdStore = {};

  // Hooks
  @override
  onBeforeInsertCookie(cookie) {
    cookie = cookie ?? '';

    return 'type_comic=1; $cookie';
  }

  // Utils
  Comic parseComic(Element itemComic, String referer) {
    final String comicId = itemComic
        .querySelector("a")!
        .attributes["href"]!
        .split("/")
        .last
        .replaceFirst(".html", "");
    final $image = itemComic.querySelector("img")!;
    final OImage image = OImage(
        src: $image.attributes["data-src"]!, headers: {"referer": referer});
    final String name = itemComic.querySelector(".comic_name")?.text ??
        itemComic.querySelector("img")!.attributes['alt']!;

    final ComicChapter lastChap = ComicChapter(
        name: itemComic.querySelector(".cl99")!.text.trim(),
        chapterId: itemComic
            .querySelector(".cl99")!
            .attributes["href"]!
            .split("/")
            .last
            .replaceFirst(".html", "")
            .replaceFirst("Chapter", "chap"));

    final timeAgoElement = itemComic.querySelector(".time-ago");
    final timeAgo = timeAgoElement != null
        ? convertTimeAgoToUtc(timeAgoElement.text)
        : null;
    final String notice = itemComic.querySelector(".type-label")?.text ?? '';

    final rateValueText = itemComic.querySelector(".rate-star")?.text.trim();
    final double? rate =
        rateValueText != null ? double.tryParse(rateValueText) : null;

    return Comic(
        image: image,
        lastChap: lastChap,
        timeAgo: timeAgo,
        notice: (notice.isEmpty ? '' : '$notice - ') + (lastChap.name),
        name: name,
        comicId: comicId,
        rate: rate,
        originalName: null);
  }

  // Main
  @override
  Future<List<HomeComicSection>> home() async {
    final Document document = await fetchDocument(baseUrl);

    final sections = document.querySelectorAll(".list_item_home");

    return [
      HomeComicSection(
          items: sections[0]
              .querySelectorAll(".item_home")
              .map((element) => parseComic(element, baseUrl))
              .toList(),
          name: 'Mới Cập Nhật',
          sectionId: 'truyen-moi-cap-nhat'),
      HomeComicSection(
          items: sections[1]
              .querySelectorAll(".item_home")
              .map((element) => parseComic(element, baseUrl))
              .toList(),
          name: "Bình Chọn",
          sectionId: "top-binh-chon"),
      HomeComicSection(
          items: sections[2]
              .querySelectorAll(".item_home")
              .map((element) => parseComic(element, baseUrl))
              .toList(),
          name: "Xem Nhiều",
          sectionId: "top-thang")
    ];
  }

  @override
  Future<MetaComic> getDetails(String comicId) async {
    final document = parseDocument(
        _comicCachedStore[comicId] = await fetch(getURL(comicId)));

    final String name =
        document.querySelector("h1[itemprop=name]")!.text.trim();
    final OImage image = OImage(
        src: document.querySelector(".thumbblock > img")!.attributes["src"]!,
        headers: {"referer": baseUrl});

    final tales = document.querySelectorAll(".info_tale > .row");

    final author = _getInfoTale(tales, "Tác Giả:")?.text.trim();
    final translator = _getInfoTale(tales, "Dịch Giả:")?.text.trim();
    final status$ =
        _getInfoTale(tales, "Trạng Thái:")?.text.trim().toLowerCase() ??
            "Unknown";
    final status = status$ == 'đang cập nhật'
        ? StatusEnum.ongoing
        : status$ == 'unknown'
            ? StatusEnum.unknown
            : StatusEnum.completed;
    final views = int.tryParse(
        _getInfoTale(tales, "Lượt Xem:")?.text.trim().replaceAll(",", "") ??
            '');
    final likes = int.tryParse(
        _getInfoTale(tales, "Theo Dõi:")?.text.trim().replaceAll(",", "") ??
            "");

    final rate$ = JsonDecoder().convert(document
            .querySelector("script[type='application/ld+json']")
            ?.text
            .trim() ??
        "{}") as Map<String, dynamic>;

    final rate = rate$.containsKey('aggregateRating')
        ? RateValue(
            best: int.parse("${rate$['aggregateRating']['bestRating']}"),
            count: int.parse(rate$['aggregateRating']['ratingCount']),
            value: double.parse(rate$['aggregateRating']['ratingValue']))
        : null;

    final genres = document.querySelectorAll(".clblue").map((anchor) => Genre(
        name: anchor.text.trim(),
        genreId:
            "the-loai*${anchor.attributes["href"]!.split("/").last.replaceFirst(".html", "")}"));
    final description =
        document.querySelector(".story-detail-info")!.text.trim();
    final chaps = document.querySelectorAll(".item_chap").map((chap) {
      final name = chap.querySelector("a")!.text;
      final chapterId = chap
          .querySelector("a")!
          .attributes["href"]!
          .split("/")
          .last
          .replaceFirst("$comicId-", "")
          .replaceFirst(".html", "");

      final time$ = chap.querySelector('.cl99')?.text;
      final time = time$ != null ? DateFormat("dd/MM/yyyy").parse(time$) : null;

      return ComicChapter(name: name, chapterId: chapterId, time: time);
    });
    final lastModified = rate$.containsKey("dateModified")
        ? DateTime.parse(rate$["dateModified"])
        : DateFormat("dd/MM/yyyy").parse(
            document.querySelector("div.w110.text-right > span > em")!.text);

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
        originalName: null);
  }

  @override
  getComicModes(comic) {
    if (comic.genres
        .any((genre) => genre.name == 'Manga' || genre.name == 'Anime')) {
      return ComicModes.rightToLeft;
    }

    return null;
  }

  Element? _getInfoTale(List<Element> tales, String name) {
    for (final element in tales) {
      if (element.querySelector(".name-title")?.text.contains(name) ?? false) {
        return element.children.last;
      }
    }

    return null;
  }

  @override
  String getURL(comicId, {chapterId}) {
    return "$baseUrl/truyen-tranh/$comicId${chapterId != null ? "-$chapterId" : ""}.html";
  }

  @override
  parseURL(url) {
    final pathname = url.split("/").last.replaceFirst(".html", "");
    final index = pathname.indexOf("chap-");
    final chapterId = index == -1 ? null : pathname.substring(index + 5);
    final comicId = index == -1 ? pathname : pathname.substring(0, index);

    return ComicParam(comicId: comicId, chapterId: chapterId);
  }

  @override
  Future<List<OImage>> getPages(String manga, String chap) async {
    final document = await fetchDocument(getURL(manga, chapterId: chap));

    _episodeIdStore[chap] =
        document.querySelector("#episode_id")!.attributes["value"]!;

    return document.querySelectorAll(".content_detail_manga > img").map((img) {
      final src = img.attributes["src"]!;

      return OImage(src: src, headers: {"referer": baseUrl});
    }).toList();
  }

  @override
  get getComments => ({required comicId, chapterId, parent, page = 1}) async {
        final parentId = parent?.id ?? 0;

        if (chapterId != null) {
          // pre-fetch
          chapterId = _episodeIdStore[chapterId] ??=
              (await fetchDocument(getURL(comicId, chapterId: chapterId)))
                  .querySelector("#episode_id")!
                  .attributes["value"]!;
        }

        final docB = parseDocument(
            _comicCachedStore[comicId] ?? await fetch(getURL(comicId)));
        final document = page == 1
            ? docB
            : await fetchDocument("$baseUrl/frontend/comment/list", body: {
                'comic_id': RegExp(r'(\d+)$').firstMatch(comicId)!.group(1)!,
                'parent_id': parentId,
                'team_id': docB.querySelector('#team_id')?.attributes['value'],
                'token':
                    docB.querySelector('#csrf-token')?.attributes['va5lue'],
                'page': page,
                'episode_id': chapterId,
              });

        final items = document.querySelectorAll(".info-comment").map((element) {
          final id =
              RegExp(r'child_(\d+)').firstMatch(element.className)!.group(1)!;

          final photoUrl =
              element.querySelector(".avartar-comment img")!.attributes['src']!;
          final name = element.querySelector(".info-user-comment strong")!.text;
          final time =
              convertTimeAgoToUtc(element.querySelector(".time")!.text.trim());

          final content = element.querySelector(".content-comment")!.innerHtml;

          final like =
              int.parse(element.querySelector(".total-like-comment")!.text);
          final dislike =
              int.parse(element.querySelector(".total-dislike-comment")!.text);

          final countReply$ =
              element.querySelector(".text-list-reply")?.text.trim();
          final countReply = countReply$ != null
              ? int.parse(
                  RegExp(r'(\d+)').firstMatch(countReply$)?.group(0) ?? '0')
              : 0;

          final canDelete = element.querySelector(".remove_comnent") != null;

          return ComicComment(
              id: id,
              comicId: comicId,
              chapterId: chapterId,
              userId: name,
              name: name,
              photoUrl: OImage(src: photoUrl, headers: {"referer": baseUrl}),
              content: content,
              countLike: like,
              countDislike: dislike,
              countReply: countReply,
              timeAgo: time,
              canDelete: canDelete);
        });

        final totalItems =
            int.parse(docB.querySelector(".comment-count")!.text);
        final totalPages = int.parse(RegExp(r'loadComment\((\d+)\);')
                .firstMatch(document
                        .querySelectorAll(".page-item")
                        .lastOrNull
                        ?.attributes['onclick'] ??
                    '')
                ?.group(1) ??
            '1');

        return ComicComments(
            items: items.toList(),
            page: page!,
            totalItems: totalItems,
            totalPages: totalPages);
      };

  @override
  get deleteComment =>
      ({required comicId, chapterId, parent, required comment}) async {
        final docB = parseDocument(
            _comicCachedStore[comicId] ?? await fetch(getURL(comicId)));

        await fetch("$baseUrl/frontend/comment/remove", body: {
          'id': comment.id,
          'comic_id': comicId,
          'token': docB.querySelector('#csrf-token')?.attributes['value'],
          'episode_id': chapterId,
        });
      };

  @override
  get setLikeComment => (
          {required comicId,
          chapterId,
          parent,
          required comment,
          required value}) async {
        if (value) {
          final json = jsonDecode(await fetch("$baseUrl/frontend/comment/like",
              body: {'id': comment.id}));

          if (json["success"] == 0) throw Exception(json["error"]);
        } else {
          final json = jsonDecode(await fetch(
              "$baseUrl/frontend/comment/dislike",
              body: {'id': comment.id}));

          if (json["success"] == 0) throw Exception(json["error"]);
        }

        return value;
      };

  @override
  get getSuggest => (comic, {page = 1}) async {
        return getSection(
            sectionId: "tim-kiem-nang-cao",
            page: page!,
            filters: {
              'category': comic.genres
                  .toList()
                  .sublist(0, min(3, comic.genres.length))
                  .map((e) =>
                      RegExp(r'\d+').allMatches(e.genreId).last.group(0)!)
                  .toList()
            });
      };

  @override
  search({required keyword, required page, required filters}) async {
    final url =
        "$baseUrl/tim-kiem${page > 1 ? '/trang-$page' : ''}.html?q=${Uri.encodeComponent(keyword)}";

    final Document document = await fetchDocument(
      url,
    );

    final sections = document.querySelectorAll(".list_item_home");

    final data = sections[0]
        .querySelectorAll(".item_home")
        .map((element) => parseComic(element, baseUrl));

    final lastPageLink = document
        .querySelector(".pagination > a:last-child")
        ?.attributes["href"];
    final maxPage = lastPageLink != null
        ? int.parse(RegExp(r'trang-(\d+)').firstMatch(lastPageLink)!.group(1)!)
        : 1;

    return ComicSection(
        name: '',
        url: url,
        items: data.toList(),
        page: page,
        totalItems: data.length * maxPage,
        totalPages: maxPage);
  }

  @override
  getSection({required sectionId, required page, required filters}) async {
    final url =
        "$baseUrl/${sectionId.replaceAll('*', '/')}${page > 1 ? '/trang-$page' : ''}.html";

    final Document document = await fetchDocument(
      buildQueryUri(url, filters: filters).toString(),
    );

    final data = document
        .querySelector(".list_item_home, .list_grid")!
        .querySelectorAll(".item_home")
        .map((element) => parseComic(element, baseUrl));

    final lastPageLink = document
        .querySelector(".pagination > a:last-child")
        ?.attributes["href"];
    final maxPage = lastPageLink != null
        ? int.parse(RegExp(r'trang-(\d+)').firstMatch(lastPageLink)!.group(1)!)
        : 1;

    return ComicSection(
        name: document.querySelector(".title_cate")!.text,
        url: url,
        items: data.toList(),
        page: page,
        totalItems: data.length * maxPage,
        totalPages: maxPage,
        filters: globalFilters);
  }

  // auth service
  @override
  getUser({required cookie}) async {
    final document = await fetchDocument("$baseUrl/thiet-lap-tai-khoan.html",
        cookie: cookie);

    if (document.querySelector("title")!.text != 'Thông Tin Tài Khoản') {
      throw UserNotFoundException(); // Not logged in
    }

    final txtCms = document.querySelectorAll("input.txt_cm");
    final user = txtCms[0].attributes['value']!;
    final email = txtCms[1].attributes['value']!;
    final photoUrl =
        document.querySelector(".image-avatar")!.attributes["src"]!;
    final fullName =
        "${document.querySelector("#first_name")!.attributes['value']!} ${document.querySelector("#last_name")!.attributes['value']!}"
            .trim();

    return User(
        user: user,
        email: email,
        photoUrl: photoUrl,
        fullName: fullName.isEmpty ? email : fullName);
  }

  @override
  Future<bool> isLiked({required comicId}) async {
    final document = await fetchDocument(
      "$baseUrl/truyen-tranh/$comicId.html",
    );

    return document.body!.text.contains("Bỏ Theo Dõi");
    // ok
    // final csrf = document.querySelector("#csrf-token")!.attributes["value"]!;
  }

  @override
  Future<bool> setLike({required comicId, required value}) async {
    final document = await fetchDocument(
      "$baseUrl/truyen-tranh/$comicId.html",
    );

    final id =
        document.querySelector(".subscribe_button")!.attributes['data-id']!;
    final csrf = document.querySelector("#csrf-token")!.attributes["value"]!;

    final data = await fetch("$baseUrl/frontend/user/regiter-subscribe",
        headers: {"x-requested-with": "XMLHttpRequest"},
        body: {"id": id, "token": csrf});

    return data != '0';
  }
}
