import 'package:flutter/material.dart';
import 'package:hoyomi/core_services/eiga/interfaces/basic_eiga.dart';
import 'package:hoyomi/core_services/utils_service.dart';
import 'package:hoyomi/widgets/eiga/vertical_eiga.dart';
import 'package:hoyomi/widgets/horizontal_list.dart';

class BasicEigaExtend {
  final BasicEiga eiga;
  final String sourceId;
  final double? percentRead;

  BasicEigaExtend(
      {required this.eiga, required this.sourceId, this.percentRead});
}

class HorizontalEigaList extends StatelessWidget {
  final List<BasicEigaExtend>? items;
  final Future<List<BasicEigaExtend>>? itemsFuture;
  final String Function(int index)? getService;
  final double Function(int index)? getPercentRead;
  final Function()? onTapChild;
  final String title;
  final String? more;
  final Future<int>? totalItems;

  const HorizontalEigaList({
    super.key,
    this.items,
    this.itemsFuture,
    this.getService,
    this.getPercentRead,
    this.onTapChild,
    required this.title,
    required this.more,
    this.totalItems,
  }) : assert(items != null || itemsFuture != null);

  @override
  Widget build(BuildContext context) {
    return HorizontalList(
      title: title,
      more: more,
      items: items,
      itemsFuture: itemsFuture,
      builder: (context, eiga, index) {
        return VerticalEiga(
          eiga: eiga.eiga,
          sourceId: eiga.sourceId,
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
