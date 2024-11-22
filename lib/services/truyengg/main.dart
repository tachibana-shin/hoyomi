import 'dart:convert';

import 'package:honyomi/services/base_service.dart';
import 'package:honyomi/services/interfaces/basic_image.dart';
import 'package:honyomi/services/interfaces/basic_section.dart';
import 'package:honyomi/services/interfaces/meta_book.dart';
import 'package:honyomi/services/interfaces/rate_value.dart';
import 'package:honyomi/services/interfaces/route.dart';
import 'package:html/dom.dart';
import 'package:intl/intl.dart';

import 'utils/parse_basic_book.dart';

class TruyenGGService extends UtilsService implements BaseService {
  @override
  final String name = "TruyenGG";
  String get baseUrl => "https://truyengg.com";

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
        lastModified: lastModified);
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
}
