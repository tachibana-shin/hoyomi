import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hoyomi/composable/use_user.dart';
import 'package:hoyomi/core_services/interfaces/main.dart';
import 'package:hoyomi/core_services/service.dart';
import 'package:hoyomi/core_services/mixin/auth_mixin.dart';
import 'package:hoyomi/widgets/iconify.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:kaeru/kaeru.dart';

class AccountService extends StatefulWidget {
  final Service service;

  const AccountService({super.key, required this.service});

  @override
  createState() => _AccountServiceState();
}

class _AccountServiceState extends State<AccountService> with KaeruMixin {
  late final UserData? _user;

  late final _status = computed(() {
    if (!_serviceAccountSupport) return "NOT_SUPPORT";
    if (_user?.fetching.value == true) return "LOADING";
    if (_user?.error.value != null) return 'ERROR';
    if (_user?.user.value == null) return 'NOT_SIGN';

    return "DONE";
  });

  bool get _serviceAccountSupport {
    return AuthMixin.support(widget.service);
  }

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
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.onSecondary,
              child: OImage.oNetwork(
                widget.service.faviconUrl,
                sourceId: widget.service.uid,
                headers: Headers({"referer": widget.service.baseUrl}),
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 5.0),
            Watch(() => _buildUserAvatar()),
          ],
        ),
        const SizedBox(height: 12.0),
        Watch(() => _buildUserDetails(context)),
        Watch(() => _buildActions()),
      ],
    );
  }

  Widget _buildUserAvatar() {
    switch (_status.value) {
      case "NOT_SUPPORT":
        return CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.onSecondary,
          child: const Iconify(
            Mdi.block_helper,
            // color: Colors.red,
          ),
        );
      case "LOADING":
        return CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.onSecondary,
          child: SpinKitFadingCircle(
            color: Theme.of(context).colorScheme.secondary,
            size: 25.0,
          ),
        );
      case "NOT_SIGN":
        return CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.onSecondary,
          child: const Iconify(Mdi.help),
        );
      case "ERROR":
        return CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.onSecondary,
          child: const Iconify(Mdi.alert_circle_outline, color: Colors.orange),
        );
      default:
        return CircleAvatar(
          backgroundColor: Colors.grey.shade300,
          child: OImage.network(
            _user!.user.value!.photoUrl,
            sourceId: widget.service.uid,
            fit: BoxFit.cover,
          ),
        );
    }
  }

  Widget _buildUserDetails(BuildContext context) {
    Widget oneLine;
    switch (_status.value) {
      case "NOT_SUPPORT":
        oneLine = Text(
          'This service does not support accounts.',
          style: TextStyle(fontSize: 14.0, color: Colors.red.shade400),
          textAlign: TextAlign.center,
        );
        break;
      case "LOADING":
        oneLine = Text(
          'Loading...',
          style: TextStyle(fontSize: 14.0, color: Colors.grey.shade400),
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
            style: TextStyle(fontSize: 14.0, color: Colors.grey.shade400),
            overflow: TextOverflow.ellipsis,
          ),
        );
        break;

      case "ERROR":
        oneLine = Column(
          children: [
            Text(
              'Failed to fetch user.',
              style: TextStyle(fontSize: 14.0, color: Colors.grey.shade400),
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
            style: TextStyle(fontSize: 14.0, color: Colors.grey.shade400),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          widget.service.name,
          style: TextStyle(fontSize: 16.0),
          overflow: TextOverflow.ellipsis,
        ),
        oneLine,
      ],
    );
  }

  Widget _buildActions() {
    return IconButton(
      onPressed: () {
        context.push("/service_settings/${widget.service.uid}");
      },
      icon: Icon(Icons.settings),
    );
  }
}
