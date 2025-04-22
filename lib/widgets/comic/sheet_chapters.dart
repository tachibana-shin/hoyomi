import 'dart:async';

import 'package:awesome_extensions/awesome_extensions.dart' hide NavigatorExt;
import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hoyomi/core_services/comic/interfaces/main.dart';
import 'package:hoyomi/utils/format_time_ago.dart';
import 'package:hoyomi/widgets/iconify.dart';
import 'package:iconify_flutter/icons/ion.dart';

class SheetChapters extends StatefulWidget {
  final MetaComic comic;
  final String sourceId;
  final String comicId;
  final Map<String, WatchPageUpdated> watchPageChapters;
  final String? currentChapterId;
  final bool replace;
  final bool reverse;

  final double initialChildSize;

  const SheetChapters({
    super.key,
    required this.comic,
    required this.sourceId,
    required this.comicId,
    required this.watchPageChapters,
    this.currentChapterId,
    this.replace = false,
    this.reverse = false,
    required this.initialChildSize,
  });

  @override
  // ignore: library_private_types_in_public_api
  _SheetChaptersState createState() => _SheetChaptersState();
}

class _SheetChaptersState extends State<SheetChapters> {
  @override
  Widget build(BuildContext context) {
    final currentChapterId =
        widget.currentChapterId ?? widget.comic.chapters.first.chapterId;

    return DraggableScrollableSheet(
      expand: false,
      snap: true,
      snapSizes: [0.15, 0.5, 0.9],
      initialChildSize: widget.initialChildSize,
      minChildSize: .15,
      maxChildSize: 0.9,
      builder: (context2, scrollController) {
        final activeKey = GlobalKey();
        bool notSelected = true;

        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          Timer(Duration(milliseconds: 70), () {
            if (activeKey.currentContext != null) {
              Scrollable.ensureVisible(
                activeKey.currentContext!,
                duration: Duration(milliseconds: 200),
              );
            }
          });
        });

        return Column(
          children: [
            // Header
            // Padding(
            //   padding: const EdgeInsets.only(bottom: 8.0),
            //   child: Text(
            //     "List chapters",
            //     style: TextStyle(
            //       color: Colors.white,
            //       fontSize: 160,
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            // ),
            // Divider(height: 1.0),
            // Chapters List
            Expanded(
              child: ListView.builder(
                controller: scrollController,
                // reverse
                itemCount: widget.comic.chapters.length,
                itemBuilder: (context2, index) {
                  final chapter = widget.comic.chapters.elementAt(
                    widget.reverse
                        ? index
                        : (widget.comic.chapters.length - 1 - index),
                  ); //[index];
                  final bool selected = chapter.chapterId == currentChapterId;
                  if (selected && notSelected) {
                    notSelected = false;
                  }

                  final watchPage = widget.watchPageChapters[chapter.chapterId];

                  return ListTile(
                    key: selected && notSelected ? activeKey : null,
                    enableFeedback: true,
                    selected: selected,
                    autofocus: selected,
                    focusColor: Colors.transparent,
                    title: Row(
                      children: [
                        if (selected)
                          Iconify(
                            Ion.play,
                            size: 20,
                            color: Colors.green.shade500,
                          ),
                        if (selected) SizedBox(width: 4.0),
                        Text(
                          chapter.name,
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: selected ? FontWeight.w500 : null,
                            color: selected
                                ? Theme.of(context).colorScheme.onSurface
                                : Theme.of(context)
                                    .colorScheme
                                    .onSurface
                                    .withValues(alpha: 0.85),
                          ),
                        ),
                      ],
                    ),
                    subtitle: Text(
                      chapter.time != null ? formatTimeAgo(chapter.time!) : "",
                      style: TextStyle(
                        color: selected
                            ? Theme.of(context).colorScheme.secondary
                            : Theme.of(
                                context,
                              ).colorScheme.secondary.withValues(alpha: 0.85),
                        fontSize: 12.0,
                      ),
                    ),
                    trailing: switch (watchPage) {
                      null => null,
                      final watchPage => SizedBox(
                          width: 30,
                          height: 30,
                          child: DashedCircularProgressBar.aspectRatio(
                            aspectRatio: 1,
                            progress: (watchPage.currentPage + 1) /
                                watchPage.totalPage *
                                100,
                            startAngle: 225,
                            sweepAngle: 270,
                            foregroundColor: Colors.green,
                            backgroundColor: const Color(0xffeeeeee),
                            foregroundStrokeWidth: 3,
                            backgroundStrokeWidth: 3,
                            animation: true,
                            seekSize: 3,
                            seekColor: const Color(0xffeeeeee),
                            child: Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    '${((watchPage.currentPage + 1) / watchPage.totalPage * 100).toInt()}',
                                  ).fontSize(12.0),
                                ],
                              ),
                            ),
                          ),
                        ),
                    },
                    onTap: () {
                      final url =
                          "/details_comic/${widget.sourceId}/${widget.comicId}/view?chap=${chapter.chapterId}";
                      final extra = {'comic': widget.comic};

                      if (widget.replace) {
                        context.replace(url, extra: extra);
                      } else {
                        context.push(url, extra: extra);
                      }
                    },
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
