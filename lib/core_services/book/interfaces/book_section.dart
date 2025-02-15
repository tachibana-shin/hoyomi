import 'package:hoyomi/core_services/book/interfaces/book.dart';
import 'package:hoyomi/core_services/interfaces/filter.dart';
import 'package:hoyomi/core_services/interfaces/paginate.dart';

class BookSection extends Paginate<Book> {
  final String name;
  final String url;
  final String? description;
  final List<Filter>? filters;

  const BookSection(
      {required this.name,
      required this.url,
      this.description,
      required super.items,
      required super.page,
      required super.totalItems,
      required super.totalPages,
      this.filters});
}
