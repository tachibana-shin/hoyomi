import 'package:hoyomi/core_services/book/interfaces/basic_book.dart';
import 'package:hoyomi/core_services/interfaces/basic_filter.dart';
import 'package:hoyomi/core_services/interfaces/paginate.dart';

class BaseBookSection extends Paginate<BasicBook> {
  final String name;
  final String url;
  final String? description;
  final List<BasicFilter>? filters;

  const BaseBookSection(
      {required this.name,
      required this.url,
      this.description,
      required super.items,
      required super.page,
      required super.totalItems,
      required super.totalPages,
      this.filters});
}
