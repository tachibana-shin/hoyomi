import 'dart:math';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hoyomi_bridge/export.dart';
import 'package:eval_annotation/eval_annotation.dart';

part 'home_comic_category.freezed.dart';
part 'home_comic_category.g.dart';

@freezed
@Bind()
sealed class HomeComicCategory with _$HomeComicCategory {
  const factory HomeComicCategory({
    required String name,
    String? categoryId,
    bool? gridView,
    required List<Comic> items,
  }) = _HomeComicCategory;

  factory HomeComicCategory.fromJson(Map<String, dynamic> json) =>
      _$HomeComicCategoryFromJson(json);

  factory HomeComicCategory.createFakeData() {
    return HomeComicCategory(
      name: "Popular Manga",
      categoryId: "sec1",
      gridView: Random().nextBool(),
      items: List.generate(5, (index) => Comic.createFakeData()),
    );
  }
}
