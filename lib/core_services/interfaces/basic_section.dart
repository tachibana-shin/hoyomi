import 'package:honyomi/core_services/interfaces/basic_book.dart';

class BasicSection {
  final String name;
  final String? slug;
  final Iterable<BasicBook> books;

  BasicSection({required this.books, required this.name, this.slug});
}
