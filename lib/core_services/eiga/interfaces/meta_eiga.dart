import 'package:honyomi/core_services/interfaces/basic_genre.dart';
import 'package:honyomi/core_services/interfaces/basic_image.dart';

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
  final int? likes;
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
    this.likes,
    this.language,
    this.studio,
    this.movieSeason,
    this.trailer,
  });
}
