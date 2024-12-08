import 'dart:convert';
import 'dart:math';

import 'package:honyomi/core_services/auth_service.dart';
import 'package:honyomi/core_services/base_service.dart';
import 'package:honyomi/core_services/interfaces/base_section.dart';
import 'package:honyomi/core_services/interfaces/basic_book.dart';
import 'package:honyomi/core_services/interfaces/basic_filter.dart';
import 'package:honyomi/core_services/interfaces/basic_user.dart';
import 'package:honyomi/core_services/interfaces/basic_image.dart';
import 'package:honyomi/core_services/interfaces/basic_section.dart';
import 'package:honyomi/core_services/interfaces/book_param.dart';
import 'package:honyomi/core_services/interfaces/comic_modes.dart';
import 'package:honyomi/core_services/interfaces/meta_book.dart';
import 'package:honyomi/core_services/interfaces/paginate.dart';
import 'package:honyomi/core_services/interfaces/rate_value.dart';
import 'package:honyomi/core_services/interfaces/route.dart';
import 'package:honyomi/utils/time_utils.dart';
import 'package:html/dom.dart';
import 'package:intl/intl.dart';

final List<BasicFilter> globalFilters = [
  BasicFilter(name: 'Trạng thái', key: 'status', multiple: false, options: [
    BasicOption(name: 'Đang tiến hành', value: '0'),
    BasicOption(name: 'Hoàn thành', value: '1')
  ]),
  BasicFilter(name: 'Quốc Gia', key: 'country', multiple: false, options: [
    BasicOption(name: 'Trung Quốc', value: '1'),
    BasicOption(name: 'Hàn Quốc', value: '2'),
    BasicOption(name: 'Nhật Bản', value: '3'),
    BasicOption(name: 'Việt Nam', value: '4'),
    BasicOption(name: 'Hoa Kỳ', value: '5'),
  ]),
  BasicFilter(name: 'Sắp Xếp', key: 'sort', multiple: false, options: [
    BasicOption(name: 'Ngày đăng giảm dần', value: '0'),
    BasicOption(name: 'Ngày đăng tăng dần', value: '1'),
    BasicOption(name: 'Ngày cập nhật giảm dần', value: '2'),
    BasicOption(name: 'Ngày cập nhật tăng dần', value: '3'),
    BasicOption(name: 'Lượt xem giảm dần', value: '4'),
    BasicOption(name: 'Lượt xem tăng dần', value: '5')
  ]),
];

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

  // Hooks
  @override
  onBeforeInsertCookie(cookie) {
    cookie = cookie ?? '';

    return 'type_book=1; $cookie';
  }

  // Utils
  BasicBook parseBasicBook(Element itemBook, String referer) {
    final String slug = itemBook
        .querySelector("a")!
        .attributes["href"]!
        .split("/")
        .last
        .replaceFirst(".html", "");
    final $image = itemBook.querySelector("img")!;
    final BasicImage image = BasicImage(
        src: $image.attributes["data-src"]!, headers: {"referer": referer});
    final String name = itemBook.querySelector(".book_name")?.text ??
        itemBook.querySelector("img")!.attributes['alt']!;

    final Route lastChap = Route(
        name: itemBook.querySelector(".cl99")!.text.trim(),
        slug: itemBook
            .querySelector(".cl99")!
            .attributes["href"]!
            .split("/")
            .last
            .replaceFirst(".html", "")
            .replaceFirst("Chapter", "chap"));

    final timeAgoElement = itemBook.querySelector(".time-ago");
    final timeAgo = timeAgoElement != null
        ? convertTimeAgoToUtc(timeAgoElement.text)
        : null;
    final String? notice = itemBook.querySelector(".type-label")?.text;

    final rateValueText = itemBook.querySelector(".rate-star")?.text.trim();
    final double? rate =
        rateValueText != null ? double.tryParse(rateValueText) : null;

    return BasicBook(
        image: image,
        lastChap: lastChap,
        timeAgo: timeAgo,
        notice: notice,
        name: name,
        slug: slug,
        rate: rate,
        originalName: null);
  }

  // Main
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
        slug:
            "the-loai*${anchor.attributes["href"]!.split("/").last.replaceFirst(".html", "")}"));
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

  @override
  getComicModes(book) {
    if (book.genres
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
    final slug = url.split("/").last.replaceFirst(".html", "");
    final index = slug.indexOf("chap-");
    final chapterId = index == -1 ? null : slug.substring(index + 5);
    final comicId = index == -1 ? slug : slug.substring(0, index);

    return BookParam(bookId: comicId, chapterId: chapterId);
  }

  @override
  Future<Iterable<BasicImage>> getPages(String manga, String chap) async {
    final document = await fetchDocument(getURL(manga, chapterId: chap));

    return document.querySelectorAll(".content_detail_manga > img").map((img) {
      final src = img.attributes["src"]!;

      return BasicImage(src: src, headers: {"referer": baseUrl});
    });
  }

  @override
  get getSuggest => (book, {page = 1}) async {
        return getSection("tim-kiem-nang-cao", page: page, filters: {
          'category': book.genres
              .toList()
              .sublist(0, min(3, book.genres.length))
              .map((e) => RegExp(r'\d+').allMatches(e.slug).last.group(0)!)
              .toList()
        });
      };

  @override
  search(keyword, {page = 1}) async {
    final Document document = await fetchDocument(
      "$baseUrl/tim-kiem${page! > 1 ? '/trang-$page' : ''}.html?q=${Uri.encodeComponent(keyword)}",
    );

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

  @override
  getSection(slug, {page = 1, filters}) async {
    page ??= 1;
    final Document document = await fetchDocument(
      buildQueryUri(
              "$baseUrl/${slug.replaceAll('*', '/')}${page > 1 ? '/trang-$page' : ''}.html",
              filters: filters)
          .toString(),
    );

    final data = document
        .querySelector(".list_item_home, .list_grid")!
        .querySelectorAll(".item_home")
        .map((element) => parseBasicBook(element, baseUrl));

    final lastPageLink = document
        .querySelector(".pagination > a:last-child")
        ?.attributes["href"];
    final maxPage = lastPageLink != null
        ? int.parse(RegExp(r'trang-(\d+)').firstMatch(lastPageLink)!.group(1)!)
        : 1;

    return BaseSection(
        name: document.querySelector(".title_cate")!.text,
        items: data,
        page: page,
        totalItems: data.length * maxPage,
        totalPages: maxPage,
        filters: globalFilters);
  }

  // auth service
  @override
  getUser({cookie}) async {
    final document = await fetchDocument("$baseUrl/thiet-lap-tai-khoan.html",
        cookie: cookie);

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
    final document = await fetchDocument(
      "$baseUrl/truyen-tranh/$slug.html",
    );

    return document.body!.text.contains("Bỏ Theo Dõi");
    // ok
    // final csrf = document.querySelector("#csrf-token")!.attributes["value"]!;
  }

  @override
  Future<bool> setLike({required slug, required value}) async {
    final document = await fetchDocument(
      "$baseUrl/truyen-tranh/$slug.html",
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
