// ignore_for_file: library_private_types_in_public_api
// remove ads in video

import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:get/get.dart';
import 'package:flutter_hls_parser/flutter_hls_parser.dart';
import 'package:hoyomi/core_services/eiga/ab_eiga_service.dart';
import 'package:hoyomi/core_services/eiga/interfaces/main.dart';
import 'package:hoyomi/core_services/eiga/mixin/eiga_watch_time_general_mixin.dart';

class OPhimService extends ABEigaService with EigaWatchTimeGeneralMixin
// with
// EigaWatchTimeMixin,
// EigaHistoryMixin,
// EigaFollowMixin,
{
  @override
  bool? get $isAuth => false;

  final hostCUrl = 'ophim17.cc';
  final _buildId = 'YjU3ELa3ICaBELMtMHUHj';
  @override
  late final init = ServiceInit(
    name: 'OPhim',
    faviconUrl: OImage(src: '/favicon.ico'),
    rootUrl: 'https://$hostCUrl',
  );

  Future<_PageProps> _get(String path) {
    return fetch(
      '$baseUrl/_next/data/$_buildId/$path',
    ).then((value) => _PageProps.fromJson(jsonDecode(value)));
  }

  Future<_PageDetailsProps> _getDetails(String eigaId) {
    return fetchWithCache(
      '$baseUrl/_next/data/$_buildId/phim/$eigaId.json?slug=$eigaId',
      expires: Duration(seconds: 30),
    ).then((value) => _PageDetailsProps.fromJson(jsonDecode(value)));
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

  OImage _getImage({required String cdn, required String src}) {
    return OImage(src: '$cdn/uploads/movies/$src');
  }

  Eiga _parseItem(String domainCDNImage, _Item item) {
    return Eiga(
      name: item.name,
      originalName: item.originName,
      eigaId: item.slug,
      image: _getImage(cdn: domainCDNImage, src: item.thumbUrl),
      notice: '${item.quality}-${item.episodeCurrent}',
      rate: item.tmdb?.voteAverage,
      preRelease: null,
      pending:
          item.episodeCurrent == 'Trailer' || item.episodeCurrent == 'Tập 0',
      lastEpisode: null,
      timeAgo: DateTime.parse(item.modified.time),
    );
  }

  CarouselItem _parseCarousel(String domainCDNImage, _Item item) {
    final data = _parseItem(domainCDNImage, item);

    final year = item.year?.toString();
    final description = item.originName;
    final studio = null;
    final genres =
        item.category
            .map(
              (category) => Genre(
                name: category.name,
                genreId: 'the-loai_${category.slug}',
              ),
            )
            .toList();
    final duration = item.time;
    //     final actors = item.querySelectorAll('.Cast a').map((anchor) {
    //       final href = anchor.attributes['href']!.split('/');
    //       return Genre(
    // name: anchor.text,
    // genreId: href.elementAt(href.length - 2)
    //       );
    //     });

    return CarouselItem(
      image: _getImage(
        cdn: domainCDNImage,
        src: item.posterUrl ?? item.thumbUrl,
      ),
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
      'Sắp chiếu': 'phim-sap-chieu',
      'Sub team': 'subteam',
    };

    final responses = await Future.wait([
      _get('index.json'),
      ...categoryUrls.values.map(
        (slug) => _get('danh-sach/$slug.json?slug=$slug'),
      ),
    ]);

    final carouselPage = responses.first;
    final carouselItems =
        carouselPage.data.items
            .map(
              (item) =>
                  _parseCarousel(carouselPage.data.appDomainCdnImage, item),
            )
            .toList();

    final categoryPages = responses.skip(1).toList();
    final categories =
        categoryUrls.entries.map((entry) {
          final name = entry.key;
          final slug = entry.value;
          final page = categoryPages[categoryUrls.keys.toList().indexOf(name)];

          return HomeEigaCategory(
            name: name,
            categoryId: 'danh-sach_$slug',
            items:
                page.data.items
                    .map(
                      (item) => _parseItem(page.data.appDomainCdnImage, item),
                    )
                    .toList(),
          );
        }).toList();

    return EigaHome(
      carousel: Carousel(
        items: carouselItems,
        aspectRatio: 404 / 720,
        maxHeightBuilder: 0.3,
      ),
      categories: categories,
    );
  }

  Future<List<Filter>> _getFilters() async {
    final $ = await fetch$('$baseUrl/danh-sach/phim-moi');

    return $('#form-filter select').map((select) {
      final key = select.attr('name');
      final multiple = ['category', 'country', 'year'].contains(key);
      final items =
          select
              .query('option')
              .skip(1)
              .toList()
              .indexed
              .map(
                (entry) => Option(
                  name: entry.$2.text(),
                  value: entry.$2.attr('value'),
                  selected: entry.$1 == 0,
                ),
              )
              .toList();
      final name = items.first.name;

      return Filter(name: name, key: key, multiple: multiple, options: items);
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
    if (categoryId.startsWith('quoc-gia_')) {
      basePath = 'danh-sach/phim-moi.json';

      query['slug'] = ['phim-moi'];
      query['country'] = [
        ...query['country'] ?? [],
        categoryId.replaceFirst('quoc-gia_', ''),
      ];
    } else if (categoryId.startsWith('tim-kiem_')) {
      basePath = 'tim-kiem.json';

      query['keyword'] = [categoryId.replaceFirst('tim-kiem_', '')];
    } else if (categoryId.startsWith('the-loai_')) {
      basePath = 'danh-sach/phim-moi.json';

      query['slug'] = ['phim-moi'];
      query['category'] = [
        ...query['category'] ?? [],
        categoryId.replaceFirst('the-loai_', ''),
      ];
    } else if (categoryId.startsWith('danh-sach_')) {
      basePath = 'danh-sach/${categoryId.replaceFirst('danh-sach_', '')}.json';

      query['slug'] = [categoryId.replaceFirst('danh-sach_', '')];
    } else {
      basePath = '$categoryId.json';

      query['slug'] = [categoryId];
    }

    final url =
        '$basePath?${query.entries.map((entry) => '${entry.key}=${entry.value.join(',')}').join('&')}';
    final pageData = await _get(url);

    final name = pageData.data.seoOnPage.titleHead;
    final items =
        pageData.data.items
            .map((item) => _parseItem(pageData.data.appDomainCdnImage, item))
            .toList();
    final totalPages = pageData.data.params.pagination.pageRanges;
    final totalItems = pageData.data.params.pagination.totalItems;

    final List<Filter> iFilters = _iFilters ??= await _getFilters();

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

  @override
  getDetails(String eigaId) async {
    final index = max(0, eigaId.indexOf('@'));
    final eigaIdRaw = index == 0 ? eigaId : eigaId.substring(0, index);

    final pageData = await _getDetails(eigaIdRaw);

    final name = pageData.data.item.name;
    final originalName = pageData.data.item.originName;
    final $uri = Uri.parse(pageData.data.seoOnPage.image!);
    final $cdn = '${$uri.scheme}://${$uri.host}';
    final image = _getImage(cdn: $cdn, src: pageData.data.item.thumbUrl);
    final poster =
        pageData.data.item.posterUrl == null
            ? null
            : _getImage(cdn: $cdn, src: pageData.data.item.posterUrl!);
    final description = pageData.data.item.content;

    final rate = pageData.data.item.tmdb?.voteAverage;
    final countRate = pageData.data.item.tmdb?.voteCount;
    final duration = pageData.data.item.episodeTotal;
    final yearOf = pageData.data.item.year;
    final views = pageData.data.item.view;
    final seasons =
        pageData.data.item.episodes.indexed.map((entry) {
          final index = entry.$1;
          final item = entry.$2;
          return Season(
            name: item.serverName,
            eigaId: index == 0 ? eigaIdRaw : '$eigaIdRaw@${item.serverName}',
          );
        }).toList();
    final genres =
        pageData.data.item.category
            .map(
              (category) => Genre(
                name: category.name,
                genreId: 'the-loai_${category.slug}',
              ),
            )
            .toList();
    final quality = pageData.data.item.quality;

    // final status = pageData.data.item.status;
    final authors = [
      Genre(name: pageData.data.item.director.first, genreId: Genre.noId),
    ];
    final countries =
        pageData.data.item.country
            .map(
              (country) => Genre(
                name: country.name,
                genreId: 'quoc-gia_${country.slug}',
              ),
            )
            .toList();
    final language = pageData.data.item.lang;
    final studio = null;
    final trailer = pageData.data.item.trailerUrl;
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
      authors: authors,
      countries: countries,
      language: language,
      studios:
          studio == null ? null : [Genre(name: studio, genreId: Genre.noId)],
      movieSeason: movieSeason,
      trailer: trailer,
    );
  }

  @override
  getEpisodes(String eigaId) async {
    final index = max(0, eigaId.indexOf('@'));

    final eigaIdRaw = index == 0 ? eigaId : eigaId.substring(0, index);
    final seasonName =
        eigaIdRaw.length + 1 < eigaId.length
            ? eigaId.substring(eigaIdRaw.length + 1)
            : '';

    final pageData = await _getDetails(eigaIdRaw);

    final episodes =
        pageData.data.item.episodes
            .firstWhereOrNull(
              (server) => seasonName.isEmpty || server.serverName == seasonName,
            )
            ?.serverData
            .map(
              (episode) => EigaEpisode(
                name: episode.name,
                episodeId: episode.slug,
                extra: jsonEncode(episode.toJson()),
              ),
            )
            .toList();
    if (episodes == null) throw Exception('Episode not found');

    final $uri = Uri.parse(pageData.data.seoOnPage.image!);
    final $cdn = '${$uri.scheme}://${$uri.host}';

    final image = _getImage(cdn: $cdn, src: pageData.data.item.thumbUrl);
    final poster = _getImage(
      cdn: $cdn,
      src: pageData.data.item.posterUrl ?? pageData.data.item.thumbUrl,
    );

    // analytics
    fetch(
      '$baseUrl/api/movies',
      body: {'action': 'update-view', 'slug': eigaIdRaw},
    );

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
  getSource({required eigaId, required episode, server}) async {
    final source = _ServerData.fromJson(jsonDecode(episode.extra!));

    return SourceVideo(
      src: source.linkM3u8,
      url: Uri.parse(source.linkM3u8),
      type: 'hls',
      headers: Headers({'referer': baseUrl}),
    );
  }

  @override
  fetchSourceContent({required source}) async {
    final master = await fetch(source.url.toString(), headers: source.headers);
    final m3u8 = master
        .split('\n')
        .firstWhere((line) => line.contains('.m3u8'));

    final urlMediaPlaylist = source.url.resolve(m3u8);
    final content = await fetch(
      urlMediaPlaylist.toString(),
      headers: source.headers,
    );

    final playlist = await HlsPlaylistParser.create().parseString(
      urlMediaPlaylist,
      content,
    );

    if (playlist is HlsMasterPlaylist) {
      return SourceContent(
        content: content,
        url: urlMediaPlaylist,
        headers: source.headers,
      );
    }

    return SourceContent(
      content: _removeAdsFromM3U8(urlMediaPlaylist, content),
      url: urlMediaPlaylist,
      headers: source.headers,
    );
  }

  @override
  getSuggest({required metaEiga, required eigaId, page}) async {
    final pageData = await _get(
      'danh-sach/phim-moi.json?slug=phim-moi&sort_field=modified.time&category=${metaEiga.genres.map((genre) => genre.genreId.replaceFirst('the-loai_', '')).join(',')}&country=${metaEiga.countries?.map((genre) => genre.genreId.replaceFirst('quoc-gia_', '')).join(',') ?? ''}',
    );

    final metaSlugs =
        metaEiga.genres
            .map((c) => c.genreId.replaceFirst('the-loai_', ''))
            .toSet();

    final scoredItems =
        pageData.data.items
            .map<({_Item item, int matchCount})>((item) {
              final matchCount =
                  item.category
                      .where((cat) => metaSlugs.contains(cat.slug))
                      .length;
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
class _PageProps {
  _Data data;

  _PageProps({required this.data});

  factory _PageProps.fromJson(Map<String, dynamic> json) {
    return _PageProps(data: _Data.fromJson(json['pageProps']['data']));
  }
}

class _Data {
  _SeoOnPage seoOnPage;
  List<_BreadCrumb> breadCrumb;
  String? titlePage;
  List<_Item> items;
  _Params params;
  String typeList;
  String appDomainFrontend;
  String appDomainCdnImage;

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
        json['breadCrumb']?.map((x) => _BreadCrumb.fromJson(x)) ?? [],
      ),
      titlePage: json['titlePage'],
      items: List<_Item>.from(json['items'].map((x) => _Item.fromJson(x))),
      params: _Params.fromJson(json['params']),
      typeList: json['type_list'],
      appDomainFrontend: json['APP_DOMAIN_FRONTEND'],
      appDomainCdnImage: json['APP_DOMAIN_CDN_IMAGE'],
    );
  }
}

class _SeoOnPage {
  String ogType;
  String titleHead;
  String descriptionHead;
  List<String> ogImage;
  int? updatedTime;
  String? ogUrl;
  String? image;

  _SeoOnPage({
    required this.ogType,
    required this.titleHead,
    required this.descriptionHead,
    required this.ogImage,
    this.updatedTime,
    this.ogUrl,
    this.image,
  });

  factory _SeoOnPage.fromJson(Map<String, dynamic> json) {
    return _SeoOnPage(
      ogType: json['og_type'],
      titleHead: json['titleHead'],
      descriptionHead: json['descriptionHead'],
      ogImage: List<String>.from(json['og_image'].map((x) => x)),
      updatedTime: json['updatedTime'],
      ogUrl: json['og_url'],
      image: json['seoSchema']?['image'],
    );
  }
}

class _BreadCrumb {
  String name;
  String? slug;
  bool isCurrent;
  int position;

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
      isCurrent: json['isCurrent'] ?? false,
      position: json['position'],
    );
  }
}

class _Item {
  _Tmdb? tmdb;
  _Imdb? imdb;
  _Modified modified;
  String id;
  String name;
  String slug;
  String originName;
  String type;
  String thumbUrl;
  String? posterUrl;
  bool subDocquyen;
  bool chieurap;
  String time;
  String episodeCurrent;
  String quality;
  String lang;
  int? year;
  List<_Category> category;
  List<_Country> country;

  _Item({
    required this.tmdb,
    required this.imdb,
    required this.modified,
    required this.id,
    required this.name,
    required this.slug,
    required this.originName,
    required this.type,
    required this.thumbUrl,
    required this.posterUrl,
    required this.subDocquyen,
    required this.chieurap,
    required this.time,
    required this.episodeCurrent,
    required this.quality,
    required this.lang,
    required this.year,
    required this.category,
    required this.country,
  });

  factory _Item.fromJson(Map<String, dynamic> json) {
    return _Item(
      tmdb: json['tmdb'] == null ? null : _Tmdb.fromJson(json['tmdb']),
      imdb: json['imdb'] == null ? null : _Imdb.fromJson(json['imdb']),
      modified: _Modified.fromJson(json['modified']),
      id: json['_id'],
      name: json['name'],
      slug: json['slug'],
      originName: json['origin_name'],
      type: json['type'],
      thumbUrl: json['thumb_url'],
      posterUrl: json['poster_url'],
      subDocquyen: json['sub_docquyen'],
      chieurap: json['chieurap'] ?? false,
      time: json['time'],
      episodeCurrent: json['episode_current'],
      quality: json['quality'],
      lang: json['lang'],
      year: json['year'],
      category: List<_Category>.from(
        json['category'].map((x) => _Category.fromJson(x)),
      ),
      country: List<_Country>.from(
        json['country'].map((x) => _Country.fromJson(x)),
      ),
    );
  }
}

class _Tmdb {
  String? type;
  String id;
  int? season;
  double? voteAverage;
  int? voteCount;

  _Tmdb({
    required this.type,
    required this.id,
    required this.season,
    required this.voteAverage,
    required this.voteCount,
  });

  factory _Tmdb.fromJson(Map<String, dynamic> json) {
    return _Tmdb(
      type: json['type'],
      id: json['id'],
      season: json['season'],
      voteAverage: json['vote_average'].toDouble(),
      voteCount: json['vote_count'],
    );
  }
}

class _Imdb {
  String? id;

  _Imdb({this.id});

  factory _Imdb.fromJson(Map<String, dynamic> json) {
    return _Imdb(id: json['id']);
  }
}

class _Created {
  String time;

  _Created({required this.time});

  factory _Created.fromJson(Map<String, dynamic> json) {
    return _Created(time: json['time']);
  }
}

class _Modified {
  String time;

  _Modified({required this.time});

  factory _Modified.fromJson(Map<String, dynamic> json) {
    return _Modified(time: json['time']);
  }
}

class _Category {
  String id;
  String name;
  String slug;

  _Category({required this.id, required this.name, required this.slug});

  factory _Category.fromJson(Map<String, dynamic> json) {
    return _Category(id: json['id'], name: json['name'], slug: json['slug']);
  }
}

class _Country {
  String id;
  String name;
  String slug;

  _Country({required this.id, required this.name, required this.slug});

  factory _Country.fromJson(Map<String, dynamic> json) {
    return _Country(id: json['id'], name: json['name'], slug: json['slug']);
  }
}

class _Params {
  String? typeSlug;
  List<String>? filterCategory;
  List<String>? filterCountry;
  String? filterYear;
  String? filterType;
  String? sortField;
  String? sortType;
  _Pagination pagination;

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

  factory _Params.fromJson(Map<String, dynamic> json) {
    return _Params(
      typeSlug: json['type_slug'],
      filterCategory: List<String>.from(json['filterCategory'].map((x) => x)),
      filterCountry: List<String>.from(json['filterCountry'].map((x) => x)),
      filterYear: json['filterYear'],
      filterType: json['filterType'],
      sortField: json['sortField'],
      sortType: json['sortType'],
      pagination: _Pagination.fromJson(json['pagination']),
    );
  }
}

class _Pagination {
  int totalItems;
  int totalItemsPerPage;
  int currentPage;
  int pageRanges;

  _Pagination({
    required this.totalItems,
    required this.totalItemsPerPage,
    required this.currentPage,
    required this.pageRanges,
  });

  factory _Pagination.fromJson(Map<String, dynamic> json) {
    return _Pagination(
      totalItems: json['totalItems'],
      totalItemsPerPage: json['totalItemsPerPage'],
      currentPage: json['currentPage'],
      pageRanges: json['pageRanges'],
    );
  }
}

/// ======================= details ============================
class _PageDetailsProps {
  _DetailsData data;

  _PageDetailsProps({required this.data});

  factory _PageDetailsProps.fromJson(Map<String, dynamic> json) {
    return _PageDetailsProps(
      data: _DetailsData.fromJson(json['pageProps']['data']),
    );
  }
}

class _DetailsData {
  _SeoOnPage seoOnPage;
  List<_BreadCrumb> breadCrumb;
  _ParamsSlug params;
  _DetailsItem item;

  _DetailsData({
    required this.seoOnPage,
    required this.breadCrumb,
    required this.params,
    required this.item,
  });

  factory _DetailsData.fromJson(Map<String, dynamic> json) {
    return _DetailsData(
      seoOnPage: _SeoOnPage.fromJson(json['seoOnPage']),
      breadCrumb: List<_BreadCrumb>.from(
        json['breadCrumb'].map((x) => _BreadCrumb.fromJson(x)),
      ),
      params: _ParamsSlug.fromJson(json['params']),
      item: _DetailsItem.fromJson(json['item']),
    );
  }
}

class _ParamsSlug {
  String slug;

  _ParamsSlug({required this.slug});

  factory _ParamsSlug.fromJson(Map<String, dynamic> json) {
    return _ParamsSlug(slug: json['slug']);
  }
}

class _DetailsItem {
  _Tmdb? tmdb;
  _Imdb? imdb;
  _Created created;
  _Modified modified;
  String id;
  String name;
  String slug;
  String originName;
  String content;
  String type;
  String status;
  String thumbUrl;
  String? posterUrl;
  bool isCopyright;
  bool subDocquyen;
  bool chieurap;
  String trailerUrl;
  String time;
  String episodeCurrent;
  String episodeTotal;
  String quality;
  String lang;
  String notify;
  String showtimes;
  int year;
  int view;
  List<String> actor;
  List<String> director;
  List<_Category> category;
  List<_Country> country;
  List<_Episode> episodes;

  _DetailsItem({
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
    required this.thumbUrl,
    required this.posterUrl,
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
    required this.episodes,
  });

  factory _DetailsItem.fromJson(Map<String, dynamic> json) {
    return _DetailsItem(
      tmdb: json['tmdb'] == null ? null : _Tmdb.fromJson(json['tmdb']),
      imdb: json['imdb'] == null ? null : _Imdb.fromJson(json['imdb']),
      created: _Created.fromJson(json['created']),
      modified: _Modified.fromJson(json['modified']),
      id: json['_id'],
      name: json['name'],
      slug: json['slug'],
      originName: json['origin_name'],
      content: json['content'],
      type: json['type'],
      status: json['status'],
      thumbUrl: json['thumb_url'],
      posterUrl: json['poster_url'],
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
      actor: List<String>.from(json['actor'].map((x) => x)),
      director: List<String>.from(json['director'].map((x) => x)),
      category: List<_Category>.from(
        json['category'].map((x) => _Category.fromJson(x)),
      ),
      country: List<_Country>.from(
        json['country'].map((x) => _Country.fromJson(x)),
      ),
      episodes: List<_Episode>.from(
        json['episodes'].map((x) => _Episode.fromJson(x)),
      ),
    );
  }
}

class _Episode {
  String serverName;
  List<_ServerData> serverData;

  _Episode({required this.serverName, required this.serverData});

  factory _Episode.fromJson(Map<String, dynamic> json) {
    return _Episode(
      serverName: json['server_name'],
      serverData: List<_ServerData>.from(
        json['server_data'].map((x) => _ServerData.fromJson(x)),
      ),
    );
  }
}

class _ServerData {
  String name;
  String slug;
  String? filename;
  String? linkEmbed;
  String linkM3u8;

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

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'slug': slug,
      'filename': filename,
      'link_embed': linkEmbed,
      'link_m3u8': linkM3u8,
    };
  }
}

const List<List<double>> _timeRanges = [
  [
    2.9029,
    3.336667,
    1.568233,
    3.336667,
    1.6016,
    3.3033,
    2.168833,
    3.336667,
    2.836167,
    3.336667,
    1.534867,
  ],
  [
    3.336667,
    1.568233,
    3.336667,
    1.6016,
    3.3033,
    2.168833,
    3.336667,
    2.836167,
    3.336667,
    1.534867,
  ],
  [2.0, 3.8, 1.76, 2.0, 2.16, 1.64, 1.68, 1.52, 1.84],
  [
    2.0,
    2.0,
    2.34,
    2.66,
    2.0,
    2.38,
    2.0,
    0.78,
    1.96,
    2.0,
    2.74,
    2.22,
    2.0,
    1.36,
    2.0,
    2.0,
    0.72,
  ],
];
String _removeAdsFromM3U8(Uri url, String m3u8) {
  final lines = m3u8.split('\n');

  final segments = <Map<String, dynamic>>[];
  final result = <String>[];

  int i = 0;
  while (i < lines.length) {
    final line = lines[i].trim();

    if (line.startsWith('#EXTINF')) {
      final durationMatch = RegExp(r'#EXTINF:([\d\.]+),').firstMatch(line);
      if (durationMatch != null) {
        final duration = double.parse(durationMatch.group(1)!);
        final segmentLines = [line];
        i++;
        while (i < lines.length && lines[i].trim().isEmpty) {
          i++;
        }
        if (i < lines.length) segmentLines.add(lines[i].trim());
        segments.add({'duration': duration, 'lines': segmentLines});
      }
    } else {
      result.add(line);
    }
    i++;
  }

  final keep = List.generate(segments.length, (_) => true);

  for (final range in _timeRanges) {
    final len = range.length;
    for (int i = 0; i <= segments.length - len; i++) {
      bool matched = true;
      for (int j = 0; j < len; j++) {
        if (segments[i + j]['duration'].round() != range[j].round()) {
          matched = false;
          break;
        }
      }
      if (matched) {
        for (int j = 0; j < len; j++) {
          if (keep[i + j]) {
            keep[i + j] = false;
          }
        }
        i += len - 1;
      }
    }
  }

  final finalResult = <String>[];
  finalResult.addAll(result);

  for (int i = 0; i < segments.length; i++) {
    if (keep[i]) {
      finalResult.addAll(segments[i]['lines']);
    }
  }

  final cleaned = <String>[];
  for (int i = 0; i < finalResult.length; i++) {
    final line = finalResult[i];
    if (line == '#EXT-X-DISCONTINUITY') {
      final prev = i > 0 ? finalResult[i - 1] : '';
      if (prev.startsWith('#E')) continue;
    }
    cleaned.add(url.resolve(line).toString());
  }

  return cleaned.join('\n');
}
