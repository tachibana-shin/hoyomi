import 'package:flutter/material.dart';
import 'package:hoyomi/core_services/comic/interfaces/comic_section.dart';
import 'package:hoyomi/core_services/main.dart';
import 'package:hoyomi/pages/section_comic/[sourceId]/[sectionId].page.dart';

class SearchComicPage extends StatelessWidget {
  final String sourceId;
  final String keyword;

  const SearchComicPage({
    super.key,
    required this.sourceId,
    required this.keyword,
  });

  @override
  Widget build(BuildContext context) {
    return SectionComicPage(
      sourceId: sourceId,
      sectionId: keyword,
      getSection: ({
        required filters,
        required page,
        required sectionId,
      }) async {
        final data = await getComicService(
          sourceId,
        ).search(filters: filters, page: page, keyword: sectionId);

        return ComicSection(
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
