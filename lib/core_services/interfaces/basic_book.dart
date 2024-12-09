import 'package:honyomi/core_services/interfaces/basic_chapter.dart';
import 'package:honyomi/core_services/interfaces/basic_image.dart';

class BasicBook {
  final String name;
  final String bookId;
  final String? originalName;
  final BasicImage image;
  final BasicChapter? lastChap;
  final DateTime? timeAgo;
  final String? notice;
  final double? rate;

  BasicBook({
    required this.name,
    required this.bookId,
    required this.originalName,
    required this.image,
    required this.lastChap,
    required this.timeAgo,
    required this.notice,
    required this.rate,
  });
}
