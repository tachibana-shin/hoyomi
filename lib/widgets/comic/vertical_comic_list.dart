import 'package:flutter/material.dart';
import 'package:hoyomi/core_services/comic/interfaces/comic.dart';
import 'package:hoyomi/core_services/utils_service.dart';
import 'package:hoyomi/widgets/comic/horizontal_comic_list.dart';
import 'package:hoyomi/widgets/vertical_list.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'vertical_comic.dart';

class VerticalComicList extends StatelessWidget {
  final Future<List<ComicExtend>> itemsFuture;
  final String title;
  final String? subtitle;
  final String? more;
  final ScrollController? controller;
  final bool skeleton;

  const VerticalComicList(
      {super.key,
      required this.itemsFuture,
      required this.title,
      this.subtitle,
      this.more,
      this.controller,
      this.skeleton = true});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: itemsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Skeletonizer(
                enabled: skeleton,
                enableSwitchAnimation: true,
                child: VerticalList<ComicExtend>(
                  title: title,
                  subtitle: subtitle,
                  more: more,
                  items: List.generate(
                      30,
                      (index) => ComicExtend(
                          comic: Comic.createFakeData(), sourceId: null)),
                  builder: (context, comic, index) {
                    return VerticalComic(
                      comic: comic.comic,
                      sourceId: comic.sourceId,
                      percentRead: comic.percentRead,
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

          return VerticalList<ComicExtend>(
            title: title,
            subtitle: subtitle,
            more: more,
            controller: controller,
            items: snapshot.data!,
            builder: (context, comic, index) {
              return VerticalComic(
                comic: comic.comic,
                sourceId: comic.sourceId,
                percentRead: comic.percentRead,
              );
            },
          );
        });
  }
}
