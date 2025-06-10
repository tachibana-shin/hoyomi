import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hoyomi_bridge/export.dart';
import 'package:eval_annotation/eval_annotation.dart';

part 'comic_history.freezed.dart';

@freezed
@Bind()
sealed class ComicHistory with _$ComicHistory {
  const factory ComicHistory({
    required String sourceId,
    required Comic item,
    required DateTime watchUpdatedAt,
    required ComicChapter lastChapter,
    required WatchPage watchPage,
  }) = _ComicHistory;

  factory ComicHistory.createFakeData() {
    return ComicHistory(
      sourceId: '',
      item: Comic.createFakeData(),
      watchUpdatedAt: DateTime.now(),
      lastChapter: ComicChapter.createFakeData(),
      watchPage: WatchPage(currentPage: 0, totalPage: 10),
    );
  }
}
