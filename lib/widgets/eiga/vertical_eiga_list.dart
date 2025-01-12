import 'package:flutter/material.dart';
import 'package:hoyomi/core_services/eiga/eiga_base_service.dart';
import 'package:hoyomi/core_services/eiga/interfaces/basic_eiga.dart';
import 'package:hoyomi/core_services/utils_service.dart';
import 'package:hoyomi/widgets/eiga/vertical_eiga.dart';
import 'package:hoyomi/widgets/vertical_list.dart';

class VerticalEigaList extends StatelessWidget {
  final Future<List<BasicEiga>>? itemsFuture;
  final List<BasicEiga>? items;
  final EigaBaseService? service;
  final String Function(int index)? getService;
  final double Function(int index)? getPercentRead;
  final String title;
  final String? more;
  final bool noHeader;

  const VerticalEigaList(
      {super.key,
      required this.itemsFuture,
      required this.items,
      required this.service,
      this.getService,
      required this.title,
      required this.more,
      this.noHeader = false,
      this.getPercentRead});

  @override
  Widget build(BuildContext context) {
    return VerticalList(
      title: title,
      more: more,
      items: items,
      itemsFuture: itemsFuture,
      builder: (context, eiga, index) {
        return VerticalEiga(
          eiga: eiga,
          sourceId: service?.uid ?? getService!(index),
          percentRead: getPercentRead != null ? getPercentRead!(index) : null,
        );
      },
      getDataLoading: () =>
          List.generate(30, (index) => BasicEiga.createFakeData()),
      builderError: (Object? error) {
        return Center(
            child: UtilsService.errorWidgetBuilder(context,
                error: error, orElse: (error) => Text('Error: $error')));
      },
    );
  }
}
