import 'dart:convert';

import 'package:flutter/material.dart' as material;
import 'package:honyomi/core_services/eiga/eiga_base_service.dart';
import 'package:honyomi/core_services/eiga/interfaces/base_eiga_home.dart';
import 'package:honyomi/core_services/eiga/interfaces/episode_eiga.dart';
import 'package:honyomi/core_services/eiga/interfaces/episodes_eiga.dart';
import 'package:honyomi/core_services/eiga/interfaces/source_content.dart';
import 'package:honyomi/core_services/eiga/interfaces/source_video.dart';
import 'package:honyomi/core_services/interfaces/basic_carousel.dart';
import 'package:honyomi/core_services/eiga/interfaces/basic_carousel_item.dart';
import 'package:honyomi/core_services/eiga/interfaces/basic_eiga.dart';
import 'package:honyomi/core_services/eiga/interfaces/basic_eiga_section.dart';
import 'package:honyomi/core_services/eiga/interfaces/eiga_param.dart';
import 'package:honyomi/core_services/eiga/interfaces/meta_eiga.dart';
import 'package:honyomi/core_services/interfaces/basic_genre.dart';
import 'package:honyomi/core_services/interfaces/basic_image.dart';
import 'package:html/dom.dart';

import 'dart:typed_data';
import 'package:crypto/crypto.dart';
import 'package:pointycastle/export.dart';
import 'package:archive/archive.dart';

class AnimeVietsubService extends EigaBaseService {
  @override
  final String name = "AnimeVietsub";
  @override
  final String baseUrl = "https://animevietsub.video";
  @override
  String get faviconUrl => "$baseUrl/favicon.ico";

  @override
  parseURL(String url) {
    final uri = Uri.parse(url);
    assert(uri.path.startsWith("/phim"));

    final seg = uri.path.split("/");
    // [0] is empty, [1] is phim
    final eigaId = seg[2];
    final episodeId = seg.length >= 4 ? seg[3] : null;

    return EigaParam(eigaId: eigaId, episodeId: episodeId);
  }

  BasicEiga _parseItem(Element item) {
    final name = item.querySelector(".Title")!.text;
    final eigaId =
        parseURL(item.querySelector("a")!.attributes["href"]!).eigaId;
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
    final description =
        item.querySelector(".Description > p")?.innerHtml.trim();
    final studio = item
        .querySelector(".AAIco-videocam")
        ?.text
        .replaceFirst('Studio:', '')
        .trim();
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

  Element? _findInfo(List<Element> elements, String label) {
    for (final element in elements) {
      if (element
              .querySelector("strong")
              ?.text
              .trim()
              .toLowerCase()
              .startsWith(label) ==
          true) {
        return element;
      }
    }

    return null;
  }

  BasicGenre _getInfoAnchor(Element item) {
    final href =
        Uri.parse('http://localhost').resolve(item.attributes['href']!).path;

    return BasicGenre(
        name: item.text.trim(),
        genreId: href.replaceAll(r'^\/|\/$', '').replaceAll('/', '_'));
  }

  @override
  getDetails(String eigaId) async {
    final document = await fetchDocument('$baseUrl/phim/$eigaId');

    final name = document.querySelector(".Title")!.text;
    final originalName = document.querySelector(".SubTitle")!.text;
    final image = BasicImage(
        src: document.querySelector(".Image img")!.attributes['src']!,
        headers: {'referer': baseUrl});
    final poster = document.querySelector(".TPostBg img") == null
        ? null
        : BasicImage(
            src: document.querySelector(".TPostBg img")!.attributes['src']!,
            headers: {'referer': baseUrl});
    final description = document.querySelector(".Description")?.text;

    final rate = double.parse(RegExp(r'[\d.]+')
        .firstMatch(document.querySelector("#average_score")!.text.trim())!
        .group(0)!);
    final countRate = int.parse(RegExp(r'\d+')
        .firstMatch(document.querySelector(".num-rating")!.text.trim())!
        .group(0)!);
    final duration = document.querySelector(".AAIco-access_time")!.text.trim();
    final yearOf =
        int.parse(document.querySelector(".AAIco-date_range > a")!.text.trim());
    final views = int.parse(RegExp(r'\d+')
        .firstMatch(document
            .querySelector(".AAIco-remove_red_eye")!
            .text
            .trim()
            .replaceAll(',', ''))!
        .group(0)!);
    final seasons = document.querySelectorAll(".season_item > a").map((item) {
      return BasicSeason(
          name: item.text.trim(),
          eigaId:
              Uri.parse(item.attributes['href']!).path.split('/').elementAt(2));
    }).toList();
    final genres = document
        .querySelectorAll(".breadcrumb > li > a")
        .skip(1)
        .take(document.querySelectorAll(".breadcrumb > li > a").length - 2)
        .map((item) => _getInfoAnchor(item))
        .toList();
    final quality = document.querySelector(".Qlty")!.text.trim();

    // ==== info ====
    final infoListLeft =
        document.querySelectorAll(".mvici-left > .InfoList > .AAIco-adjust");
    final infoListRight =
        document.querySelectorAll(".mvici-right > .InfoList > .AAIco-adjust");

    // final status =
    //     _findInfo(infoListLeft, "trạng thái")?.text.split(":")[1].trim();
    final author =
        _findInfo(infoListLeft, "đạo diễn")?.text.split(":")[1].trim();
    final countries = _findInfo(infoListLeft, "quốc gia")
        ?.querySelectorAll("a")
        .map((item) => _getInfoAnchor(item))
        .toList();
    final likes = int.parse(_findInfo(infoListLeft, "số người theo dõi")
            ?.text
            .split(":")[1]
            .trim()
            .replaceAll(',', '') ??
        '0');
    final language =
        _findInfo(infoListRight, "ngôn ngữ")?.text.split(":")[1].trim();
    final studio = _findInfo(infoListRight, "studio") == null
        ? null
        : _getInfoAnchor(
            _findInfo(infoListRight, "studio")!.querySelector("a")!);
    final trailer = document.querySelector("#Opt1 iframe")?.attributes['src'];
    final movieSeason =
        _getInfoAnchor(_findInfo(infoListRight, "studio")!.querySelector("a")!);

    return MetaEiga(
        name: name,
        originalName: originalName,
        image: image,
        poster: poster,
        description: description ?? '',
        rate: rate,
        countRate: countRate,
        duration: duration,
        yearOf: yearOf,
        views: views,
        seasons: seasons,
        genres: genres,
        quality: quality,
        author: author,
        countries: countries,
        likes: likes,
        language: language,
        studio: studio,
        movieSeason: movieSeason,
        trailer: trailer);
  }

  @override
  getEpisodes(String eigaId) async {
    final document = await fetchDocument('$baseUrl/phim/$eigaId/xem-phim.html');

    final episodes = document
        .querySelectorAll("#list-server .list-episode .episode a")
        .map((item) {
      return EpisodeEiga(
          name: item.text.trim(),
          episodeId:
              Uri.parse(item.attributes['href']!).path.split('/').elementAt(3),
          extra: {
            'id': item.attributes['data-id']!,
            'play': item.attributes['data-play']!,
            'hash': item.attributes['data-hash']!
          });
    }).toList();

    final scheduleText = document
        .querySelector(".schedule-title-main > h4 > strong:nth-child(3)")
        ?.text;
    final match = RegExp(r'(Thứ [^\s]+|chủ nhật) vào lúc (\d+) giờ (\d+) phút',
            caseSensitive: false)
        .firstMatch(scheduleText ?? '');
    final day = match?.group(1);
    final hour = match?.group(2);
    final minute = match?.group(3);

    final image$ = document.querySelector(".Image img")?.attributes['src'];
    final image = image$ == null
        ? null
        : BasicImage(src: image$, headers: {'referer': baseUrl});
    final poster$ = document.querySelector(".TPostBg img")?.attributes['src'];
    final poster = poster$ == null
        ? null
        : BasicImage(src: poster$, headers: {'referer': baseUrl});

    return EpisodesEiga(
      episodes: episodes,
      image: image,
      poster: poster,
      schedule: day != null && hour != null && minute != null
          ? TimeAndDay(
              hour: int.parse(hour), minute: int.parse(minute), day: day)
          : null,
    );
  }

  @override
  getSource({required EpisodeEiga episode}) async {
    final json = jsonDecode(await fetch('$baseUrl/ajax/player?v=2019a',
        body: {...(episode.extra as Map<String, String>? ?? {}), 'backuplinks': '1'}));

    return SourceVideo(src: json['link'][0]['file'], type: json['playTech'] == 'api' ? 'hls' : 'embed', headers: {'referer': baseUrl});
  }
  
  fetchSourceContentData({required source}) async {
    return SourceContent(content: _decryptM3u8(source.src), url: source.url, headers: source.headers);
  }

  @override
  getSubtitles({required episode}) async {
    return [];
  }
}


String _decryptM3u8(
  String data, {
  bool flag1 = true,
  bool flag2 = false,
  bool flag3 = false,
  bool flag4 = false,
  String? key,
}) {
  final keyString = key ?? "ZG1fdGhhbmdfc3VjX3ZhdF9nZXRfbGlua19hbl9kYnQ";
  final keyBytes = base64.decode(keyString);
  final digest = sha256.convert(keyBytes).bytes;

  final buff = flag1 ? base64.decode(data) : Uint8List(data.length);

  final iv = buff.sublist(flag2 ? 9 : 0, flag3 ? 18 : 16);
  final body = buff.sublist(flag4 ? 25 : 16);

  final cipher = CBCBlockCipher(AESFastEngine())
    ..init(
      false,
      ParametersWithIV(KeyParameter(Uint8List.fromList(digest)), iv),
    );

  final decrypted = _processBlocks(cipher, body);
  final decompressed = _Inflate.raw(decrypted);//.getBytes();

  return utf8.decode(decompressed);
}

Uint8List _processBlocks(BlockCipher cipher, Uint8List input) {
  final output = Uint8List(input.length);
  var offset = 0;

  while (offset < input.length) {
    final length = cipher.processBlock(input, offset, output, offset);
    offset += length;
  }

  return output;
}

class _Inflate {
  final List<int> _input;
  _Inflate(this._input);

  Uint8List  getBytes() {
    final archive = ZLibDecoder().decodeBytes(_input, verify: true);
    return archive;
  }

  static Uint8List  raw(List<int> input) {
    final archive = ZLibDecoder().decodeBytes(input, verify: true);
    return archive;
  }
}