import 'package:freezed_annotation/freezed_annotation.dart';
import 'main.dart';

part 'comic_home.freezed.dart';
part 'comic_home.g.dart';

@freezed
sealed class ComicHome with _$ComicHome {
  const factory ComicHome({
    ComicCarousel? carousel,
    required List<HomeComicCategory> categories,
  }) = _ComicHome;

  factory ComicHome.fromJson(Map<String, dynamic> json) =>
      _$ComicHomeFromJson(json);

  factory ComicHome.createFakeData() {
    return ComicHome(
      carousel: ComicCarousel.createFakeData(),
      categories: List.generate(3, (i) => HomeComicCategory.createFakeData()),
    );
  }
}
