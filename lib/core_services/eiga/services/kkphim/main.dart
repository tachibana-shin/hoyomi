// ignore_for_file: library_private_types_in_public_api
// remove ads in video

import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:flutter_hls_parser/flutter_hls_parser.dart';
import 'package:get/get.dart';
import 'package:hoyomi/core_services/eiga/ab_eiga_service.dart';
import 'package:hoyomi/core_services/eiga/interfaces/main.dart';
import 'package:hoyomi/core_services/eiga/mixin/eiga_watch_time_general_mixin.dart';

import 'package:mediaquery_sizer/mediaquery_sizer.dart';

class KKPhimService extends ABEigaService with EigaWatchTimeGeneralMixin
// with
// EigaWatchTimeMixin,
// EigaHistoryMixin,
// EigaFollowMixin,
{
  final hostCUrl = "phimapi.com";
  final _homeCms = "https://kkphim.com/duyet-tim";
  @override
  late final init = ServiceInit(
    name: "KKPhim",
    faviconUrl: OImage(src: '$_homeCms/../assets/img/favicon.png'),
    rootUrl: 'https://$hostCUrl',
  );

  Future<_MovieResponse> _get(String path) {
    return fetch('$baseUrl/$path')
        .then((value) => _MovieResponse.fromJson(jsonDecode(value)));
  }

  Future<_MovieDetailResponse> _getDetails(String eigaId) {
    return fetchWithCache('$baseUrl/phim/$eigaId',
            expires: Duration(seconds: 30))
        .then((value) => _MovieDetailResponse.fromJson(jsonDecode(value)));
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

  OImage _getImage({required String? cdn, required String src}) {
    return OImage(
        src: cdn == null ? src : Uri.parse(cdn).resolve(src).toString());
  }

  Eiga _parseItem(String? cdn, _MovieItem item) {
    return Eiga(
      name: item.name,
      originalName: item.originName,
      eigaId: item.slug,
      image: _getImage(cdn: cdn, src: item.thumbUrl),
      notice: '${item.quality}-${item.episodeCurrent}',
      preRelease: null,
      pending: item.episodeCurrent == 'Trailer',
      lastEpisode: null,
      timeAgo: DateTime.parse(item.modified.time),
    );
  }

  CarouselItem _parseCarousel(_MovieItem item) {
    final data = _parseItem(null, item);

    final year = item.year.toString();
    final description = item.originName;
    final studio = null;
    final genres = item.category
        .map((category) =>
            Genre(name: category.name, genreId: 'the-loai_${category.slug}'))
        .toList();
    final duration = item.time;
    //     final actors = item.querySelectorAll(".Cast a").map((anchor) {
    //       final href = anchor.attributes['href']!.split('/');
    //       return Genre(
    // name: anchor.text.trim(),
    // genreId: href.elementAt(href.length - 2)
    //       );
    //     });

    return CarouselItem(
      image: _getImage(cdn: null, src: item.posterUrl),
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
      duration: duration,
    );
  }

  @override
  Future<EigaHome> home() async {
    final categoryUrls = {
      'Phim bộ': 'phim-bo',
      'Phim lẻ': 'phim-le',
      'Truyền hình': 'tv-shows',
      'Hoạt hình': 'hoat-hinh',
      'Nhật Bản': '/v1/api/quoc-gia/nhat-ban',
      'Thuyết minh & Lồng tiếng':
          '/v1/api/nam/2025?sort_lang=thuyet-minh,long-tieng',
    };

    final carouselPage$ = fetch('$baseUrl/danh-sach/phim-moi-cap-nhat-v3').then(
        (json) => List<_MovieItem>.from(
            jsonDecode(json)['items'].map((x) => _MovieItem.fromJson(x))));
    final categoryPages$ = categoryUrls.values
        .map((slug) =>
            _get(slug.startsWith('/') ? slug : 'v1/api/danh-sach/$slug?page=1'))
        .toList();

    await Future.wait([carouselPage$, ...categoryPages$]);

    final carouselPage = await carouselPage$;
    final categoryPages = await Future.wait(categoryPages$);

    final carouselItems = carouselPage.map(_parseCarousel).toList();
    final categorys = categoryUrls.entries.map((entry) {
      final name = entry.key;
      final slug = entry.value;
      final page = categoryPages[categoryUrls.keys.toList().indexOf(name)];

      return HomeEigaCategory(
        name: name,
        categoryId: 'danh-sach_$slug',
        items: page.data.items
            .map((item) => _parseItem(page.data.appDomainCdnImage, item))
            .toList(),
      );
    }).toList();

    return EigaHome(
      carousel: Carousel(
        items: carouselItems,
        aspectRatio: 404 / 720,
        maxHeightBuilder: (context) => 30.h(context),
      ),
      categorys: categorys,
    );
  }

  Future<List<Filter>> _getFilters() async {
    final document = await fetchDocument(_homeCms);

    return document
        .querySelectorAll('#filter-panel > form > div:not([class])')
        .map((group) {
      final name = group.querySelector('.font-bold')!.text;
      final key = group
          .querySelector('input')!
          .attributes['name']!
          .replaceFirst('[]', '');
      final multiple = false;
      final items = group
          .querySelectorAll('label')
          .indexed
          .skip(1)
          .map((entry) => Option(
                name: entry.$2.text.trim(),
                value: entry.$2.querySelector('input')!.attributes['value']!,
                selected: false,
              ))
          .toList();

      return Filter(
        name: name,
        key: key,
        multiple: multiple,
        options: items,
      );
    }).toList();
  }

  List<Filter>? _iFilters;

  @override
  getCategory({required categoryId, required page, required filters}) async {
    late final String basePath;
    final Map<String, List<String>> query = Map.from(filters);

    query['page'] = [page.toString()];

    if (query['sort_field'] == null || query['sort_field']!.isEmpty) {
      query['sort_field'] = ['modified.time'];
    }
    bool isListMode = false;
    if (categoryId.startsWith('quoc-gia_')) {
      basePath =
          'v1/api/quoc-gia/${query['country']?.lastOrNull ?? categoryId.replaceFirst('quoc-gia_', '')}';
    } else if (categoryId.startsWith('tim-kiem_')) {
      basePath = 'v1/api/tim-kiem';
      query['keyword'] = [categoryId.replaceFirst('tim-kiem_', '')];
    } else if (categoryId.startsWith('the-loai_')) {
      basePath =
          'v1/api/the-loai/${query['category']?.lastOrNull ?? categoryId.replaceFirst('the-loai_', '')}';
    } else if (categoryId.startsWith('danh-sach_')) {
      basePath =
          'v1/api/danh-sach/${query['type']?.lastOrNull ?? categoryId.replaceFirst('danh-sach_', '')}';
      isListMode = true;
    } else if (categoryId.startsWith('nam_')) {
      basePath =
          'v1/api/nam/${query['year']?.lastOrNull ?? categoryId.replaceFirst('nam_', '')}';
    }

    final url =
        '$basePath?${query.entries.map((entry) => '${entry.key}=${entry.value.join(',')}').join('&')}';
    final pageData = await _get(url);

    final name = pageData.data.seoOnPage.titleHead;
    final items = pageData.data.items
        .map((item) => _parseItem(pageData.data.appDomainCdnImage, item))
        .toList();
    final totalPages = pageData.data.params.pagination.totalPages;
    final totalItems = pageData.data.params.pagination.totalItems;

    final List<Filter> iFilters = _iFilters ??= await _getFilters();

    return EigaCategory(
      name: name,
      url: url,
      items: items,
      page: page,
      totalItems: totalItems,
      totalPages: totalPages,
      filters: isListMode
          ? iFilters
          : iFilters.where((filter) => filter.key != 'type').toList(),
    );
  }

  @override
  getDetails(String eigaId) async {
    final index = max(0, eigaId.indexOf('@'));
    final eigaIdRaw = index == 0 ? eigaId : eigaId.substring(0, index);

    final pageData = await _getDetails(eigaIdRaw);

    final name = pageData.movie.name;
    final originalName = pageData.movie.originName;
    final image = _getImage(cdn: null, src: pageData.movie.posterUrl);
    final poster = _getImage(cdn: null, src: pageData.movie.thumbUrl);
    final description = pageData.movie.content;

    final rate = pageData.movie.tmdb.voteAverage;
    final countRate = pageData.movie.tmdb.voteCount;
    final duration = pageData.movie.episodeTotal;
    final yearOf = pageData.movie.year;
    final views = pageData.movie.view;
    final seasons = pageData.episodes.indexed.map((entry) {
      final index = entry.$1;
      final item = entry.$2;
      return Season(
          name: item.serverName,
          eigaId: index == 0 ? eigaIdRaw : '$eigaIdRaw@${item.serverName}');
    }).toList();
    final genres = pageData.movie.category
        .map((category) =>
            Genre(name: category.name, genreId: 'the-loai_${category.slug}'))
        .toList();
    final quality = pageData.movie.quality;

    // final status = pageData.movie.status;
    final author = pageData.movie.director.first;
    final countries = pageData.movie.country
        .map((country) =>
            Genre(name: country.name, genreId: 'quoc-gia_${country.slug}'))
        .toList();
    final language = pageData.movie.lang;
    final studio = null;
    final trailer = pageData.movie.trailerUrl;
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
    final index = max(0, eigaId.indexOf('@'));

    final eigaIdRaw = index == 0 ? eigaId : eigaId.substring(0, index);
    final seasonName = eigaIdRaw.length + 1 < eigaId.length
        ? eigaId.substring(eigaIdRaw.length + 1)
        : '';

    final pageData = await _getDetails(eigaIdRaw);

    final episodes = pageData.episodes
        .firstWhereOrNull(
            (server) => seasonName.isEmpty || server.serverName == seasonName)
        ?.serverData
        .map((episode) => EigaEpisode(
            name: episode.name,
            episodeId: episode.slug,
            extra: episode.toJson()))
        .toList();
    if (episodes == null) throw Exception('Episode not found');

    final image = _getImage(cdn: null, src: pageData.movie.thumbUrl);
    final poster = _getImage(cdn: null, src: pageData.movie.posterUrl);

    return EigaEpisodes(
      episodes: episodes,
      image: image,
      poster: poster,
      // schedule: day != null && hour != null && minute != null
      //     ? TimeAndDay(
      //         hour: int.parse(hour),
      //         minute: int.parse(minute),
      //         day: day,
      //       )
      //     : null,
    );
  }

  @override
  getSource({required eigaId, required episode}) async {
    final source = _ServerData.fromJson(episode.extra);

    return SourceVideo(
      src: source.linkM3u8,
      url: Uri.parse(source.linkM3u8),
      type: 'hls',
      headers: {'referer': baseUrl},
    );
  }

  @override
  fetchSourceContent({required source}) async {
    final master = await fetch(source.url.toString(), headers: source.headers);
    final m3u8 =
        master.split('\n').firstWhere((line) => line.contains('.m3u8'));

    final urlMediaPlaylist = source.url.resolve(m3u8);
    final content =
        await fetch(urlMediaPlaylist.toString(), headers: source.headers);

    final playlist =
        await HlsPlaylistParser.create().parseString(urlMediaPlaylist, content);

    if (playlist is HlsMasterPlaylist) {
      return SourceContent(
          content: content, url: urlMediaPlaylist, headers: source.headers);
    }

    return SourceContent(
        content: _removeAdsFromM3U8(urlMediaPlaylist, content),
        url: urlMediaPlaylist,
        headers: source.headers);
  }

  @override
  getSubtitles({required eigaId, required episode}) async {
    return [];
  }

  @override
  getSuggest({required metaEiga, required eigaId, page}) async {
    final pageData =
        await _get('v1/api/the-loai/${metaEiga.genres.first.genreId}?limit=30');

    final metaSlugs = metaEiga.genres
        .map((c) => c.genreId.replaceFirst('the-loai_', ''))
        .toSet();

    final scoredItems = pageData.data.items
        .map<({_MovieItem item, int matchCount})>((item) {
          final matchCount =
              item.category.where((cat) => metaSlugs.contains(cat.slug)).length;
          return (item: item, matchCount: matchCount);
        })
        .where((entry) => entry.matchCount > 0)
        .toList();

    scoredItems.sort((a, b) => b.matchCount - a.matchCount);

    return scoredItems
        .take(30)
        .map((entry) => _parseItem(pageData.data.appDomainCdnImage, entry.item))
        .toList();
  }

  @override
  search({required keyword, required page, required filters, required quick}) {
    return getCategory(
      categoryId: 'tim-kiem_$keyword',
      page: page,
      // /_next/data/YjU3ELa3ICaBELMtMHUHj/tim-kiem.json?keyword=%C4%91%E1%BA%A1o+l%C3%A0m+ch%E1%BB%93ng+%C4%91%E1%BA%A3m
      filters: filters,
    );
  }
}

/// ======================= utils =========================
class _MovieResponse {
  final _Data data;

  _MovieResponse({required this.data});

  factory _MovieResponse.fromJson(Map<String, dynamic> json) {
    return _MovieResponse(
      data: _Data.fromJson(json['data']),
    );
  }
}

class _Data {
  final _SeoOnPage seoOnPage;
  final List<_BreadCrumb> breadCrumb;
  final String titlePage;
  final List<_MovieItem> items;
  final _Params params;
  final String typeList;
  final String appDomainFrontend;
  final String appDomainCdnImage;

  _Data({
    required this.seoOnPage,
    required this.breadCrumb,
    required this.titlePage,
    required this.items,
    required this.params,
    required this.typeList,
    required this.appDomainFrontend,
    required this.appDomainCdnImage,
  });

  factory _Data.fromJson(Map<String, dynamic> json) {
    return _Data(
      seoOnPage: _SeoOnPage.fromJson(json['seoOnPage']),
      breadCrumb: List<_BreadCrumb>.from(
          json['breadCrumb'].map((x) => _BreadCrumb.fromJson(x))),
      titlePage: json['titlePage'],
      items: List<_MovieItem>.from(
          json['items'].map((x) => _MovieItem.fromJson(x))),
      params: _Params.fromJson(json['params']),
      typeList: json['type_list'],
      appDomainFrontend: json['APP_DOMAIN_FRONTEND'],
      appDomainCdnImage: json['APP_DOMAIN_CDN_IMAGE'],
    );
  }
}

class _SeoOnPage {
  final String ogType;
  final String titleHead;
  final String descriptionHead;
  final List<String> ogImage;
  final String ogUrl;

  _SeoOnPage({
    required this.ogType,
    required this.titleHead,
    required this.descriptionHead,
    required this.ogImage,
    required this.ogUrl,
  });

  factory _SeoOnPage.fromJson(Map<String, dynamic> json) {
    return _SeoOnPage(
      ogType: json['og_type'],
      titleHead: json['titleHead'],
      descriptionHead: json['descriptionHead'],
      ogImage: List<String>.from(json['og_image']),
      ogUrl: json['og_url'],
    );
  }
}

class _BreadCrumb {
  final String name;
  final String? slug;
  final bool isCurrent;
  final int position;

  _BreadCrumb({
    required this.name,
    this.slug,
    required this.isCurrent,
    required this.position,
  });

  factory _BreadCrumb.fromJson(Map<String, dynamic> json) {
    return _BreadCrumb(
      name: json['name'],
      slug: json['slug'],
      isCurrent: json['isCurrent'],
      position: json['position'],
    );
  }
}

class _MovieItem {
  final _Modified modified;
  final String id;
  final String name;
  final String slug;
  final String originName;
  final String type;
  final String posterUrl;
  final String thumbUrl;
  final bool subDocquyen;
  final String time;
  final String episodeCurrent;
  final String quality;
  final String lang;
  final int year;
  final List<_Category> category;
  final List<_Country> country;

  _MovieItem({
    required this.modified,
    required this.id,
    required this.name,
    required this.slug,
    required this.originName,
    required this.type,
    required this.posterUrl,
    required this.thumbUrl,
    required this.subDocquyen,
    required this.time,
    required this.episodeCurrent,
    required this.quality,
    required this.lang,
    required this.year,
    required this.category,
    required this.country,
  });

  factory _MovieItem.fromJson(Map<String, dynamic> json) {
    return _MovieItem(
      modified: _Modified.fromJson(json['modified']),
      id: json['_id'],
      name: json['name'],
      slug: json['slug'],
      originName: json['origin_name'],
      type: json['type'],
      posterUrl: json['poster_url'],
      thumbUrl: json['thumb_url'],
      subDocquyen: json['sub_docquyen'],
      time: json['time'],
      episodeCurrent: json['episode_current'],
      quality: json['quality'],
      lang: json['lang'],
      year: json['year'],
      category:
          (json['category'] as List).map((e) => _Category.fromJson(e)).toList(),
      country:
          (json['country'] as List).map((e) => _Country.fromJson(e)).toList(),
    );
  }
}

class _Modified {
  final String time;

  _Modified({required this.time});

  factory _Modified.fromJson(Map<String, dynamic> json) {
    return _Modified(time: json['time']);
  }
}

class _Category {
  final String id;
  final String name;
  final String slug;

  _Category({required this.id, required this.name, required this.slug});

  factory _Category.fromJson(Map<String, dynamic> json) {
    return _Category(
      id: json['id'],
      name: json['name'],
      slug: json['slug'],
    );
  }
}

class _Country {
  final String id;
  final String name;
  final String slug;

  _Country({required this.id, required this.name, required this.slug});

  factory _Country.fromJson(Map<String, dynamic> json) {
    return _Country(
      id: json['id'],
      name: json['name'],
      slug: json['slug'],
    );
  }
}

/// ============= details =============
class _MovieDetailResponse {
  final bool status;
  final String msg;
  final _MovieDetail movie;
  final List<_EpisodeGroup> episodes;

  _MovieDetailResponse({
    required this.status,
    required this.msg,
    required this.movie,
    required this.episodes,
  });

  factory _MovieDetailResponse.fromJson(Map<String, dynamic> json) {
    return _MovieDetailResponse(
      status: json['status'],
      msg: json['msg'],
      movie: _MovieDetail.fromJson(json['movie']),
      episodes: (json['episodes'] as List)
          .map((e) => _EpisodeGroup.fromJson(e))
          .toList(),
    );
  }
}

class _MovieDetail {
  final _Tmdb tmdb;
  final _Imdb imdb;
  final _TimeInfo created;
  final _TimeInfo modified;
  final String id;
  final String name;
  final String slug;
  final String originName;
  final String content;
  final String type;
  final String status;
  final String posterUrl;
  final String thumbUrl;
  final bool isCopyright;
  final bool subDocquyen;
  final bool chieurap;
  final String trailerUrl;
  final String time;
  final String episodeCurrent;
  final String episodeTotal;
  final String quality;
  final String lang;
  final String notify;
  final String showtimes;
  final int year;
  final int view;
  final List<String> actor;
  final List<String> director;
  final List<_Category> category;
  final List<_Country> country;

  _MovieDetail({
    required this.tmdb,
    required this.imdb,
    required this.created,
    required this.modified,
    required this.id,
    required this.name,
    required this.slug,
    required this.originName,
    required this.content,
    required this.type,
    required this.status,
    required this.posterUrl,
    required this.thumbUrl,
    required this.isCopyright,
    required this.subDocquyen,
    required this.chieurap,
    required this.trailerUrl,
    required this.time,
    required this.episodeCurrent,
    required this.episodeTotal,
    required this.quality,
    required this.lang,
    required this.notify,
    required this.showtimes,
    required this.year,
    required this.view,
    required this.actor,
    required this.director,
    required this.category,
    required this.country,
  });

  factory _MovieDetail.fromJson(Map<String, dynamic> json) {
    return _MovieDetail(
      tmdb: _Tmdb.fromJson(json['tmdb']),
      imdb: _Imdb.fromJson(json['imdb']),
      created: _TimeInfo.fromJson(json['created']),
      modified: _TimeInfo.fromJson(json['modified']),
      id: json['_id'],
      name: json['name'],
      slug: json['slug'],
      originName: json['origin_name'],
      content: json['content'],
      type: json['type'],
      status: json['status'],
      posterUrl: json['poster_url'],
      thumbUrl: json['thumb_url'],
      isCopyright: json['is_copyright'],
      subDocquyen: json['sub_docquyen'],
      chieurap: json['chieurap'],
      trailerUrl: json['trailer_url'],
      time: json['time'],
      episodeCurrent: json['episode_current'],
      episodeTotal: json['episode_total'],
      quality: json['quality'],
      lang: json['lang'],
      notify: json['notify'],
      showtimes: json['showtimes'],
      year: json['year'],
      view: json['view'],
      actor: List<String>.from(json['actor']),
      director: List<String>.from(json['director']),
      category:
          (json['category'] as List).map((e) => _Category.fromJson(e)).toList(),
      country:
          (json['country'] as List).map((e) => _Country.fromJson(e)).toList(),
    );
  }
}

class _Tmdb {
  final double? voteAverage;
  final int? voteCount;

  _Tmdb({
    required this.voteAverage,
    required this.voteCount,
  });

  factory _Tmdb.fromJson(Map<String, dynamic> json) {
    return _Tmdb(
      voteAverage: (json['vote_average'] as num).toDouble(),
      voteCount: json['vote_count'],
    );
  }
}

class _Imdb {
  final dynamic id;

  _Imdb({this.id});

  factory _Imdb.fromJson(Map<String, dynamic> json) {
    return _Imdb(
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
      };
}

class _TimeInfo {
  final String time;

  _TimeInfo({required this.time});

  factory _TimeInfo.fromJson(Map<String, dynamic> json) {
    return _TimeInfo(
      time: json['time'],
    );
  }

  Map<String, dynamic> toJson() => {
        'time': time,
      };
}

class _EpisodeGroup {
  final String serverName;
  final List<_ServerData> serverData;

  _EpisodeGroup({
    required this.serverName,
    required this.serverData,
  });

  factory _EpisodeGroup.fromJson(Map<String, dynamic> json) {
    return _EpisodeGroup(
      serverName: json['server_name'],
      serverData: (json['server_data'] as List)
          .map((e) => _ServerData.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'server_name': serverName,
        'server_data': serverData.map((e) => e.toJson()).toList(),
      };
}

class _Pagination {
  final int totalItems;
  final int totalItemsPerPage;
  final int currentPage;
  final int totalPages;

  _Pagination({
    required this.totalItems,
    required this.totalItemsPerPage,
    required this.currentPage,
    required this.totalPages,
  });

  // Factory constructor to create an instance of Pagination from JSON
  factory _Pagination.fromJson(Map<String, dynamic> json) {
    return _Pagination(
      totalItems: json['totalItems'],
      totalItemsPerPage: json['totalItemsPerPage'],
      currentPage: json['currentPage'],
      totalPages: json['totalPages'],
    );
  }
}

class _Params {
  final String typeSlug;
  final List<String> filterCategory;
  final List<String> filterCountry;
  final List<int>? filterYear;
  final List<String>? filterType;
  final String sortField;
  final String sortType;
  final _Pagination pagination;

  _Params({
    required this.typeSlug,
    required this.filterCategory,
    required this.filterCountry,
    required this.filterYear,
    required this.filterType,
    required this.sortField,
    required this.sortType,
    required this.pagination,
  });

  static List<T> _toArray<T>(dynamic value) {
    if (value is List<T?>) {
      return value.where((item) => item != null).toList() as List<T>;
    }
    if (value is T) return [value];
    return <T>[];
  }

  // Factory constructor to create an instance of Params from JSON
  factory _Params.fromJson(Map<String, dynamic> json) {
    return _Params(
      typeSlug: json['type_slug'],
      filterCategory: _toArray<String>(json['filterCategory']),
      filterCountry: _toArray<String>(json['filterCountry']),
      filterYear: _toArray<int>(json['filterYear']),
      filterType: _toArray<String>(json['filterType']),
      sortField: json['sortField'],
      sortType: json['sortType'],
      pagination: _Pagination.fromJson(json['pagination']),
    );
  }
}

class _ServerData {
  final String name;
  final String slug;
  final String filename;
  final String linkEmbed;
  final String linkM3u8;

  _ServerData({
    required this.name,
    required this.slug,
    required this.filename,
    required this.linkEmbed,
    required this.linkM3u8,
  });

  factory _ServerData.fromJson(Map<String, dynamic> json) {
    return _ServerData(
      name: json['name'],
      slug: json['slug'],
      filename: json['filename'],
      linkEmbed: json['link_embed'],
      linkM3u8: json['link_m3u8'],
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'slug': slug,
        'filename': filename,
        'link_embed': linkEmbed,
        'link_m3u8': linkM3u8,
      };
}

String _removeAdsFromM3U8(Uri url, String m3u8) {
  final lines = m3u8.split('\n');
  final regex = RegExp(r"#EXTINF:([\d.]+),");

  final output = <String>[];
  for (int i = 0; i < lines.length; i++) {
    final line = lines.elementAt(i);
    final match = regex.firstMatch(line);
    if (match != null && i + 1 < lines.length) {
      // if line is segment. Example #EXTINF:133343
      // the next line is url
      final currentUrl = lines.elementAt(i + 1);
      final isAd = RegExp(r'^\d+\.ts$').hasMatch(currentUrl) || currentUrl.contains("adjump");

      i++;
      // if ad skip segment
      if (isAd) {
        continue;
      } else {
        // if not ad, add segment to output
        output.add(line);
        output.add(url.resolve(currentUrl).toString());
        continue;
      }
    }

    output.add(line);
  }

  return output.join('\n');
}
