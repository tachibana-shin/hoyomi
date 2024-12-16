import 'package:honyomi/core_services/book/interfaces/basic_book.dart';

class BasicSection {
  final String name;
  final String? sectionId;
  final bool? gridView;
  final List<BasicBook> books;

  BasicSection(
      {required this.books, required this.name, this.sectionId, this.gridView});
}
