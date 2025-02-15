import 'package:hoyomi/core_services/book/interfaces/book.dart';

class HomeBookSection {
  final String name;
  final String? sectionId;
  final bool? gridView;
  final List<Book> items;

  HomeBookSection(
      {required this.items, required this.name, this.sectionId, this.gridView});
}
