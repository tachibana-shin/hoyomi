import 'package:hoyomi/core_services/comic/export.dart';

class ComicFollow {
  final String sourceId;
  final Comic item;
  final DateTime? updatedAt;
  final ComicChapter? lastChapter;

  const ComicFollow({
    required this.sourceId,
    required this.item,
    this.updatedAt,
    this.lastChapter,
  });

  factory ComicFollow.createFakeData() {
    return ComicFollow(
      sourceId: '',
      item: Comic.createFakeData(),
      updatedAt: DateTime.now(),
      lastChapter: ComicChapter(
        chapterId: 'fake_episode_id',
        name: 'Fake Episode',
      ),
    );
  }
}
