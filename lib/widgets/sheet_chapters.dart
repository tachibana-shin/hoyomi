import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:honyomi/services/interfaces/meta_book.dart';

class SheetChapters extends StatefulWidget {
  final MetaBook book;
  final String sourceId;
  final String slug;

  const SheetChapters(
      {super.key,
      required this.book,
      required this.sourceId,
      required this.slug});

  @override
  _SheetChaptersState createState() => _SheetChaptersState();
}

class _SheetChaptersState extends State<SheetChapters> {
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: .5,
      minChildSize: .5,
      maxChildSize: 1.0,
      builder: (context2, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade900,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(16.0),
            ),
          ),
          child: Column(
            children: [
              // Header
              Container(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "List chapters",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Divider(
                color: Colors.grey.shade700,
                height: 1.0,
              ),
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
                        "${chapter.time}",
                        style: TextStyle(
                          color: Colors.grey.shade400,
                          fontSize: 12.0,
                        ),
                      ),
                      onTap: () {
                        context.push(
                            "/details_comic/${widget.sourceId}/${widget.slug}/${chapter.slug}");
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
