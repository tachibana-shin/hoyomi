import 'package:honyomi/core_services/interfaces/basic_image.dart';
import 'package:honyomi/core_services/interfaces/route.dart';

class BasicBook extends Route {
  final String? originalName;
  final BasicImage image;
  final Route? lastChap;
  final DateTime? timeAgo;
  final String? notice;
  final double? rate;

  BasicBook({
    required super.slug,
    required super.name,
    required this.originalName,
    required this.image,
    required this.lastChap,
    required this.timeAgo,
    required this.notice,
    required this.rate,
  });
}
