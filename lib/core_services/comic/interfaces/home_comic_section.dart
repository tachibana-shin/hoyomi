import 'package:hoyomi/core_services/comic/interfaces/comic.dart';

class HomeComicSection {
  final String name;
  final String? sectionId;
  final bool? gridView;
  final List<Comic> items;

  const HomeComicSection({
    required this.items,
    required this.name,
    this.sectionId,
    this.gridView,
  });

  factory HomeComicSection.createFakeData() {
    return HomeComicSection(
      name: "Popular Manga",
      sectionId: "sec1",
      gridView: true,
      items: List.generate(5, (index) => Comic.createFakeData()),
    );
  }
}
