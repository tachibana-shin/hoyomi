import 'package:flutter/material.dart';
import 'package:hoyomi/core_services/eiga/interfaces/eiga.dart';
import 'package:hoyomi/widgets/card_item.dart';
import 'package:hoyomi/widgets/iconify.dart';
import 'package:iconify_flutter/icons/bi.dart';
import 'package:iconify_flutter/icons/eva.dart';

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
        extend: [
          if (eiga.countDub != null)
            Row(mainAxisSize: MainAxisSize.min, children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 4.0),
                decoration: BoxDecoration(
                  color: const Color(0xFFB0E3AF),
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: Center(
                    child: Row(mainAxisSize: MainAxisSize.min, children: [
                  const Iconify(Bi.badge_cc_fill, size: 12.0),
                  Text(
                    eiga.countSub.toString(),
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(fontSize: 14.0),
                  ),
                ])),
              )
            ]),
          if (eiga.countDub != null)
            Row(mainAxisSize: MainAxisSize.min, children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 4.0),
                decoration: BoxDecoration(
                  color: const Color(0xFFB0E3AF),
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: Center(
                    child: Row(mainAxisSize: MainAxisSize.min, children: [
                  const Iconify(Eva.mic_fill, size: 12.0),
                  Text(
                    eiga.countDub.toString(),
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(fontSize: 14.0),
                  ),
                ])),
              )
            ])
        ]);
  }
}
