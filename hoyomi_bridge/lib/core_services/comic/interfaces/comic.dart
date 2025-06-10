import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hoyomi_bridge/export.dart';
import 'package:eval_annotation/eval_annotation.dart';

part 'comic.freezed.dart';
part 'comic.g.dart';

@freezed
@Bind()
sealed class Comic with _$Comic {
  const factory Comic({
    required String name,
    required String comicId,
    String? originalName,
    required OImage image,
    ComicChapter? lastChap,
    DateTime? lastUpdate,
    String? notice,
    @Default(false) bool pending,
    DateTime? preRelease,
    double? rate,
    String? description,
  }) = _Comic;

  factory Comic.fromJson(Map<String, dynamic> json) => _$ComicFromJson(json);

  factory Comic.fromMeta(String comicId, {required MetaComic comic}) {
    return Comic(
      name: comic.name,
      comicId: comicId,
      originalName: comic.originalName,
      image: comic.image,
      lastChap: null,
      lastUpdate: null,
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
      lastUpdate: null,
      notice: 'Notice Fake',
      rate: 8.5,
    );
  }
}
