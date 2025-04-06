import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hoyomi/core_services/comic/interfaces/comic.dart';

part 'home_comic_category.freezed.dart';

@freezed
class HomeComicCategory with _$HomeComicCategory {
  const factory HomeComicCategory({
    required String name,
    String? categoryId,
    bool? gridView,
    required List<Comic> items,
  }) = _HomeComicCategory;


  factory HomeComicCategory.createFakeData() {
    return HomeComicCategory(
      name: "Popular Manga",
      categoryId: "sec1",
      gridView: true,
      items: List.generate(5, (index) => Comic.createFakeData()),
    );
  }
}
