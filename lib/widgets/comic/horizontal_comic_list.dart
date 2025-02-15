import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoyomi/core_services/comic/interfaces/comic.dart';
import 'package:hoyomi/core_services/utils_service.dart';
import 'package:hoyomi/widgets/horizontal_list.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'vertical_comic.dart';

class ComicExtend {
  final Comic comic;
  final String? sourceId;
  final double? percentRead;

  ComicExtend(
      {required this.comic, required this.sourceId, this.percentRead});
}

class HorizontalComicList extends StatelessWidget {
  final Future<List<ComicExtend>> itemsFuture;
  final String title;
  final String? subtitle;
  final String? more;

  const HorizontalComicList({
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
                child: HorizontalList<ComicExtend>(
                  title: title,
                  subtitle: subtitle,
                  more: more,
                  items: List.generate(
                      30,
                      (index) => ComicExtend(
                          comic: Comic.createFakeData(), sourceId: null)),
                  needSubtitle: false,
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

          return HorizontalList<ComicExtend>(
            title: title,
            subtitle: subtitle,
            more: more,
            items: snapshot.data!,
            needSubtitle: snapshot.data!.firstWhereOrNull(
                    (comic) => VerticalComic.checkNeedSubtitle(comic.comic)) !=
                null,
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
