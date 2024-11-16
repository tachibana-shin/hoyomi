import 'package:honyomi/services/interfaces/basic_image.dart';
import 'package:honyomi/services/interfaces/route.dart';

class BasicBook extends Route {
  final BasicImage image;
  final Route? lastChap;
  final DateTime timeAgo;
  final String? notice;
  final double? rate;

  BasicBook(
      {required this.image,
      required this.lastChap,
      required this.timeAgo,
      required this.notice,
      required this.rate,
      required super.name,
      required super.slug});
}
