import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:honyomi/core_services/interfaces/meta_book.dart';
import 'package:honyomi/utils/format_time_ago.dart';

class SheetChapters extends StatefulWidget {
  final MetaBook book;
  final String sourceId;
  final String slug;

  final double initialChildSize;

  const SheetChapters({
    super.key,
    required this.book,
    required this.sourceId,
    required this.slug,
    required this.initialChildSize,
  });

  @override
  _SheetChaptersState createState() => _SheetChaptersState();
}

class _SheetChaptersState extends State<SheetChapters> {
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: widget.initialChildSize,
      minChildSize: .15,
      maxChildSize: 1.0,
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
                  itemCount: widget.book.chapters.length,
                  itemBuilder: (context2, index) {
                    final chapter =
                        widget.book.chapters.elementAt(index); //[index];
                    return ListTile(
                      enableFeedback: true,
                      title: Text(
                        chapter.name,
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                      subtitle: Text(
                        chapter.time != null ? formatTimeAgo(chapter.time!) : "",
                        style: TextStyle(
                          color: Colors.grey.shade400,
                          fontSize: 12.0,
                        ),
                      ),
                      onTap: () {
                        context.push(
                            "/details_comic/${widget.sourceId}/${widget.slug}/view?chap=${chapter.slug}");
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
