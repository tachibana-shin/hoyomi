import 'package:flutter/material.dart';
import 'package:hoyomi/core_services/comic/interfaces/comic.dart';
import 'package:hoyomi/router/extensions/to_router.dart';
import 'package:hoyomi/widgets/card_item.dart';

class VerticalComic extends StatelessWidget {
  static bool existsSubtitle(Comic comic) {
    return comic.lastChap != null;
  }

  static bool existsTimeAgo(Comic comic) {
    return comic.lastUpdate != null;
  }

  final Comic comic;
  final String? sourceId;
  final double? progress;
  final bool replace;

  const VerticalComic({
    super.key,
    required this.comic,
    required this.sourceId,
    this.progress,
    this.replace = false,
  });

  @override
  Widget build(BuildContext context) {
    return CardItem(
      to: '/details_comic/$sourceId/${comic.comicId}',
      replace: replace,
      sourceId: sourceId ?? '',
      rate: comic.rate,
      image: comic.image,
      notice: comic.notice,
      progress: progress,
      pending: comic.pending,
      preRelease: comic.preRelease,
      title: comic.name,
      subtitle: comic.lastChap?.name,
      toDouble:
          comic.lastChap != null
              ? ToRoute(
                name: 'details_comic_reader',
                pathParameters: {
                  'sourceId': sourceId ?? '',
                  'comicId': comic.comicId,
                },
                queryParameters: {'chap': comic.lastChap!.chapterId},
              )
              : null,
      lastUpdate: comic.lastUpdate,
      extend: const <Widget>[],
    );
  }
}
