import 'package:freezed_annotation/freezed_annotation.dart';

part 'comic_chapter.freezed.dart';
part 'comic_chapter.g.dart';

@freezed
sealed class ComicChapter with _$ComicChapter {
  const factory ComicChapter({
    required String name,
    String? fullName,
    required String chapterId,
    DateTime? time,
  }) = _ComicChapter;

  /// JSONからの生成
  factory ComicChapter.fromJson(Map<String, dynamic> json) =>
      _$ComicChapterFromJson(json);

  /// Fakeデータを作成
  factory ComicChapter.createFakeData() => ComicChapter(
    name: "Chapter 1: The Beginning",
    chapterId: "ch1",
    time: DateTime.now().subtract(const Duration(days: 2)),
  );
}
