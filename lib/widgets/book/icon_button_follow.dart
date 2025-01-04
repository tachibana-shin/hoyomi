import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hoyomi/controller/history.dart';
import 'package:hoyomi/core_services/book/interfaces/meta_book.dart';

class IconButtonFollow extends StatefulWidget {
  final String sourceId;
  final String bookId;
  final MetaBook? book;

  const IconButtonFollow(
      {super.key,
      required this.sourceId,
      required this.bookId,
      required this.book});

  @override
  State<IconButtonFollow> createState() => _IconButtonFollowState();
}

class _IconButtonFollowState extends State<IconButtonFollow> {
  final ValueNotifier<bool> _isFollowed = ValueNotifier<bool>(false);
  final _history = HistoryController();

  @override
  void initState() {
    super.initState();
    _setFollowed(null);
  }

  void _setFollowed(bool? val)async  {
    if (widget.book == null) return;

    final book = await _history.createBook(widget.sourceId,
        bookId: widget.bookId, book: widget.book!, followed: val);
    _isFollowed.value = book.followedAt != null;
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
        opacity: null == widget.book ? 0.8 : 1.0,
        child: IconButton(
          tooltip: _isFollowed.value ? "Unfollow" : "Follow",
          icon: ValueListenableBuilder<bool>(
            valueListenable: _isFollowed,
            builder: (context, value, child) => Icon(
              value
                  ? MaterialCommunityIcons.bookmark
                  : MaterialCommunityIcons.bookmark_outline,
            ),
          ),
          onPressed: () {
            _setFollowed(!_isFollowed.value);
          },
        ));
  }
}
