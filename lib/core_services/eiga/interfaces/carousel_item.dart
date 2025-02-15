import 'package:hoyomi/core_services/interfaces/genre.dart';
import 'package:hoyomi/core_services/interfaces/o_image.dart';

class CarouselItem {
  final OImage image;
  final String eigaId;
  final String name;
  final String? originalName;
  final double? rate;
  final String? notice; // optional: quality + process
  final String? year;
  final String? description;
  final String? studio;
  final String? duration;
  final List<Genre>? genres;
  final List<Genre>? actors;

  CarouselItem(
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
