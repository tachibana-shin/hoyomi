// ignore: file_names

import 'package:flutter/material.dart';
import 'package:hoyomi/core_services/comic/export.dart';
import 'package:hoyomi/core_services/eiga/export.dart';
import 'package:hoyomi/pages/export.dart';
import 'package:hoyomi/plugins/export.dart';

class ExplorerPage extends StatefulWidget {
  final String sourceId;

  const ExplorerPage({super.key, required this.sourceId});

  @override
  State<ExplorerPage> createState() => _ExplorerPageState();
}

class _ExplorerPageState extends State<ExplorerPage> {
  @override
  Widget build(BuildContext context) {
    final service = getService(widget.sourceId);

    if (service is ABComicService) {
      return CategoryComicPage(
        sourceId: widget.sourceId,
        categoryId: '',
        getCategory: ({
          required filters,
          required page,
          required categoryId,
        }) async {
          return service.getExplorer(filters: filters, page: page);
        },
      );
    } else if (service is ABEigaService) {
      return CategoryEigaPage(
        sourceId: widget.sourceId,
        categoryId: '',
        getCategory: ({
          required filters,
          required page,
          required categoryId,
        }) async {
          return service.getExplorer(filters: filters, page: page);
        },
      );
    }

    return Container();
  }
}
