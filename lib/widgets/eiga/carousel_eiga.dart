import 'dart:math';

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hoyomi/core_services/eiga/interfaces/carousel_item.dart';
import 'package:hoyomi/core_services/interfaces/main.dart';
import 'package:hoyomi/widgets/vertical_separator.dart';
import 'package:hoyomi/widgets/iconify.dart';
import 'package:iconify_flutter/icons/eva.dart';

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
          final headers = [
            if (item.rate != null)
              [
                Row(mainAxisSize: MainAxisSize.min, children: [
                  Iconify(
                    Eva.star_fill,
                    color: Colors.blue.shade200,
                    size: 12.0,
                  ),
                  Text(
                    ' ${item.rate}',
                    style: const TextStyle(
                      fontSize: 12.0,
                      color: Colors.white,
                    ),
                  ),
                ])
              ],
            if (item.year != null)
              [
                Text(
                  item.year!,
                  style: const TextStyle(
                    fontSize: 12.0,
                    color: Colors.white,
                  ),
                ),
              ],
            if (item.notice != null)
              [
                Text(
                  item.notice!,
                  style: const TextStyle(
                    fontSize: 12.0,
                    color: Colors.white,
                  ),
                ),
              ],
            if (item.studio != null)
              [
                Text(
                  item.studio!,
                  style: const TextStyle(
                    fontSize: 12.0,
                    color: Colors.white,
                  ),
                ),
              ],
            if (item.duration != null)
              [
                Text(
                  item.duration!,
                  style: const TextStyle(
                    fontSize: 12.0,
                    color: Colors.white,
                  ),
                ),
              ],
            if (item.language != null)
              [
                Text(
                  item.language!,
                  style: const TextStyle(
                    fontSize: 12.0,
                    color: Colors.white,
                  ),
                )
              ]
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
                            Text(
                              item.name,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(
                                context,
                              ).textTheme.headlineSmall?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20.0,
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
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16.0,
                                    ),
                              ),
                            SizedBox(height: 5.0),
                            // rate
                            Wrap(
                              children: headers
                                  .asMap()
                                  .entries
                                  .fold<List<Widget>>([], (arr, entry) {
                                int index = entry.key;
                                final item = entry.value;

                                arr.addAll(item);

                                if (index > 0 && index < headers.length - 1) {
                                  arr.add(const VerticalSeparator());
                                }

                                return arr;
                              }),
                            ),
                            // genres
                            if (item.genres?.isNotEmpty == true)
                              Wrap(
                                spacing: 7.0, // Space between the genre tags
                                children: item.genres!.map((genre) {
                                  return GestureDetector(
                                    onTap: genre.genreId == Genre.noId
                                        ? null
                                        : () {
                                            context.push(
                                              '/category_eiga/${widget.sourceId}/${genre.genreId}',
                                            );
                                          },
                                    child: Text(
                                      '#${genre.name}',
                                      style: genre.genreId == Genre.noId
                                          ? null
                                          : Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.copyWith(
                                                fontSize: 14.0,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .tertiary,
                                              ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            // actors
                            if (item.actors?.isNotEmpty == true)
                              Wrap(
                                spacing: 7.0, // Space between the genre tags
                                children: item.actors!.map((genre) {
                                  return GestureDetector(
                                    onTap: genre.genreId == Genre.noId
                                        ? null
                                        : () {
                                            context.push(
                                              '/category_eiga/${widget.sourceId}/${genre.genreId}',
                                            );
                                          },
                                    child: Text(
                                      '#${genre.name}',
                                      style: genre.genreId == Genre.noId
                                          ? null
                                          : Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.copyWith(
                                                fontSize: 14.0,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .tertiary,
                                              ),
                                    ),
                                  );
                                }).toList(),
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
