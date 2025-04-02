// ignore_for_file: library_private_types_in_public_api

import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:get/get.dart';
import 'package:hoyomi/core_services/eiga/ab_eiga_service.dart';
import 'package:hoyomi/core_services/eiga/interfaces/main.dart';

import 'package:mediaquery_sizer/mediaquery_sizer.dart';

class NguonCService extends ABEigaService
// with
// EigaWatchTimeMixin,
// EigaHistoryMixin,
// EigaFollowMixin,
{
  final hostCUrl = "phim.nguonc.com";
  @override
  late final init = ServiceInit(
    name: "NguonC",
    faviconUrl: OImage(src: '$hostCUrl/favicon.png'),
    rootUrl: 'https://$hostCUrl',
  );

  Future<_MovieResponse> _get(String path) {
    return fetch('$baseUrl/api/films/$path')
        .then((value) => _MovieResponse.fromJson(jsonDecode(value)));
  }

  Future<_MovieDetailResponse> _getDetails(String eigaId) {
    return fetchWithCache('$baseUrl/api/film/$eigaId',
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

  OImage _getImage({required String src}) {
    return OImage(src: src);
  }

  Eiga _parseItem(_MovieItem item) {
    return Eiga(
      name: item.name,
      originalName: item.originalName,
      eigaId: item.slug,
      image: _getImage(src: item.thumbUrl),
      notice: '${item.quality}-${item.currentEpisode}',
      preRelease: null,
      pending: item.currentEpisode == 'Trailer',
      lastEpisode: null,
      timeAgo: DateTime.parse(item.modified),
    );
  }

  CarouselItem _parseCarousel(_MovieItem item) {
    final data = _parseItem(item);

    final year = null;
    final description = item.originalName;
    final studio = null;
    final genres = null;
    final actors = item.casts
        .split(',')
        .map((item) => Genre(name: item.trim(), genreId: Genre.noId))
        .toList();
    final duration = item.totalEpisodes.toString();
    final language = item.language;
    //     final actors = item.querySelectorAll(".Cast a").map((anchor) {
    //       final href = anchor.attributes['href']!.split('/');
    //       return Genre(
    // name: anchor.text.trim(),
    // genreId: href.elementAt(href.length - 2)
    //       );
    //     });

    return CarouselItem(
      image: _getImage(src: item.posterUrl),
      eigaId: data.eigaId,
      name: data.name,
      originalName: data.originalName,
      rate: data.rate,
      notice: data.notice,
      year: year,
      description: description,
      studio: studio,
      genres: genres,
      actors: actors,
      duration: duration,
      language: language,
    );
  }

  @override
  Future<EigaHome> home() async {
    final categoryUrls = {
      'Phim bộ': 'danh-sach/phim-bo',
      'Phim lẻ': 'danh-sach/phim-le',
      'Truyền hình': 'danh-sach/tv-shows',
      'Nhạc': 'the-loai/phim-nhac',
      'Hoạt hình': 'the-loai/hoat-hinh',
      'Nhật Bản': 'quoc-gia/nhat-ban',
    };

    final carouselPage$ = fetch('phim-moi-cap-nhat').then((json) =>
        List<_MovieItem>.from(
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
        items: page.items.map((item) => _parseItem(item)).toList(),
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
    final document = await fetchDocument('$baseUrl/tim-kiem?keyword=*');

    return document.querySelectorAll('#form-filter select').map((select) {
      final key = select.attributes['name']!;
      final multiple = false;
      final items = select
          .querySelectorAll('option')
          .indexed
          .skip(1)
          .map((entry) => Option(
                name: entry.$2.text.trim(),
                value: entry.$2.attributes['value']!,
                selected: entry.$1 == 0,
              ))
          .toList();
      final name = items.first.name;

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

    if (query['sort_field'] == null || query['sort_field']!.isEmpty) {
      query['sort_field'] = ['modified'];
    }
    bool isListMode = false;
    if (categoryId.startsWith('quoc-gia_')) {
      basePath =
          'quoc-gia/${query['country']?.lastOrNull ?? categoryId.replaceFirst('quoc-gia_', '')}';
    } else if (categoryId.startsWith('tim-kiem_')) {
      basePath = 'search';
      query['keyword'] = [categoryId.replaceFirst('tim-kiem_', '')];
    } else if (categoryId.startsWith('the-loai_')) {
      basePath =
          'the-loai/${query['category']?.lastOrNull ?? categoryId.replaceFirst('the-loai_', '')}';
    } else if (categoryId.startsWith('danh-sach_')) {
      basePath =
          'danh-sach/${query['type']?.lastOrNull ?? categoryId.replaceFirst('danh-sach_', '')}';
      isListMode = true;
    } else if (categoryId.startsWith('nam_')) {
      basePath =
          'nam-phat-hanh/${query['year']?.lastOrNull ?? categoryId.replaceFirst('nam_', '')}';
    }

    final url =
        '$basePath?${query.entries.map((entry) => '${entry.key}=${entry.value.join(',')}').join('&')}';
    final pageData = await _get(url);

    final name = pageData.cat?.name ?? categoryId;
    final items = pageData.items.map(_parseItem).toList();
    final totalPages = pageData.paginate.totalPage;
    final totalItems = pageData.paginate.totalItems;

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

  _CategoryGroup? _findGroup(_Movie movie, String groupName) {
    for (var categoryGroup in movie.category.values) {
      if (categoryGroup.group.name == groupName) {
        return categoryGroup;
      }
    }
    return null;
  }

  @override
  getDetails(String eigaId) async {
    final index = max(0, eigaId.indexOf('@'));
    final eigaIdRaw = index == 0 ? eigaId : eigaId.substring(0, index);

    final pageData = await _getDetails(eigaIdRaw);
    final movie = pageData.movie;

    final name = movie.name;
    final originalName = movie.originalName;
    final image = _getImage(src: movie.posterUrl);
    final poster = _getImage(src: movie.thumbUrl);
    final description = movie.description;

    final rate = null;
    final countRate = null;
    final duration = movie.totalEpisodes.toString();
    final yearOf =
        int.tryParse(_findGroup(movie, 'Năm')?.list.firstOrNull?.name ?? '');
    final views = 0;
    final seasons = movie.episodes.map((item) {
      return Season(
          name: item.serverName, eigaId: '$eigaIdRaw@${item.serverName}');
    }).toList();
    final genres = _findGroup(movie, 'Thể loại')
            ?.list
            .map((category) => Genre(
                name: category.name, genreId: 'the-loai_${category.name}'))
            .toList() ??
        const <Genre>[];
    final quality = movie.quality;

    // final status = movie.status;
    final author = movie.director;
    final countries = _findGroup(movie, 'Quốc gia')
        ?.list
        .map((country) =>
            Genre(name: country.name, genreId: 'quoc-gia_${country.name}'))
        .toList();
    final language = movie.language;
    final studio = null;
    final trailer = null;
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
    final movie = pageData.movie;

    final episodes = movie.episodes
        .firstWhereOrNull(
            (server) => seasonName.isEmpty || server.serverName == seasonName)
        ?.items
        .map((episode) => EigaEpisode(
            name: episode.name,
            episodeId: episode.slug,
            extra: episode.toJson()))
        .toList();
    if (episodes == null) throw Exception('Episode not found');

    final image = _getImage(src: movie.thumbUrl);
    final poster = _getImage(src: movie.posterUrl);

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
    final source = _EpisodeItem.fromJson(episode.extra);

    return SourceVideo(
      src: source.embed,
      url: Uri.parse(source.embed),
      type: 'hls',
      headers: {'referer': baseUrl},
    );
  }

  @override
  fetchSourceContent({required source}) async {
    final url = source.src.toString().replaceFirst("embed.php", "get.php");
    final content = await fetch(url, headers: {
      'accept':
          "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8",
      "accept-language": "vi-VN,vi;q=0.6",
      "cache-control": "no-cache",
      'cookie': "af30a30f-1d12-406e-ad01-d76d8b94da41=1",
      'pragma': "no-cache",
      'priority': "u=0, i",
      'referer': source.src.toString(),
      "sec-ch-ua": '"Chromium";v="130", "Brave";v="130", "Not?A_Brand";v="99"',
      "sec-ch-ua-mobile": "?0",
      "sec-ch-ua-platform": '"Windows"',
      "sec-fetch-dest": "document",
      "sec-fetch-mode": "navigate",
      "sec-fetch-site": "same-origin",
      "sec-gpc": "1",
      "upgrade-insecure-requests": "1",
      "user-agent":
          "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36"
    });

    return SourceContent(
      content: content,
      url: Uri.parse(url),
      headers: source.headers,
    );
  }

  @override
  getSubtitles({required eigaId, required episode}) async {
    return [];
  }

  @override
  getSuggest({required metaEiga, required eigaId, page}) async {
    return (await getCategory(
            categoryId: metaEiga.genres.first.genreId, page: 1, filters: {}))
        .items;
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
  final String status;
  final _Paginate paginate;
  final _Cat? cat;
  final List<_MovieItem> items;

  _MovieResponse({
    required this.status,
    required this.paginate,
    required this.cat,
    required this.items,
  });

  factory _MovieResponse.fromJson(Map<String, dynamic> json) {
    return _MovieResponse(
      status: json['status'],
      paginate: _Paginate.fromJson(json['paginate']),
      cat: json['cat'] != null ? _Cat.fromJson(json['cat']) : null,
      items: (json['items'] as List)
          .map((item) => _MovieItem.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'paginate': paginate.toJson(),
      'cat': cat?.toJson(),
      'items': items.map((item) => item.toJson()).toList(),
    };
  }
}

class _Paginate {
  final int currentPage;
  final int totalPage;
  final int totalItems;
  final int itemsPerPage;

  _Paginate({
    required this.currentPage,
    required this.totalPage,
    required this.totalItems,
    required this.itemsPerPage,
  });

  factory _Paginate.fromJson(Map<String, dynamic> json) {
    return _Paginate(
      currentPage: json['current_page'],
      totalPage: json['total_page'],
      totalItems: json['total_items'],
      itemsPerPage: json['items_per_page'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'current_page': currentPage,
      'total_page': totalPage,
      'total_items': totalItems,
      'items_per_page': itemsPerPage,
    };
  }
}

class _Cat {
  final String name;
  final String title;
  final String slug;

  _Cat({
    required this.name,
    required this.title,
    required this.slug,
  });

  factory _Cat.fromJson(Map<String, dynamic> json) {
    return _Cat(
      name: json['name'],
      title: json['title'],
      slug: json['slug'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'title': title,
      'slug': slug,
    };
  }
}

class _MovieItem {
  final String name;
  final String slug;
  final String originalName;
  final String thumbUrl;
  final String posterUrl;
  final String created;
  final String modified;
  final String description;
  final int totalEpisodes;
  final String currentEpisode;
  final String time;
  final String quality;
  final String language;
  final String director;
  final String casts;

  _MovieItem({
    required this.name,
    required this.slug,
    required this.originalName,
    required this.thumbUrl,
    required this.posterUrl,
    required this.created,
    required this.modified,
    required this.description,
    required this.totalEpisodes,
    required this.currentEpisode,
    required this.time,
    required this.quality,
    required this.language,
    required this.director,
    required this.casts,
  });

  factory _MovieItem.fromJson(Map<String, dynamic> json) {
    return _MovieItem(
      name: json['name'],
      slug: json['slug'],
      originalName: json['original_name'],
      thumbUrl: json['thumb_url'],
      posterUrl: json['poster_url'],
      created: json['created'],
      modified: json['modified'],
      description: json['description'],
      totalEpisodes: json['total_episodes'],
      currentEpisode: json['current_episode'],
      time: json['time'],
      quality: json['quality'],
      language: json['language'],
      director: json['director'],
      casts: json['casts'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'slug': slug,
      'original_name': originalName,
      'thumb_url': thumbUrl,
      'poster_url': posterUrl,
      'created': created,
      'modified': modified,
      'description': description,
      'total_episodes': totalEpisodes,
      'current_episode': currentEpisode,
      'time': time,
      'quality': quality,
      'language': language,
      'director': director,
      'casts': casts,
    };
  }
}

/// ================= details movie ====================
class _MovieDetailResponse {
  final String status;
  final _Movie movie;

  _MovieDetailResponse({
    required this.status,
    required this.movie,
  });

  factory _MovieDetailResponse.fromJson(Map<String, dynamic> json) {
    return _MovieDetailResponse(
      status: json['status'],
      movie: _Movie.fromJson(json['movie']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'movie': movie.toJson(),
    };
  }
}

class _Movie {
  final String id;
  final String name;
  final String slug;
  final String originalName;
  final String thumbUrl;
  final String posterUrl;
  final String created;
  final String modified;
  final String description;
  final int totalEpisodes;
  final String currentEpisode;
  final String time;
  final String quality;
  final String language;
  final String? director;
  final String casts;
  final Map<String, _CategoryGroup> category;
  final List<_EpisodeGroup> episodes;

  _Movie({
    required this.id,
    required this.name,
    required this.slug,
    required this.originalName,
    required this.thumbUrl,
    required this.posterUrl,
    required this.created,
    required this.modified,
    required this.description,
    required this.totalEpisodes,
    required this.currentEpisode,
    required this.time,
    required this.quality,
    required this.language,
    this.director,
    required this.casts,
    required this.category,
    required this.episodes,
  });

  factory _Movie.fromJson(Map<String, dynamic> json) {
    // Xử lý category là một map với key là String và value là CategoryGroup
    Map<String, _CategoryGroup> catMap = {};
    (json['category'] as Map<String, dynamic>).forEach((key, value) {
      catMap[key] = _CategoryGroup.fromJson(value);
    });

    return _Movie(
      id: json['id'],
      name: json['name'],
      slug: json['slug'],
      originalName: json['original_name'],
      thumbUrl: json['thumb_url'],
      posterUrl: json['poster_url'],
      created: json['created'],
      modified: json['modified'],
      description: json['description'],
      totalEpisodes: json['total_episodes'],
      currentEpisode: json['current_episode'],
      time: json['time'],
      quality: json['quality'],
      language: json['language'],
      director: json['director'],
      casts: json['casts'],
      category: catMap,
      episodes: (json['episodes'] as List)
          .map((e) => _EpisodeGroup.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    // Chuyển map category về dạng Map<String, dynamic>
    Map<String, dynamic> catMap = {};
    category.forEach((key, value) {
      catMap[key] = value.toJson();
    });

    return {
      'id': id,
      'name': name,
      'slug': slug,
      'original_name': originalName,
      'thumb_url': thumbUrl,
      'poster_url': posterUrl,
      'created': created,
      'modified': modified,
      'description': description,
      'total_episodes': totalEpisodes,
      'current_episode': currentEpisode,
      'time': time,
      'quality': quality,
      'language': language,
      'director': director,
      'casts': casts,
      'category': catMap,
      'episodes': episodes.map((e) => e.toJson()).toList(),
    };
  }
}

class _CategoryGroup {
  final _Group group;
  final List<_CategoryItem> list;

  _CategoryGroup({
    required this.group,
    required this.list,
  });

  factory _CategoryGroup.fromJson(Map<String, dynamic> json) {
    return _CategoryGroup(
      group: _Group.fromJson(json['group']),
      list: (json['list'] as List)
          .map((item) => _CategoryItem.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'group': group.toJson(),
      'list': list.map((item) => item.toJson()).toList(),
    };
  }
}

class _Group {
  final String id;
  final String name;

  _Group({
    required this.id,
    required this.name,
  });

  factory _Group.fromJson(Map<String, dynamic> json) {
    return _Group(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}

class _CategoryItem {
  final String id;
  final String name;

  _CategoryItem({
    required this.id,
    required this.name,
  });

  factory _CategoryItem.fromJson(Map<String, dynamic> json) {
    return _CategoryItem(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}

class _EpisodeGroup {
  final String serverName;
  final List<_EpisodeItem> items;

  _EpisodeGroup({
    required this.serverName,
    required this.items,
  });

  factory _EpisodeGroup.fromJson(Map<String, dynamic> json) {
    return _EpisodeGroup(
      serverName: json['server_name'],
      items: (json['items'] as List)
          .map((item) => _EpisodeItem.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'server_name': serverName,
      'items': items.map((item) => item.toJson()).toList(),
    };
  }
}

class _EpisodeItem {
  final String name;
  final String slug;
  final String embed;
  final String m3u8;

  _EpisodeItem({
    required this.name,
    required this.slug,
    required this.embed,
    required this.m3u8,
  });

  factory _EpisodeItem.fromJson(Map<String, dynamic> json) {
    return _EpisodeItem(
      name: json['name'],
      slug: json['slug'],
      embed: json['embed'],
      m3u8: json['m3u8'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'slug': slug,
      'embed': embed,
      'm3u8': m3u8,
    };
  }
}
