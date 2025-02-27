import 'dart:convert';
import 'dart:math';

import 'package:hoyomi/core_services/comic/interfaces/comic_section.dart';
import 'package:hoyomi/core_services/comic/interfaces/comic.dart';
import 'package:hoyomi/core_services/comic/interfaces/comic_chapter.dart';
import 'package:hoyomi/core_services/interfaces/genre.dart';
import 'package:hoyomi/core_services/interfaces/o_image.dart';
import 'package:hoyomi/core_services/comic/interfaces/home_comic_section.dart';
import 'package:hoyomi/core_services/comic/interfaces/meta_comic.dart';
import 'package:hoyomi/core_services/comic/interfaces/rate_value.dart';
import 'package:hoyomi/core_services/comic/interfaces/status_enum.dart';
import 'package:hoyomi/core_services/comic/services/truyengg/main.dart';
import 'package:hoyomi/utils/time_utils.dart';
import 'package:html/dom.dart';
import 'package:intl/intl.dart';

class TruyenQQService extends TruyenGGService {
  @override
  get name => "TruyenQQ";
  @override
  get baseUrl => "https://truyenqqto.com";
  @override
  get faviconUrl => "https://i.imgur.com/yX8CCPe.png";

  /// @Hooks
  String _generateRandomHex(int length) {
    const hexChars = '0123456789abcdef';
    final random = Random();
    return List.generate(
      length,
      (_) => hexChars[random.nextInt(hexChars.length)],
    ).join();
  }

  @override
  onBeforeInsertCookie(String? cookie) {
    cookie ??= '';

    return 'visit-read=${_generateRandomHex(13)}-${_generateRandomHex(13)}; $cookie';
  }

  // Utils
  @override
  Comic parseComic(Element itemComic, String referer) {
    final String comicId = itemComic
        .querySelector("a")!
        .attributes["href"]!
        .split("/")
        .last
        .replaceFirst(".html", "");
    final $image = itemComic.querySelector("img")!;
    final OImage image = OImage(
      src: $image.attributes["src"]!,
      headers: {"referer": referer},
    );
    final String name =
        (itemComic.querySelector(".comic_name a")?.text ??
                itemComic.querySelector("img")!.attributes['alt']!)
            .trim();

    final ComicChapter lastChap = ComicChapter(
      name: itemComic.querySelector(".last_chapter > a")!.text.trim(),
      chapterId: itemComic
          .querySelector(".cl99, .last_chapter > a")!
          .attributes["href"]!
          .split("/")
          .last
          .replaceFirst("$comicId-", "")
          .replaceFirst(".html", ""),
    );

    final timeAgoElement = itemComic.querySelector(".time-ago");
    final timeAgo =
        timeAgoElement != null
            ? convertTimeAgoToUtc(timeAgoElement.text)
            : null;
    final String? notice = itemComic.querySelector(".type-label")?.text;

    final rateValueText = itemComic.querySelector(".rate-star")?.text.trim();
    final double? rate =
        rateValueText != null ? double.tryParse(rateValueText) : null;

    return Comic(
      image: image,
      lastChap: lastChap,
      timeAgo: timeAgo,
      notice: notice,
      name: name,
      comicId: comicId,
      rate: rate,
      originalName: null,
    );
  }

  @override
  Future<List<HomeComicSection>> home() async {
    final document = await fetchDocument(baseUrl);

    return [
      HomeComicSection(
        items:
            document
                .querySelectorAll("#list_suggest > li")
                .map((element) => parseComic(element, baseUrl))
                .toList(),
        name: 'Truyện Hay',
      ),
      HomeComicSection(
        items:
            document
                .querySelectorAll("#list_new > li")
                .map((element) => parseComic(element, baseUrl))
                .toList(),
        name: 'Truyện Mới Cập Nhật',
        sectionId: 'truyen-moi-cap-nhat',
      ),
    ];
  }

  @override
  Future<MetaComic> getDetails(String comicId) async {
    final document = await fetchDocument("$baseUrl/truyen-tranh/$comicId.html");

    final String name =
        document.querySelector("h1[itemprop=name]")!.text.trim();
    final OImage image = OImage(
      src: document.querySelector(".comic_avatar img")!.attributes["src"]!,
      headers: {"referer": baseUrl},
    );

    final tales = document.querySelectorAll(".list-info > li");

    final originalName = _getInfoTale(tales, "Tên khác")?.text.trim();
    final author = _getInfoTale(tales, "Tác giả")?.text.trim();
    final translator = _getInfoTale(tales, "Dịch giả")?.text.trim();
    final status$ =
        _getInfoTale(tales, "Tình trạng")?.text.trim().toLowerCase() ??
        "unknown";
    final status =
        status$ == 'đang cập nhật'
            ? StatusEnum.ongoing
            : status$ == 'unknown'
            ? StatusEnum.unknown
            : StatusEnum.completed;

    final views = int.tryParse(
      _getInfoTale(tales, "Lượt xem")?.text.trim().replaceAll(",", "") ?? '',
    );
    final likes = int.tryParse(
      _getInfoTale(tales, "Lượt theo dõi")?.text.trim().replaceAll(",", "") ??
          "",
    );

    final rate$ =
        JsonDecoder().convert(
              document
                      .querySelector("script[type='application/ld+json']")
                      ?.text
                      .trim() ??
                  "{}",
            )
            as Map<String, dynamic>;

    final rate =
        rate$.containsKey('aggregateRating')
            ? RateValue(
              best: int.parse("${rate$['aggregateRating']['bestRating']}"),
              count: int.parse(rate$['aggregateRating']['ratingCount']),
              value: double.parse(rate$['aggregateRating']['ratingValue']),
            )
            : null;

    final genres = document
        .querySelectorAll(".list01 a")
        .map(
          (anchor) => Genre(
            name: anchor.text.trim(),
            genreId:
                "the-loai*${anchor.attributes["href"]!.split("/").last.replaceFirst(".html", "")}",
          ),
        );
    final description =
        document.querySelector(".story-detail-info")!.text.trim();
    final chapters = document
        .querySelectorAll(".works-chapter-item")
        .reversed
        .map((chap) {
          final name = chap.querySelector("a")!.text;
          final chapterId = chap
              .querySelector("a")!
              .attributes["href"]!
              .split("/")
              .last
              .replaceFirst("$comicId-", "")
              .replaceFirst(".html", "");

          final time$ = chap.querySelector('.time-chap')?.text.trim();
          final time =
              time$ != null ? DateFormat("dd/MM/yyyy").tryParse(time$) : null;

          return ComicChapter(name: name, chapterId: chapterId, time: time);
        });
    final lastModified =
        rate$.containsKey("dateModified")
            ? DateTime.parse(rate$["dateModified"])
            : DateFormat(
              "dd/MM/yyyy",
            ).parse(document.querySelector(".time-chap")!.text);

    return MetaComic(
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
      lastModified: lastModified,
    );
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
        .map((element) => parseComic(element, baseUrl));

    final lastPageLink =
        document
            .querySelector(".page_redirect > a:last-child")
            ?.attributes["href"];
    final maxPage =
        lastPageLink != null
            ? int.parse(
              RegExp(r'trang-(\d+)').firstMatch(lastPageLink)!.group(1)!,
            )
            : 1;

    return ComicSection(
      name: '',
      url: url,
      items: data.toList(),
      page: page,
      totalItems: data.length * maxPage,
      totalPages: maxPage,
    );
  }

  @override
  getSection({required sectionId, required page, required filters}) async {
    final url =
        "$baseUrl/${sectionId.replaceAll('*', '/')}${page > 1 ? '/trang-$page' : ''}.html";

    final Document document = await fetchDocument(
      buildQueryUri(url, filters: filters).toString(),
    );

    final data = document
        .querySelectorAll(".list_grid_out li")
        .map((element) => parseComic(element, baseUrl));

    final lastPageLink =
        document
            .querySelector(".page_redirect > a:last-child")
            ?.attributes["href"];
    final maxPage =
        lastPageLink != null
            ? int.parse(
              RegExp(r'trang-(\d+)').firstMatch(lastPageLink)!.group(1)!,
            )
            : 1;

    return ComicSection(
      name:
          document
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
      filters: globalFilters,
    );
  }
}
