import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:hoyomi/core_services/comic/interfaces/comic_comments.dart';
import 'package:hoyomi/core_services/comic/interfaces/comic_comment.dart';
import 'package:hoyomi/core_services/utils_service.dart';
import 'package:hoyomi/widgets/comments/widget/comment.dart';
import 'package:hoyomi/widgets/pull_refresh_page.dart';

class Comments extends StatefulWidget {
  final Future<ComicComments> Function({
    required ComicComment? parent,
    int? page,
  })?
  getComments;
  final Future<void> Function({
    required ComicComment? parent,
    required ComicComment comment,
  })
  deleteComment;
  final Future<bool> Function({
    required ComicComment? parent,
    required ComicComment comment,
    required bool value,
  })
  setLikeComment;
  final ScrollController? controller;
  final ComicComment? parent;
  final bool activatorMode;

  const Comments({
    super.key,
    required this.getComments,
    required this.controller,
    this.parent,
    required this.deleteComment,
    this.activatorMode = false,
    required this.setLikeComment,
  });

  @override
  State<Comments> createState() => _CommentsState();
}

class _CommentsState extends State<Comments> {
  int page = 1;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.activatorMode) {
      return FutureBuilder(
        future: widget.getComments!(page: page, parent: widget.parent),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: UtilsService.errorWidgetBuilder(
                context,
                error: snapshot.error,
                orElse: (err) => Text('Error: $err'),
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return _buildLastComment(snapshot.data!);
          }
          return Center(child: Text('Error: ${snapshot.error}'));
        },
      );
    }

    return PullRefreshPage<ComicComments>(
      onLoadData: () => widget.getComments!(page: page, parent: widget.parent),
      onLoadFake: () => ComicComments.createFakeData(),
      builder: (data, _) => _buildLastComment(data),
    );
  }

  Widget _buildFullComments(ComicComments comments) {
    Widget itemBuilder(ComicComments comments, int index) {
      final comment = comments.items.elementAt(index);
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
        child: Comment(
          comment: comment,
          getComments: widget.getComments,
          deleteComment: widget.deleteComment,
          setLikeComment: widget.setLikeComment,
          onPop: () {
            setState(() {
              comments.items.removeAt(index);
            });
          },
          parent: widget.parent,
        ),
      );
    }

    int index = 0;
    return Column(
      children:
          comments.items.map((item) => itemBuilder(comments, index++)).toList(),
    );
  }

  Widget _buildLastComment(ComicComments comments) {
    final comment = comments.items.firstOrNull;
    if (comment == null) {
      return InkWell(
        onTap: () {
          _showBottomSheet(comments);
        },
        borderRadius: BorderRadius.circular(10.0),
        child: Center(child: Text('Tap to comment')),
      );
    }

    return InkWell(
      onTap: () {
        _showBottomSheet(comments);
      },
      borderRadius: BorderRadius.circular(10.0),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Theme.of(context).colorScheme.surfaceContainer,
        ),
        // color: Theme.of(context).colorScheme.surfaceContainer,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Comments',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  TextSpan(
                    text: ' ${comments.totalItems}',
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8),
            // Main comment layout
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                    comment.photoUrl.src,
                    headers: comment.photoUrl.headers,
                  ),
                  radius: 12,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: HtmlWidget(
                    comment.content,
                    textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showBottomSheet(ComicComments comments) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder:
          (context) => DraggableScrollableSheet(
            expand: false,
            snap: true,
            initialChildSize: 0.5,
            minChildSize: 0.3,
            maxChildSize: 0.9,
            builder: (context, scrollController) {
              return SingleChildScrollView(
                controller: scrollController,
                child: _buildFullComments(comments),
              );
            },
          ),
    );
  }
}
