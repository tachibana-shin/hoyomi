import 'package:hoyomi/core_services/book/interfaces/basic_book.dart';

class BasicBookSection {
  final String name;
  final String? sectionId;
  final bool? gridView;
  final List<BasicBook> items;

  BasicBookSection(
      {required this.items, required this.name, this.sectionId, this.gridView});
}
