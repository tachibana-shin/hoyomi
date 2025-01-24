import 'package:hoyomi/core_services/interfaces/basic_genre.dart';
import 'package:hoyomi/core_services/interfaces/basic_image.dart';

class BasicSeason {
  final String name;
  final String eigaId;

  BasicSeason({required this.name, required this.eigaId});
}

class MetaEiga {
  final String name;
  final String? originalName;
  BasicImage image;
  BasicImage? poster;
  final String description;
  final double? rate;
  final int? countRate;
  final String? duration;
  final int? yearOf;
  final int? views;
  final List<BasicSeason> seasons;
  final List<BasicGenre> genres;
  final String? quality;
  final String? author;
  final List<BasicGenre>? countries;
  final String? language;
  final BasicGenre? studio;
  final BasicGenre? movieSeason;
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
      image: BasicImage.createFakeData(),
      poster: BasicImage.createFakeData(),
      description: 'This is a fake movie description.',
      rate: 8.5,
      countRate: 1200,
      duration: '2h 30m',
      yearOf: 2023,
      views: 500000,
      seasons: [
        BasicSeason(name: 'Season 1', eigaId: 'S1'),
        BasicSeason(name: 'Season 2', eigaId: 'S2'),
      ],
      genres: [
        BasicGenre(name: 'Action', genreId: ''),
        BasicGenre(name: 'Drama', genreId: ''),
        BasicGenre(name: 'Drama', genreId: ''),
        BasicGenre(name: 'Drama', genreId: ''),
        BasicGenre(name: 'Drama', genreId: ''),
        BasicGenre(name: 'Drama', genreId: ''),
        BasicGenre(name: 'Drama', genreId: ''),
      ],
      quality: 'HD',
      author: 'John Doe',
      countries: [
        BasicGenre(name: 'Japan', genreId: ''),
      ],
      language: 'English',
      studio: BasicGenre(name: 'Studio Ghibli', genreId: ''),
      movieSeason: BasicGenre(name: 'Spring', genreId: ''),
    );
  }
}
