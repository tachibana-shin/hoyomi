import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:hoyomi/core_services/eiga/interfaces/eiga.dart';
import 'package:hoyomi/core_services/interfaces/o_image.dart';
import 'package:hoyomi/utils/format_time_ago.dart';
import 'package:hoyomi/widgets/circular_progress.dart';

class VerticalEiga extends StatelessWidget {
  static bool checkNeedSubtitle(Eiga comic) {
    return comic.lastEpisode != null;
  }

  final Eiga eiga;
  final String? sourceId;
  final double? percentRead;

  const VerticalEiga({
    super.key,
    required this.eiga,
    required this.sourceId,
    this.percentRead,
  });

  @override
  Widget build(BuildContext context) {
    final widgetStar =
        eiga.rate != null
            ? Text.rich(
              TextSpan(
                children: [
                  WidgetSpan(
                    alignment: PlaceholderAlignment.middle,
                    child: Icon(
                      MaterialCommunityIcons.star,
                      color: Colors.blue.shade200,
                      size: 12.0,
                    ),
                  ),
                  TextSpan(
                    text: ' ${eiga.rate}',
                    style: TextStyle(
                      fontSize: 10.0,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                ],
              ),
            )
            : null;

    return InkWell(
      onTap: () {
        context.push("/details_eiga/$sourceId/${eiga.eigaId}");
      },
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
                    child: OImage.network(
                      eiga.image.src,
                      sourceId: sourceId ?? '',
                      headers: eiga.image.headers,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                // top
                if (eiga.notice != null)
                  Positioned(
                    top: 4,
                    left: 0,
                    right: 4,
                    child: Wrap(
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
                            color:
                                Theme.of(context).colorScheme.surfaceContainer,
                            borderRadius: BorderRadius.circular(14.0),
                          ),
                          child: Text(
                            eiga.notice!,
                            style: Theme.of(
                              context,
                            ).textTheme.bodySmall?.copyWith(fontSize: 10.0),
                          ),
                        ),
                      ],
                    ),
                  ),

                // bottom
                if (eiga.timeAgo != null)
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.only(
                        top: 16.0,
                        left: 8.0,
                        right: 8.0,
                        bottom: 4.0,
                      ),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.black.withValues(alpha: 0.8),
                            Colors.transparent,
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: Text(
                        formatTimeAgo(eiga.timeAgo!),
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.blueGrey.shade50,
                        ),
                      ),
                    ),
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
                  ),

                if (eiga.rate != null)
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
                            color:
                                Theme.of(context).colorScheme.surfaceContainer,
                            borderRadius: BorderRadius.circular(14.0),
                          ),
                          child: widgetStar,
                        ),
                      ],
                    ),
                  ),

                // progress read
                if (percentRead != null)
                  Positioned(
                    bottom: 4,
                    right: 4,
                    child: CircularProgress(
                      value: percentRead!,
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
                      backgroundColor:
                          Theme.of(context).colorScheme.tertiaryFixedDim,
                      size: 25,
                    ),
                  ),

                if (eiga.pending)
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
                          eiga.preRelease != null
                              ? formatTimeAgo(eiga.preRelease!)
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
              child: Container(
                constraints: BoxConstraints(minHeight: 40.0),
                child: Text(
                  eiga.name,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Theme.of(context).colorScheme.onSurface,
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            if (eiga.lastEpisode != null)
              Text(
                eiga.lastEpisode?.name ?? 'N/A',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 12.0,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
