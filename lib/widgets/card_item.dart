import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hoyomi/core_services/interfaces/o_image.dart';
import 'package:hoyomi/router/extensions/to_router.dart';
import 'package:hoyomi/utils/format_time_ago.dart';
import 'package:hoyomi/widgets/iconify.dart';
import 'package:iconify_flutter/icons/eva.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'circular_progress.dart';

class CardItem extends StatelessWidget {
  final String to;
  final ToRoute? toDouble;
  final bool replace;

  final String sourceId;

  final double? rate;
  final OImage image;
  final String? notice;
  final double? progress;
  final bool pending;
  final DateTime? preRelease;
  final String title;
  final String? subtitle;
  final DateTime? lastUpdate;
  final List<Widget> extend;

  const CardItem({
    super.key,
    required this.to,
    this.toDouble,
    required this.replace,
    required this.sourceId,
    required this.rate,
    required this.image,
    required this.notice,
    required this.progress,
    required this.pending,
    required this.preRelease,
    required this.title,
    required this.subtitle,
    required this.lastUpdate,
    required this.extend,
  });

  @override
  Widget build(BuildContext context) {
    final widgetStar = switch (rate) {
      (!= null && != 0) => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Iconify(Eva.star_fill, color: Colors.blue.shade200, size: 12.0),
          Text(
            ' $rate',
            style: TextStyle(
              fontSize: 10.0,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ],
      ),
      _ => null,
    };

    return InkWell(
      onTap: () {
        if (replace) {
          context.replace(to);
        } else {
          context.push(to);
        }
      },
      onDoubleTap: toDouble != null
          ? () {
              if (replace) {
                context.replaceRoute(toDouble!);
              } else {
                context.pushRoute(toDouble!);
              }
            }
          : null,
      splashColor: Colors.white70.withValues(alpha: 0.3),
      highlightColor: Colors.white70.withValues(alpha: 0.1),
      borderRadius: BorderRadius.circular(8.0),
      child: Card(
        // margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),/
        color: Colors.transparent,
        elevation: 0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                AspectRatio(
                  aspectRatio: 2 / 3,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Skeleton.replace(
                      replacement: Image.asset(
                        'assets/images/blank.png',
                        fit: BoxFit.cover,
                      ),
                      child: OImage.oNetwork(
                        image,
                        sourceId: sourceId,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),

                // top
                if (notice != null && notice!.isNotEmpty)
                  Positioned(
                    top: 4,
                    left: 0,
                    right: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Wrap(
                          alignment: WrapAlignment.end,
                          children: [
                            Container(
                              padding: const EdgeInsets.only(
                                left: 8.0,
                                right: 8.0,
                                top: 4.0,
                                bottom: 4.0,
                              ),
                              decoration: BoxDecoration(
                                color: Theme.of(
                                  context,
                                ).colorScheme.surfaceContainer,
                                borderRadius: BorderRadius.circular(14.0),
                              ),
                              child: Text(
                                notice!,
                                style: Theme.of(
                                  context,
                                ).textTheme.bodySmall?.copyWith(fontSize: 10.0),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        if (extend.isNotEmpty)
                          Wrap(
                            alignment: WrapAlignment.end,
                            spacing: 2,
                            children: extend,
                          ),
                      ],
                    ),
                  ),

                // bottom
                // if (timeAgo != null)
                //   Positioned(
                //     bottom: 0,
                //     left: 0,
                //     right: 0,
                //     child: Container(
                //       padding: const EdgeInsets.only(
                //         top: 16.0,
                //         left: 8.0,
                //         right: 8.0,
                //         bottom: 4.0,
                //       ),
                //       decoration: BoxDecoration(
                //         gradient: LinearGradient(
                //           colors: [
                //             Colors.black.withValues(alpha: 0.8),
                //             Colors.transparent,
                //           ],
                //           begin: Alignment.bottomCenter,
                //           end: Alignment.topCenter,
                //         ),
                //         borderRadius: BorderRadius.circular(4.0),
                //       ),
                //       child: Text(
                //         formatTimeAgo(timeAgo!),
                //         style: TextStyle(
                //           fontSize: 12.0,
                //           color: Colors.blueGrey.shade50,
                //         ),
                //       ),
                //     ),
                //  Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       if (comic.rate != null)
                //         Row(
                //           children: [
                //             Icon(
                //               Icons.star,
                //               color: Colors.yellow[700],
                //               size: 16.0,
                //             ),
                //             const SizedBox(width: 4.0),
                //             Text(
                //               comic.rate!.toString(),
                //               style: const TextStyle(
                //                   fontSize: 14.0, color: Colors.white),
                //             ),
                //           ],
                //         ),
                //       if (comic.notice != null)
                //         Text(
                //           comic.notice!,
                //           style: const TextStyle(
                //               fontSize: 12.0, color: Colors.orange),
                //         ),
                //     ])),
                // ),
                if (widgetStar != null)
                  Positioned(
                    bottom: 4,
                    left: 4,
                    right: 0,
                    child: Wrap(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(
                            left: 8.0,
                            right: 8.0,
                            top: 4.0,
                            bottom: 4.0,
                          ),
                          decoration: BoxDecoration(
                            color: Theme.of(
                              context,
                            ).colorScheme.surfaceContainer,
                            borderRadius: BorderRadius.circular(14.0),
                          ),
                          child: widgetStar,
                        ),
                      ],
                    ),
                  ),

                // progress read
                if (progress != null)
                  Positioned(
                    bottom: 4,
                    right: 4,
                    child: CircularProgress(
                      value: progress!,
                      strokeWidth: 7.0,
                      textStyle: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.surface,
                      ),
                      borderColor: AlwaysStoppedAnimation<Color>(
                        Theme.of(context).colorScheme.onTertiaryFixed,
                      ),
                      backgroundBorder: Colors.transparent,
                      backgroundColor: Theme.of(
                        context,
                      ).colorScheme.tertiaryFixedDim,
                      size: 25,
                    ),
                  ),

                if (pending)
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      color: Theme.of(
                        context,
                      ).colorScheme.surfaceContainer.withValues(alpha: 0.5),
                      child: Center(
                        child: Text(
                          preRelease != null
                              ? formatTimeAgo(preRelease!)
                              : 'Pre-release',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 2.0),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 14.0,
                  color: Theme.of(context).colorScheme.onSurface,
                  fontWeight: FontWeight.w500,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            if (subtitle != null)
              Text(
                subtitle!,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 12.0,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            if (lastUpdate != null)
              Text(
                formatTimeAgo(lastUpdate!),
                style: TextStyle(
                  fontSize: 12.0,
                  color: Theme.of(
                    context,
                  ).colorScheme.secondary.withValues(alpha: 0.8),
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
          ],
        ),
      ),
    );
  }
}
