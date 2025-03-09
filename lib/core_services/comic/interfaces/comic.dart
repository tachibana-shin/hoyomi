import 'package:hoyomi/core_services/comic/interfaces/comic_chapter.dart';
import 'package:hoyomi/core_services/interfaces/o_image.dart';
import 'package:hoyomi/core_services/comic/interfaces/meta_comic.dart';

class Comic {
  final String name;
  final String comicId;
  final String? originalName;
  final OImage image;
  final ComicChapter? lastChap;
  final DateTime? timeAgo;
  final String? notice;
  final double? rate;
  final String? description;

  Comic({
    required this.name,
    required this.comicId,
    required this.originalName,
    required this.image,
    required this.lastChap,
    required this.timeAgo,
    required this.notice,
    required this.rate,
    this.description,
  });

  factory Comic.fromMeta(String comicId, {required MetaComic comic}) {
    return Comic(
      name: comic.name,
      comicId: comicId,
      originalName: comic.originalName,
      image: comic.image,
      lastChap: null,
      timeAgo: null,
      notice: null,
      rate: comic.rate?.value,
    );
  }

  factory Comic.createFakeData() {
    return Comic(
      name: 'Dragon Ball Daima',
      comicId: 'eiga-fake-id',
      originalName: null,
      image: OImage.createFakeData(),
      lastChap: null,
      timeAgo: null,
      notice: 'Notice Fake',
      rate: 8.5,
    );
  }
}
