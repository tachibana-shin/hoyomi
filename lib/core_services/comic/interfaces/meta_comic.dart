import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hoyomi/core_services/comic/interfaces/comic_chapter.dart';
import 'package:hoyomi/core_services/interfaces/genre.dart';
import 'package:hoyomi/core_services/interfaces/o_image.dart';
import 'package:hoyomi/core_services/comic/interfaces/rate_value.dart';
import 'package:hoyomi/core_services/comic/interfaces/status_enum.dart';

part 'meta_comic.freezed.dart';
part 'meta_comic.g.dart';

@freezed
sealed class MetaComic with _$MetaComic {
  const factory MetaComic({
    required String name,
    String? originalName,
    required OImage image,
    String? author,
    String? translator,
    required StatusEnum status,
    int? views,
    int? likes,
    RateValue? rate,
    required List<Genre> genres,
    required String description,
    required List<ComicChapter> chapters,
    required DateTime lastModified,
    @Default(false) bool fake,
    @Default(false) bool offlineMode,
  }) = _MetaComic;

  factory MetaComic.fromJson(Map<String, dynamic> json) =>
      _$MetaComicFromJson(json);

  factory MetaComic.createFakeData() {
    return MetaComic(
      name: "Fake Comic Title",
      originalName: "フェイクコミックタイトル",
      image: OImage.createFakeData(),
      author: "Fake Author",
      translator: "Fake Translator",
      status: StatusEnum.ongoing,
      views: 100000,
      likes: 5000,
      rate: RateValue.createFakeData(),
      genres: [Genre.createFakeData(), Genre.createFakeData()],
      description: "これはダミーの説明です。",
      chapters: [ComicChapter.createFakeData(), ComicChapter.createFakeData()],
      lastModified: DateTime.now(),
      fake: true,
    );
  }
}
