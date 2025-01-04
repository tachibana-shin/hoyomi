import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:hoyomi/core_services/book/interfaces/base_comments.dart';
import 'package:hoyomi/core_services/book/interfaces/basic_comment.dart';
import 'package:hoyomi/widgets/comments/widget/comment.dart';
import 'package:hoyomi/widgets/pull_to_refresh.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class Comments extends StatefulWidget {
  final Future<BaseComments> Function(
      {required BasicComment? parent, int? page})? getComments;
  final Future<void> Function(
      {required BasicComment? parent,
      required BasicComment comment}) deleteComment;
  final Future<bool> Function(
      {required BasicComment? parent,
      required BasicComment comment,
      required bool value}) setLikeComment;
  final ScrollController? controller;
  final BasicComment? parent;
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
  final _refreshController = RefreshController(initialRefresh: false);
  late Future<BaseComments> _futureComments;

  int page = 1;

  @override
  void initState() {
    super.initState();
    _loadComments();
  }

  void _loadComments() async {
    if (widget.getComments != null) {
      setState(() {
        _futureComments =
            widget.getComments!(page: page, parent: widget.parent);
      });
    }
  }

  Future<BaseComments> _onRefresh() async {
    page = 1;
    return widget.getComments!(page: page, parent: widget.parent);
  }

  Future<BaseComments?> _onLoading(BaseComments oldData) async {
    final newData =
        await widget.getComments!(page: ++page, parent: widget.parent);

    if (newData.items.isEmpty) {
      return null;
    }

    return BaseComments(
      items: oldData.items.toList()..addAll(newData.items),
      page: newData.page,
      totalItems: newData.totalItems,
      totalPages: newData.totalPages,
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<BaseComments>(
      future: _futureComments,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else if (snapshot.hasData && snapshot.data!.items.isEmpty) {
          return const Center(child: Text('No comments available.'));
        } else if (snapshot.hasData) {
          final comments = snapshot.data!;

          if (widget.activatorMode) return _buildLastComment(comments);
          return _buildFullComments(comments);
        } else {
          return const Center(child: Text('Unexpected error.'));
        }
      },
    );
  }

  Widget _buildFullComments(BaseComments comments,
      {ScrollController? controller}) {
    controller ??= widget.controller;

    Widget itemBuilder(BaseComments comments, int index) {
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

    if (controller != null) {
      return PullToRefresh(
          controller: _refreshController,
          onRefresh: _onRefresh,
          onLoading: _onLoading,
          initialData: comments,
          builder: (data) => ListView.builder(
              controller: controller,
              itemCount: data.items.length,
              itemBuilder: (_, index) => itemBuilder(data, index)));
    }

    int index = 0;
    return Column(
        children: comments.items
            .map((item) => itemBuilder(comments, index++))
            .toList());
  }

  Widget _buildLastComment(BaseComments comments) {
    final comment = comments.items.firstOrNull;
    if (comment == null) {
      return InkWell(
          onTap: () {
            _showBottomSheet(comments);
          },
          borderRadius: BorderRadius.circular(10.0),
          child: Center(child: Text('Tap to comment')));
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
                Text.rich(TextSpan(children: [
                  TextSpan(
                    text: 'Comments',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  TextSpan(
                      text: ' ${comments.totalItems}',
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color:
                              Theme.of(context).colorScheme.onSurfaceVariant))
                ])),
                SizedBox(
                  height: 8,
                ),
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
                        textStyle: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ],
            )));
  }

  void _showBottomSheet(BaseComments comments) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        showDragHandle: true,
        builder: (context) => DraggableScrollableSheet(
              expand: false,
              snap: true,
              initialChildSize: 0.5,
              minChildSize: 0.3,
              maxChildSize: 0.9,
              builder: (context, scrollController) {
                return _buildFullComments(comments,
                    controller: scrollController);
              },
            ));
  }
}
