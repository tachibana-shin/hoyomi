/// Resource from https://github.com/phisher98/cloudstream-extensions-phisher/blob/master/HiAnime/src/main/kotlin/com/HiAnime/HiAnime.kt
/// https://github.com/phisher98/cloudstream-extensions-phisher/blob/07de88f11818cbf8a0b7342be544f1df674ad346/HiAnime/src/main/kotlin/com/HiAnime/HiAnime.kt#L282
/// https://github.com/search?q=megacloud.club&type=code
///
/// Thanks for @phisher98

library;

import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:hoyomi/core_services/eiga/ab_eiga_service.dart';
import 'package:hoyomi/core_services/eiga/interfaces/main.dart';
import 'package:hoyomi/crypto/decrypt_ase.dart';
import 'package:hoyomi/utils/d_query.dart';
import 'package:intl/intl.dart';

class HiAnimeService extends ABEigaService {
  @override
  bool? get $isAuth => false;

  final hostCUrl = 'hianime.bz';
  @override
  late final init = ServiceInit(
    name: 'HiAnime',
    faviconUrl: OImage(src: '/favicon.ico'),
    rootUrl: 'https://$hostCUrl',
    webRules: [
      WebRule(
        regexFilter: '^https?:\\/\\/(.+\\.)?hianime(.+)?',
        referer: 'https://$hostCUrl',
      ),
      WebRule(urlFilter: '#megacloud|', referer: 'https://megacloud.club/'),
    ],
  );

  final Map<String, Future<DollarFunction>> _cacheDetails = {};

  Eiga _parseItem(DQuery $trend) {
    return Eiga(
      name: $trend.queryOne('.dynamic-name').text(),
      originalName: $trend.queryOne('.dynamic-name').data('jname'),
      eigaId: $trend.queryOne('a').attr('href').split('/').last,
      image: OImage.from($trend.queryOne('img').data('src')),
      notice: [
        $trend.queryOne('.fdi-item').text(),
        'EP ${$trend.queryOne('.tick-sub').text()}',
        $trend.queryOne('.fdi-duration').text(),
      ].where((item) => item.isNotEmpty && item != 'EP ').join('-'),
      countSub: int.tryParse($trend.queryOne('.tick-sub').text()),
      countDub: int.tryParse($trend.queryOne('.tick-dub').text()),
      description: $trend.queryOne('.description').html(),
    );
  }

  @override
  Future<EigaHome> home() async {
    final $ = await fetch$('$baseUrl/home');

    final carousel = EigaCarousel(
      aspectRatio: 679 / 350,
      maxHeightBuilder: 0.4,
      items: $('#slider .deslide-item').map(($deslide) {
        final subText = $deslide.queryOne('.desi-sub-text').text();

        final image = OImage.from(
          $deslide.query('.deslide-cover-img > img').data('src'),
        );
        final eigaId = $deslide
            .query('.desi-buttons > a')
            .attr('href')
            .split('/')
            .last;
        final name = $deslide.query('.dynamic-name').text();
        final originalName = $deslide.query('.dynamic-name').data('jname');
        final $scdItems = $deslide.query('.scd-item');
        final type = $scdItems.eq(0).text();
        final episodeDuration = $scdItems.eq(1).text();
        final updatedAt = DateFormat(
          'MMM d, yyyy',
        ).parse($scdItems.eq(2).text());
        final quality = $scdItems.queryOne('.quality').text();
        final countSub = int.tryParse($scdItems.queryOne('.tick-sub').text());
        final countDub = int.tryParse($scdItems.queryOne('.tick-dub').text());
        // final countEpisodes =
        //     int.tryParse($scdItems.queryOne('.tick-eps').text());

        final description = $deslide
            .queryOne('.desi-description')
            .text()
            .replaceAll(r'\s+', ' ');

        /// double? rate,
        /// String? notice,
        /// String? year,
        /// String? description,
        /// String? studio,
        /// String? duration,
        /// String? language,
        /// List<Genre>? genres,
        /// List<Genre>? actors,

        return EigaCarouselItem(
          subText: subText,
          image: image,
          eigaId: eigaId,
          name: name,
          originalName: originalName,
          type: type,
          episodeDuration: episodeDuration,
          updatedAt: updatedAt,
          quality: quality,
          countSub: countSub,
          countDub: countDub,
          description: description,
        );
      }),
    );

    final $hBlocks = $('.anif-block-header');
    final $hAreas = $('.block_area-header');

    final List<HomeEigaCategory> categories = [
      HomeEigaCategory(
        name: 'Trending',
        items: $('#trending-home .item').map(_parseItem),
      ),
      HomeEigaCategory(
        name: 'Top Airing',
        categoryId: 'top-airing',
        items: $hBlocks
            .containsOne('Top Airing')
            .next()
            .query('li')
            .map(_parseItem),
      ),
      HomeEigaCategory(
        name: 'Most Popular',
        categoryId: 'most-popular',
        items: $hBlocks
            .containsOne('Most Popular')
            .next()
            .query('li')
            .map(_parseItem),
      ),
      HomeEigaCategory(
        name: 'Most Favorite',
        categoryId: 'most-favorite',
        items: $hBlocks
            .containsOne('Most Favorite')
            .next()
            .query('li')
            .map(_parseItem),
      ),
      HomeEigaCategory(
        name: 'Latest Completed',
        categoryId: 'completed',
        items: $hBlocks
            .containsOne('Latest Completed')
            .next()
            .query('li')
            .map(_parseItem),
      ),

      // =============================================================
      HomeEigaCategory(
        name: 'Latest Episode',
        categoryId: 'recently-updated',
        items: $hAreas
            .containsOne('Latest Episode')
            .next()
            .query('.flw-item')
            .map(_parseItem),
      ),
      HomeEigaCategory(
        name: 'New On HiAnime',
        categoryId: 'recently-added',
        items: $hAreas
            .containsOne('New On HiAnime')
            .next()
            .query('.flw-item')
            .map(_parseItem),
      ),
      HomeEigaCategory(
        name: 'Top Upcoming',
        categoryId: 'top-upcoming',
        items: $hAreas
            .containsOne('Top Upcoming')
            .next()
            .query('.flw-item')
            .map(_parseItem),
      ),
    ];

    return EigaHome(carousel: carousel, categories: categories);
  }

  @override
  getCategory({required categoryId, required page, required filters}) async {
    final url = '$baseUrl/${categoryId.replaceAll(r'_', '/')}';
    final query = UrlSearchParams.fromMap(filters).set('page', page.toString());

    final $ = await fetch$(url, query: query);

    final name = $('.cat-heading').text();
    final items = $('.flw-item').map(_parseItem);
    final totalPages = int.parse(
      RegExp(r'=(\d+)$')
              .firstMatch(
                $('.pre-pagination li').eq(1).queryOne('a').attr('href'),
              )
              ?.group(1) ??
          '1',
    );
    final totalItems = totalPages * 40;

    // final List<Filter> iFilters = _iFilters ??= await _getFilters();

    return EigaCategory(
      name: name,
      url: url,
      items: items,
      page: page,
      totalItems: totalItems,
      totalPages: totalPages,
      // filters: iFilters,
    );
  }

  @override
  getExplorer({required page, required filters}) async {
    return getCategory(categoryId: 'filter', page: page, filters: filters);
  }

  @override
  getDetails(String eigaId) async {
    final $ = await (_cacheDetails[eigaId] = fetch$('$baseUrl/$eigaId'));

    final name = $('.dynamic-name').text();
    final originalName = $('.dynamic-name').data('jname');
    final image = OImage.from($('.film-poster-img').attr('src'));
    final poster = null; // OImage.from($('.film-poster-img').attr('src'));
    final description = $(
      '.film-description > .text, .film-description',
      single: true,
    ).html().trim();

    final countRate = null; // pageData.data.item.tmdb?.voteCount;
    final $aniScInfo = $('.anisc-info > .item');
    final rate = double.tryParse(
      $aniScInfo.containsOne('MAL Score:').queryOne('.name, .text').text(),
    ); // pageData.data.item.tmdb?.voteAverage;
    final duration = $aniScInfo
        .containsOne('Duration:')
        .queryOne('.name, .text')
        .textRaw();
    final yearOf = int.tryParse(
      RegExp(r', (\d+) ')
              .firstMatch(
                $aniScInfo
                    .containsOne('Aired:')
                    .queryOne('.name, .text')
                    .text(),
              )
              ?.group(1) ??
          '',
    );
    final views = null; //pageData.data.item.view;
    final seasons = $('.os-list > a').map(($a) {
      return Season(name: $a.text(), eigaId: $a.attr('href').split('/').last);
    });
    final genres = $aniScInfo
        .containsOne('Genres:')
        .query('a')
        .map(
          ($a) =>
              Genre(name: $a.text(), genreId: $a.attr('href').split('/').last),
        );
    final quality = $('.tick-quality', single: true).textRaw();
    final countSub = int.tryParse($('.tick-sub', single: true).textRaw() ?? '');
    final countDub = int.tryParse($('.tick-dub', single: true).textRaw() ?? '');

    // final status = pageData.data.item.status;
    final authors = $aniScInfo
        .containsOne('Producers:')
        .query('a')
        .map(
          ($a) =>
              Genre(name: $a.text(), genreId: $a.attr('href').split('/').last),
        );
    final countries = null;
    final language = $aniScInfo
        .containsOne('Duration:')
        .queryOne('.name, .text')
        .textRaw();
    final studios = $aniScInfo
        .containsOne('Studios:')
        .queryOne('a')
        .map(
          ($studio) => Genre(
            name: $studio.text(),
            genreId: $studio.attr('href').split('/').last,
          ),
        );
    final trailer = null; //pageData.data.item.trailerUrl;
    final movieSeason = $aniScInfo
        .containsOne('Premiered:')
        .queryOne('.name, .text')
        .textRaw();

    final status =
        $aniScInfo
                .containsOne('Status:')
                .queryOne('.name, .text')
                .textRaw()
                ?.contains('Finished') ==
            true
        ? StatusEnum.completed
        : StatusEnum.ongoing;

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
      countSub: countSub,
      countDub: countDub,
      authors: authors,
      countries: countries,
      language: language,
      studios: studios,
      movieSeason: movieSeason == null
          ? null
          : Genre(name: movieSeason, genreId: Genre.noId),
      trailer: trailer,
      status: status,
    );
  }

  @override
  getEpisodes(String eigaId) async {
    final json = jsonDecode(
      await fetch(
        '$baseUrl/ajax/v2/episode/list/${RegExp(r'-(\d+)$').firstMatch(eigaId)!.group(1)}',
      ),
    );
    final html = json['html'] as String;

    final $ = parse$(html);

    final episodes = $('.ep-item').map(($item) {
      return EigaEpisode(
        name: $item.queryOne('.ssli-order').text(),
        episodeId: $item.data('id'),
        description:
            '${$item.queryOne('.e-dynamic-name').text()}(${$item.queryOne('.e-dynamic-name').data('jname')})',
      );
    });

    return EigaEpisodes(
      episodes: episodes,
      // image: image,
      // poster: poster,
      schedule: DateFormat(
        'MMM d, yyyy',
      ).tryParse($('#schedule-date').textRaw() ?? '?'),
    );
  }

  @override
  getServers({required eigaId, required episode}) async {
    final json = jsonDecode(
      await fetch(
        '$baseUrl/ajax/v2/episode/servers?episodeId=${episode.episodeId}',
      ),
    );
    final html = json['html'] as String;

    final $ = parse$(html);

    return $('.server-item[data-id]').map(($item) {
      final id = $item.data('id');
      final type = $item.data('type');
      final name = $item.text().trim();

      return ServerSource(name: name, serverId: id, extra: type);
    });
  }

  Future<String> _getConfServer(String serverId) async {
    final json = await fetch('/ajax/v2/episode/sources?id=$serverId');

    return jsonDecode(json)['link'] as String;
  }

  @override
  getSource({required eigaId, required episode, server}) async {
    if (server == null) throw UnimplementedError();

    final link = await _getConfServer(server.serverId);

    final idRaw = link.substring((link.lastIndexOf("/") >>> 0) + 1);
    final serverId = idRaw.substring(0, idRaw.indexOf("?") >>> 0);

    final rawSourceData = jsonDecode(
      await fetch(
        'https://megacloud.blog/embed-2/v2/e-1/getSources?id=$serverId',
      ),
    );
    final encryptedBase64 = rawSourceData?['sources'];

    if (encryptedBase64.isEmpty) {
      throw Exception('Encrypted source missing in response');
    }

    /// https://github.com/yahyaMomin/hianime-API/blob/main/src/parsers/decryptor/megacloud_v1.js
    ///
    final key = await fetch(
      'https://raw.githubusercontent.com/itzzzme/megacloud-keys/refs/heads/main/key.txt',
    );

    final source = decryptAes(
      base64.decode(encryptedBase64),
      keyOrPassphrase: key,
    );
    final json = jsonDecode(utf8.decode(source));

    return SourceVideo(
      src: json[0]['file'],
      type: json[0]['type'],
      headers: Headers({
        'referer': 'https://megacloud.blog/',
        'origin': 'https://megacloud.blog/',
      }),
      extra: jsonEncode(rawSourceData),
    );
  }

  @override
  Future<SourceContent> fetchSourceContent({
    required SourceVideo source,
  }) async {
    final content = await fetch(source.src, headers: source.headers);

    return SourceContent(
      content: kIsWeb
          ? _processM3U8StreamUrls(content, Uri.parse(source.src))
          : content,
      url: Uri.parse(source.src),
      headers: source.headers,
    );
  }

  String _processM3U8StreamUrls(String content, Uri baseUri) {
    final lines = content.split('\n');
    final processedLines = <String>[];

    for (int i = 0; i < lines.length; i++) {
      final line = lines[i];
      processedLines.add(line);

      if ((line.startsWith('#EXT-X-STREAM-INF') ||
              line.startsWith('#EXTINF')) &&
          i + 1 < lines.length &&
          !lines[i + 1].startsWith('#') &&
          lines[i + 1].trim().isNotEmpty) {
        final relativeUrl = lines[i + 1].trim();
        final fullUrl = '${baseUri.resolve(relativeUrl)}#megacloud';
        processedLines.add(fullUrl);
        i++;
      }
    }

    return processedLines.join('\n');
  }

  @override
  getSubtitles({required eigaId, required episode, required source}) async {
    final data = jsonDecode(source.extra!);

    final subtitles = data['tracks'] as List;
    // is {url: string, lang: string}[] ! lang=thumbnails is preview thumbnail

    return subtitles.where((subtitle) => subtitle['kind'] != 'thumbnails').map((
      subtitle,
    ) {
      return Subtitle(
        url: subtitle['file'],
        language: subtitle['label'],
        code: subtitle['label'],
        type: subtitle['file'].endsWith('srt')
            ? SubtitleType.srt
            : SubtitleType.vtt,
      );
    }).toList();
  }

  @override
  getSeekThumbnail(context) async {
    final data = jsonDecode(context.source.extra!);

    final subtitles = data['subtitles'] as List;
    // is {url: string, lang: string}[] ! lang=thumbnails is preview thumbnail

    final file =
        subtitles.firstWhereOrNull(
              (subtitle) => subtitle['lang'] == 'thumbnails',
            )
            as Map?;
    return file == null ? null : Vtt(src: file['url']);
  }

  @override
  getOpeningEnding(context) async {
    final data = jsonDecode(context.source.extra!);

    final opening = data['intro'] as Map;
    final ending = data['outro'] as Map;

    return OpeningEnding(
      opening: opening['start'] != opening['end']
          ? DurationRange(
              start: Duration(seconds: (opening['start'] as num).floor()),
              end: Duration(seconds: (opening['end'] as num).floor()),
            )
          : null,
      ending: ending['start'] != ending['end']
          ? DurationRange(
              start: Duration(seconds: (ending['start'] as num).floor()),
              end: Duration(seconds: (ending['end'] as num).floor()),
            )
          : null,
    );
  }

  @override
  getSuggest({required metaEiga, required eigaId, page}) async {
    final $ = await _cacheDetails[eigaId]!;
    return $('#main-content .flw-item').map(_parseItem);
  }

  @override
  search({required keyword, required page, required filters, required quick}) {
    return getCategory(
      categoryId: 'search',
      page: page,
      // /_next/data/YjU3ELa3ICaBELMtMHUHj/tim-kiem.json?keyword=%C4%91%E1%BA%A1o+l%C3%A0m+ch%E1%BB%93ng+%C4%91%E1%BA%A3m
      filters: {
        ...filters,
        'keyword': [keyword],
        'page': [page.toString()],
      },
    );
  }
}
