import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hoyomi/core_services/comic/export.dart';

part 'comic_follow.freezed.dart';
part 'comic_follow.g.dart';

@freezed
sealed class ComicFollow with _$ComicFollow {
  const factory ComicFollow({
    required String sourceId,
    required Comic item,
    DateTime? updatedAt,
    ComicChapter? lastChapter,
  }) = _ComicFollow;

  factory ComicFollow.createFakeData() => ComicFollow(
    sourceId: '',
    item: Comic.createFakeData(),
    updatedAt: DateTime.now(),
    lastChapter: ComicChapter(
      chapterId: 'fake_episode_id',
      name: 'Fake Episode',
    ),
  );

  factory ComicFollow.fromJson(Map<String, dynamic> json) =>
      _$ComicFollowFromJson(json);
}
