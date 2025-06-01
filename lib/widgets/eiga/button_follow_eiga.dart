import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hoyomi/core_services/eiga/main.dart';
import 'package:hoyomi/apis/show_snack_bar.dart';
import 'package:hoyomi/utils/format_number.dart';
import 'package:hoyomi/widgets/export.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:kaeru/kaeru.dart';

class ButtonFollowEiga extends StatefulWidget {
  final Ref<String> eigaId;
  final Ref<MetaEiga> metaEiga;
  final Service service;
  final Ref<EigaEpisodes?> episodes;

  const ButtonFollowEiga({
    super.key,
    required this.eigaId,
    required this.metaEiga,
    required this.service,
    required this.episodes,
  });

  @override
  createState() => _ButtonFollowEigaState();
}

class _ButtonFollowEigaState extends State<ButtonFollowEiga>
    with KaeruMixin, KaeruLifeMixin {
  late final _loading = ref(false);
  late final _isFollowed = ref(false);
  late final _followCount = ref<int?>(null);

  late final UserData? _user;

  bool get _supportAuth => widget.service is EigaFollowMixin;

  @override
  void initState() {
    super.initState();

    watch([widget.eigaId], () async {
      if (!_supportAuth) return;
      final service = widget.service as EigaFollowMixin;

      _loading.value = true;
      try {
        await Future.wait([
          service.isFollow(widget.eigaId.value).then((value) {
            if (mounted) _isFollowed.value = value;
          }),
          service
              .getFollowsCount(widget.eigaId.value)
              .then((value) {
                if (mounted) _followCount.value = value;
              })
              .onError<UnimplementedError>((_, _) => null),
        ]);
      } finally {
        if (mounted) _loading.value = false;
      }
    }, immediate: true);

    if (_supportAuth) {
      _user = widget.service.getUserData();
    } else {
      _user = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Watch(() {
      final isFollowed = _isFollowed.value;
      final followCount = _followCount.value;

      return Disabled(
        disabled:
            !_supportAuth || _loading.value || widget.episodes.value == null,
        child: ElevatedButton.icon(
          onPressed: _onTap,
          icon: Iconify(
            isFollowed ? Mdi.bookmark_check : Mdi.bookmark_plus_outline,
            color: Theme.of(context).textTheme.labelLarge?.color,
          ),
          label: Text(
            followCount == null || followCount == 0
                ? 'Follow'
                : formatNumber(followCount),
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
              fontWeight: FontWeight.normal,
              fontSize: 12.0,
            ),
          ),
          style: ButtonStyle(
            padding: WidgetStateProperty.all(
              EdgeInsets.symmetric(horizontal: 12.0, vertical: 5.0),
            ),
          ),
        ),
      );
    });
  }

  void _onTap() async {
    if (!_supportAuth) return;
    final service = widget.service as EigaFollowMixin;

    final isSigned = _user?.user.value != null;
    if (!isSigned) {
      showSnackBar(
        Text('Please sign in to follow eiga.'),
        action: SnackBarAction(
          label: 'Sign in',
          onPressed: () => context.pushNamed(
            'webview',
            pathParameters: {'sourceId': widget.service.uid},
          ),
        ),
      );

      return;
    }

    final oldFollowed = _isFollowed.value;
    _isFollowed.value = !oldFollowed;

    try {
      await service.setFollow(
        EigaContextWithEpisodes(
          eigaId: widget.eigaId.value,
          metaEiga: widget.metaEiga.value,
          episodes: widget.episodes.value!.episodes,
        ),
        !oldFollowed,
      );

      showSnackBar(
        Text(
          _isFollowed.value ? 'Added to watch list' : 'Removed from watch list',
        ),
      );
    } catch (err) {
      // restore value
      _isFollowed.value = oldFollowed;
      showSnackError('follow', err);
    }
  }
}
