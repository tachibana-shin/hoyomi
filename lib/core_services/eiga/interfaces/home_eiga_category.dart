import 'package:hoyomi/core_services/eiga/interfaces/eiga.dart';

class HomeEigaCategory {
  final String name;
  final String? categoryId;
  final bool? gridView;
  final List<Eiga> items;

  HomeEigaCategory({
    required this.items,
    required this.name,
    this.categoryId,
    this.gridView,
  });

  factory HomeEigaCategory.createFakeData() {
    return HomeEigaCategory(
      name: 'Category Name',
      items: List.generate(10, (index) => Eiga.createFakeData()),
    );
  }
}
