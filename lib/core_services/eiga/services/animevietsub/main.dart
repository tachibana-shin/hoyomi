import 'package:flutter/material.dart' as material;
import 'package:honyomi/core_services/eiga/eiga_base_service.dart';
import 'package:honyomi/core_services/eiga/interfaces/base_eiga_home.dart';
import 'package:honyomi/core_services/eiga/interfaces/basic_carousel.dart';
import 'package:honyomi/core_services/eiga/interfaces/basic_carousel_item.dart';
import 'package:honyomi/core_services/eiga/interfaces/basic_eiga.dart';
import 'package:honyomi/core_services/eiga/interfaces/basic_eiga_section.dart';
import 'package:honyomi/core_services/interfaces/basic_genre.dart';
import 'package:honyomi/core_services/interfaces/basic_image.dart';
import 'package:html/dom.dart';

class AnimeVietsubService extends EigaBaseService {
  @override
  final String name = "AnimeVietsub";
  @override
  final String baseUrl = "https://animevietsub.info/";
  @override
  String get faviconUrl => "$baseUrl/favicon.ico";

  BasicEiga _parseItem(Element item) {
    final name = item.querySelector(".Title")!.text;
    final eigaId = item.querySelector("a")!.attributes["href"]!;
    final originalName = item.querySelector(".Qlty")?.text ??
        item.querySelector(".mli-quality")?.text;

    final image = BasicImage(
        src: item.querySelector("img")!.attributes["data-cfsrc"] ??
            item.querySelector("img")!.attributes["src"]!,
        headers: {"Referer": baseUrl});
    final notice =
        '${originalName?.isNotEmpty == true ? '${originalName!.trim()} ' : ''}${item.querySelector(".AAIco-access_time, .mli-eps")?.text ?? ''}';

    final rate = double.parse(
        item.querySelector(".anime-avg-user-rating")?.text.trim() ??
            item.querySelector(".AAIco-star")!.text.trim());

    final timeSchedule = item.querySelector(".mli-timeschedule");
    final countdownInSeconds = timeSchedule == null
        ? null
        : int.tryParse(timeSchedule.attributes["data-timer_second"] ?? '');
    final currentTime = DateTime.now();
    final countdown = countdownInSeconds == null
        ? null
        : currentTime.add(Duration(seconds: countdownInSeconds));

    return BasicEiga(
        name: name,
        eigaId: eigaId,
        originalName: null,
        image: image,
        notice: notice,
        rate: rate,
        preRelease: countdown,
        pending: timeSchedule != null,
        lastEpisode: null,
        timeAgo: null);
  }

  BasicCarouselItem _parseCarousel(Element item) {
    final data = _parseItem(item);

    final year = item.querySelector(".AAIco-date_range")?.text.trim();
    final description = item.querySelector(".Description > p")?.innerHtml.trim();
    final studio = item.querySelector(".AAIco-videocam")?.text.replaceFirst('Studio:', '').trim();
    final genres =
        item.querySelectorAll(".AAIco-movie_creation a").map((anchor) {
      final href = anchor.attributes['href']!.split('/');
      return BasicGenre(
          name: anchor.text.trim(), genreId: href.elementAt(href.length - 2));
    }).toList();
//     final actors = item.querySelectorAll(".Cast a").map((anchor) {
//       final href = anchor.attributes['href']!.split('/');
//       return BasicGenre(
// name: anchor.text.trim(),
// genreId: href.elementAt(href.length - 2)
//       );
//     });

    return BasicCarouselItem(
        image: data.image,
        eigaId: data.eigaId,
        name: data.name,
        originalName: data.originalName,
        rate: data.rate,
        notice: data.notice,
        year: year,
        description: description,
        studio: studio,
        genres: genres,
        actors: null,
        duration: null);
  }

  @override
  home() async {
    final document = await fetchDocument(baseUrl);

    return BaseEigaHome(
        carousel: BasicCarousel(
            items: document
                .querySelectorAll(".MovieListSldCn .TPostMv")
                .map((item) => _parseCarousel(item))
                .toList(),
            aspectRatio: 404 / 720,
            maxHeightBuilder: (context) =>
                material.MediaQuery.of(context).size.height * 0.3),
        sections: [
          BasicEigaSection(
              name: 'Top',
              items: document
                  .querySelectorAll(".MovieListTopCn .TPostMv")
                  .map((item) => _parseItem(item))
                  .toList()),
          BasicEigaSection(
              name: 'Latest',
              items: document
                  .querySelectorAll("#single-home .TPostMv")
                  .map((item) => _parseItem(item))
                  .toList()),
          BasicEigaSection(
              name: 'Pre Release',
              items: document
                  .querySelectorAll("#new-home .TPostMv")
                  .map((item) => _parseItem(item))
                  .toList()),
          BasicEigaSection(
              name: 'Hot',
              items: document
                  .querySelectorAll("#hot-home .TPostMv")
                  .map((item) => _parseItem(item))
                  .toList()),
          BasicEigaSection(
              name: 'Top',
              items: document
                  .querySelectorAll("#showTopPhim .TPost")
                  .map((item) => _parseItem(item))
                  .toList()),
        ]);
  }
}
