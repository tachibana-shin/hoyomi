import 'package:flutter/material.dart';
import 'package:hoyomi/core_services/main.dart';
import 'package:hoyomi/pages/section_comic/[sourceId]/[sectionId].page.dart';

class SearchComicPage extends StatelessWidget {
  final String serviceId;
  final String keyword;

  const SearchComicPage(
      {super.key, required this.serviceId, required this.keyword});

  @override
  Widget build(BuildContext context) {
    return SectionComicPage(
        serviceId: serviceId,
        sectionId: keyword,
        getSection: ({required filters, required page, required sectionId}) =>
            getComicService(serviceId)
                .search(filters: filters, page: page, keyword: sectionId));
  }
}
