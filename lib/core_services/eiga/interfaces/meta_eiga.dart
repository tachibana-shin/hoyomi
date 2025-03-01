import 'package:hoyomi/core_services/interfaces/genre.dart';
import 'package:hoyomi/core_services/interfaces/o_image.dart';

class Season {
  final String name;
  final String eigaId;

  Season({required this.name, required this.eigaId});

  factory Season.fromJson(Map<String, dynamic> json) {
    return Season(
      name: json['name'] as String,
      eigaId: json['eigaId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'eigaId': eigaId};
  }
}

class MetaEiga {
  final String name;
  final String? originalName;
  OImage image;
  OImage? poster;
  final String description;
  final double? rate;
  final int? countRate;
  final String? duration;
  final int? yearOf;
  final int? views;
  final List<Season> seasons;
  final List<Genre> genres;
  final String? quality;
  final String? author;
  final List<Genre>? countries;
  final String? language;
  final Genre? studio;
  final Genre? movieSeason;
  final String? trailer;
  final bool fake;

  MetaEiga({
    required this.name,
    this.originalName,
    required this.image,
    this.poster,
    required this.description,
    this.rate,
    this.countRate,
    this.duration,
    this.yearOf,
    this.views,
    required this.seasons,
    required this.genres,
    this.quality,
    this.author,
    this.countries,
    this.language,
    this.studio,
    this.movieSeason,
    this.trailer,
    this.fake = false,
  });

  factory MetaEiga.fromJson(Map<String, dynamic> json) {
    return MetaEiga(
      name: json['name'] as String,
      originalName: json['originalName'] as String?,
      image: OImage.fromJson(json['image'] as Map<String, dynamic>),
      poster: json['poster'] != null
          ? OImage.fromJson(json['poster'] as Map<String, dynamic>)
          : null,
      description: json['description'] as String,
      rate: json['rate'] != null ? (json['rate'] as num).toDouble() : null,
      countRate: json['countRate'] as int?,
      duration: json['duration'] as String?,
      yearOf: json['yearOf'] as int?,
      views: json['views'] as int?,
      seasons: (json['seasons'] as List)
          .map((e) => Season.fromJson(e as Map<String, dynamic>))
          .toList(),
      genres: (json['genres'] as List)
          .map((e) => Genre.fromJson(e as Map<String, dynamic>))
          .toList(),
      quality: json['quality'] as String?,
      author: json['author'] as String?,
      countries: json['countries'] != null
          ? (json['countries'] as List)
              .map((e) => Genre.fromJson(e as Map<String, dynamic>))
              .toList()
          : null,
      language: json['language'] as String?,
      studio: json['studio'] != null
          ? Genre.fromJson(json['studio'] as Map<String, dynamic>)
          : null,
      movieSeason: json['movieSeason'] != null
          ? Genre.fromJson(json['movieSeason'] as Map<String, dynamic>)
          : null,
      trailer: json['trailer'] as String?,
      fake: json['fake'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'originalName': originalName,
      'image': image.toJson(),
      'poster': poster?.toJson(),
      'description': description,
      'rate': rate,
      'countRate': countRate,
      'duration': duration,
      'yearOf': yearOf,
      'views': views,
      'seasons': seasons.map((season) => season.toJson()).toList(),
      'genres': genres.map((genre) => genre.toJson()).toList(),
      'quality': quality,
      'author': author,
      'countries': countries?.map((country) => country.toJson()).toList(),
      'language': language,
      'studio': studio?.toJson(),
      'movieSeason': movieSeason?.toJson(),
      'trailer': trailer,
      'fake': fake,
    };
  }

  factory MetaEiga.createFakeData() {
    return MetaEiga(
      name: '5-toubun no Hanayome',
      originalName: '5-toubun no Hanayome',
      image: OImage.createFakeData(),
      poster: OImage.createFakeData(),
      description: 'This is a fake movie description.',
      rate: 8.5,
      countRate: 1200,
      duration: '2h 30m',
      yearOf: 2023,
      views: 500000,
      seasons: [
        Season(name: 'Season 1', eigaId: 'S1'),
        Season(name: 'Season 2', eigaId: 'S2'),
      ],
      genres: [
        Genre(name: 'Action', genreId: ''),
        Genre(name: 'Drama', genreId: ''),
        Genre(name: 'Drama', genreId: ''),
        Genre(name: 'Drama', genreId: ''),
        Genre(name: 'Drama', genreId: ''),
        Genre(name: 'Drama', genreId: ''),
        Genre(name: 'Drama', genreId: ''),
      ],
      quality: 'HD',
      author: 'John Doe',
      countries: [Genre(name: 'Japan', genreId: '')],
      language: 'English',
      studio: Genre(name: 'Studio Ghibli', genreId: ''),
      movieSeason: Genre(name: 'Spring', genreId: ''),
      fake: true,
    );
  }
}
