import 'package:hoyomi/core_services/interfaces/filter.dart';
import 'package:hoyomi/core_services/interfaces/paginate.dart';
import 'package:hoyomi/core_services/eiga/interfaces/eiga.dart';
import 'package:json_annotation/json_annotation.dart';

part 'eiga_category.g.dart';

@JsonSerializable()
class EigaCategory implements Paginate<Eiga> {
  final String name;
  final String url;
  final String? description;
  final List<Filter>? filters;

  @override
  final List<Eiga> items;
  @override
  final int page;
  @override
  final int totalItems;
  @override
  final int totalPages;

  const EigaCategory({
    required this.name,
    required this.url,
    this.description,
    required this.items,
    required this.page,
    required this.totalItems,
    required this.totalPages,
    this.filters,
  });

  factory EigaCategory.fromJson(Map<String, dynamic> json) =>
      _$EigaCategoryFromJson(json);
  Map<String, dynamic> toJson() => _$EigaCategoryToJson(this);

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
