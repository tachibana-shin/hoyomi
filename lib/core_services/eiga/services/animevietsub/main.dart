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
import 'package:hoyomi/plugins/inflate_raw.dart';
import 'package:hoyomi/utils/d_query.dart';

import 'package:crypto/crypto.dart';
import 'package:http/http.dart';
import 'package:pointycastle/export.dart';

mixin _SupabaseRPC {
  final String _supabaseUrl = 'https://ctwwltbkwksgnispcjmq.supabase.co';
  final String _supabaseKey =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImN0d3dsdGJrd2tzZ25pc3Bjam1xIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjAxNjM5ODksImV4cCI6MjAzNTczOTk4OX0.Dva9EPqy4P0KFYLAGpFqFoMBH4I_yz0VWnGny0uA-8U';

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
  final hostCUrl = 'animevietsub.lol';
  @override
  late final init = ServiceInit(
      name: 'AnimeVietsub',
      faviconUrl: OImage(src: '/favicon.ico'),
      rootUrl: 'https://$hostCUrl',
      webRules: [
        WebRule(
          shortRegexFilter: 'animevietsub\\.lol',
          referer: 'https://$hostCUrl',
        ),
        WebRule(
          shortRegexFilter: 'sk-hianime\\.animevsub\\.eu\\.org',
          referer: 'https://animevsub.eu.org',
        ),
        WebRule(
          shortRegexFilter: 'storage\\.googleapiscdn\\.com',
          referer: 'https://storage.googleapiscdn.com',
        ),
      ]);

  final String _apiThumb = 'https://sk-hianime.animevsub.eu.org';

  final Map<String, Completer<Map<String, _ParamsEpisode>>>
      _paramsEpisodeStore = {};
  final Map<String, Future<DollarFunction>> _docEigaStore = {};
  final Map<String, String> _uidUserStore = {};

  @override
  getUser({required cookie}) async {
    final $ = await fetch$(
      '$baseUrl/account/info/',
      cookie: cookie,
      headers: Headers({'Referer': baseUrl}),
    );

    if ($('.profile-userpic', single: true).isEmpty) {
      throw UserNotFoundException();
    }

    final avatar =
        $('.profile-userpic img:eq(0)', single: true).attr('src').replaceFirst(
              RegExp(r'animevietsub\.\w+\/'),
              '${baseUrl.split('://')[1]}/',
            );

    final name = $('.profile-usertitle-name', single: true).text();
    final email = $('#email', single: true).attr('value');
    final username = $('#hoten', single: true).attr('value');

    final sex = $('#male', single: true).prop('checked') != null
        ? Sex.male
        : $('#female', single: true).prop('checked') != null
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
      '$baseUrl/ajax/notification?Bookmark=true&filmId=$id',
    );

    return jsonDecode(text)['status'] == 1;
    // ok
    // final csrf = document.querySelector('#csrf-token')!.attributes['value']!;
  }

  @override
  Future<bool> setFollow({required eigaId, required value}) async {
    final id = RegExp(r'(\d+)$').firstMatch(eigaId)!.group(1)!;

    final text = await fetch(
      '$baseUrl/ajax/notification?Bookmark=true&filmId=$id&type=${value ? 'add' : 'remove'}',
    );

    return jsonDecode(text)['status'] == 1 ? value : !value;
  }

  @override
  getFollowCount({required eigaId}) async {
    final $ = await (_docEigaStore[eigaId] ??= fetch$(
      '$baseUrl/phim/$eigaId',
    ).catchError((error) {
      _docEigaStore.remove(eigaId);
      throw error;
    }));

    final infoListLeft = $('.mvici-left > .InfoList > .AAIco-adjust');

    final followCount = int.parse(
      _findInfo(
            infoListLeft,
            'số người theo dõi',
          )?.text().split(':')[1].replaceAll(',', '') ??
          '0',
    );

    return followCount;
  }

  @override
  parseURL(String url) {
    final uri = Uri.parse(url);
    assert(uri.path.startsWith('/phim'));

    final seg = uri.path.split('/');
    // [0] is empty, [1] is phim
    final eigaId = seg[2];
    final episodeId = seg.length >= 4 ? seg[3] : null;

    return EigaParam(
      eigaId: eigaId,
      episodeId: episodeId?.replaceFirst('.html', ''),
    );
  }

  Eiga _parseItem(DQuery item) {
    final name = item.queryOne('.Title').text();
    final eigaId = parseURL(item.queryOne('a').attr('href')).eigaId;
    final lty$ = item.queryOne('.mli-quality').text();
    final originalName =
        lty$.isNotEmpty ? lty$ : item.queryOne('.mli-quality').text();

    final $img = item.queryOne('img');
    final image = OImage(
      src: $img.attr('data-cfsrc').isNotEmpty
          ? $img.attr('data-cfsrc')
          : $img.attr('src'),
      headers: Headers({'Referer': baseUrl}),
    );
    final notice =
        '${originalName.isNotEmpty == true ? '$originalName ' : ''}${item.queryOne('.AAIco-access_time, .mli-eps').text()}';

    final rate = num.parse(
      item.queryOne('.anime-avg-user-rating').textRaw() ??
          item.queryOne('.AAIco-star').text(),
    ).toDouble();

    final timeSchedule = item.queryOne('.mli-timeschedule');
    final countdownInSeconds = timeSchedule.isEmpty
        ? null
        : int.tryParse(timeSchedule.attr('data-timer_second'));
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
      pending: timeSchedule.isNotEmpty,
      lastEpisode: null,
      timeAgo: null,
    );
  }

  CarouselItem _parseCarousel(DQuery item) {
    final data = _parseItem(item);

    final year = item.queryOne('.AAIco-date_range').text();
    final description = item.queryOne('.Description > p').html();
    final studio =
        item.queryOne('.AAIco-videocam').text().replaceFirst('Studio:', '');
    final genres = item.query('.AAIco-movie_creation a').map((anchor) {
      final href = anchor.attr('href').split('/');
      return Genre(
        name: anchor.text(),
        genreId: href.elementAt(href.length - 2),
      );
    }).toList();
    //     final actors = item.querySelectorAll('.Cast a').map((anchor) {
    //       final href = anchor.attributes['href']!.split('/');
    //       return Genre(
    // name: anchor.text,
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
    final $ = await fetch$(baseUrl);

    return EigaHome(
      carousel: Carousel(
        items: $('.MovieListSldCn .TPostMv')
            .map((item) => _parseCarousel(item))
            .toList(),
        aspectRatio: 404 / 720,
        maxHeightBuilder: 0.3,
      ),
      categories: [
        HomeEigaCategory(
          name: 'Top',
          items: $('.MovieListTopCn .TPostMv')
              .map((item) => _parseItem(item))
              .toList(),
        ),
        HomeEigaCategory(
          name: 'Latest',
          items: $('#single-home .TPostMv')
              .map((item) => _parseItem(item))
              .toList(),
        ),
        HomeEigaCategory(
          name: 'Pre Release',
          items:
              $('#new-home .TPostMv').map((item) => _parseItem(item)).toList(),
        ),
        HomeEigaCategory(
          name: 'Hot',
          items:
              $('#hot-home .TPostMv').map((item) => _parseItem(item)).toList(),
        ),
        HomeEigaCategory(
          name: 'Top',
          items:
              $('#showTopPhim .TPost').map((item) => _parseItem(item)).toList(),
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
    final $ = await fetch$(url);

    final name = $('title', single: true).text();
    final items = $('.MovieList', single: true)
        .query('.TPostMv')
        .map((item) => _parseItem(item))
        .toList();
    final $pageNavi =
        $('.larger:last-child, .wp-pagenavi > *:last-child', single: true);
    final totalPages = int.parse(
        $pageNavi.attrRaw('data') ?? $pageNavi.attrRaw('title') ?? '1');

    final totalItems = items.length * totalPages;

    final List<Filter> iFilters = $('div[class^=\'fc-\']').map((fc) {
      final name = fc.queryOne('.fc-title').text().replaceFirst(r'\n', '');
      final key = fc.queryOne('input').attr('name');
      final multiple = fc.queryOne('input').attr('type') == 'checkbox';
      final options = fc.query('input').map((input) => Option(
            name: input.parent().text(),
            value: input.attr('value'),
          ));

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

  DQuery? _findInfo(DQuery elements, String label) {
    return elements.findOne((element) =>
        element.queryOne('strong').text().toLowerCase().startsWith(label));
  }

  Genre _getInfoAnchor(DQuery item) {
    final href = Uri.parse('http://localhost').resolve(item.attr('href')).path;

    return Genre(
      name: item.text(),
      genreId: href.replaceAll(r'^\/|\/$', '').replaceAll('/', '_'),
    );
  }

  @override
  getDetails(String eigaId) async {
    final $ = await (_docEigaStore[eigaId] ??= fetch$(
      '$baseUrl/phim/$eigaId',
    ).catchError((error) {
      _docEigaStore.remove(eigaId);
      throw error;
    }));

    final name = $('.Title', single: true).text();
    final originalName = $('.SubTitle', single: true).text();
    final image = OImage(
      src: $('.Image img', single: true).attr('src'),
      headers: Headers({'Referer': baseUrl}),
    );
    final $img = $('.TPostBg img', single: true);
    final poster = $img.isEmpty
        ? null
        : OImage(src: $img.attr('src'), headers: Headers({'Referer': baseUrl}));
    final description = $('.Description', single: true).text();

    final rate = num.parse(
      RegExp(r'[\d.]+')
          .firstMatch($('#average_score', single: true).text())!
          .group(0)!,
    ).toDouble();
    final countRate = int.parse(
      RegExp(r'\d+')
          .firstMatch($('.num-rating', single: true).text())!
          .group(0)!,
    );
    final duration = $('.AAIco-access_time', single: true).text();
    final yearOf = int.parse(
      $('.AAIco-date_range > a', single: true).text(),
    );
    final views = int.parse(
      RegExp(r'\d+')
          .firstMatch($('.AAIco-remove_red_eye', single: true)
              .text()
              .replaceAll(',', ''))!
          .group(0)!,
    );
    final seasons = $('.season_item > a').map((item) {
      return Season(
        name: item.text(),
        eigaId: Uri.parse(item.attr('href')).path.split('/').elementAt(2),
      );
    }).toList();
    final $genresAnchor = $('.breadcrumb > li > a');
    final genres = $genresAnchor
        .skip(1)
        .take($genresAnchor.length - 2)
        .map((item) => _getInfoAnchor(item))
        .toList();
    final quality = $('.Qlty', single: true).text();

    // ==== info ====
    final infoListLeft = $('.mvici-left > .InfoList > .AAIco-adjust');
    final infoListRight = $('.mvici-right > .InfoList > .AAIco-adjust');

    // final status =
    //     _findInfo(infoListLeft, 'trạng thái')?.text.split(':')[1];
    final authorName$ =
        _findInfo(infoListLeft, 'đạo diễn')?.text().split(':')[1];
    final authors = authorName$ == null
        ? null
        : [Genre(name: authorName$, genreId: Genre.noId)];
    final countries = _findInfo(
      infoListLeft,
      'quốc gia',
    )?.query('a').map((item) => _getInfoAnchor(item)).toList();
    final language = _findInfo(infoListRight, 'ngôn ngữ')?.text().split(':')[1];
    final studios =
        _findInfo(infoListRight, 'studio')?.query('a').map(_getInfoAnchor);
    final trailer = $('#Opt1 iframe', single: true).attr('src');
    final movieSeason =
        _getInfoAnchor(_findInfo(infoListRight, 'season')!.queryOne('a'));

    return MetaEiga(
      name: name,
      originalName: originalName,
      image: image,
      poster: poster,
      description: description,
      rate: rate,
      countRate: countRate,
      duration: duration,
      yearOf: yearOf,
      views: views,
      seasons: seasons,
      genres: genres,
      quality: quality,
      authors: authors,
      countries: countries,
      language: language,
      studios: studios,
      movieSeason: movieSeason,
      trailer: trailer,
    );
  }

  Future<(List<EigaEpisode>, DollarFunction)> __fetchHtmlEpisodes(
      String eigaId) {
    late final List<EigaEpisode> episodes;
    if (_paramsEpisodeStore[eigaId] == null ||
        _paramsEpisodeStore[eigaId]!.isCompleted) {
      _paramsEpisodeStore[eigaId] = Completer<Map<String, _ParamsEpisode>>();
    }

    return fetch$('$baseUrl/phim/$eigaId/xem-phim.html').then(($) {
      final Map<String, _ParamsEpisode> map = {};

      episodes = $('#list-server .list-episode .episode a').map((
        item,
      ) {
        final episodeId = Uri.parse(item.attr('href'))
            .path
            .split('/')
            .elementAt(3)
            .replaceFirst('.html', '');

        final params = _ParamsEpisode(
          id: item.attr('data-id'),
          play: item.attr('data-play'),
          hash: item.attr('data-hash'),
          backuplinks: item.attrRaw('data-backuplinks') ?? '1',
        );

        map[episodeId] = params;

        return EigaEpisode(name: item.text(), episodeId: episodeId);
      }).toList();

      _paramsEpisodeStore[eigaId]?.complete(map);

      return (episodes, $);
    }).catchError((error) {
      _paramsEpisodeStore[eigaId]?.completeError(error);
      throw error;
    });
  }

  final Map<String, Future<(List<EigaEpisode>, DollarFunction)>>
      _fetchHtmlEpisodesStore = {};
  Future<(List<EigaEpisode>, DollarFunction)> _fetchHtmlEpisodes(
      String eigaId) {
    return _fetchHtmlEpisodesStore[eigaId] ??=
        __fetchHtmlEpisodes(eigaId).catchError((error) {
      _fetchHtmlEpisodesStore.remove(eigaId);

      throw error;
    });
  }

  @override
  getEpisodes(String eigaId) async {
    final (episodes, $) = await _fetchHtmlEpisodes(eigaId);

    final scheduleText =
        $('.schedule-title-main > h4 > strong').last().textRaw();
    final match = RegExp(
      r'(Thứ [^\s]+|chủ nhật) vào lúc (\d+) giờ (\d+) phút',
      caseSensitive: false,
    ).firstMatch(scheduleText ?? '');
    final day$ = match?.group(1);
    final hour = match?.group(2);
    final minute = match?.group(3);

    final dayIndex = day$ == null
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

    DateTime? nextScheduleDateTime;
    if (dayIndex != null && hour != null && minute != null) {
      final now = DateTime.now();
      final todayIndex = now.weekday % 7;

      int daysUntil = (dayIndex - todayIndex) % 7;
      if (daysUntil == 0 &&
          (now.hour > int.parse(hour) ||
              (now.hour == int.parse(hour) &&
                  now.minute >= int.parse(minute)))) {
        daysUntil = 7;
      }

      final scheduledDay = now
          .add(Duration(days: daysUntil))
          .copyWith(hour: int.parse(hour), minute: int.parse(minute));
      nextScheduleDateTime = scheduledDay;
    }

    final image$ = $('.Image img', single: true).attrRaw('src');
    final image = image$ == null
        ? null
        : OImage(src: image$, headers: Headers({'Referer': baseUrl}));
    final poster$ = $('.TPostBg img', single: true).attrRaw('src');
    final poster = poster$ == null
        ? null
        : OImage(src: poster$, headers: Headers({'Referer': baseUrl}));

    return EigaEpisodes(
      episodes: episodes,
      image: image,
      poster: poster,
      schedule: nextScheduleDateTime,
    );
  }

  @override
  getSource({required eigaId, required episode, server}) async {
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
      headers: Headers({'Referer': baseUrl}),
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
    required MetaEiga metaEiga,
  }) async {
    final episodes = await _callApiAnimeVsub(
      '$_apiThumb/list-episodes?${[
        metaEiga.name,
        ...metaEiga.originalName?.split(',').map((name) => name) ?? []
      ].map((name) => 'name=$name').join('&')}',
    );

    final rawName = episode.name.trim();
    final epName = rawName.replaceAll(RegExp('^[^0-9.+_-]+'), '').trim();

    final list = jsonDecode(episodes)['list'] as List<dynamic>;

    final epFloat = num.tryParse(epName)?.toDouble();
    final episodeD = (epFloat == null
            ? null
            : list.firstWhereOrNull((item) {
                if (item['name'] == epName || item['name'] == rawName) {
                  return true;
                }

                return num.tryParse(item['name'])?.toDouble() == epFloat;
              })) ??
        list.elementAtOrNull(episode.index);

    if (episodeD == null) return null;

    return episodeD['id'];
  }

  @override
  getSeekThumbnail(props) async {
    final episodeId = await _getEpisodeIDApi(
      eigaId: props.eigaId,
      episode: props.episode,
      metaEiga: props.metaEiga,
    );
    final meta = jsonDecode(
      await _callApiAnimeVsub('$_apiThumb/episode-skip/$episodeId'),
    );

    final file = meta['thumbs'] as String?;
    if (file != null) return Vtt(src: file);
    return null;
  }

  @override
  getOpeningEnding(props) async {
    final episodeId = await _getEpisodeIDApi(
      eigaId: props.eigaId,
      episode: props.episode,
      metaEiga: props.metaEiga,
    );
    final meta = jsonDecode(
      await _callApiAnimeVsub('$_apiThumb/episode-skip/$episodeId'),
    );

    final opening = (meta['intro'] as Map<String, dynamic>?);
    final ending = (meta['outro'] as Map<String, dynamic>?);

    return OpeningEnding(
      opening: opening != null
          ? DurationRange(
              start: Duration(seconds: (opening['start'] as num).floor()),
              end: Duration(seconds: (opening['end'] as num).floor()),
            )
          : null,
      ending: ending != null
          ? DurationRange(
              start: Duration(seconds: (ending['start'] as num).floor()),
              end: Duration(seconds: (ending['end'] as num).floor()),
            )
          : null,
    );
  }

  @override
  getSuggest({required metaEiga, required eigaId, page}) async {
    final items = (await _docEigaStore[eigaId]!)('.MovieListRelated .TPostMv')
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
      'gmt': 'Asia/Saigon',
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
  final keyString = key ?? 'ZG1fdGhhbmdfc3VjX3ZhdF9nZXRfbGlua19hbl9kYnQ=';
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
  final decompressed = inflateRaw(decrypted); //.getBytes();

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
