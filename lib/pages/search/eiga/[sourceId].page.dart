import 'package:flutter/material.dart';
import 'package:hoyomi/core_services/eiga/interfaces/eiga_category.dart';
import 'package:hoyomi/core_services/main.dart';
import 'package:hoyomi/pages/category_eiga/%5BsourceId%5D/%5BcategoryId%5D.page.dart';

class SearchEigaPage extends StatelessWidget {
  final String sourceId;
  final String keyword;

  const SearchEigaPage({
    super.key,
    required this.sourceId,
    required this.keyword,
  });

  @override
  Widget build(BuildContext context) {
    return CategoryEigaPage(
      sourceId: sourceId,
      categoryId: keyword,
      getCategory: ({
        required filters,
        required page,
        required categoryId,
      }) async {
        final data = await getEigaService(sourceId).search(
          filters: filters,
          page: page,
          keyword: categoryId,
          quick: false,
        );

        return EigaCategory(
          name: 'Search "$categoryId"',
          url: data.url,
          items: data.items,
          page: data.page,
          totalItems: data.totalItems,
          totalPages: data.totalPages,
          description: data.description,
          filters: data.filters,
        );
      },
    );
  }
}
