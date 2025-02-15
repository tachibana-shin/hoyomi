import 'dart:convert';

import 'package:hoyomi/core_services/book/interfaces/book_section.dart';
import 'package:hoyomi/core_services/book/interfaces/book.dart';
import 'package:hoyomi/core_services/book/interfaces/book_chapter.dart';
import 'package:hoyomi/core_services/interfaces/genre.dart';
import 'package:hoyomi/core_services/interfaces/o_image.dart';
import 'package:hoyomi/core_services/book/interfaces/home_book_section.dart';
import 'package:hoyomi/core_services/book/interfaces/meta_book.dart';
import 'package:hoyomi/core_services/book/interfaces/rate_value.dart';
import 'package:hoyomi/core_services/book/interfaces/status_enum.dart';
import 'package:hoyomi/core_services/book/services/truyengg/main.dart';
import 'package:hoyomi/utils/time_utils.dart';
import 'package:html/dom.dart';
import 'package:intl/intl.dart';

class TruyenQQService extends TruyenGGService {
  @override
  get name => "TruyenQQ";
  @override
  get baseUrl => "https://truyenqqto.com";

  // Utils
  @override
  Book parseBook(Element itemBook, String referer) {
    final String bookId = itemBook
        .querySelector("a")!
        .attributes["href"]!
        .split("/")
        .last
        .replaceFirst(".html", "");
    final $image = itemBook.querySelector("img")!;
    final OImage image = OImage(
        src: $image.attributes["src"]!, headers: {"referer": referer});
    final String name = (itemBook.querySelector(".book_name a")?.text ??
            itemBook.querySelector("img")!.attributes['alt']!)
        .trim();

    final BookChapter lastChap = BookChapter(
        name: itemBook.querySelector(".last_chapter > a")!.text.trim(),
        chapterId: itemBook
            .querySelector(".cl99, .last_chapter > a")!
            .attributes["href"]!
            .split("/")
            .last
            .replaceFirst("$bookId-", "")
            .replaceFirst(".html", ""));

    final timeAgoElement = itemBook.querySelector(".time-ago");
    final timeAgo = timeAgoElement != null
        ? convertTimeAgoToUtc(timeAgoElement.text)
        : null;
    final String? notice = itemBook.querySelector(".type-label")?.text;

    final rateValueText = itemBook.querySelector(".rate-star")?.text.trim();
    final double? rate =
        rateValueText != null ? double.tryParse(rateValueText) : null;

    return Book(
        image: image,
        lastChap: lastChap,
        timeAgo: timeAgo,
        notice: notice,
        name: name,
        bookId: bookId,
        rate: rate,
        originalName: null);
  }

  @override
  Future<List<HomeBookSection>> home() async {
    final document = await fetchDocument(baseUrl);

    return [
      HomeBookSection(
        items: document
            .querySelectorAll("#list_suggest > li")
            .map((element) => parseBook(element, baseUrl))
            .toList(),
        name: 'Truyện Hay',
      ),
      HomeBookSection(
          items: document
              .querySelectorAll("#list_new > li")
              .map((element) => parseBook(element, baseUrl))
              .toList(),
          name: 'Truyện Mới Cập Nhật',
          sectionId: 'truyen-moi-cap-nhat'),
    ];
  }

  @override
  Future<MetaBook> getDetails(String bookId) async {
    final document = await fetchDocument("$baseUrl/truyen-tranh/$bookId.html");

    final String name =
        document.querySelector("h1[itemprop=name]")!.text.trim();
    final OImage image = OImage(
        src: document.querySelector(".book_avatar img")!.attributes["src"]!,
        headers: {"referer": baseUrl});

    final tales = document.querySelectorAll(".list-info > li");

    final originalName = _getInfoTale(tales, "Tên khác")?.text.trim();
    final author = _getInfoTale(tales, "Tác giả")?.text.trim();
    final translator = _getInfoTale(tales, "Dịch giả")?.text.trim();
    final status$ =
        _getInfoTale(tales, "Tình trạng")?.text.trim().toLowerCase() ??
            "unknown";
    final status = status$ == 'đang cập nhật'
        ? StatusEnum.ongoing
        : status$ == 'unknown'
            ? StatusEnum.unknown
            : StatusEnum.completed;

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

    final genres = document.querySelectorAll(".list01 a").map((anchor) =>
        Genre(
            name: anchor.text.trim(),
            genreId:
                "the-loai*${anchor.attributes["href"]!.split("/").last.replaceFirst(".html", "")}"));
    final description =
        document.querySelector(".story-detail-info")!.text.trim();
    final chapters =
        document.querySelectorAll(".works-chapter-item").reversed.map((chap) {
      final name = chap.querySelector("a")!.text;
      final chapterId = chap
          .querySelector("a")!
          .attributes["href"]!
          .split("/")
          .last
          .replaceFirst("$bookId-", "")
          .replaceFirst(".html", "");

      final time$ = chap.querySelector('.time-chap')?.text.trim();
      final time =
          time$ != null ? DateFormat("dd/MM/yyyy").tryParse(time$) : null;

      return Chapter(name: name, chapterId: chapterId, time: time);
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
        genres: genres.toList(),
        description: description,
        chapters: chapters.toList(),
        lastModified: lastModified);
  }

  @override
  Future<List<OImage>> getPages(String manga, String chap) async {
    final document = await fetchDocument(getURL(manga, chapterId: chap));

    return document.querySelectorAll(".chapter_content img").map((img) {
      final src = img.attributes["src"]!;

      return OImage(src: src, headers: {"referer": baseUrl});
    }).toList();
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
  search({required keyword, required page, required filters}) async {
    final url =
        "$baseUrl/tim-kiem${page > 1 ? '/trang-$page' : ''}.html?q=${Uri.encodeComponent(keyword)}";

    final Document document = await fetchDocument(url);

    final data = document
        .querySelectorAll(".list_grid_out li")
        .map((element) => parseBook(element, baseUrl));

    final lastPageLink = document
        .querySelector(".page_redirect > a:last-child")
        ?.attributes["href"];
    final maxPage = lastPageLink != null
        ? int.parse(RegExp(r'trang-(\d+)').firstMatch(lastPageLink)!.group(1)!)
        : 1;

    return BookSection(
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

    final Document document =
        await fetchDocument(buildQueryUri(url, filters: filters).toString());

    final data = document
        .querySelectorAll(".list_grid_out li")
        .map((element) => parseBook(element, baseUrl));

    final lastPageLink = document
        .querySelector(".page_redirect > a:last-child")
        ?.attributes["href"];
    final maxPage = lastPageLink != null
        ? int.parse(RegExp(r'trang-(\d+)').firstMatch(lastPageLink)!.group(1)!)
        : 1;

    return BookSection(
        name: document
                .querySelector(".title_cate, .text_list_update")
                ?.text
                .trim() ??
            '',
        url: url,
        description: document.querySelector("tags_detail")?.text,
        items: data.toList(),
        page: page,
        totalItems: data.length * maxPage,
        totalPages: maxPage,
        filters: globalFilters);
  }
}
