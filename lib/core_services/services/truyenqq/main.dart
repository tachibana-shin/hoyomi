import 'dart:convert';

import 'package:honyomi/core_services/interfaces/base_section.dart';
import 'package:honyomi/core_services/interfaces/basic_book.dart';
import 'package:honyomi/core_services/interfaces/basic_image.dart';
import 'package:honyomi/core_services/interfaces/basic_section.dart';
import 'package:honyomi/core_services/interfaces/meta_book.dart';
import 'package:honyomi/core_services/interfaces/paginate.dart';
import 'package:honyomi/core_services/interfaces/rate_value.dart';
import 'package:honyomi/core_services/interfaces/route.dart';
import 'package:honyomi/core_services/services/truyengg/main.dart';
import 'package:honyomi/utils/time_utils.dart';
import 'package:html/dom.dart';
import 'package:intl/intl.dart';

class TruyenQQService extends TruyenGGService {
  @override
  get name => "TruyenQQ";
  @override
  get baseUrl => "https://truyenqqto.com";

  // Utils
  @override
  BasicBook parseBasicBook(Element itemBook, String referer) {
    final String slug = itemBook
        .querySelector("a")!
        .attributes["href"]!
        .split("/")
        .last
        .replaceFirst(".html", "");
    final $image = itemBook.querySelector("img")!;
    final BasicImage image = BasicImage(
        src: $image.attributes["src"]!, headers: {"referer": referer});
    final String name = (itemBook.querySelector(".book_name a")?.text ??
            itemBook.querySelector("img")!.attributes['alt']!)
        .trim();

    final Route lastChap = Route(
        name: itemBook.querySelector(".last_chapter > a")!.text.trim(),
        slug: itemBook
            .querySelector(".cl99, .last_chapter > a")!
            .attributes["href"]!
            .split("/")
            .last
            .replaceFirst("$slug-", "")
            .replaceFirst(".html", ""));

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

  @override
  Future<Iterable<BasicSection>> home() async {
    final document = await fetchDocument(baseUrl);

    return [
      BasicSection(
        books: document
            .querySelectorAll("#list_suggest > li")
            .map((element) => parseBasicBook(element, baseUrl)),
        name: 'Truyện Hay',
      ),
      BasicSection(
          books: document
              .querySelectorAll("#list_new > li")
              .map((element) => parseBasicBook(element, baseUrl)),
          name: 'Truyện Mới Cập Nhật',
          slug: 'truyen-moi-cap-nhat'),
    ];
  }

  @override
  Future<MetaBook> getDetails(String slug) async {
    final document = await fetchDocument("$baseUrl/truyen-tranh/$slug.html");

    final String name =
        document.querySelector("h1[itemprop=name]")!.text.trim();
    final BasicImage image = BasicImage(
        src: document.querySelector(".book_avatar img")!.attributes["src"]!,
        headers: {"referer": baseUrl});

    final tales = document.querySelectorAll(".list-info > li");

    final originalName = _getInfoTale(tales, "Tên khác")?.text.trim();
    final author = _getInfoTale(tales, "Tác giả")?.text.trim();
    final translator = _getInfoTale(tales, "Dịch giả")?.text.trim();
    final status = _getInfoTale(tales, "Tình trạng")?.text.trim() ?? "Unknown";
    final views = int.tryParse(
        _getInfoTale(tales, "Lượt xem")?.text.trim().replaceAll(",", "") ?? '');
    final likes = int.tryParse(
        _getInfoTale(tales, "Lượt theo dõi")?.text.trim().replaceAll(",", "") ??
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

    final genres = document.querySelectorAll(".list01 a").map((anchor) => Route(
        name: anchor.text.trim(),
        slug:
            "the-loai*${anchor.attributes["href"]!.split("/").last.replaceFirst(".html", "")}"));
    final description =
        document.querySelector(".story-detail-info")!.text.trim();
    final slugRoot = slug;
    final chapters =
        document.querySelectorAll(".works-chapter-item").reversed.map((chap) {
      final name = chap.querySelector("a")!.text;
      final slug = chap
          .querySelector("a")!
          .attributes["href"]!
          .split("/")
          .last
          .replaceFirst("$slugRoot-", "")
          .replaceFirst(".html", "");

      final time$ = chap.querySelector('.time-chap')?.text.trim();
      final time =
          time$ != null ? DateFormat("dd/MM/yyyy").tryParse(time$) : null;

      return Chapter(name: name, slug: slug, time: time);
    });
    final lastModified = rate$.containsKey("dateModified")
        ? DateTime.parse(rate$["dateModified"])
        : DateFormat("dd/MM/yyyy")
            .parse(document.querySelector(".time-chap")!.text);

    return MetaBook(
        name: name,
        originalName: originalName,
        image: image,
        author: author,
        translator: translator,
        status: status,
        views: views,
        likes: likes,
        rate: rate,
        genres: genres,
        description: description,
        chapters: chapters,
        lastModified: lastModified);
  }

  @override
  Future<Iterable<BasicImage>> getPages(String manga, String chap) async {
    final document = await fetchDocument(getURL(manga, chapterId: chap));

    return document.querySelectorAll(".chapter_content img").map((img) {
      final src = img.attributes["src"]!;

      return BasicImage(src: src, headers: {"referer": baseUrl});
    });
  }

  Element? _getInfoTale(List<Element> tales, String name) {
    for (final element in tales) {
      if (element.querySelector(".name")?.text.contains(name) ?? false) {
        return element.children.last;
      }
    }

    return null;
  }

  @override
  search(keyword, {page = 1}) async {
    final Document document = await fetchDocument(
        "$baseUrl/tim-kiem${page! > 1 ? '/trang-$page' : ''}.html?q=${Uri.encodeComponent(keyword)}",
        useCookie: true);

    final data = document
        .querySelectorAll(".list_grid_out a")
        .map((element) => parseBasicBook(element, baseUrl));

    final lastPageLink = document
        .querySelector(".page_redirect > a:last-child")
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
    final Document document = await fetchDocument(
        buildQueryUri(
                "$baseUrl/${slug.replaceAll('*', '/')}${page! > 1 ? '/trang-$page' : ''}.html",
                filters: filters)
            .toString(),
        useCookie: true);

    final data = document
        .querySelectorAll(".list_grid_out a")
        .map((element) => parseBasicBook(element, baseUrl));

    final lastPageLink = document
        .querySelector(".page_redirect > a:last-child")
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
}
