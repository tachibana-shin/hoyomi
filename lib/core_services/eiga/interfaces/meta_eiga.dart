import 'package:hoyomi/core_services/interfaces/genre.dart';
import 'package:hoyomi/core_services/interfaces/o_image.dart';

class Season {
  final String name;
  final String eigaId;

  Season({required this.name, required this.eigaId});
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
  });

  // Factory method to create fake data
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
      countries: [
        Genre(name: 'Japan', genreId: ''),
      ],
      language: 'English',
      studio: Genre(name: 'Studio Ghibli', genreId: ''),
      movieSeason: Genre(name: 'Spring', genreId: ''),
    );
  }
}
