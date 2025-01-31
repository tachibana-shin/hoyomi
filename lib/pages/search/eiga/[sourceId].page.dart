import 'package:flutter/material.dart';
import 'package:hoyomi/core_services/main.dart';
import 'package:hoyomi/pages/section_eiga/[sourceId]/[sectionId].page.dart';

class SearchEigaPage extends StatelessWidget {
  final String serviceId;
  final String keyword;

  const SearchEigaPage(
      {super.key, required this.serviceId, required this.keyword});

  @override
  Widget build(BuildContext context) {
    return SectionEigaPage(
        serviceId: serviceId,
        sectionId: keyword,
        getSection: ({required filters, required page, required sectionId}) =>
            getEigaService(serviceId)
                .search(filters: filters, page: page, keyword: sectionId));
  }
}
