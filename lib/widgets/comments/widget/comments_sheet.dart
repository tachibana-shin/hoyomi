import 'package:flutter/material.dart';
import 'package:hoyomi/core_services/comic/main.dart';
import 'comments.dart';

class CommentsSheet extends StatefulWidget {
  final ComicCommentMixin service;

  final String comicId;
  final MetaComic metaComic;
  final String chapterId;
  final ComicChapter chapter;

  const CommentsSheet({
    super.key,
    required this.comicId,
    required this.metaComic,
    required this.chapterId,
    required this.chapter,
    required this.service,
  });

  @override
  State<CommentsSheet> createState() => _CommentsSheetState();
}

class _CommentsSheetState extends State<CommentsSheet> {
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      snap: true,
      initialChildSize: 0.5,
      minChildSize: 0.3,
      maxChildSize: 0.9,
      builder: (context, scrollController) {
        return Comments(
          fake: widget.metaComic.fake,
          getComments: ({page, parent}) {
            return widget.service.getComments(
              ComicCommentContext(
                comicId: widget.comicId,
                metaComic: widget.metaComic,
                chapterId: widget.chapterId,
                chapter: widget.chapter,
                parent: parent,
              ),
              page: page,
            );
          },
          deleteComment: ({required comment, parent}) {
            return widget.service.deleteComment(
              ComicCommentContext(
                comicId: widget.comicId,
                metaComic: widget.metaComic,
                chapterId: widget.chapterId,
                chapter: widget.chapter,
                parent: parent,
              ),
              comment: comment,
            );
          },
          controller: scrollController,
          setLikeComment: ({required comment, parent, required value}) {
            return widget.service.setLikeComment(
              ComicCommentContext(
                comicId: widget.comicId,
                metaComic: widget.metaComic,
                chapterId: widget.chapterId,
                chapter: widget.chapter,
                parent: parent,
              ),
              comment: comment,
              value: value,
            );
          },
        );
      },
    );
  }
}
