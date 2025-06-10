
import 'package:hoyomi_bridge/export.dart';
// ignore: unused_import
import 'package:dart_eval/dart_eval_bridge.dart';
// ignore: unused_import
import 'package:dart_eval/dart_eval_extensions.dart';

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
