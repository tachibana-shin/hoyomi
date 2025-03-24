import 'package:hoyomi/core_services/comic/interfaces/comic.dart';

class HomeComicCategory {
  final String name;
  final String? categoryId;
  final bool? gridView;
  final List<Comic> items;

  const HomeComicCategory({
    required this.items,
    required this.name,
    this.categoryId,
    this.gridView,
  });

  factory HomeComicCategory.createFakeData() {
    return HomeComicCategory(
      name: "Popular Manga",
      categoryId: "sec1",
      gridView: true,
      items: List.generate(5, (index) => Comic.createFakeData()),
    );
  }
}
