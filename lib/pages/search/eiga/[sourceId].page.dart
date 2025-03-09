import 'package:flutter/material.dart';
import 'package:hoyomi/core_services/eiga/interfaces/eiga_section.dart';
import 'package:hoyomi/core_services/main.dart';
import 'package:hoyomi/pages/section_eiga/[sourceId]/[sectionId].page.dart';

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
    return SectionEigaPage(
      sourceId: sourceId,
      sectionId: keyword,
      getSection: ({
        required filters,
        required page,
        required sectionId,
      }) async {
        final data = await getEigaService(
          sourceId,
        ).search(
            filters: filters, page: page, keyword: sectionId, quick: false);

        return EigaSection(
          name: 'Search "$sectionId"',
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
