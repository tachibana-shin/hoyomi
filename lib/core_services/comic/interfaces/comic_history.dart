import 'package:freezed_annotation/freezed_annotation.dart';

import 'main.dart';

part 'comic_history.freezed.dart';

@freezed
sealed class ComicHistory with _$ComicHistory {
  const factory ComicHistory({
    required Comic item,
    required DateTime watchUpdatedAt,
    required ComicChapter lastEpisode,
    required WatchPage watchPage,
  }) = _ComicHistory;

  factory ComicHistory.createFakeData() {
    return ComicHistory(
      item: Comic.createFakeData(),
      watchUpdatedAt: DateTime.now(),
      lastEpisode: ComicChapter(
        chapterId: 'fake_episode_id',
        name: 'Fake Episode',
      ),
      watchPage: WatchPage(
        currentPage: 0,
        totalPage: 10,
      ),
    );
  }
}
