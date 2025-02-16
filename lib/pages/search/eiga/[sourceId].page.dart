import 'package:flutter/material.dart';
import 'package:hoyomi/core_services/main.dart';
import 'package:hoyomi/pages/section_eiga/[sourceId]/[sectionId].page.dart';

class SearchEigaPage extends StatelessWidget {
  final String sourceId;
  final String keyword;

  const SearchEigaPage(
      {super.key, required this.sourceId, required this.keyword});

  @override
  Widget build(BuildContext context) {
    return SectionEigaPage(
        sourceId: sourceId,
        sectionId: keyword,
        getSection: ({required filters, required page, required sectionId}) =>
            getEigaService(sourceId)
                .search(filters: filters, page: page, keyword: sectionId));
  }
}
