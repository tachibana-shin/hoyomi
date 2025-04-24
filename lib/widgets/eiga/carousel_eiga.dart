import 'dart:math';

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hoyomi/core_services/eiga/interfaces/carousel_item.dart';
import 'package:hoyomi/core_services/interfaces/main.dart';
import 'package:hoyomi/extensions/iterable_extension.dart';
import 'package:hoyomi/extensions/list_extension.dart';
import 'package:hoyomi/widgets/vertical_separator.dart';
import 'package:hoyomi/widgets/iconify.dart';
import 'package:iconify_flutter/icons/bi.dart';
import 'package:iconify_flutter/icons/eva.dart';
import 'package:intl/intl.dart';

class CarouselEiga extends StatefulWidget {
  final double aspectRatio;
  final double maxHeight;
  final String sourceId;
  final List<CarouselItem> items;

  const CarouselEiga({
    super.key,
    required this.aspectRatio,
    required this.maxHeight,
    required this.items,
    required this.sourceId,
  });

  @override
  State<CarouselEiga> createState() => _CarouselEigaState();
}

class _CarouselEigaState extends State<CarouselEiga> {
  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    final height = min(screen.width / widget.aspectRatio, widget.maxHeight);

    return SizedBox(
      width: screen.width,
      height: height,
      child: Swiper(
        itemCount: widget.items.length,
        // viewportFraction: 0.8,
        // scale: 0.9,
        itemBuilder: (BuildContext context, int index) {
          final item = widget.items.elementAt(index);
          final List<List<Widget>> headers = [
            if (item.rate != null)
              [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Iconify(Eva.star_fill, size: 14.0),
                    Text(
                      ' ${item.rate}',
                      style: const TextStyle(
                        fontSize: 12.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            if (item.type != null)
              [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Iconify(Eva.play_circle_fill, size: 14.0),
                    Text(
                      ' ${item.type}',
                      style: const TextStyle(
                        fontSize: 12.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            if (item.episodeDuration != null)
              [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Iconify(Eva.clock_fill, size: 14.0),
                    Text(
                      ' ${item.episodeDuration}',
                      style: const TextStyle(
                        fontSize: 12.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            if ((item.updatedAt ?? item.year) != null)
              [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Iconify(Eva.calendar_fill, size: 14.0),
                    Text(
                      ' ${item.updatedAt != null ? DateFormat('MMM d, y').format(item.updatedAt!) : item.year!}',
                      style: const TextStyle(
                        fontSize: 12.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            if (item.quality != null)
              [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 4.0),
                      decoration: BoxDecoration(
                        color: Colors.greenAccent.shade400,
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: Center(
                        child: Text(
                          item.quality!,
                          style: Theme.of(
                            context,
                          ).textTheme.bodyMedium?.copyWith(
                            fontSize: 12.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            if (item.countSub != null)
              [
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
                              ' ${item.countSub}',
                              style: Theme.of(
                                context,
                              ).textTheme.bodyMedium?.copyWith(
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
            if (item.countDub != null)
              [
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
                            Iconify(
                              Eva.mic_fill,
                              color: Colors.black,
                              size: 12.0,
                            ),
                            Text(
                              ' ${item.countDub}',
                              style: Theme.of(
                                context,
                              ).textTheme.bodyMedium?.copyWith(
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
            if (item.notice != null)
              [
                Text(
                  item.notice!,
                  style: const TextStyle(fontSize: 12.0, color: Colors.white),
                ),
              ],
            if (item.studio != null)
              [
                Text(
                  item.studio!,
                  style: const TextStyle(fontSize: 12.0, color: Colors.white),
                ),
              ],
            if (item.duration != null)
              [
                Text(
                  item.duration!,
                  style: const TextStyle(fontSize: 12.0, color: Colors.white),
                ),
              ],
            if (item.language != null)
              [
                Text(
                  item.language!,
                  style: const TextStyle(fontSize: 12.0, color: Colors.white),
                ),
              ],
          ];

          return GestureDetector(
            onTap: () {
              context.push("/details_eiga/${widget.sourceId}/${item.eigaId}");
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Stack(
                children: [
                  OImage.network(
                    item.image.src,
                    sourceId: widget.sourceId,
                    headers: item.image.headers,
                    fit: BoxFit.cover,
                    width: screen.width,
                    height: height,
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    bottom: 0,
                    width: screen.width * 0.2,
                    child: Container(
                      width: screen.width * 0.2,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.black.withValues(alpha: 0.7),
                            Colors.transparent,
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    bottom: 0,
                    width: screen.width * 0.2,
                    child: Container(
                      width: screen.width * 0.2,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.black.withValues(alpha: 0.7),
                            Colors.transparent,
                          ],
                          begin: Alignment.centerRight,
                          end: Alignment.centerLeft,
                        ),
                      ),
                    ),
                  ),

                  ///////////
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    height: screen.height * 0.3,
                    child: Container(
                      height: screen.height * 0.3,
                      width: screen.width,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.black.withValues(alpha: 0.7),
                            Colors.transparent,
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    bottom: 0,
                    right: 0,
                    height: height * 0.8,
                    child: Container(
                      margin: EdgeInsets.only(
                        left: 24.0,
                        right: 12.0,
                        top: 18.0,
                        bottom: 50.0,
                      ),
                      child: OverflowBox(
                        maxHeight: height * 0.8,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            if (item.subText != null)
                              Padding(
                                padding: EdgeInsets.only(bottom: 3.0),
                                child: Text(
                                  item.subText!,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(
                                    context,
                                  ).textTheme.headlineSmall?.copyWith(
                                    color: const Color(0xFFFFBADE),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.0,
                                  ),
                                ),
                              ),
                            FractionallySizedBox(
                              widthFactor: 0.8,
                              child: Text(
                                item.name,
                                maxLines: height < 300 ? 1 : 2,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(
                                  context,
                                ).textTheme.headlineSmall?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20.0,
                                ),
                              ),
                            ),
                            if (item.originalName?.isNotEmpty == true)
                              Text(
                                item.originalName!,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(
                                  context,
                                ).textTheme.headlineSmall?.copyWith(
                                  color: Colors.white.withValues(
                                    alpha: height < 300 ? 0.8 : 1.0,
                                  ),
                                  fontWeight:
                                      height < 300 ? null : FontWeight.w600,
                                  fontSize: 16.0,
                                ),
                              ),
                            SizedBox(height: 5.0),
                            // rate
                            Wrap(
                              children: headers.joinWith(
                                const VerticalSeparator(),
                              ),
                            ),
                            // genres
                            if (item.genres?.isNotEmpty == true)
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Wrap(
                                  spacing: 7.0,
                                  children:
                                      item.genres!.map((genre) {
                                        return GestureDetector(
                                          onTap:
                                              genre.genreId == Genre.noId
                                                  ? null
                                                  : () => context.push(
                                                    '/category_eiga/${widget.sourceId}/${genre.genreId}',
                                                  ),
                                          child: Text(
                                            '#${genre.name}',
                                            style:
                                                genre.genreId == Genre.noId
                                                    ? null
                                                    : TextStyle(
                                                      color: Colors.white
                                                          .withValues(
                                                            alpha: 0.8,
                                                          ),
                                                    ),
                                          ),
                                        );
                                      }).toList(),
                                ),
                              ),
                            // actors
                            if (item.actors?.isNotEmpty == true)
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Wrap(
                                  children:
                                      item.actors!.indexed.mapWithIterable((
                                        entry,
                                        list,
                                      ) {
                                        final (index, actor) = entry;
                                        return GestureDetector(
                                          onTap:
                                              actor.genreId == Genre.noId
                                                  ? null
                                                  : () => context.push(
                                                    '/category_eiga/${widget.sourceId}/${actor.genreId}',
                                                  ),
                                          child: Text(
                                            '${actor.name}${index < list.length - 1 ? ', ' : ''}',
                                            style:
                                                actor.genreId == Genre.noId
                                                    ? null
                                                    : TextStyle(
                                                      color: Colors.white
                                                          .withValues(
                                                            alpha: 0.8,
                                                          ),
                                                    ),
                                          ),
                                        );
                                      }).toList(),
                                ),
                              ),
                            SizedBox(height: 5.0),
                            // description
                            Text(
                              item.description ?? '',
                              style: const TextStyle(
                                fontSize: 13.0,
                                color: Colors.white,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
