import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:honyomi/core_services/interfaces/meta_book.dart';
import 'package:honyomi/models/history_chap.dart';
import 'package:honyomi/utils/format_time_ago.dart';
import 'package:honyomi/widgets/circular_progress.dart';

class SheetChapters extends StatefulWidget {
  final MetaBook book;
  final String sourceId;
  final String bookId;
  final String? currentChapterId;
  final Map<String, HistoryChap>? histories;

  final double initialChildSize;

  const SheetChapters({
    super.key,
    required this.book,
    required this.sourceId,
    required this.bookId,
    this.currentChapterId,
    required this.histories,
    required this.initialChildSize,
  });

  @override
  // ignore: library_private_types_in_public_api
  _SheetChaptersState createState() => _SheetChaptersState();
}

class _SheetChaptersState extends State<SheetChapters> {
  @override
  Widget build(BuildContext context) {
    final lastHistoryChapObject = widget.histories?.values.isNotEmpty == true
        ? widget.histories!.values
            .reduce((a, b) => a.updatedAt.isAfter(b.updatedAt) ? a : b)
        : null;
    final currentChapterId =
        widget.currentChapterId ?? widget.book.chapters.first.chapterId;

    return DraggableScrollableSheet(
      expand: false,
      snap: true,
      snapSizes: [0.5],
      initialChildSize: widget.initialChildSize,
      minChildSize: .15,
      maxChildSize: 0.9,
      builder: (context2, scrollController) {
        return  Column(
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
                  itemCount: widget.book.chapters.length,
                  itemBuilder: (context2, index) {
                    final chapter =
                        widget.book.chapters.elementAt(index); //[index];
                    final history =
                        widget.histories?.containsKey(chapter.chapterId) == true
                            ? widget.histories![chapter.chapterId]
                            : null;
                    final bool selected = (lastHistoryChapObject != null &&
                            lastHistoryChapObject == history) ||
                        chapter.chapterId == currentChapterId;

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
                              color: selected
                                  ? Theme.of(context).colorScheme.onSurface
                                  : Theme.of(context)
                                      .colorScheme
                                      .onSurface
                                      .withOpacity(0.85),
                            ),
                          ),
                        ],
                      ),
                      subtitle: Text(
                        chapter.time != null
                            ? formatTimeAgo(chapter.time!)
                            : "",
                        style: TextStyle(
                          color: selected
                              ? Theme.of(context).colorScheme.secondary
                              : Theme.of(context)
                                  .colorScheme
                                  .secondary
                                  .withOpacity(0.85),
                          fontSize: 12.0,
                        ),
                      ),
                      trailing: history == null
                          ? null
                          : CircularProgress(
                              value: min(1,
                                  (history.currentPage + 1) / history.maxPage),
                              strokeWidth: 3.0,
                              textStyle: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                              borderColor:
                                  AlwaysStoppedAnimation<Color>(Colors.green),
                              backgroundBorder: Colors.grey[300],
                              size: 25),
                      onTap: () {
                        context.push(
                            "/details_comic/${widget.sourceId}/${widget.bookId}/view?chap=${chapter.chapterId}");
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
