import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:hoyomi/composable/use_user.dart';
import 'package:hoyomi/core_services/service.dart';
import 'package:hoyomi/core_services/interfaces/o_image.dart';
import 'package:hoyomi/core_services/mixin/auth_mixin.dart';
import 'package:signals/signals_flutter.dart';

class AccountItem extends StatefulWidget {
  final Service service;

  const AccountItem({super.key, required this.service});

  @override
  State<AccountItem> createState() => _AccountItemState();
}

class _AccountItemState extends State<AccountItem> with SignalsMixin {
  late final UserData? _user;

  bool get _serviceAccountSupport {
    return widget.service is AuthMixin;
  }

  late final _status = createComputed(() {
    if (!_serviceAccountSupport) return "NOT_SUPPORT";
    if (_user?.fetching.value == true) return "LOADING";
    if (_user?.error.value != null) return 'ERROR';
    if (_user?.user.value == null) return 'NOT_SIGN';

    return "DONE";
  });

  @override
  void initState() {
    super.initState();
    if (_serviceAccountSupport) {
      _user = useUser(widget.service as AuthMixin, context: this);
    } else {
      _user = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.surface,
          child: OImage.network(
            widget.service.faviconUrl,
            sourceId: widget.service.uid,
            headers: {"referer": widget.service.baseUrl},
            fit: BoxFit.cover,
          )),
      title: Text(
        widget.service.name,
        // style: TextStyle(
        //   fontSize: 12.0,
        //   fontWeight: FontWeight.w500,
        //   color: Colors.grey.shade400,
        // ),
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Row(
        children: [
          _buildUserAvatar(),
          const SizedBox(width: 5.0),
          _buildUserDetails(context),
        ],
      ),
    );
  }

  Widget _buildUserAvatar() {
    Widget avatar;
    switch (_status()) {
      case "NOT_SUPPORT":
        avatar = const Icon(
          MaterialCommunityIcons.block_helper,
          // color: Colors.red,
        );
        break;
      case "LOADING":
        avatar = CircularProgressIndicator();
        break;
      case "NOT_SIGN":
        avatar = const Icon(
          MaterialCommunityIcons.help,
        );
        break;
      case "ERROR":
        avatar = const Icon(
          MaterialCommunityIcons.alert_circle_outline,
          color: Colors.orange,
        );
        break;
      default:
        avatar = OImage.network(
          _user!.user.value!.photoUrl,
          sourceId: widget.service.uid,
          fit: BoxFit.cover,
        );
    }

    return CircleAvatar(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: SizedBox(width: 10, height: 10, child: avatar),
    );
  }

  Widget _buildUserDetails(BuildContext context) {
    Widget oneLine;
    switch (_status()) {
      case "NOT_SUPPORT":
        oneLine = Text(
          'This service does not support accounts.',
          style: TextStyle(
            fontSize: 14.0,
            color: Colors.red.shade400,
          ),
          textAlign: TextAlign.center,
        );
        break;
      case "LOADING":
        oneLine = Text(
          'Loading...',
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.grey.shade300,
          ),
          textAlign: TextAlign.center,
        );
        break;
      case "NOT_SIGN":
        oneLine = InkWell(
            onTap: () async {
              await context.push("/webview/${widget.service.uid}");
              _user?.refresh();
            },
            child: Text(
              "(Tap to sign in)",
              style: const TextStyle(
                fontSize: 16.0,
              ),
              overflow: TextOverflow.ellipsis,
            ));
        break;

      case "ERROR":
        oneLine = Column(
          children: [
            Text(
              'Failed to fetch user.',
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.orange.shade400,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 5.0),
            TextButton(
              onPressed: () {
                _user?.refresh();
              },
              child: const Text('Retry'),
            ),
          ],
        );
        break;
      default:
        oneLine = InkWell(
            onTap: () {
              context.push("/webview/${widget.service.uid}");
            },
            child: Text(
              _user!.user.value!.fullName,
              style: const TextStyle(
                fontSize: 16.0,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ));
    }

    return oneLine;
  }
}
