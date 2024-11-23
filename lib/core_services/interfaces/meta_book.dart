import 'package:honyomi/core_services/interfaces/basic_image.dart';
import 'package:honyomi/core_services/interfaces/rate_value.dart';
import 'package:honyomi/core_services/interfaces/route.dart';

class MetaBook {
  final String name;
  final BasicImage image;

  final String? author;
  final String? translator;
  final String? status;

  final int? views;
  final int? likes;

  final RateValue? rate;
  final Iterable<Route> genres;
  final String description;
  final Iterable<Chapter> chapters;
  final DateTime lastModified;

  MetaBook(
      {required this.name,
      required this.image,
      required this.author,
      required this.translator,
      required this.status,
      required this.views,
      required this.likes,
      required this.rate,
      required this.genres,
      required this.description,
      required this.chapters,
      required this.lastModified});
}

class Chapter extends Route {
  final DateTime? time;

  Chapter({required super.name, required super.slug, this.time});
}
