import 'package:honyomi/services/interfaces/basic_book.dart';
import 'package:honyomi/services/interfaces/route.dart';

class BasicSection extends Route {
  final Iterable<BasicBook> books;

  BasicSection({required this.books, required super.name, required super.slug});
}
