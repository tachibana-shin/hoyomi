import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hoyomi/core_services/book/interfaces/base_comments.dart';
import 'package:hoyomi/core_services/book/interfaces/basic_comment.dart';
import 'package:hoyomi/globals.dart';
import 'package:hoyomi/utils/format_time_ago.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:hoyomi/widgets/comments/widget/comments.dart';

class Comment extends StatefulWidget {
  final BasicComment comment;
  final BasicComment? parent;

  final Future<BaseComments> Function(
      {required BasicComment? parent, int? page})? getComments;
  final Future<void> Function(
      {required BasicComment? parent,
      required BasicComment comment}) deleteComment;
  final Future<bool> Function(
      {required BasicComment? parent,
      required BasicComment comment,
      required bool value}) setLikeComment;
  final void Function() onPop;

  const Comment({
    super.key,
    required this.comment,
    required this.parent,
    required this.getComments,
    required this.deleteComment,
    required this.onPop,
    required this.setLikeComment,
  });

  @override
  State<Comment> createState() => _CommentState();
}

class _CommentState extends State<Comment> {
  bool _showReplies = false;

  void _showRepliesList() {
    setState(() {
      _showReplies = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Main comment layout
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                widget.comment.photoUrl.src,
                headers: widget.comment.photoUrl.headers,
              ),
              radius: 24,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          widget.comment.name,
                          overflow: TextOverflow.ellipsis,
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            formatTimeAgo(widget.comment.timeAgo),
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: Colors.grey,
                                    ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  HtmlWidget(
                    widget.comment.content,
                    textStyle: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(widget.comment.like == true
                            ? MaterialCommunityIcons.thumb_up
                            : MaterialCommunityIcons.thumb_up_outline),
                        iconSize: 20,
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          _setLike(true);
                        },
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      Text(
                        '${widget.comment.countLike ?? 0}',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const SizedBox(width: 4),
                      IconButton(
                        icon: Icon(widget.comment.like == false
                            ? MaterialCommunityIcons.thumb_down
                            : MaterialCommunityIcons.thumb_down_outline),
                        iconSize: 20,
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          _setLike(false);
                        },
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      Text(
                        '${widget.comment.countDislike ?? 0}',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const SizedBox(width: 16),
                      TextButton.icon(
                        onPressed: _showRepliesList,
                        icon:
                            const Icon(MaterialCommunityIcons.reply, size: 18),
                        label: Text(
                          'Reply',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                      if (widget.comment.canDelete)
                        IconButton(
                          onPressed: () {
                            _confirmDelete(context);
                          },
                          padding: EdgeInsets.zero,
                          icon: const Icon(
                            MaterialCommunityIcons.trash_can_outline,
                            size: 20,
                            color: Colors.red,
                          ),
                        ),
                    ],
                  ),
                  if (widget.comment.countReply > 0 && _showReplies == false)
                    Transform.translate(
                        offset: Offset(-28.0, -8.0),
                        child: TextButton(
                          onPressed: _showRepliesList,
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.0),
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text:
                                        'View more replies (${widget.comment.countReply})',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondaryFixedDim,
                                        ),
                                  ),
                                  WidgetSpan(
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 4.0),
                                      child: Icon(
                                        MaterialCommunityIcons.chevron_down,
                                        size: 18,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )),
                ],
              ),
            ),
          ],
        ),
        // Replies section
        if (_showReplies)
          Comments(
              getComments: widget.getComments,
              parent: widget.comment,
              controller: null,
              deleteComment: widget.deleteComment,
              setLikeComment: widget.setLikeComment),
      ],
    );
  }

  Future<void> _setLike(bool value) async {
    final old = widget.comment.like;
    try {
      setState(() {
        widget.comment.like = value;
        if (value) {
          if (old != true) {
            widget.comment.countLike = (widget.comment.countLike ?? 0) + 1;
          }
        } else {
          if (old != false) {
            widget.comment.countDislike =
                (widget.comment.countDislike ?? 0) + 1;
          }
        }
      });
      await widget.setLikeComment(
          comment: widget.comment, parent: widget.parent, value: value);
    } catch (err) {
      setState(() {
        widget.comment.like = old;
      });
      showSnackBar(Text('Error: $err'));
    }
  }

  void _confirmDelete(BuildContext context) {
    bool isDeleting = false;

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text('Confirm Delete'),
              content:
                  const Text('Are you sure you want to delete this comment?'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: isDeleting
                      ? null
                      : () async {
                          setState(() {
                            isDeleting = true;
                          });

                          try {
                            await widget.deleteComment(
                                comment: widget.comment, parent: widget.parent);
                            if (mounted) {
                              // pop me
                              widget.onPop();
                              // ignore: use_build_context_synchronously
                              Navigator.pop(context);
                            }
                          } catch (e) {
                            setState(() {
                              isDeleting = false;
                            });

                            showSnackBar(Text('Error: $e'));
                          }
                        },
                  child: isDeleting
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                          ),
                        )
                      : const Text('Delete'),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
