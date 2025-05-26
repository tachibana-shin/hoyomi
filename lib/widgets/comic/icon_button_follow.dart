import 'package:flutter/material.dart';
import 'package:hoyomi/apis/show_snack_bar.dart';
import 'package:hoyomi/core_services/comic/export.dart';
import 'package:hoyomi/widgets/export.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:kaeru/kaeru.dart';

class IconButtonFollow extends StatefulWidget {
  final Service service;
  final String comicId;
  final Ref<MetaComic?> comic;

  const IconButtonFollow({
    super.key,
    required this.service,
    required this.comicId,
    required this.comic,
  });

  @override
  State<IconButtonFollow> createState() => _IconButtonFollowState();
}

class _IconButtonFollowState extends State<IconButtonFollow>
    with KaeruMixin, KaeruLifeMixin {
  late final _isFollowed = ref<bool>(false);
  late final _loading = ref(false);
  bool _setting = false;

  @override
  void initState() {
    super.initState();

    watchEffect(() async {
      _loading.value = true;

      try {
        _isFollowed.value = await (widget.service as ComicFollowMixin).isFollow(
          comicId: widget.comicId,
        );

        if (mounted) _loading.value = false;
      } catch (err) {
        showSnackBar(Text('Error checking follow status: $err'));
        if (mounted) _loading.value = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Watch(
      () => Disabled(
        disabled:
            _loading.value ||
            null == widget.comic.value ||
            widget.comic.value!.fake ||
            widget.service is! ComicFollowMixin,
        child: IconButton(
          tooltip: _isFollowed.value ? "Unfollow" : "Follow",
          icon: Iconify(
            _isFollowed.value ? Mdi.bookmark : Mdi.bookmark_outline,
            color: _isFollowed.value ? Colors.yellow : null,
          ),
          onPressed: () async {
            if (_loading.value || _setting) return;

            _isFollowed.value = !_isFollowed.value;

            _setting = true;

            try {
              final comic = widget.comic.value;
              if (comic == null) return;

              await (widget.service as ComicFollowMixin).setFollow(
                comicId: widget.comicId,
                metaComic: comic,
                value: _isFollowed.value,
              );

              if (_isFollowed.value) {
                showSnackBar(Text('Followed ${comic.name}'));
              } else {
                showSnackBar(Text('Unfollowed ${comic.name}'));
              }
            } catch (e) {
              _isFollowed.value = !_isFollowed.value; // revert the change
              showSnackBar(Text('Failed to follow/unfollow: $e'));
            } finally {
              _setting = false;
            }
          },
        ),
      ),
    );
  }
}
