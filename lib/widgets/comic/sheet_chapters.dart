import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:hoyomi/core_services/comic/interfaces/meta_comic.dart';
import 'package:hoyomi/database/scheme/history_chap.dart';
import 'package:hoyomi/utils/format_time_ago.dart';
import 'package:hoyomi/widgets/circular_progress.dart';

class SheetChapters extends StatefulWidget {
  final MetaComic comic;
  final String sourceId;
  final String comicId;
  final String? currentChapterId;
  final Map<String, HistoryChap>? histories;
  final bool replace;

  final double initialChildSize;

  const SheetChapters({
    super.key,
    required this.comic,
    required this.sourceId,
    required this.comicId,
    this.currentChapterId,
    required this.histories,
    this.replace = false,
    required this.initialChildSize,
  });

  @override
  // ignore: library_private_types_in_public_api
  _SheetChaptersState createState() => _SheetChaptersState();
}

class _SheetChaptersState extends State<SheetChapters> {
  @override
  Widget build(BuildContext context) {
    final lastHistoryChapObject =
        widget.histories?.values.isNotEmpty == true
            ? widget.histories!.values.reduce(
              (a, b) => a.updatedAt.isAfter(b.updatedAt) ? a : b,
            )
            : null;
    final currentChapterId =
        widget.currentChapterId ??
        lastHistoryChapObject?.chapterId ??
        widget.comic.chapters.first.chapterId;

    return DraggableScrollableSheet(
      expand: false,
      snap: true,
      snapSizes: [0.15, 0.5, 0.9],
      initialChildSize: widget.initialChildSize,
      minChildSize: .15,
      maxChildSize: 0.9,
      builder: (context2, scrollController) {
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
                    index,
                  ); //[index];
                  final history =
                      widget.histories?.containsKey(chapter.chapterId) == true
                          ? widget.histories![chapter.chapterId]
                          : null;
                  final bool selected = chapter.chapterId == currentChapterId;

                  return ListTile(
                    enableFeedback: true,
                    selected: selected,
                    autofocus: selected,
                    focusColor: Colors.transparent,
                    title: Row(
                      children: [
                        if (selected)
                          Icon(
                            MaterialCommunityIcons.play,
                            size: 20,
                            color: Colors.green.shade500,
                          ),
                        if (selected) SizedBox(width: 4.0),
                        Text(
                          chapter.name,
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: selected ? FontWeight.w500 : null,
                            color:
                                selected
                                    ? Theme.of(context).colorScheme.onSurface
                                    : Theme.of(context).colorScheme.onSurface
                                        .withValues(alpha: 0.85),
                          ),
                        ),
                      ],
                    ),
                    subtitle: Text(
                      chapter.time != null ? formatTimeAgo(chapter.time!) : "",
                      style: TextStyle(
                        color:
                            selected
                                ? Theme.of(context).colorScheme.secondary
                                : Theme.of(
                                  context,
                                ).colorScheme.secondary.withValues(alpha: 0.85),
                        fontSize: 12.0,
                      ),
                    ),
                    trailing:
                        history == null
                            ? null
                            : CircularProgress(
                              value: min(
                                1,
                                (history.currentPage + 1) / history.maxPage,
                              ),
                              strokeWidth: 3.0,
                              textStyle: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                              borderColor: AlwaysStoppedAnimation<Color>(
                                Colors.green,
                              ),
                              backgroundBorder: Colors.grey[300],
                              size: 25,
                            ),
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
