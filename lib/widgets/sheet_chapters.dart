import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:honyomi/core_services/interfaces/meta_book.dart';
import 'package:honyomi/models/history_chap.dart';
import 'package:honyomi/utils/format_time_ago.dart';

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

    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: widget.initialChildSize,
      minChildSize: .15,
      maxChildSize: 0.9,
      builder: (context2, scrollController) {
        return Container(
          // color: Colors.transparent,
          decoration: BoxDecoration(
            color: Colors.transparent, //Colors.grey.shade900,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(16.0),
            ),
          ),
          child: Column(
            children: [
              Center(
                child: Container(
                  width: 40.0,
                  height: 4.0,
                  margin: EdgeInsets.symmetric(vertical: 16.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(2.0),
                  ),
                ),
              ),
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
                        (widget.currentChapterId != null &&
                            chapter.chapterId == widget.currentChapterId);

                    return ListTile(
                      enableFeedback: true,
                      selected: selected,
                      autofocus: selected,
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
                          : SizedBox(
                              height: 25,
                              width: 25,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  CircularProgressIndicator(
                                    strokeWidth: 3.0,
                                    value: min(
                                        1,
                                        (history.currentPage + 1) /
                                            history.maxPage),
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.green),
                                    backgroundColor: Colors.grey[300],
                                  ),
                                  Center(
                                    child: Text(
                                      ((history.currentPage + 1) /
                                              history.maxPage *
                                              100)
                                          .round()
                                          .toString(),
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w600,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                      onTap: () {
                        context.push(
                            "/details_comic/${widget.sourceId}/${widget.bookId}/view?chap=${chapter.chapterId}");
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
