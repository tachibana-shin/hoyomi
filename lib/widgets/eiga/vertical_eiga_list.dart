import 'package:flutter/material.dart';
import 'package:hoyomi/core_services/eiga/interfaces/eiga.dart';
import 'package:hoyomi/core_services/service.dart';
import 'package:hoyomi/widgets/eiga/horizontal_eiga_list.dart';
import 'package:hoyomi/widgets/vertical_list.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'vertical_eiga.dart';

class VerticalEigaList extends StatelessWidget {
  final Future<List<EigaExtend>> itemsFuture;
  final String title;
  final String? subtitle;
  final String? more;
  final ScrollController? controller;
  final bool disableScroll;
  final bool goMode;

  final bool skeleton;

  const VerticalEigaList({
    super.key,
    required this.itemsFuture,
    required this.title,
    this.subtitle,
    this.more,
    this.controller,
    this.disableScroll = false,
    this.skeleton = true,
    this.goMode = false,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: itemsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Skeletonizer(
            enabled: skeleton,
            enableSwitchAnimation: true,
            child: VerticalList<EigaExtend>(
              title: title,
              subtitle: subtitle,
              more: more,
              disableScroll: disableScroll,
              items: List.generate(
                30,
                (index) =>
                    EigaExtend(eiga: Eiga.createFakeData(), sourceId: null),
              ),
              builder: (context, eiga, index) {
                return VerticalEiga(
                  eiga: eiga.eiga,
                  sourceId: eiga.sourceId,
                  percentRead: eiga.percentRead,
                  goMode: goMode,
                );
              },
            ),
          );
        }

        if (snapshot.hasError) {
          return Center(
            child: Service.errorWidgetBuilder(
              context,
              error: snapshot.error,
              service: null,
              orElse: (error) => Text('Error: $error'),
            ),
          );
        }

        return VerticalList<EigaExtend>(
          title: title,
          subtitle: subtitle,
          more: more,
          controller: controller,
          disableScroll: disableScroll,
          items: snapshot.data!,
          builder: (context, eiga, index) {
            return VerticalEiga(
              eiga: eiga.eiga,
              sourceId: eiga.sourceId,
              percentRead: eiga.percentRead,
              goMode: goMode,
            );
          },
        );
      },
    );
  }
}
