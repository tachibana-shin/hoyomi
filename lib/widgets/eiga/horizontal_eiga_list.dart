import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoyomi/core_services/eiga/interfaces/eiga.dart';
import 'package:hoyomi/core_services/service.dart';
import 'package:hoyomi/router/extensions/to_router.dart';
import 'package:hoyomi/widgets/eiga/vertical_eiga.dart';
import 'package:hoyomi/widgets/horizontal_list.dart';
import 'package:skeletonizer/skeletonizer.dart';

class EigaExtend {
  final Eiga eiga;
  final String? sourceId;
  final double? progress;

  EigaExtend({required this.eiga, required this.sourceId, this.progress});
}

class HorizontalEigaList extends StatelessWidget {
  final Future<List<EigaExtend>> itemsFuture;
  final String title;
  final String? subtitle;
  final ToRouter? more;

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
          final items = List.generate(
            30,
            (index) => EigaExtend(eiga: Eiga.createFakeData(), sourceId: null),
          );
          return Skeletonizer(
            enabled: true,
            enableSwitchAnimation: true,
            child: HorizontalList<EigaExtend>(
              title: title,
              subtitle: subtitle,
              more: more,
              items: items,
              titleLength: items
                  .map((item) => item.eiga.name.length)
                  .reduce((max, length) => length > max ? length : max),
              itemSubtitle: false,
              itemTimeAgo: false,
              builder: (context, eiga, index) {
                return VerticalEiga(
                  eiga: eiga.eiga,
                  sourceId: eiga.sourceId,
                  progress: eiga.progress,
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
                  child: Service.errorWidgetBuilder(
                    context,
                    error: snapshot.error,
                    trace: snapshot.stackTrace,
                    service: null,
                    orElse: (error) => Text('Error: $error'),
                  ),
                ),
            titleLength: 1,
            itemSubtitle: false,
            itemTimeAgo: false,
          );
        }
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return HorizontalList.buildContainer(
            context,
            title: title,
            subtitle: subtitle,
            more: more,
            builder: (viewFraction) => Center(child: Text('No data available')),
            titleLength: 1,
            itemSubtitle: false,
            itemTimeAgo: false,
          );
        }

        return HorizontalList<EigaExtend>(
          title: title,
          subtitle: subtitle,
          more: more,
          items: snapshot.data!,
          titleLength: snapshot.data!
              .map((item) => item.eiga.name.length)
              .reduce((max, length) => length > max ? length : max),
          itemSubtitle:
              snapshot.data!.firstWhereOrNull(
                (eiga) => VerticalEiga.existsSubtitle(eiga.eiga),
              ) !=
              null,
          itemTimeAgo:
              snapshot.data!.firstWhereOrNull(
                (eiga) => VerticalEiga.existsTimeAgo(eiga.eiga),
              ) !=
              null,
          builder: (context, eiga, index) {
            return VerticalEiga(
              eiga: eiga.eiga,
              sourceId: eiga.sourceId,
              progress: eiga.progress,
            );
          },
        );
      },
    );
  }
}
