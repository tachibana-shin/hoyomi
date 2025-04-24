import 'package:flutter/material.dart';
import 'package:hoyomi/core_services/comic/interfaces/meta_comic.dart';
import 'package:hoyomi/widgets/iconify.dart';
import 'package:iconify_flutter/icons/mdi.dart';

class IconButtonFollow extends StatefulWidget {
  final String sourceId;
  final String comicId;
  final MetaComic? comic;

  const IconButtonFollow({
    super.key,
    required this.sourceId,
    required this.comicId,
    required this.comic,
  });

  @override
  State<IconButtonFollow> createState() => _IconButtonFollowState();
}

class _IconButtonFollowState extends State<IconButtonFollow> {
  final ValueNotifier<bool> _isFollowed = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
    _setFollowed(null);
  }

  void _setFollowed(bool? val) async {}

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: null == widget.comic ? 0.8 : 1.0,
      child: IconButton(
        tooltip: _isFollowed.value ? "Unfollow" : "Follow",
        icon: ValueListenableBuilder<bool>(
          valueListenable: _isFollowed,
          builder:
              (context, value, child) =>
                  Iconify(value ? Mdi.bookmark : Mdi.bookmark_outline),
        ),
        onPressed: () {
          _setFollowed(!_isFollowed.value);
        },
      ),
    );
  }
}
