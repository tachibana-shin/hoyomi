import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hoyomi/core_services/service.dart';
import 'package:hoyomi/core_services/eiga/mixin/eiga_auth_mixin.dart';
import 'package:hoyomi/core_services/eiga/interfaces/meta_eiga.dart';
import 'package:hoyomi/core_services/mixin/auth_mixin.dart';
import 'package:hoyomi/apis/show_snack_bar.dart';
import 'package:hoyomi/router/index.dart';
import 'package:hoyomi/utils/format_number.dart';
import 'package:hoyomi/widgets/export.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:kaeru/kaeru.dart';

class ButtonFollowEiga extends StatefulWidget {
  final Ref<String> eigaId;
  final Ref<MetaEiga> metaEiga;
  final Service service;

  const ButtonFollowEiga({
    super.key,
    required this.eigaId,
    required this.metaEiga,
    required this.service,
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

  bool get _supportAuth =>
      widget.service is EigaAuthMixin && AuthMixin.support(widget.service);

  @override
  void initState() {
    super.initState();

    watch([widget.eigaId], () async {
      if (!_supportAuth) return;
      final service = widget.service as EigaAuthMixin;

      _loading.value = true;
      try {
        await Future.wait([
          service.isFollowed(eigaId: widget.eigaId.value).then((value) {
            if (mounted) _isFollowed.value = value;
          }),
          service.getFollowCount(eigaId: widget.eigaId.value).then((value) {
            if (mounted) _followCount.value = value;
          }),
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
        disabled: !(_supportAuth && !_loading.value),
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
    final service = widget.service as EigaAuthMixin;

    final isSigned = _user?.user.value != null;
    if (!isSigned) {
      showSnackBar(
        Text('Please sign in to follow eiga.'),
        action: SnackBarAction(
          label: 'Sign in',
          onPressed: () => context.push('/webview/${widget.service.uid}'),
        ),
      );

      return;
    }

    final oldFollowed = _isFollowed.value;
    _isFollowed.value = !oldFollowed;

    try {
      _isFollowed.value = await service.setFollow(
        eigaId: widget.eigaId.value,
        value: !oldFollowed,
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
