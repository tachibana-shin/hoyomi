import 'package:flutter/material.dart';
import 'package:hoyomi/core_services/book/auth_service.dart';
import 'package:hoyomi/widgets/comments/widget/comments.dart';

class CommentsSheet extends StatefulWidget {
  final AuthService service;

  final String bookId;
  final String chapterId;

  const CommentsSheet({
    super.key,
    required this.bookId,
    required this.chapterId,
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
          getComments: ({page, parent}) {
            return widget.service.getComments!(
                bookId: widget.bookId,
                chapterId: widget.chapterId,
                page: page,
                parent: parent);
          },
          deleteComment: ({required comment, parent}) {
            return widget.service.deleteComment!(
                bookId: widget.bookId,
                chapterId: widget.chapterId,
                parent: parent,
                comment: comment);
          },
          controller: scrollController,
          setLikeComment: ({required comment, parent, required value}) {
            return widget.service.setLikeComment!(
                bookId: widget.bookId,
                chapterId: widget.chapterId,
                parent: parent,
                comment: comment,
                value: value);
          },
        );
      },
    );
  }
}
