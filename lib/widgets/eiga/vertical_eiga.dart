import 'package:flutter/material.dart';
import 'package:hoyomi/core_services/eiga/interfaces/eiga.dart';
import 'package:hoyomi/widgets/card_item.dart';

class VerticalEiga extends StatelessWidget {
  static bool existsSubtitle(Eiga comic) {
    return comic.lastEpisode != null;
  }

  static bool existsTimeAgo(Eiga comic) {
    return comic.timeAgo != null;
  }

  final Eiga eiga;
  final String? sourceId;
  final double? progress;
  final bool replace;

  const VerticalEiga({
    super.key,
    required this.eiga,
    required this.sourceId,
    this.progress,
    this.replace = false,
  });

  @override
  Widget build(BuildContext context) {
    return CardItem(
      to: '/details_eiga/$sourceId/${eiga.eigaId}',
      replace: replace,
      sourceId: sourceId ?? '',
      rate: eiga.rate,
      image: eiga.image,
      notice: eiga.notice,
      progress: progress,
      pending: eiga.pending,
      preRelease: eiga.preRelease,
      title: eiga.name,
      subtitle: eiga.lastEpisode?.name,
      timeAgo: eiga.timeAgo,
    );
  }
}
