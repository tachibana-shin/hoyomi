import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hoyomi/core_services/eiga/interfaces/eiga.dart';

part 'home_eiga_category.freezed.dart';
part 'home_eiga_category.g.dart';

@freezed
sealed class HomeEigaCategory with _$HomeEigaCategory {
  const factory HomeEigaCategory({
    required String name,
    String? categoryId,
    @Default(false) bool gridView,
    required List<Eiga> items,
  }) = _HomeEigaCategory;

  factory HomeEigaCategory.fromJson(Map<String, dynamic> json) =>
      _$HomeEigaCategoryFromJson(json);

  factory HomeEigaCategory.createFakeData() {
    return HomeEigaCategory(
      name: 'Category Name',
      items: List.generate(10, (index) => Eiga.createFakeData()),
    );
  }
}
