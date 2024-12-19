import 'package:honyomi/core_services/interfaces/basic_genre.dart';
import 'package:honyomi/core_services/interfaces/basic_image.dart';

class BasicCarouselItem {
  final BasicImage image;
  final String eigaId;
  final String name;
  final String? originalName;
  final double? rate;
  final String? notice; // optional: quality + process
  final String? year;
  final String? description;
  final String? studio;
  final String? duration;
  final List<BasicGenre>? genres;
  final List<BasicGenre>? actors;

  BasicCarouselItem(
      {required this.image,
      required this.eigaId,
      required this.name,
      required this.originalName,
      required this.rate,
      required this.notice,
      required this.year,
      required this.description,
      required this.studio,
      required this.duration,
      required this.genres,
      required this.actors});
}
