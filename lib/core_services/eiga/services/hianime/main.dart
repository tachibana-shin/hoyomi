/// Resource from https://github.com/phisher98/cloudstream-extensions-phisher/blob/master/HiAnime/src/main/kotlin/com/HiAnime/HiAnime.kt
/// https://github.com/phisher98/cloudstream-extensions-phisher/blob/07de88f11818cbf8a0b7342be544f1df674ad346/HiAnime/src/main/kotlin/com/HiAnime/HiAnime.kt#L282
/// https://github.com/search?q=megacloud.club&type=code
///
/// Thanks for @phisher98

library;

import 'dart:async';
import 'dart:convert';

import 'package:hoyomi/core_services/eiga/ab_eiga_service.dart';
import 'package:hoyomi/core_services/eiga/interfaces/main.dart';
import 'package:hoyomi/core_services/eiga/mixin/eiga_watch_time_general_mixin.dart';
import 'package:hoyomi/utils/d_query.dart';

class HiAnimeService extends ABEigaService with EigaWatchTimeGeneralMixin {
  final hostCUrl = 'hianime.bz';
  @override
  late final init = ServiceInit(
    name: 'HiAnime',
    faviconUrl: OImage(src: '/favicon.ico'),
    rootUrl: 'https://$hostCUrl',
  );

  final Map<String, Future<DollarFunction>> _cacheDetails = {};

  @override
  parseURL(String url) {
    final uri = Uri.parse(url);
    assert(uri.path.startsWith('/watch'));

    final seg = uri.path.split('/');
    // [0] is empty, [1] is phim
    final eigaId = seg[2];
    final episodeId = seg.length >= 4 ? seg[3] : null;

    return EigaParam(
      eigaId: eigaId,
      episodeId: episodeId,
    );
  }

  Eiga _parseItem(DQuery $trend) {
    return Eiga(
        name: $trend.queryOne('.dynamic-name').text(),
        originalName: $trend.queryOne('.dynamic-name').data('jname'),
        eigaId: $trend.queryOne('a').attr('href').split('/').last,
        image: OImage.from($trend.queryOne('img').data('src')),
        notice: [
          $trend.queryOne('.fdi-item').text(),
          'EP.${$trend.queryOne('.tick-sub').text()}',
          $trend.queryOne('.fdi-duration').text()
        ].where((item) => item.isNotEmpty).join('-'),
        countSub: int.tryParse($trend.queryOne('.tick-sub').text()),
        countDub: int.tryParse($trend.queryOne('.tick-dub').text()),
        description: $trend.queryOne('.description').html());
  }

  @override
  Future<EigaHome> home() async {
    final $ = await fetch$('$baseUrl/home');

    final carousel = Carousel(
      aspectRatio: 407 / 950,
      maxHeightBuilder: 0.4,
      items: $('#slider .deslide-item').map(($deslide) {
        final subText = $deslide.queryOne('.desi-sub-text').text();

        final image =
            OImage.from($deslide.query('.deslide-cover-img > img').data('src'));
        final eigaId =
            $deslide.query('.desi-buttons > a').attr('href').split('/').last;
        final name = $deslide.query('.dynamic-name').text();
        final originalName = $deslide.query('.dynamic-name').data('jname');
        final $scdItems = $deslide.query('.scd-item');
        final type = $scdItems.eq(0).text();
        final episodeDuration = $scdItems.eq(1).text();
        final updatedAt = DateTime.parse($scdItems.eq(2).text());
        final quality = $scdItems.queryOne('.quality').text();
        final countSub = int.tryParse($scdItems.queryOne('.tick-sub').text());
        final countDub = int.tryParse($scdItems.queryOne('.tick-dub').text());
        // final countEpisodes =
        //     int.tryParse($scdItems.queryOne('.tick-eps').text());

        final description = $deslide.queryOne('.desi-description').html();

        /// double? rate,
        /// String? notice,
        /// String? year,
        /// String? description,
        /// String? studio,
        /// String? duration,
        /// String? language,
        /// List<Genre>? genres,
        /// List<Genre>? actors,

        return CarouselItem(
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

    final List<HomeEigaCategory> categories = [
      HomeEigaCategory(
          name: 'Trending', items: $('#trending-home .item').map(_parseItem)),
      HomeEigaCategory(
        name: 'Top Airing',
        categoryId: 'top-airing',
        items:
            $('#anime-featured > div > div > div > div:nth-child(1) > div > div.anif-block-ul > ul > li')
                .map(_parseItem),
      ),
      HomeEigaCategory(
        name: 'Most Popular',
        categoryId: 'most-popular',
        items:
            $('#anime-featured > div > div > div > div:nth-child(2) > div > div.anif-block-ul > ul > li')
                .map(_parseItem),
      ),
      HomeEigaCategory(
        name: 'Most Favorite',
        categoryId: 'most-favorite',
        items:
            $('#anime-featured > div > div > div > div:nth-child(3) > div > div.anif-block-ul > ul > li')
                .map(_parseItem),
      ),
      HomeEigaCategory(
        name: 'Latest Completed',
        categoryId: 'completed',
        items:
            $('#anime-featured > div > div > div > div:nth-child(4) > div > div.anif-block-ul > ul > li')
                .map(_parseItem),
      ),
      // =============================================================

      HomeEigaCategory(
        name: 'Latest Episode',
        categoryId: 'recently-updated',
        items:
            $('#main-content > section:nth-child(2) > div.tab-content > div > div.film_list-wrap .flw-item')
                .map(_parseItem),
      ),
      HomeEigaCategory(
        name: 'New On HiAnime',
        categoryId: 'recently-added',
        items:
            $('#main-content > section:nth-child(4) > div.tab-content > div > div.film_list-wrap .flw-item')
                .map(_parseItem),
      ),
      HomeEigaCategory(
        name: 'Top Upcoming',
        categoryId: 'top-upcoming',
        items:
            $('#main-content > section:nth-child(7) > div.tab-content > div > div.film_list-wrap .flw-item')
                .map(_parseItem),
      ),
    ];

    return EigaHome(
      carousel: carousel,
      categories: categories,
    );
  }

  @override
  getCategory({required categoryId, required page, required filters}) async {
    final url = '$baseUrl/$categoryId';
    final Map<String, List<String>> query = Map.from(filters);

    query['page'] = [page.toString()];

    final $ = await fetch$('$baseUrl/$categoryId', query: query);

    final name = $('.cat-heading').text();
    final items = $('.flw-item').map(_parseItem);
    final totalPages = int.parse(RegExp(r'=(\d+)$')
            .firstMatch(
                $('.pre-pagination li').eq(1).queryOne('a').attr('href'))
            ?.group(1) ??
        '1');
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
  getDetails(String eigaId) async {
    final $ = await (_cacheDetails[eigaId] = fetch$('$baseUrl/watch/$eigaId'));

    final name = $('.dynamic-name').text();
    final originalName = $('.dynamic-name').data('jname');
    final image = OImage.from($('.film-poster-img').attr('src'));
    final poster = null; // OImage.from($('.film-poster-img').attr('src'));
    final description = $('.film-description').html();

    final countRate = null; // pageData.data.item.tmdb?.voteCount;
    final $aniscInfo = $('.anisc-info > .item', single: true);
    DQuery findInfo(String name) => $aniscInfo
        .findOne(($info) => $info.queryOne('.item-head').text() == name);
    final rate = double.tryParse(findInfo('MAL Score:')
        .queryOne('.text')
        .text()); // pageData.data.item.tmdb?.voteAverage;
    final duration = findInfo('Duration:').queryOne('.text').text();
    final yearOf = int.tryParse(RegExp(r', (\d+) ')
            .firstMatch(findInfo('Aired:').queryOne('.text').text())
            ?.group(1) ??
        '');
    final views = null; //pageData.data.item.view;
    final seasons = $('.os-list > a').map(($a) {
      return Season(name: $a.text(), eigaId: $a.attr('href').split('/').last);
    });
    final genres = findInfo('Genres:').query('a').map(($a) =>
        Genre(name: $a.text(), genreId: $a.attr('href').split('/').last));
    final quality = $('.tick-quality').textRaw();

    // final status = pageData.data.item.status;
    final author = findInfo('Producers:').text().replaceFirst('Producers:', '');
    final countries = null;
    final language = findInfo('Duration:').queryOne('.text').textRaw();
    final $studio = findInfo('Studios:').queryOne('a');
    final studio = $studio.isNotEmpty
        ? Genre(
            name: $studio.text(),
            genreId: $studio.attr('href').split('/').last,
          )
        : null;
    final trailer = null; //pageData.data.item.trailerUrl;
    final movieSeason = null;

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
      author: author,
      countries: countries,
      language: language,
      studio: studio,
      movieSeason: movieSeason,
      trailer: trailer,
    );
  }

  @override
  getEpisodes(String eigaId) async {
    final json = jsonDecode(await fetch(
        '$baseUrl/ajax/v2/episode/list/${RegExp(r'-(\d+)$').firstMatch(eigaId)!.group(1)}'));
    final html = json['html'] as String;

    final $ = parse$(html);

    final episodes = $('.ep-item').map(($item) {
      return EigaEpisode(
          name: $item.text().replaceAll(r'\s+', ' '),
          episodeId: $item.data('id'));
    });

    return EigaEpisodes(
        episodes: episodes,
        // image: image,
        // poster: poster,
        schedule: DateTime.tryParse($('#schedule-date').textRaw() ?? '?'));
  }

  @override
  getSource({required eigaId, required episode}) async {
    return SourceVideo(
      src: ' source.linkM3u8',
      url: Uri.parse('source.linkM3u8'),
      type: 'hls',
      headers: {'referer': baseUrl},
    );
  }

  @override
  getSubtitles({required eigaId, required episode}) async {
    return [];
  }

  @override
  getSuggest({required metaEiga, required eigaId, page}) async {
    final $ = await _cacheDetails[eigaId]!;
    return $('#main-content .flw-item').map(_parseItem);
  }

  @override
  search({required keyword, required page, required filters, required quick}) {
    return getCategory(
      categoryId: 'search_$keyword',
      page: page,
      // /_next/data/YjU3ELa3ICaBELMtMHUHj/tim-kiem.json?keyword=%C4%91%E1%BA%A1o+l%C3%A0m+ch%E1%BB%93ng+%C4%91%E1%BA%A3m
      filters: filters,
    );
  }
}
