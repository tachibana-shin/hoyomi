import 'package:hoyomi/core_services/comic/interfaces/comic.dart';
import 'package:hoyomi/core_services/interfaces/filter.dart';
import 'package:hoyomi/core_services/interfaces/paginate.dart';
import 'package:json_annotation/json_annotation.dart';

part 'comic_category.g.dart';

@JsonSerializable()
class ComicCategory implements Paginate<Comic> {
  final String name;
  final String url;
  final String? description;
  final List<Filter>? filters;

  @override
  final List<Comic> items;
  @override
  final int page;
  @override
  final int totalItems;
  @override
  final int totalPages;

  const ComicCategory({
    required this.name,
    required this.url,
    this.description,
    required this.items,
    required this.page,
    required this.totalItems,
    required this.totalPages,
    this.filters,
  });

  factory ComicCategory.fromJson(Map<String, dynamic> json) =>
      _$ComicCategoryFromJson(json);
  Map<String, dynamic> toJson() => _$ComicCategoryToJson(this);

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
