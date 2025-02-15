import 'package:hoyomi/core_services/comic/interfaces/comic.dart';

class HomeComicSection {
  final String name;
  final String? sectionId;
  final bool? gridView;
  final List<Comic> items;

  HomeComicSection(
      {required this.items, required this.name, this.sectionId, this.gridView});
}
