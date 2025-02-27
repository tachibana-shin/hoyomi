import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoyomi/core_services/eiga/interfaces/eiga.dart';
import 'package:hoyomi/core_services/utils_service.dart';
import 'package:hoyomi/widgets/eiga/vertical_eiga.dart';
import 'package:hoyomi/widgets/horizontal_list.dart';
import 'package:skeletonizer/skeletonizer.dart';

class EigaExtend {
  final Eiga eiga;
  final String? sourceId;
  final double? percentRead;

  EigaExtend({required this.eiga, required this.sourceId, this.percentRead});
}

class HorizontalEigaList extends StatelessWidget {
  final Future<List<EigaExtend>> itemsFuture;
  final String title;
  final String? subtitle;
  final String? more;

  const HorizontalEigaList({
    super.key,
    required this.itemsFuture,
    required this.title,
    this.subtitle,
    this.more,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: itemsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Skeletonizer(
            enabled: true,
            enableSwitchAnimation: true,
            child: HorizontalList<EigaExtend>(
              title: title,
              subtitle: subtitle,
              more: more,
              items: List.generate(
                30,
                (index) =>
                    EigaExtend(eiga: Eiga.createFakeData(), sourceId: null),
              ),
              needSubtitle: false,
              builder: (context, eiga, index) {
                return VerticalEiga(
                  eiga: eiga.eiga,
                  sourceId: eiga.sourceId,
                  percentRead: eiga.percentRead,
                );
              },
            ),
          );
        }

        if (snapshot.hasError) {
          return HorizontalList.buildContainer(
            context,
            title: title,
            subtitle: subtitle,
            more: more,
            builder:
                (viewFraction) => Center(
                  child: UtilsService.errorWidgetBuilder(
                    context,
                    error: snapshot.error,
                    orElse: (error) => Text('Error: $error'),
                  ),
                ),
            needSubtitle: false,
          );
        }
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return HorizontalList.buildContainer(
            context,
            title: title,
            subtitle: subtitle,
            more: more,
            builder: (viewFraction) => Center(child: Text('No data available')),
            needSubtitle: false,
          );
        }

        return HorizontalList<EigaExtend>(
          title: title,
          subtitle: subtitle,
          more: more,
          items: snapshot.data!,
          needSubtitle:
              snapshot.data!.firstWhereOrNull(
                (eiga) => VerticalEiga.checkNeedSubtitle(eiga.eiga),
              ) !=
              null,
          builder: (context, eiga, index) {
            return VerticalEiga(
              eiga: eiga.eiga,
              sourceId: eiga.sourceId,
              percentRead: eiga.percentRead,
            );
          },
        );
      },
    );
  }
}
