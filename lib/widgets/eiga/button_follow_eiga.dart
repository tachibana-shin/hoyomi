import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hoyomi/composable/use_user.dart';
import 'package:hoyomi/core_services/base_service.dart';
import 'package:hoyomi/core_services/eiga/eiga_auth_service.dart';
import 'package:hoyomi/core_services/eiga/interfaces/meta_eiga.dart';
import 'package:hoyomi/core_services/interfaces/basic_user.dart';
import 'package:hoyomi/globals.dart';
import 'package:hoyomi/utils/format_number.dart';
import 'package:signals/signals_flutter.dart';

class ButtonFollowEiga extends StatefulWidget {
  final ValueNotifier<String> eigaId;
  final ValueNotifier<MetaEiga> metaEiga;
  final BaseService service;

  const ButtonFollowEiga(
      {super.key,
      required this.eigaId,
      required this.metaEiga,
      required this.service});

  @override
  createState() => _ButtonFollowEigaState();
}

class _ButtonFollowEigaState extends State<ButtonFollowEiga> with SignalsMixin {
  late final _isFollowed = createSignal(false);
  late final _followCount = createSignal<int?>(null);

  late final _user = createSignal<BasicUser?>(null);
  late final _isSigned = createComputed<bool>(() => _user.value != null);

  void Function()? _onDisposeError;
  void Function()? _onDisposeUser;

  bool get _supportAuth => widget.service is EigaAuthService;

  @override
  void initState() {
    super.initState();
    _onUpdateEigaId();
    widget.eigaId.addListener(_onUpdateEigaId);

    if (_supportAuth) {
      final out = useUser(widget.service as EigaAuthService);

      _onDisposeError = out.error.subscribe((error) {
        if (error != null) {
          showSnackBar(Text('Sign in failed: $error'));
          out.user.value = null;
        }
      });
      _onDisposeUser = out.user.subscribe((user) => _user.value = user);
    }
  }

  @override
  void dispose() {
    widget.eigaId.removeListener(_onUpdateEigaId);
    if (_onDisposeError != null) _onDisposeError!();
    if (_onDisposeUser != null) _onDisposeUser!();

    super.dispose();
  }

  void _onUpdateEigaId() {
    if (!_supportAuth) return;
    final service = widget.service as EigaAuthService;

    service.isFollowed(eigaId: widget.eigaId.value).then((value) {
      if (mounted) _isFollowed.value = value;
    });
    service.getFollowCount(eigaId: widget.eigaId.value).then((value) {
      if (mounted) _followCount.value = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isFollowed = _isFollowed();
    final followCount = _followCount();

    return Opacity(
        opacity: _supportAuth ? 1.0 : 0.5,
        child: IgnorePointer(
            ignoring: !_supportAuth,
            child: ElevatedButton.icon(
              onPressed: _onTap,
              icon: Icon(
                isFollowed
                    ? MaterialCommunityIcons.bookmark_check
                    : MaterialCommunityIcons.bookmark_plus_outline,
                color: Theme.of(context).textTheme.labelLarge?.color,
              ),
              label: Text(
                  followCount == null || followCount == 0
                      ? 'Follow'
                      : formatNumber(followCount),
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge
                      ?.copyWith(fontWeight: FontWeight.normal)),
            )));
  }

  void _onTap() async {
    if (!_supportAuth) return;
    final service = widget.service as EigaAuthService;

    final isSigned = _isSigned.value;
    if (!isSigned) {
      showSnackBar(Text('Please sign in to follow eiga.'));

      return;
    }

    final oldFollowed = _isFollowed.value;
    _isFollowed.value = !oldFollowed;

    try {
      _isFollowed.value = await service.setFollow(
          eigaId: widget.eigaId.value, value: !oldFollowed);
    } catch (err) {
      // restore value
      _isFollowed.value = oldFollowed;
      showSnackBar(Text('Follow error: $err'));

      debugPrint('Error: $err');
    }
  }
}
