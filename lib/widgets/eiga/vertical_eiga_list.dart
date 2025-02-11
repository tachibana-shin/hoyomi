import 'package:flutter/material.dart';
import 'package:hoyomi/core_services/eiga/interfaces/basic_eiga.dart';
import 'package:hoyomi/core_services/utils_service.dart';
import 'package:hoyomi/widgets/eiga/horizontal_eiga_list.dart';
import 'package:hoyomi/widgets/vertical_list.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'vertical_eiga.dart';

class VerticalEigaList extends StatelessWidget {
  final Future<List<BasicEigaExtend>> itemsFuture;
  final String title;
  final String? subtitle;
  final String? more;
  final bool disableScroll;

  const VerticalEigaList(
      {super.key,
      required this.itemsFuture,
      required this.title,
      this.subtitle,
      this.more,
      this.disableScroll = false});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: itemsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Skeletonizer(
                enabled: true,
                enableSwitchAnimation: true,
                child: VerticalList<BasicEigaExtend>(
                  title: title,
                  subtitle: subtitle,
                  more: more,
                  disableScroll: disableScroll,
                  items: List.generate(
                      30,
                      (index) => BasicEigaExtend(
                          eiga: BasicEiga.createFakeData(), sourceId: null)),
                  builder: (context, eiga, index) {
                    return VerticalEiga(
                      eiga: eiga.eiga,
                      sourceId: eiga.sourceId,
                      percentRead: eiga.percentRead,
                    );
                  },
                ));
          }

          if (snapshot.hasError) {
            return Center(
                child: UtilsService.errorWidgetBuilder(context,
                    error: snapshot.error,
                    orElse: (error) => Text('Error: $error')));
          }

          return VerticalList<BasicEigaExtend>(
            title: title,
            subtitle: subtitle,
            more: more,
            disableScroll: disableScroll,
            items: snapshot.data!,
            builder: (context, eiga, index) {
              return VerticalEiga(
                eiga: eiga.eiga,
                sourceId: eiga.sourceId,
                percentRead: eiga.percentRead,
              );
            },
          );
        });
  }
}
