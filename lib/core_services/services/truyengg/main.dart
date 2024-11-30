import 'dart:convert';

import 'package:honyomi/core_services/auth_service.dart';
import 'package:honyomi/core_services/base_service.dart';
import 'package:honyomi/core_services/interfaces/basic_book.dart';
import 'package:honyomi/core_services/interfaces/basic_user.dart';
import 'package:honyomi/core_services/interfaces/basic_image.dart';
import 'package:honyomi/core_services/interfaces/basic_section.dart';
import 'package:honyomi/core_services/interfaces/meta_book.dart';
import 'package:honyomi/core_services/interfaces/paginate.dart';
import 'package:honyomi/core_services/interfaces/rate_value.dart';
import 'package:honyomi/core_services/interfaces/route.dart';
import 'package:html/dom.dart';
import 'package:intl/intl.dart';

import 'utils/parse_basic_book.dart';

class TruyenGGService extends BaseService implements AuthService {
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

  @override
  onBeforeInsertCookie(cookie) {
    cookie = cookie ?? '';

    return 'type_book=1; $cookie';
  }

// auth service
  String? _csrf;
  Future<String> _getCsrf() async {
    if (_csrf != null) return _csrf!;

    final document = await fetchDocument(baseUrl, useCookie: true);
    _csrf = document.querySelector("#csrf-token")!.attributes["value"]!;

    return _csrf!;
  }

  @override
  Future<Iterable<BasicSection>> home() async {
    final Document document = await fetchDocument(baseUrl);

    final sections = document.querySelectorAll(".list_item_home");

    return [
      BasicSection(
          books: sections[0]
              .querySelectorAll(".item_home")
              .map((element) => parseBasicBook(element, baseUrl)),
          name: 'Mới Cập Nhật',
          slug: 'truyen-moi-cap-nhat'),
      BasicSection(
          books: sections[1]
              .querySelectorAll(".item_home")
              .map((element) => parseBasicBook(element, baseUrl)),
          name: "Bình Chọn",
          slug: "top-binh-chon"),
      BasicSection(
          books: sections[2]
              .querySelectorAll(".item_home")
              .map((element) => parseBasicBook(element, baseUrl)),
          name: "Xem Nhiều",
          slug: "top-thang")
    ];
  }

  @override
  Future<MetaBook> getDetails(String slug) async {
    final document = await fetchDocument("$baseUrl/truyen-tranh/$slug.html");

    final String name =
        document.querySelector("h1[itemprop=name]")!.text.trim();
    final BasicImage image = BasicImage(
        src: document.querySelector(".thumbblock > img")!.attributes["src"]!,
        headers: {"referer": baseUrl});

    final tales = document.querySelectorAll(".info_tale > .row");

    final author = _getInfoTale(tales, "Tác Giả:")?.text.trim();
    final translator = _getInfoTale(tales, "Dịch Giả:")?.text.trim();
    final status = _getInfoTale(tales, "Trạng Thái:")?.text.trim() ?? "Unknown";
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

    final genres = document.querySelectorAll(".clblue").map((anchor) => Route(
        name: anchor.text.trim(),
        slug: anchor.attributes["href"]!
            .split("/")
            .last
            .replaceFirst(".html", "")));
    final description =
        document.querySelector(".story-detail-info")!.text.trim();
    final slugRoot = slug;
    final chaps = document.querySelectorAll(".item_chap").reversed.map((chap) {
      final name = chap.querySelector("a")!.text;
      final slug = chap
          .querySelector("a")!
          .attributes["href"]!
          .split("/")
          .last
          .replaceFirst("$slugRoot-", "")
          .replaceFirst(".html", "");

      final time$ = chap.querySelector('.cl99')?.text;
      final time = time$ != null ? DateFormat("dd/MM/yyyy").parse(time$) : null;

      return Chapter(name: name, slug: slug, time: time);
    });
    final lastModified = rate$.containsKey("dateModified")
        ? DateTime.parse(rate$["dateModified"])
        : DateFormat("dd/MM/yyyy").parse(
            document.querySelector("div.w110.text-right > span > em")!.text);

    return MetaBook(
        name: name,
        image: image,
        author: author,
        translator: translator,
        status: status,
        views: views,
        likes: likes,
        rate: rate,
        genres: genres,
        description: description,
        chapters: chaps,
        lastModified: lastModified,
        originalName: null);
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
  String getURL(manga, chap) {
    return "$baseUrl/truyen-tranh/$manga-$chap.html";
  }

  @override
  Future<Iterable<BasicImage>> getPages(String manga, String chap) async {
    final document = await fetchDocument(getURL(manga, chap));

    return document.querySelectorAll(".content_detail_manga > img").map((img) {
      final src = img.attributes["src"]!;

      return BasicImage(src: src, headers: {"referer": baseUrl});
    });
  }

  @override
  quickSearch(keyword) async {
    final document = await fetchDocument("$baseUrl/frontend/search/search",
        headers: {"x-requested-with": "XMLHttpRequest"},
        body: {"search": keyword, "type": "0", "token": await _getCsrf()});

    final data = document.querySelectorAll("li > a").map((anchor) {
      final slug =
          anchor.attributes["href"]!.split("/").last.replaceFirst(".html", "");
      final name = anchor.querySelector(".name")!.text;
      final image = BasicImage(
          src: anchor.querySelector("img")!.attributes["src"]!,
          headers: {"referer": baseUrl});
      final originalName = anchor.querySelector(".name_other")!.text;

      final lastChapName$ = anchor.querySelector("p:nth-child(3)")!.text;
      final lastChap = Route(
        slug: "$slug/${lastChapName$.replaceFirst('Chapter ', 'chap-')}",
        name: lastChapName$,
      );

      return BasicBook(
          slug: slug,
          name: name,
          originalName: originalName,
          lastChap: lastChap,
          image: image,
          timeAgo: null,
          notice: null,
          rate: null);
    });

    return data;
  }

  @override
  search(keyword, {page = 1}) async {
    final Document document = await fetchDocument(
        "$baseUrl/tim-kiem${page! > 1 ? '/trang-$page' : ''}.html?q=${Uri.encodeComponent(keyword)}",
        useCookie: true);

    final sections = document.querySelectorAll(".list_item_home");

    final data = sections[0]
        .querySelectorAll(".item_home")
        .map((element) => parseBasicBook(element, baseUrl));

    final lastPageLink = document
        .querySelector(".pagination > a:last-child")
        ?.attributes["href"];
    final maxPage = lastPageLink != null
        ? int.parse(RegExp(r'trang-(\d+)').firstMatch(lastPageLink)!.group(1)!)
        : 1;

    return Paginate(
        items: data,
        page: page,
        totalItems: data.length * maxPage,
        totalPages: maxPage);
  }

  // auth service
  @override
  getUser({cookie}) async {
    final document = await fetchDocument("$baseUrl/thiet-lap-tai-khoan.html",
        cookie: cookie, useCookie: true);

    if (document.querySelector("title")!.text != 'Thông Tin Tài Khoản') {
      throw Exception("Not logged in"); // Not logged in
    }

    final txtCms = document.querySelectorAll("input.txt_cm");
    final user = txtCms[0].attributes['value']!;
    final email = txtCms[1].attributes['value']!;
    final photoUrl =
        document.querySelector(".image-avatar")!.attributes["src"]!;
    final fullName =
        "${document.querySelector("#first_name")!.attributes['value']!} ${document.querySelector("#last_name")!.attributes['value']!}"
            .trim();

    return BasicUser(
        user: user,
        email: email,
        photoUrl: photoUrl,
        fullName: fullName.isEmpty ? email : fullName);
  }

  @override
  Future<bool> isLiked({required slug}) async {
    final document = await fetchDocument("$baseUrl/truyen-tranh/$slug.html",
        useCookie: true);

    return document.body!.text.contains("Bỏ Theo Dõi");
    // ok
    // final csrf = document.querySelector("#csrf-token")!.attributes["value"]!;
  }

  @override
  Future<bool> setLike({required slug, required value}) async {
    final document = await fetchDocument("$baseUrl/truyen-tranh/$slug.html",
        useCookie: true);

    final id =
        document.querySelector(".subscribe_button")!.attributes['data-id']!;
    _csrf = document.querySelector("#csrf-token")!.attributes["value"]!;

    final data = await fetch("$baseUrl/frontend/user/regiter-subscribe",
        headers: {"x-requested-with": "XMLHttpRequest"},
        body: {"id": id, "token": _csrf});

    return data != '0';
  }
}
