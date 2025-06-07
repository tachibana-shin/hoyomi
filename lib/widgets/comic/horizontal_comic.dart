import 'package:flutter/material.dart';
import 'package:hoyomi/core_services/comic/interfaces/comic.dart';
import 'package:hoyomi/router/extensions/to_router.dart';

import '../card_horz_item.dart';

class HorizontalComic extends StatelessWidget {
  final Comic comic;
  final String sourceId;
  final bool replace;

  const HorizontalComic({
    super.key,
    required this.comic,
    required this.sourceId,
    this.replace = false,
  });

  @override
  Widget build(BuildContext context) {
    return CardHorzItem(
      to: ToRoute(
        name: 'details_comic',
        pathParameters: {'sourceId': sourceId, 'comicId': comic.comicId},
      ),
      replace: replace,
      sourceId: sourceId,
      rate: comic.rate,
      image: comic.image,
      notice: comic.notice,
      progress: null,
      pending: false,
      preRelease: null,
      title: comic.name,
      subtitle2: comic.originalName,
      subtitle: comic.lastChap?.name,
      lastUpdate: comic.lastUpdate,
      extend: const [],
    );
  }
}
