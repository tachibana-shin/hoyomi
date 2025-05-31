import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoyomi/core_services/comic/interfaces/comic.dart';
import 'package:hoyomi/core_services/service.dart';
import 'package:hoyomi/widgets/horizontal_list.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'vertical_comic.dart';

class ComicExtend {
  final Comic comic;
  final String? sourceId;
  final double? progress;

  ComicExtend({required this.comic, required this.sourceId, this.progress});
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
          final items = List.generate(
            30,
            (index) =>
                ComicExtend(comic: Comic.createFakeData(), sourceId: null),
          );
          return Skeletonizer(
            enabled: true,
            enableSwitchAnimation: true,
            child: HorizontalList<ComicExtend>(
              title: title,
              subtitle: subtitle,
              more: more,
              items: items,
              titleLength: items
                  .map((item) => item.comic.name.length)
                  .reduce((max, length) => length > max ? length : max),
              itemSubtitle: false,
              itemTimeAgo: false,
              builder: (context, comic, index) {
                return VerticalComic(
                  comic: comic.comic,
                  sourceId: comic.sourceId,
                  progress: comic.progress,
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
            builder: (viewFraction) => Center(
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
            title: title,
            subtitle: subtitle,
            more: more,
            context,
            builder: (viewFraction) => Center(child: Text('No data available')),
            titleLength: 1,
            itemSubtitle: false,
            itemTimeAgo: false,
          );
        }

        return HorizontalList<ComicExtend>(
          title: title,
          subtitle: subtitle,
          more: more,
          items: snapshot.data!,
          titleLength: snapshot.data!
              .map((item) => item.comic.name.length)
              .reduce((max, length) => length > max ? length : max),
          itemSubtitle:
              snapshot.data!.firstWhereOrNull(
                (comic) => VerticalComic.existsSubtitle(comic.comic),
              ) !=
              null,
          itemTimeAgo:
              snapshot.data!.firstWhereOrNull(
                (comic) => VerticalComic.existsTimeAgo(comic.comic),
              ) !=
              null,
          builder: (context, comic, index) {
            return VerticalComic(
              comic: comic.comic,
              sourceId: comic.sourceId,
              progress: comic.progress,
            );
          },
        );
      },
    );
  }
}
