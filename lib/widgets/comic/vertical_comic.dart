import 'package:flutter/material.dart';
import 'package:hoyomi/core_services/comic/interfaces/comic.dart';
import 'package:hoyomi/widgets/card_item.dart';

class VerticalComic extends StatelessWidget {
  static bool existsSubtitle(Comic comic) {
    return comic.lastChap != null;
  }

  static bool existsTimeAgo(Comic comic) {
    return comic.timeAgo != null;
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
      timeAgo: comic.timeAgo,
    );
  }
}
