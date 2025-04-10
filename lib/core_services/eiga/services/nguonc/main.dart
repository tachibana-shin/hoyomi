// ignore_for_file: library_private_types_in_public_api

import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:get/get.dart';
import 'package:hoyomi/core_services/eiga/ab_eiga_service.dart';
import 'package:hoyomi/core_services/eiga/interfaces/main.dart';
import 'package:hoyomi/core_services/eiga/mixin/eiga_watch_time_general_mixin.dart';

class NguonCService extends ABEigaService with EigaWatchTimeGeneralMixin
// with
// EigaWatchTimeMixin,
// EigaHistoryMixin,
// EigaFollowMixin,
{
  final hostCUrl = 'phim.nguonc.com';
  @override
  late final init = ServiceInit(
    name: 'NguonC',
    faviconUrl: OImage(src: 'https://i.imgur.com/3Vowy8s.png'),
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
        ?.split(',')
        .map((item) => Genre(name: item, genreId: Genre.noId))
        .toList();
    final duration = item.totalEpisodes.toString();
    final language = item.language;
    //     final actors = item.querySelectorAll('.Cast a').map((anchor) {
    //       final href = anchor.attributes['href']!.split('/');
    //       return Genre(
    // name: anchor.text,
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

    final carouselPage$ = _get('phim-moi-cap-nhat');
    final categoryPages$ = categoryUrls.values
        .map((slug) => _get(slug.startsWith('/') ? slug : '$slug?page=1'))
        .toList();

    await Future.wait([carouselPage$, ...categoryPages$]);

    final carouselPage = await carouselPage$;
    final categoryPages = await Future.wait(categoryPages$);

    final carouselItems = carouselPage.items.map(_parseCarousel).toList();
    final categories = categoryUrls.entries.map((entry) {
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
        maxHeightBuilder: 0.3,
      ),
      categories: categories,
    );
  }

  Future<List<Filter>> _getFilters() async {
    final $ = await fetch$('$baseUrl/tim-kiem?keyword=*');

    return $('#form-filter select').map((select) {
      final key = select.attr('name');
      final multiple = false;
      final items = select
          .query('option')
          .skip(1)
          .toList()
          .indexed
          .map((entry) => Option(
                name: entry.$2.text(),
                value: entry.$2.attr('value'),
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
    final image = _getImage(src: movie.thumbUrl);
    final poster = _getImage(src: movie.posterUrl);
    final description = movie.description;

    final rate = null;
    final countRate = null;
    final duration = movie.totalEpisodes.toString();
    final yearOf =
        int.tryParse(_findGroup(movie, 'Năm')?.list.firstOrNull?.name ?? '');
    final views = 0;
    final seasons = movie.episodes.indexed.map((entry) {
      final index = entry.$1;
      final item = entry.$2;
      return Season(
          name: item.serverName,
          eigaId: index == 0 ? eigaIdRaw : '$eigaIdRaw@${item.serverName}');
    }).toList();
    final genres = _findGroup(movie, 'Thể loại')
            ?.list
            .map((category) => Genre(
                name: category.name,
                genreId:
                    'the-loai_${_removeDiacritics(category.name).toLowerCase().replaceAll(RegExp(r'\s'), '-')}'))
            .toList() ??
        const <Genre>[];
    final quality = movie.quality;

    // final status = movie.status;
    final authors = movie.director == null
        ? null
        : [Genre(name: movie.director!, genreId: Genre.noId)];
    final countries = _findGroup(movie, 'Quốc gia')
        ?.list
        .map((country) => Genre(
            name: country.name,
            genreId:
                'quoc-gia_${_removeDiacritics(country.name).toLowerCase().replaceAll(RegExp(r'\s'), '-')}'))
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
            extra: jsonEncode(episode.toJson())))
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
  getSource({required eigaId, required episode, server}) async {
    final source = _EpisodeItem.fromJson(jsonDecode(episode.extra!));

    return SourceVideo(
      src: source.embed,
      url: Uri.parse(source.embed),
      type: 'hls',
      headers: Headers({'referer': baseUrl}),
    );
  }

  @override
  fetchSourceContent({required source}) async {
    final url = source.src.toString().replaceFirst('embed.php', 'get.php');
    final content = await fetch(url,
        headers: Headers({
          'accept':
              'text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8',
          'accept-language': 'vi-VN,vi;q=0.6',
          'cache-control': 'no-cache',
          'cookie': 'af30a30f-1d12-406e-ad01-d76d8b94da41=1',
          'pragma': 'no-cache',
          'priority': 'u=0, i',
          'referer': source.src.toString(),
          'sec-ch-ua':
              '"Chromium";v="130", "Brave";v="130", "Not?A_Brand";v="99"',
          'sec-ch-ua-mobile': '?0',
          'sec-ch-ua-platform': '"Windows"',
          'sec-fetch-dest': 'document',
          'sec-fetch-mode': 'navigate',
          'sec-fetch-site': 'same-origin',
          'sec-gpc': '1',
          'upgrade-insecure-requests': '1',
          'user-agent':
              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36'
        }));

    return SourceContent(
      content: content,
      url: Uri.parse(url),
      headers: source.headers,
    );
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
  final String? time;
  final String quality;
  final String language;
  final String? director;
  final String? casts;

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
      description: json['description'] ?? '',
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
  final String? time;
  final String? quality;
  final String? language;
  final String? director;
  final String? casts;
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
      description: json['description'] ?? '',
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

/// =============== methods ================
/// Removes common accents and diacritical signs from a string by replacing them with an equivalent character.
String _removeDiacritics(String str) {
  final diacriticsMap = {};
  final diacriticsRegExp = RegExp('[^\u0000-\u007E]', multiLine: true);

  if (diacriticsMap.isEmpty) {
    for (int i = 0; i < _defaultDiacriticsRemovalMap.length; i++) {
      var letters = _defaultDiacriticsRemovalMap[i]['letters'];
      letters = letters ?? '';
      for (int j = 0; j < letters.length; j++) {
        diacriticsMap[letters[j]] = _defaultDiacriticsRemovalMap[i]['base'];
      }
    }
  }

  return str.replaceAllMapped(diacriticsRegExp, (a) {
    return diacriticsMap[a.group(0)] ?? a.group(0);
  });
}

final _defaultDiacriticsRemovalMap = [
  {
    'base': 'A',
    'letters':
        '\u0041\u24B6\uFF21\u00C0\u00C1\u00C2\u1EA6\u1EA4\u1EAA\u1EA8\u00C3\u0100\u0102\u1EB0\u1EAE\u1EB4\u1EB2\u0226\u01E0\u00C4\u01DE\u1EA2\u00C5\u01FA\u01CD\u0200\u0202\u1EA0\u1EAC\u1EB6\u1E00\u0104\u023A\u2C6F\u0386'
  },
  {'base': 'AA', 'letters': '\uA732'},
  {'base': 'AE', 'letters': '\u00C6\u01FC\u01E2'},
  {'base': 'AO', 'letters': '\uA734'},
  {'base': 'AU', 'letters': '\uA736'},
  {'base': 'AV', 'letters': '\uA738\uA73A'},
  {'base': 'AY', 'letters': '\uA73C'},
  {
    'base': 'B',
    'letters': '\u0042\u24B7\uFF22\u1E02\u1E04\u1E06\u0243\u0182\u0181'
  },
  {
    'base': 'C',
    'letters':
        '\u0043\u24B8\uFF23\u0106\u0108\u010A\u010C\u00C7\u1E08\u0187\u023B\uA73E'
  },
  {
    'base': 'D',
    'letters':
        '\u0044\u24B9\uFF24\u1E0A\u010E\u1E0C\u1E10\u1E12\u1E0E\u0110\u018B\u018A\u0189\uA779'
  },
  {'base': 'DZ', 'letters': '\u01F1\u01C4'},
  {'base': 'Dz', 'letters': '\u01F2\u01C5'},
  {
    'base': 'E',
    'letters':
        '\u0388\u0045\u24BA\uFF25\u00C8\u00C9\u00CA\u1EC0\u1EBE\u1EC4\u1EC2\u1EBC\u0112\u1E14\u1E16\u0114\u0116\u00CB\u1EBA\u011A\u0204\u0206\u1EB8\u1EC6\u0228\u1E1C\u0118\u1E18\u1E1A\u0190\u018E'
  },
  {'base': 'F', 'letters': '\u0046\u24BB\uFF26\u1E1E\u0191\uA77B'},
  {
    'base': 'G',
    'letters':
        '\u0047\u24BC\uFF27\u01F4\u011C\u1E20\u011E\u0120\u01E6\u0122\u01E4\u0193\uA7A0\uA77D\uA77E'
  },
  {
    'base': 'H',
    'letters':
        '\u0048\u24BD\uFF28\u0124\u1E22\u1E26\u021E\u1E24\u1E28\u1E2A\u0126\u2C67\u2C75\uA78D'
  },
  {
    'base': 'I',
    'letters':
        '\u038A\u03AA\u0049\u24BE\uFF29\u00CC\u00CD\u00CE\u0128\u012A\u012C\u0130\u00CF\u1E2E\u1EC8\u01CF\u0208\u020A\u1ECA\u012E\u1E2C\u0197'
  },
  {'base': 'J', 'letters': '\u004A\u24BF\uFF2A\u0134\u0248'},
  {
    'base': 'K',
    'letters':
        '\u004B\u24C0\uFF2B\u1E30\u01E8\u1E32\u0136\u1E34\u0198\u2C69\uA740\uA742\uA744\uA7A2'
  },
  {
    'base': 'L',
    'letters':
        '\u004C\u24C1\uFF2C\u013F\u0139\u013D\u1E36\u1E38\u013B\u1E3C\u1E3A\u0141\u023D\u2C62\u2C60\uA748\uA746\uA780'
  },
  {'base': 'LJ', 'letters': '\u01C7'},
  {'base': 'Lj', 'letters': '\u01C8'},
  {'base': 'M', 'letters': '\u004D\u24C2\uFF2D\u1E3E\u1E40\u1E42\u2C6E\u019C'},
  {
    'base': 'N',
    'letters':
        '\u004E\u24C3\uFF2E\u01F8\u0143\u00D1\u1E44\u0147\u1E46\u0145\u1E4A\u1E48\u0220\u019D\uA790\uA7A4'
  },
  {'base': 'NJ', 'letters': '\u01CA'},
  {'base': 'Nj', 'letters': '\u01CB'},
  {
    'base': 'O',
    'letters':
        '\u038c\u004F\u24C4\uFF2F\u00D2\u00D3\u00D4\u1ED2\u1ED0\u1ED6\u1ED4\u00D5\u1E4C\u022C\u1E4E\u014C\u1E50\u1E52\u014E\u022E\u0230\u00D6\u022A\u1ECE\u0150\u01D1\u020C\u020E\u01A0\u1EDC\u1EDA\u1EE0\u1EDE\u1EE2\u1ECC\u1ED8\u01EA\u01EC\u00D8\u01FE\u0186\u019F\uA74A\uA74C'
  },
  {'base': 'OI', 'letters': '\u01A2'},
  {'base': 'OO', 'letters': '\uA74E'},
  {'base': 'OU', 'letters': '\u0222'},
  {'base': 'OE', 'letters': '\u008C\u0152'},
  {'base': 'oe', 'letters': '\u009C\u0153'},
  {
    'base': 'P',
    'letters': '\u0050\u24C5\uFF30\u1E54\u1E56\u01A4\u2C63\uA750\uA752\uA754'
  },
  {'base': 'Q', 'letters': '\u0051\u24C6\uFF31\uA756\uA758\u024A'},
  {
    'base': 'R',
    'letters':
        '\u0052\u24C7\uFF32\u0154\u1E58\u0158\u0210\u0212\u1E5A\u1E5C\u0156\u1E5E\u024C\u2C64\uA75A\uA7A6\uA782'
  },
  {
    'base': 'S',
    'letters':
        '\u0053\u24C8\uFF33\u1E9E\u015A\u1E64\u015C\u1E60\u0160\u1E66\u1E62\u1E68\u0218\u015E\u2C7E\uA7A8\uA784'
  },
  {
    'base': 'T',
    'letters':
        '\u0054\u24C9\uFF34\u1E6A\u0164\u1E6C\u021A\u0162\u1E70\u1E6E\u0166\u01AC\u01AE\u023E\uA786'
  },
  {'base': 'TZ', 'letters': '\uA728'},
  {
    'base': 'U',
    'letters':
        '\u0055\u24CA\uFF35\u00D9\u00DA\u00DB\u0168\u1E78\u016A\u1E7A\u016C\u00DC\u01DB\u01D7\u01D5\u01D9\u1EE6\u016E\u0170\u01D3\u0214\u0216\u01AF\u1EEA\u1EE8\u1EEE\u1EEC\u1EF0\u1EE4\u1E72\u0172\u1E76\u1E74\u0244'
  },
  {'base': 'V', 'letters': '\u0056\u24CB\uFF36\u1E7C\u1E7E\u01B2\uA75E\u0245'},
  {'base': 'VY', 'letters': '\uA760'},
  {
    'base': 'W',
    'letters': '\u0057\u24CC\uFF37\u1E80\u1E82\u0174\u1E86\u1E84\u1E88\u2C72'
  },
  {'base': 'X', 'letters': '\u0058\u24CD\uFF38\u1E8A\u1E8C'},
  {
    'base': 'Y',
    'letters':
        '\u038E\u03AB\u0059\u24CE\uFF39\u1EF2\u00DD\u0176\u1EF8\u0232\u1E8E\u0178\u1EF6\u1EF4\u01B3\u024E\u1EFE'
  },
  {
    'base': 'Z',
    'letters':
        '\u005A\u24CF\uFF3A\u0179\u1E90\u017B\u017D\u1E92\u1E94\u01B5\u0224\u2C7F\u2C6B\uA762'
  },
  {
    'base': 'a',
    'letters':
        '\u0061\u24D0\uFF41\u1E9A\u00E0\u00E1\u00E2\u1EA7\u1EA5\u1EAB\u1EA9\u00E3\u0101\u0103\u1EB1\u1EAF\u1EB5\u1EB3\u0227\u01E1\u00E4\u01DF\u1EA3\u00E5\u01FB\u01CE\u0201\u0203\u1EA1\u1EAD\u1EB7\u1E01\u0105\u2C65\u0250\u0251\u03AC\u03B1'
  },
  {'base': 'aa', 'letters': '\uA733'},
  {'base': 'ae', 'letters': '\u00E6\u01FD\u01E3'},
  {'base': 'ao', 'letters': '\uA735'},
  {'base': 'au', 'letters': '\uA737'},
  {'base': 'av', 'letters': '\uA739\uA73B'},
  {'base': 'ay', 'letters': '\uA73D'},
  {
    'base': 'b',
    'letters': '\u0062\u24D1\uFF42\u1E03\u1E05\u1E07\u0180\u0183\u0253'
  },
  {
    'base': 'c',
    'letters':
        '\u0063\u24D2\uFF43\u0107\u0109\u010B\u010D\u00E7\u1E09\u0188\u023C\uA73F\u2184'
  },
  {
    'base': 'd',
    'letters':
        '\u0064\u24D3\uFF44\u1E0B\u010F\u1E0D\u1E11\u1E13\u1E0F\u0111\u018C\u0256\u0257\uA77A'
  },
  {'base': 'dz', 'letters': '\u01F3\u01C6'},
  {
    'base': 'e',
    'letters':
        '\u0065\u24D4\uFF45\u00E8\u00E9\u00EA\u1EC1\u1EBF\u1EC5\u1EC3\u1EBD\u0113\u1E15\u1E17\u0115\u0117\u00EB\u1EBB\u011B\u0205\u0207\u1EB9\u1EC7\u0229\u1E1D\u0119\u1E19\u1E1B\u0247\u025B\u01DD'
  },
  {'base': 'f', 'letters': '\u0066\u24D5\uFF46\u1E1F\u0192\uA77C'},
  {
    'base': 'g',
    'letters':
        '\u0067\u24D6\uFF47\u01F5\u011D\u1E21\u011F\u0121\u01E7\u0123\u01E5\u0260\uA7A1\u1D79\uA77F'
  },
  {
    'base': 'h',
    'letters':
        '\u0068\u24D7\uFF48\u0125\u1E23\u1E27\u021F\u1E25\u1E29\u1E2B\u1E96\u0127\u2C68\u2C76\u0265'
  },
  {'base': 'hv', 'letters': '\u0195'},
  {
    'base': 'i',
    'letters':
        '\u0457\u0069\u24D8\uFF49\u00EC\u00ED\u00EE\u0129\u012B\u012D\u00EF\u1E2F\u1EC9\u01D0\u0209\u020B\u1ECB\u012F\u1E2D\u0268\u0131'
  },
  {'base': 'j', 'letters': '\u006A\u24D9\uFF4A\u0135\u01F0\u0249'},
  {
    'base': 'k',
    'letters':
        '\u006B\u24DA\uFF4B\u1E31\u01E9\u1E33\u0137\u1E35\u0199\u2C6A\uA741\uA743\uA745\uA7A3'
  },
  {
    'base': 'l',
    'letters':
        '\u006C\u24DB\uFF4C\u0140\u013A\u013E\u1E37\u1E39\u013C\u1E3D\u1E3B\u017F\u0142\u019A\u026B\u2C61\uA749\uA781\uA747'
  },
  {'base': 'lj', 'letters': '\u01C9'},
  {'base': 'm', 'letters': '\u006D\u24DC\uFF4D\u1E3F\u1E41\u1E43\u0271\u026F'},
  {
    'base': 'n',
    'letters':
        '\u006E\u24DD\uFF4E\u01F9\u0144\u00F1\u1E45\u0148\u1E47\u0146\u1E4B\u1E49\u019E\u0272\u0149\uA791\uA7A5'
  },
  {'base': 'nj', 'letters': '\u01CC'},
  {
    'base': 'o',
    'letters':
        '\u03CC\u006F\u24DE\uFF4F\u00F2\u00F3\u00F4\u1ED3\u1ED1\u1ED7\u1ED5\u00F5\u1E4D\u022D\u1E4F\u014D\u1E51\u1E53\u014F\u022F\u0231\u00F6\u022B\u1ECF\u0151\u01D2\u020D\u020F\u01A1\u1EDD\u1EDB\u1EE1\u1EDF\u1EE3\u1ECD\u1ED9\u01EB\u01ED\u00F8\u01FF\u0254\uA74B\uA74D\u0275'
  },
  {'base': 'oi', 'letters': '\u01A3'},
  {'base': 'ou', 'letters': '\u0223'},
  {'base': 'oo', 'letters': '\uA74F'},
  {
    'base': 'p',
    'letters': '\u0070\u24DF\uFF50\u1E55\u1E57\u01A5\u1D7D\uA751\uA753\uA755'
  },
  {'base': 'q', 'letters': '\u0071\u24E0\uFF51\u024B\uA757\uA759'},
  {
    'base': 'r',
    'letters':
        '\u0072\u24E1\uFF52\u0155\u1E59\u0159\u0211\u0213\u1E5B\u1E5D\u0157\u1E5F\u024D\u027D\uA75B\uA7A7\uA783'
  },
  {
    'base': 's',
    'letters':
        '\u0073\u24E2\uFF53\u00DF\u015B\u1E65\u015D\u1E61\u0161\u1E67\u1E63\u1E69\u0219\u015F\u023F\uA7A9\uA785\u1E9B'
  },
  {
    'base': 't',
    'letters':
        '\u0074\u24E3\uFF54\u1E6B\u1E97\u0165\u1E6D\u021B\u0163\u1E71\u1E6F\u0167\u01AD\u0288\u2C66\uA787'
  },
  {'base': 'tz', 'letters': '\uA729'},
  {
    'base': 'u',
    'letters':
        '\u0075\u24E4\uFF55\u00F9\u00FA\u00FB\u0169\u1E79\u016B\u1E7B\u016D\u00FC\u01DC\u01D8\u01D6\u01DA\u1EE7\u016F\u0171\u01D4\u0215\u0217\u01B0\u1EEB\u1EE9\u1EEF\u1EED\u1EF1\u1EE5\u1E73\u0173\u1E77\u1E75\u0289'
  },
  {'base': 'v', 'letters': '\u0076\u24E5\uFF56\u1E7D\u1E7F\u028B\uA75F\u028C'},
  {'base': 'vy', 'letters': '\uA761'},
  {
    'base': 'w',
    'letters':
        '\u0077\u24E6\uFF57\u1E81\u1E83\u0175\u1E87\u1E85\u1E98\u1E89\u2C73'
  },
  {'base': 'x', 'letters': '\u0078\u24E7\uFF58\u1E8B\u1E8D'},
  {
    'base': 'y',
    'letters':
        '\u0079\u24E8\uFF59\u1EF3\u00FD\u0177\u1EF9\u0233\u1E8F\u00FF\u1EF7\u1E99\u1EF5\u01B4\u024F\u1EFF'
  },
  {
    'base': 'z',
    'letters':
        '\u007A\u24E9\uFF5A\u017A\u1E91\u017C\u017E\u1E93\u1E95\u01B6\u0225\u0240\u2C6C\uA763'
  }
];
