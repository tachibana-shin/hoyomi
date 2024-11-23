import 'package:honyomi/core_services/interfaces/basic_book.dart';
import 'package:honyomi/core_services/interfaces/route.dart';

class BasicSection extends Route {
  final Iterable<BasicBook> books;

  BasicSection({required this.books, required super.name, required super.slug});
}
