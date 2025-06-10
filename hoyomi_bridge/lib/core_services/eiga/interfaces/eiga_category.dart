import 'package:hoyomi_bridge/export.dart';

class EigaCategory extends Paginate<Eiga> {
  final String name;
  final String url;
  final String? description;
  final List<Filter>? filters;

  const EigaCategory({
    required this.name,
    required this.url,
    this.description,
    required super.items,
    required super.page,
    required super.totalItems,
    required super.totalPages,
    this.filters,
  });

  factory EigaCategory.createFakeData() {
    return EigaCategory(
      name: 'Fake Category',
      url: 'https://example.com/fake-category',
      description: 'This is a fake category for testing purposes.',
      items: List.generate(30, (_) => Eiga.createFakeData()),
      page: 1,
      totalItems: 0,
      totalPages: 1,
    );
  }
}
