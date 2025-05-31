import 'package:hoyomi/core_services/comic/interfaces/comic.dart';
import 'package:hoyomi/core_services/interfaces/filter.dart';
import 'package:hoyomi/core_services/interfaces/paginate.dart';

class ComicCategory extends Paginate<Comic> {
  final String name;
  final String url;
  final String? description;
  final List<Filter>? filters;

  const ComicCategory({
    required this.name,
    required this.url,
    this.description,
    required super.items,
    required super.page,
    required super.totalItems,
    required super.totalPages,
    this.filters,
  });

  factory ComicCategory.createFakeData() {
    return ComicCategory(
      name: 'Fake Category',
      url: 'https://example.com/fake-category',
      description: 'This is a fake category for testing purposes.',
      items: List.generate(30, (_) => Comic.createFakeData()),
      page: 1,
      totalItems: 0,
      totalPages: 1,
    );
  }
}
