import 'package:flutter/material.dart';
import 'package:hoyomi/core_services/eiga/interfaces/eiga.dart';
import 'package:hoyomi/router/extensions/to_router.dart';
import 'package:hoyomi/widgets/card_item.dart';
import 'package:hoyomi/widgets/iconify.dart';
import 'package:iconify_flutter/icons/bi.dart';
import 'package:iconify_flutter/icons/eva.dart';

class VerticalEiga extends StatelessWidget {
  static bool existsSubtitle(Eiga comic) {
    return comic.lastEpisode != null;
  }

  static bool existsTimeAgo(Eiga comic) {
    return comic.lastUpdate != null;
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
      lastUpdate: eiga.lastUpdate,
      toDouble: eiga.lastEpisode != null
          ? ToRoute(
              name: 'details_eiga',
              pathParameters: {
                'sourceId': sourceId ?? '',
                'eigaId': eiga.eigaId,
              },
              queryParameters: {'episodeId': eiga.lastEpisode!.episodeId},
            )
          : null,
      extend: [
        if (eiga.countSub != null)
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 4.0),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(176, 227, 175, 1.0),
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Iconify(
                        Bi.badge_cc_fill,
                        color: Colors.black,
                        size: 12.0,
                      ),
                      Text(
                        ' ${eiga.countSub}',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: 12.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        if (eiga.countDub != null)
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 4.0),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(185, 231, 255, 1.0),
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Iconify(Eva.mic_fill, color: Colors.black, size: 12.0),
                      Text(
                        ' ${eiga.countDub}',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: 12.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
      ],
    );
  }
}
