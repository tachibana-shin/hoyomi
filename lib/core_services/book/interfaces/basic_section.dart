import 'package:honyomi/core_services/book/interfaces/basic_book.dart';

class BasicSection {
  final String name;
  final String? sectionId;
  final bool? gridView;
  final List<BasicBook> items;

  BasicSection(
      {required this.items, required this.name, this.sectionId, this.gridView});
}
