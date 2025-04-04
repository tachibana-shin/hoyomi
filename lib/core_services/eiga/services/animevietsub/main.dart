import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:hoyomi/core_services/eiga/ab_eiga_service.dart';
import 'package:hoyomi/core_services/eiga/interfaces/main.dart';
import 'package:hoyomi/core_services/eiga/mixin/eiga_auth_mixin.dart';
import 'package:hoyomi/core_services/eiga/mixin/eiga_follow_mixin.dart';
import 'package:hoyomi/core_services/eiga/mixin/eiga_watch_time_mixin.dart';
import 'package:hoyomi/core_services/exception/user_not_found_exception.dart';
import 'package:html/dom.dart';

import 'package:crypto/crypto.dart';
import 'package:http/http.dart';
import 'package:mediaquery_sizer/mediaquery_sizer.dart';
import 'package:pointycastle/export.dart';
import 'package:archive/archive.dart';
import 'package:video_player/video_player.dart';

mixin _SupabaseRPC {
  final String _supabaseUrl = "https://ctwwltbkwksgnispcjmq.supabase.co";
  final String _supabaseKey =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImN0d3dsdGJrd2tzZ25pc3Bjam1xIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjAxNjM5ODksImV4cCI6MjAzNTczOTk4OX0.Dva9EPqy4P0KFYLAGpFqFoMBH4I_yz0VWnGny0uA-8U";

  Future<List<dynamic>> rpc(String name, Object requestData) async {
    final response = await post(
      Uri.parse('$_supabaseUrl/rest/v1/rpc/$name'),
      headers: {
        'User-Agent':
            'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:134.0) Gecko/20100101 Firefox/134.0',
        'Accept': '*/*',
        'Accept-Language': 'vi-VN,vi;q=0.8,en-US;q=0.5,en;q=0.3',
        'Accept-Encoding': 'gzip, deflate, br, zstd',
        'Content-Type': 'application/json',
        'Referer': 'https://animevsub.eu.org/',
        'apikey': _supabaseKey,
        'content-profile': 'public',
        'x-client-info': 'supabase-js-web/2.44.4',
        'Origin': 'https://animevsub.eu.org',
        'DNT': '1',
        'Sec-Fetch-Dest': 'empty',
        'Sec-Fetch-Mode': 'cors',
        'Sec-Fetch-Site': 'cross-site',
        'authorization': 'Bearer $_supabaseKey',
        'Connection': 'keep-alive',
        'Priority': 'u=4',
        'Pragma': 'no-cache',
        'Cache-Control': 'no-cache',
        'TE': 'trailers',
      },
      body: jsonEncode(requestData),
    );

    if (response.statusCode > 299) {
      if (kDebugMode) {
        print('[${response.reasonPhrase}]: ${response.body}');
      }
      throw Exception('[${response.reasonPhrase}]: ${response.body}');
    }

    return jsonDecode(response.body) as List;
  }
}

class AnimeVietsubService extends ABEigaService
    with EigaAuthMixin, EigaWatchTimeMixin, EigaFollowMixin, _SupabaseRPC {
  final hostCUrl = "animevietsub.lol";
  @override
  late final init = ServiceInit(
    name: "AnimeVietsub",
    faviconUrl: OImage(src: '/favicon.ico'),
    rootUrl: 'https://$hostCUrl',
  );

  final String _apiOpEnd = "https://opend-9animetv.animevsub.eu.org";
  final String _apiThumb = "https://sk-hianime.animevsub.eu.org";

  final Map<String, Completer<Map<String, _ParamsEpisode>>>
      _paramsEpisodeStore = {};
  final Map<String, Future<Document>> _docEigaStore = {};
  final Map<String, String> _uidUserStore = {};

  @override
  getUser({required cookie}) async {
    final document = await fetchDocument(
      '$baseUrl/account/info/',
      cookie: cookie,
      headers: {'Referer': baseUrl},
    );

    if (document.querySelector('.profile-userpic') == null) {
      throw UserNotFoundException();
    }

    final avatar = document
        .querySelector('.profile-userpic img')!
        .attributes['src']!
        .replaceFirst(
          RegExp(r'animevietsub\.\w+\/'),
          '${baseUrl.split('://')[1]}/',
        );

    final name = document.querySelector('.profile-usertitle-name')!.text.trim();
    final email = document.querySelector('#email')!.attributes['value']!;
    final username = document.querySelector('#hoten')!.attributes['value']!;

    final sex = document.querySelector('#male')?.attributes['checked'] != null
        ? Sex.male
        : document.querySelector('#female')?.attributes['checked'] != null
            ? Sex.female
            : Sex.other;

    return User(
      user: username,
      photoUrl: avatar,
      fullName: name,
      email: email,
      sex: sex,
    );
  }

  @override
  Future<bool> isFollowed({required eigaId}) async {
    final id = RegExp(r'(\d+)$').firstMatch(eigaId)!.group(1)!;

    final text = await fetch(
      "$baseUrl/ajax/notification?Bookmark=true&filmId=$id",
    );

    return jsonDecode(text)['status'] == 1;
    // ok
    // final csrf = document.querySelector("#csrf-token")!.attributes["value"]!;
  }

  @override
  Future<bool> setFollow({required eigaId, required value}) async {
    final id = RegExp(r'(\d+)$').firstMatch(eigaId)!.group(1)!;

    final text = await fetch(
      "$baseUrl/ajax/notification?Bookmark=true&filmId=$id&type=${value ? "add" : "remove"}",
    );

    return jsonDecode(text)['status'] == 1 ? value : !value;
  }

  @override
  getFollowCount({required eigaId}) async {
    final document = await (_docEigaStore[eigaId] ??= fetchDocument(
      '$baseUrl/phim/$eigaId',
    ).catchError((error) {
      _docEigaStore.remove(eigaId);
      throw error;
    }));

    final infoListLeft = document.querySelectorAll(
      ".mvici-left > .InfoList > .AAIco-adjust",
    );

    final followCount = int.parse(
      _findInfo(
            infoListLeft,
            "số người theo dõi",
          )?.text.split(":")[1].trim().replaceAll(',', '') ??
          '0',
    );

    return followCount;
  }

  @override
  parseURL(String url) {
    final uri = Uri.parse(url);
    assert(uri.path.startsWith("/phim"));

    final seg = uri.path.split("/");
    // [0] is empty, [1] is phim
    final eigaId = seg[2];
    final episodeId = seg.length >= 4 ? seg[3] : null;

    return EigaParam(
      eigaId: eigaId,
      episodeId: episodeId?.replaceFirst(".html", ""),
    );
  }

  Eiga _parseItem(Element item) {
    final name = item.querySelector(".Title")!.text;
    final eigaId =
        parseURL(item.querySelector("a")!.attributes["href"]!).eigaId;
    final originalName = item.querySelector(".Qlty")?.text ??
        item.querySelector(".mli-quality")?.text;

    final image = OImage(
      src: item.querySelector("img")!.attributes["data-cfsrc"] ??
          item.querySelector("img")!.attributes["src"]!,
      headers: {"Referer": baseUrl},
    );
    final notice =
        '${originalName?.isNotEmpty == true ? '${originalName!.trim()} ' : ''}${item.querySelector(".AAIco-access_time, .mli-eps")?.text ?? ''}';

    final rate = num.parse(
      item.querySelector(".anime-avg-user-rating")?.text.trim() ??
          item.querySelector(".AAIco-star")!.text.trim(),
    ).toDouble();

    final timeSchedule = item.querySelector(".mli-timeschedule");
    final countdownInSeconds = timeSchedule == null
        ? null
        : int.tryParse(timeSchedule.attributes["data-timer_second"] ?? '');
    final currentTime = DateTime.now();
    final countdown = countdownInSeconds == null
        ? null
        : currentTime.add(Duration(seconds: countdownInSeconds));

    return Eiga(
      name: name,
      eigaId: eigaId,
      originalName: null,
      image: image,
      notice: notice,
      rate: rate,
      preRelease: countdown,
      pending: timeSchedule != null,
      lastEpisode: null,
      timeAgo: null,
    );
  }

  CarouselItem _parseCarousel(Element item) {
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
      return Genre(
        name: anchor.text.trim(),
        genreId: href.elementAt(href.length - 2),
      );
    }).toList();
    //     final actors = item.querySelectorAll(".Cast a").map((anchor) {
    //       final href = anchor.attributes['href']!.split('/');
    //       return Genre(
    // name: anchor.text.trim(),
    // genreId: href.elementAt(href.length - 2)
    //       );
    //     });

    return CarouselItem(
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
      duration: null,
    );
  }

  @override
  home() async {
    final document = await fetchDocument(baseUrl);

    return EigaHome(
      carousel: Carousel(
        items: document
            .querySelectorAll(".MovieListSldCn .TPostMv")
            .map((item) => _parseCarousel(item))
            .toList(),
        aspectRatio: 404 / 720,
        maxHeightBuilder: (context) => 30.h(context),
      ),
      categorys: [
        HomeEigaCategory(
          name: 'Top',
          items: document
              .querySelectorAll(".MovieListTopCn .TPostMv")
              .map((item) => _parseItem(item))
              .toList(),
        ),
        HomeEigaCategory(
          name: 'Latest',
          items: document
              .querySelectorAll("#single-home .TPostMv")
              .map((item) => _parseItem(item))
              .toList(),
        ),
        HomeEigaCategory(
          name: 'Pre Release',
          items: document
              .querySelectorAll("#new-home .TPostMv")
              .map((item) => _parseItem(item))
              .toList(),
        ),
        HomeEigaCategory(
          name: 'Hot',
          items: document
              .querySelectorAll("#hot-home .TPostMv")
              .map((item) => _parseItem(item))
              .toList(),
        ),
        HomeEigaCategory(
          name: 'Top',
          items: document
              .querySelectorAll("#showTopPhim .TPost")
              .map((item) => _parseItem(item))
              .toList(),
        ),
      ],
    );
  }

  @override
  getCategory({required categoryId, required page, required filters}) async {
    final params = (filters['type'] == null || filters['type']!.isEmpty) &&
            (filters['genres[]'] == null || filters['genres[]']!.isEmpty) &&
            (filters['season'] == null || filters['season']!.isEmpty) &&
            (filters['year'] == null || filters['year']!.isEmpty)
        ? null
        : [
            'danh-sach',
            filters['type']?.first ?? 'all',
            filters['genres[]']?.join('-') ?? 'all',
            filters['season']?.first ?? 'all',
            filters['year']?.first ?? 'all',
            '',
            //list-le/2-44-3-4/winter/2025/
          ].join('/');
    final url = (params == null
            ? baseUrl + categoryId.replaceAll('_', '/')
            : '$baseUrl/$params') +
        (page > 1 ? '/trang-$page' : '') +
        (filters['sort'] == null ? '' : '?sort=${filters['sort']}');
    final document = await fetchDocument(url);

    final name = document.querySelector('title')!.text;
    final items = document
        .querySelector(".MovieList")!
        .querySelectorAll(".TPostMv")
        .map((item) => _parseItem(item))
        .toList();
    final totalPages = int.parse(
      document
              .querySelector(".larger:last-child, .wp-pagenavi > *:last-child")
              ?.attributes["data"] ??
          document
              .querySelector(".larger:last-child, .wp-pagenavi > *:last-child")
              ?.attributes["title"] ??
          "1",
    );

    final totalItems = items.length * totalPages;

    final List<Filter> iFilters =
        document.querySelectorAll("div[class^='fc-']").map((fc) {
      final name =
          fc.querySelector('.fc-title')!.text.replaceFirst(r'\n', '').trim();
      final key = fc.querySelector('input')!.attributes['name']!;
      final multiple =
          fc.querySelector('input')!.attributes['type'] == 'checkbox';
      final options = fc.querySelectorAll('input').map(
            (input) => Option(
              name: input.parentNode!.text!.trim(),
              value: input.attributes['value']!,
            ),
          );

      return Filter(
        name: name,
        key: key,
        multiple: multiple,
        options: options.toList(),
      );
    }).toList()
          ..add(
            Filter(
              name: 'Sắp xếp',
              key: 'sort',
              multiple: true,
              options: [
                Option(name: 'Mới nhất', value: 'latest'),
                Option(name: 'Tên A-Z', value: 'nameaz'),
                Option(name: 'Tên Z-A', value: 'nameza'),
                Option(name: 'Xem nhiều nhất', value: 'view'),
                Option(name: 'Nhiều lượt bình luận', value: 'rating'),
              ],
            ),
          );

    return EigaCategory(
      name: name,
      url: url,
      items: items,
      page: page,
      totalItems: totalItems,
      totalPages: totalPages,
      filters: iFilters,
    );
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

  Genre _getInfoAnchor(Element item) {
    final href =
        Uri.parse('http://localhost').resolve(item.attributes['href']!).path;

    return Genre(
      name: item.text.trim(),
      genreId: href.replaceAll(r'^\/|\/$', '').replaceAll('/', '_'),
    );
  }

  @override
  getDetails(String eigaId) async {
    final document = await (_docEigaStore[eigaId] ??= fetchDocument(
      '$baseUrl/phim/$eigaId',
    ).catchError((error) {
      _docEigaStore.remove(eigaId);
      throw error;
    }));

    final name = document.querySelector(".Title")!.text;
    final originalName = document.querySelector(".SubTitle")!.text;
    final image = OImage(
      src: document.querySelector(".Image img")!.attributes['src']!,
      headers: {'referer': baseUrl},
    );
    final poster = document.querySelector(".TPostBg img") == null
        ? null
        : OImage(
            src: document.querySelector(".TPostBg img")!.attributes['src']!,
            headers: {'referer': baseUrl},
          );
    final description = document.querySelector(".Description")?.text;

    final rate = num.parse(
      RegExp(r'[\d.]+')
          .firstMatch(document.querySelector("#average_score")!.text.trim())!
          .group(0)!,
    ).toDouble();
    final countRate = int.parse(
      RegExp(r'\d+')
          .firstMatch(document.querySelector(".num-rating")!.text.trim())!
          .group(0)!,
    );
    final duration = document.querySelector(".AAIco-access_time")!.text.trim();
    final yearOf = int.parse(
      document.querySelector(".AAIco-date_range > a")!.text.trim(),
    );
    final views = int.parse(
      RegExp(r'\d+')
          .firstMatch(
            document
                .querySelector(".AAIco-remove_red_eye")!
                .text
                .trim()
                .replaceAll(',', ''),
          )!
          .group(0)!,
    );
    final seasons = document.querySelectorAll(".season_item > a").map((item) {
      return Season(
        name: item.text.trim(),
        eigaId: Uri.parse(
          item.attributes['href']!,
        ).path.split('/').elementAt(2),
      );
    }).toList();
    final genres = document
        .querySelectorAll(".breadcrumb > li > a")
        .skip(1)
        .take(document.querySelectorAll(".breadcrumb > li > a").length - 2)
        .map((item) => _getInfoAnchor(item))
        .toList();
    final quality = document.querySelector(".Qlty")!.text.trim();

    // ==== info ====
    final infoListLeft = document.querySelectorAll(
      ".mvici-left > .InfoList > .AAIco-adjust",
    );
    final infoListRight = document.querySelectorAll(
      ".mvici-right > .InfoList > .AAIco-adjust",
    );

    // final status =
    //     _findInfo(infoListLeft, "trạng thái")?.text.split(":")[1].trim();
    final author =
        _findInfo(infoListLeft, "đạo diễn")?.text.split(":")[1].trim();
    final countries = _findInfo(
      infoListLeft,
      "quốc gia",
    )?.querySelectorAll("a").map((item) => _getInfoAnchor(item)).toList();
    final language =
        _findInfo(infoListRight, "ngôn ngữ")?.text.split(":")[1].trim();
    final studio = _findInfo(infoListRight, "studio") == null
        ? null
        : _getInfoAnchor(
            _findInfo(infoListRight, "studio")!.querySelector("a")!,
          );
    final trailer = document.querySelector("#Opt1 iframe")?.attributes['src'];
    final movieSeason = _getInfoAnchor(
      _findInfo(infoListRight, "season")!.querySelector("a")!,
    );

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
      language: language,
      studio: studio,
      movieSeason: movieSeason,
      trailer: trailer,
    );
  }

  Future<(List<EigaEpisode>, Document)> __fetchHtmlEpisodes(String eigaId) {
    late final List<EigaEpisode> episodes;
    if (_paramsEpisodeStore[eigaId] == null ||
        _paramsEpisodeStore[eigaId]!.isCompleted) {
      _paramsEpisodeStore[eigaId] = Completer<Map<String, _ParamsEpisode>>();
    }

    return fetchDocument('$baseUrl/phim/$eigaId/xem-phim.html')
        .then((document) {
      final Map<String, _ParamsEpisode> map = {};

      episodes = document
          .querySelectorAll("#list-server .list-episode .episode a")
          .map((
        item,
      ) {
        final episodeId = Uri.parse(
          item.attributes['href']!,
        ).path.split('/').elementAt(3).replaceFirst(".html", "");

        final params = _ParamsEpisode(
          id: item.attributes['data-id']!,
          play: item.attributes['data-play']!,
          hash: item.attributes['data-hash']!,
          backuplinks: item.attributes['data-backuplinks'] ?? '1',
        );

        map[episodeId] = params;

        return EigaEpisode(name: item.text.trim(), episodeId: episodeId);
      }).toList();

      _paramsEpisodeStore[eigaId]?.complete(map);

      return (episodes, document);
    }).catchError((error) {
      _paramsEpisodeStore[eigaId]?.completeError(error);
      throw error;
    });
  }

  final Map<String, Future<(List<EigaEpisode>, Document)>>
      _fetchHtmlEpisodesStore = {};
  Future<(List<EigaEpisode>, Document)> _fetchHtmlEpisodes(String eigaId) {
    return _fetchHtmlEpisodesStore[eigaId] ??=
        __fetchHtmlEpisodes(eigaId).catchError((error) {
      _fetchHtmlEpisodesStore.remove(eigaId);

      throw error;
    });
  }

  @override
  getEpisodes(String eigaId) async {
    final (episodes, document) = await _fetchHtmlEpisodes(eigaId);

    final scheduleText = document
        .querySelectorAll(".schedule-title-main > h4 > strong")
        .lastOrNull
        ?.text;
    final match = RegExp(
      r'(Thứ [^\s]+|chủ nhật) vào lúc (\d+) giờ (\d+) phút',
      caseSensitive: false,
    ).firstMatch(scheduleText ?? '');
    final day$ = match?.group(1);
    final hour = match?.group(2);
    final minute = match?.group(3);

    final day = day$ == null
        ? null
        : [
            'chủ nhật',
            'thứ hai',
            'thứ ba',
            'thứ tư',
            'thứ năm',
            'thứ sáu',
            'thứ bảy',
          ].indexOf(day$.toLowerCase());

    final image$ = document.querySelector(".Image img")?.attributes['src'];
    final image = image$ == null
        ? null
        : OImage(src: image$, headers: {'referer': baseUrl});
    final poster$ =
        document.querySelector(".TPostBg img")?.attributes['data-cfsrc'];
    final poster = poster$ == null
        ? null
        : OImage(src: poster$, headers: {'referer': baseUrl});

    return EigaEpisodes(
      episodes: episodes,
      image: image,
      poster: poster,
      schedule: day != null && hour != null && minute != null
          ? TimeAndDay(
              hour: int.parse(hour),
              minute: int.parse(minute),
              day: day,
            )
          : null,
    );
  }

  @override
  getSource({required eigaId, required EigaEpisode episode}) async {
    await _fetchHtmlEpisodes(eigaId);

    final text = (await fetch(
      '$baseUrl/ajax/player?v=2019a',
      body: (await _paramsEpisodeStore[eigaId]!.future)[episode.episodeId]!
          .toMap(),
    ));

    final json = jsonDecode(text);
    return SourceVideo(
      src: json['link'][0]['file'],
      url: Uri.parse(baseUrl),
      type: json['playTech'] == 'api' ? 'hls' : 'embed',
      headers: {'referer': baseUrl},
    );
  }

  @override
  fetchSourceContent({required source}) async {
    return SourceContent(
      content: jsonDecode(_decryptM3u8(source.src)),
      url: source.url,
      headers: source.headers,
    );
  }

  final Map<String, Future<String>> _callApiStore = {};
  Future<String> _callApiAnimeVsub(String url) {
    if (_callApiStore[url] != null) return _callApiStore[url]!;
    return _callApiStore[url] = get(Uri.parse(url)).then<String>((response) {
      if (response.statusCode == 200) return response.body;
      throw response;
    });
  }

  Future<String?> _getEpisodeIDApi({
    required String eigaId,
    required EigaEpisode episode,
    required int episodeIndex,
    required MetaEiga metaEiga,
  }) async {
    final episodes = await _callApiAnimeVsub(
      '$_apiOpEnd/list-episodes?${[
        metaEiga.name,
        ...metaEiga.originalName?.split(",").map((name) => name.trim()) ?? []
      ].map((name) => 'name=$name').join('&')}',
    );

    final rawName = episode.name.trim();
    final epName = rawName.replaceAll('^[^0-9.+_-]+', '');

    final list = jsonDecode(episodes)['list'] as List<dynamic>;

    final epFloat = num.parse(epName).toDouble();
    final episodeD = list.firstWhereOrNull((item) {
          if (item['name'] == epName || item['name'] == rawName) {
            return true;
          }

          return num.parse(item['name']).toDouble() == epFloat;
        }) ??
        (episodeIndex < list.length - 1 ? list[episodeIndex] : null);

    if (episodeD == null) return null;

    return episodeD['id'];
  }

  @override
  get getThumbnailPreview => ({
        required eigaId,
        required episode,
        required episodeIndex,
        required metaEiga,
      }) async {
        final episodeId = await _getEpisodeIDApi(
          eigaId: eigaId,
          episode: episode,
          episodeIndex: episodeIndex,
          metaEiga: metaEiga,
        );
        final meta = jsonDecode(
          await _callApiAnimeVsub('$_apiThumb/episode-skip/$episodeId'),
        );

        final file = (meta['tracks'] as List<dynamic>).firstWhereOrNull(
          (item) => item['kind'] == "thumbnails",
        );

        if (file != null) return Vtt(src: file['file']);
        return null;
      };

  @override
  getOpeningEnding({
    required eigaId,
    required episode,
    required episodeIndex,
    required metaEiga,
  }) async {
    final episodeId = await _getEpisodeIDApi(
      eigaId: eigaId,
      episode: episode,
      episodeIndex: episodeIndex,
      metaEiga: metaEiga,
    );
    final meta = jsonDecode(
      await _callApiAnimeVsub('$_apiThumb/episode-skip/$episodeId'),
    );

    final opening = (meta['intro'] as Map<String, dynamic>?);
    final ending = (meta['outro'] as Map<String, dynamic>?);

    return OpeningEnding(
      opening: opening != null
          ? DurationRange(
              Duration(seconds: opening['start'] as int),
              Duration(seconds: opening['end'] as int),
            )
          : null,
      ending: ending != null
          ? DurationRange(
              Duration(seconds: ending['start'] as int),
              Duration(seconds: ending['end'] as int),
            )
          : null,
    );
  }

  @override
  getSubtitles({required eigaId, required episode}) async {
    return [];
  }

  @override
  getSuggest({required metaEiga, required eigaId, page}) async {
    final items = (await _docEigaStore[eigaId]!)
        .querySelectorAll(".MovieListRelated .TPostMv")
        .map((item) => _parseItem(item))
        .toList();

    return items;
  }

  @override
  search({required keyword, required page, required filters, required quick}) {
    return getCategory(
      categoryId: '/tim-kiem/$keyword/',
      page: page,
      filters: filters,
    );
  }

  Future<String> _getUidUser() async {
    final user = await fetchUser();

    return _uidUserStore[user.user] ??=
        sha256.convert(utf8.encode('${user.email}${user.fullName}')).toString();
  }

  @override
  getWatchTime({
    required String eigaId,
    required EigaEpisode episode,
    required int episodeIndex,
    required MetaEiga metaEiga,
  }) async {
    final userUid = await _getUidUser();

    final json = await rpc('get_single_progress', {
      'user_uid': userUid,
      'season_id': eigaId,
      'p_chap_id': RegExp(r'-(\d+)$').firstMatch(episode.episodeId)!.group(1),
    });
    if (json.isEmpty) throw Exception('No watch time found');

    return WatchTime(
      position: Duration(seconds: (json.first['cur'] as num).round()),
      duration: Duration(seconds: (json.first['dur'] as num).round()),
    );
  }

  @override
  Future<Map<String, WatchTime>> getWatchTimeEpisodes({
    required eigaId,
    required episodes,
  }) async {
    final userUid = await _getUidUser();

    final json = await rpc('get_watch_progress', {
      'user_uid': userUid,
      'season_id': eigaId,
    });

    final Map<String, String> chapIdToEpisodeKey = {};
    for (final episode in episodes) {
      final match = RegExp(r'(\d+)$').firstMatch(episode.episodeId);
      if (match != null) {
        chapIdToEpisodeKey[match.group(1)!] = episode.episodeId;
      }
    }

    return {
      for (final item in json)
        if (chapIdToEpisodeKey.containsKey(item['chap_id']))
          chapIdToEpisodeKey[item['chap_id']]!: WatchTime(
            position: Duration(seconds: (item['cur'] as num).round()),
            duration: Duration(seconds: (item['dur'] as num).round()),
          ),
    };
  }

  @override
  Future<void> setWatchTime({
    required eigaId,
    required episode,
    required episodeIndex,
    required MetaEiga metaEiga,
    required season,
    required WatchTime watchTime,
  }) async {
    final userUid = await _getUidUser();

    await rpc('set_single_progress', {
      'user_uid': userUid,
      'p_name': metaEiga.name,
      'p_poster': _removeHostUrlImage(
        metaEiga.poster?.src ?? metaEiga.image.src,
      ),
      'season_id': eigaId,
      'p_season_name': season.name,
      'e_cur': watchTime.position.inMilliseconds / 1e3,
      'e_dur': watchTime.duration.inMilliseconds / 1e3,
      'e_name': episode.name,
      'e_chap': RegExp(r'(\d+)$').firstMatch(episode.episodeId)!.group(1)!,
      'gmt': "Asia/Saigon",
    });
  }

  String _redirectOldDomainCDN(String url) {
    return url.replaceAll(r'/animevietsub\.(?:\w+)/i', hostCUrl);
  }

  String _removeHostUrlImage(String url) {
    final pattern = RegExp(
      r'https?:\/\/([^/]+.)?' + RegExp.escape(hostCUrl) + r'(?=(?:\:\d+)?\/)',
      caseSensitive: false,
    );
    return _redirectOldDomainCDN(
      url,
    ).replaceAllMapped(pattern, (match) => '${match[1]}\$@');
  }

  @override
  Future<List<HistoryItem<Eiga>>> getWatchHistory({required int page}) async {
    final userUid = await _getUidUser();

    final data = (await rpc('query_history', {
      'user_uid': userUid,
      'page': page,
      'size': 30,
    }))
        .map((item) => _WatchInfo.fromJson(item));

    return data.map((item) {
      return HistoryItem<Eiga>(
        item: Eiga(
          name: item.name,
          eigaId: item.season,
          originalName: item.seasonName,
          image: OImage(src: _addHostUrlImage(item.poster)),
        ),
        watchUpdatedAt: item.createdAt,
        lastEpisode: EigaEpisode(name: item.watchName, episodeId: item.watchId),
        watchTime: WatchTime(
          position: Duration(seconds: item.watchCur.round()),
          duration: Duration(seconds: item.watchDur.round()),
        ),
      );
    }).toList();
  }

  String _addHostUrlImage(String url) {
    // for old data from database
    final pattern = RegExp(r'^([^/]+.)?\$@(:\d+)?(?=\/)', caseSensitive: false);
    return _redirectOldDomainCDN(url).replaceAllMapped(pattern, (match) {
      final part1 = match.group(1) ?? '';
      final part2 = match.group(2) ?? '';
      return 'https://$part1$hostCUrl$part2';
    });
  }

  @override
  getFollows({required int page}) async {
    await _getUidUser();

    final category = await getCategory(
      categoryId: '/tu-phim/',
      page: page,
      filters: {},
    );
    final items =
        category.items.map((item) => FollowItem<Eiga>(item: item)).toList();

    return Paginate(
      items: items,
      page: category.page,
      totalItems: category.totalItems,
      totalPages: category.totalPages,
    );
  }
}

class _ParamsEpisode {
  final String id;
  final String play;
  final String hash;
  final String backuplinks;

  _ParamsEpisode({
    required this.id,
    required this.play,
    required this.hash,
    required this.backuplinks,
  });

  Map<String, String> toMap() {
    return {'id': id, 'play': play, 'link': hash, 'backuplinks': backuplinks};
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
  final keyString = key ?? "ZG1fdGhhbmdfc3VjX3ZhdF9nZXRfbGlua19hbl9kYnQ=";
  final keyBytes = base64.decode(keyString);
  final digest = sha256.convert(keyBytes).bytes;

  final buff = flag1 ? base64.decode(data) : Uint8List(data.length);

  final iv = buff.sublist(flag2 ? 9 : 0, flag3 ? 18 : 16);
  final body = buff.sublist(flag4 ? 25 : 16);

  final cipher = CBCBlockCipher(AESEngine())
    ..init(
      false,
      ParametersWithIV(KeyParameter(Uint8List.fromList(digest)), iv),
    );

  final decrypted = _processBlocks(cipher, body);
  final decompressed = _Inflate.raw(decrypted); //.getBytes();

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

  Uint8List getBytes() {
    final archive = ZLibDecoder().decodeBytes(_input, verify: true, raw: true);
    return archive;
  }

  static Uint8List raw(List<int> input) {
    final archive = ZLibDecoder().decodeBytes(input, verify: true, raw: true);
    return archive;
  }
}

class _WatchInfo {
  final DateTime createdAt;
  final String season;
  final String name;
  final String poster;
  final String seasonName;
  final DateTime watchUpdatedAt;
  final String watchName;
  final String watchId;
  final double watchCur;
  final double watchDur;

  _WatchInfo({
    required this.createdAt,
    required this.season,
    required this.name,
    required this.poster,
    required this.seasonName,
    required this.watchUpdatedAt,
    required this.watchName,
    required this.watchId,
    required this.watchCur,
    required this.watchDur,
  });

  // From JSON
  factory _WatchInfo.fromJson(Map<String, dynamic> json) {
    return _WatchInfo(
      createdAt: DateTime.parse(json['created_at']),
      season: json['season'],
      name: json['name'],
      poster: json['poster'],
      seasonName: json['season_name'],
      watchUpdatedAt: DateTime.parse(json['watch_updated_at']),
      watchName: json['watch_name'],
      watchId: json['watch_id'],
      watchCur: json['watch_cur'].runtimeType == double
          ? json['watch_cur']
          : json['watch_cur'].toDouble(),
      watchDur: json['watch_dur'].runtimeType == double
          ? json['watch_dur']
          : json['watch_dur'].toDouble(),
    );
  }

  // To JSON
  Map<String, dynamic> toJson() {
    return {
      'created_at': createdAt.toIso8601String(),
      'season': season,
      'name': name,
      'poster': poster,
      'season_name': seasonName,
      'watch_updated_at': watchUpdatedAt.toIso8601String(),
      'watch_name': watchName,
      'watch_id': watchId,
      'watch_cur': watchCur,
      'watch_dur': watchDur,
    };
  }
}
