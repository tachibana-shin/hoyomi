import 'package:flutter/material.dart';
import 'package:honyomi/core_services/eiga/eiga_base_service.dart';
import 'package:honyomi/core_services/eiga/interfaces/basic_eiga.dart';
import 'package:honyomi/core_services/utils_service.dart';
import 'package:honyomi/widgets/eiga/vertical_eiga.dart';
import 'package:honyomi/widgets/horizontal_list.dart';

class HorizontalEigaList extends StatelessWidget {
  final List<BasicEiga>? items;
  final Future<List<BasicEiga>> itemsFuture;
  final EigaBaseService? service;
  final String Function(int index)? getService;
  final double Function(int index)? getPercentRead;
  final Function()? onTapChild;
  final String title;
  final String? more;
  final Future<int>? totalItems;

  const HorizontalEigaList({
    super.key,
    this.items,
    required this.itemsFuture,
    required this.service,
    this.getService,
    this.getPercentRead,
    this.onTapChild,
    required this.title,
    required this.more,
    this.totalItems,
  });

  @override
  Widget build(BuildContext context) {
    return HorizontalList(
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
      builderError: (Object? error) {
        return Center(
            child: UtilsService.errorWidgetBuilder(context,
                error: error, orElse: (error) => Text('Error: $error')));
      },
      totalFuture: totalItems,
    );
  }
}
