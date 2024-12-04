import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:honyomi/cache/get_user.dart';
import 'package:honyomi/core_services/auth_service.dart';
import 'package:honyomi/core_services/base_service.dart';
import 'package:honyomi/core_services/interfaces/basic_user.dart';
import 'package:honyomi/globals.dart';
import 'package:honyomi/models/cookie_manager.dart';
import 'package:honyomi/objectbox.g.dart';
import 'package:honyomi/plugins/objectbox.dart';

class AccountService extends StatefulWidget {
  final BaseService service;

  const AccountService({super.key, required this.service});

  @override
  _AccountServiceState createState() => _AccountServiceState();
}

class _AccountServiceState extends State<AccountService> {
  BasicUser? _user;
  Object? _error;
  bool? _signed;

  bool get _serviceAccountSupport {
    return widget.service is AuthService;
  }

  String get _status {
    if (!_serviceAccountSupport) return "NOT_SUPPORT";

    if (_signed == null) return "LOADING";
    if (_signed == false) return "NOT_SIGN";
    // _signed is true;

    if (_error != null) return "ERROR";
    if (_user == null) return "LOADING";

    return "DONE";
  }

  @override
  void initState() {
    super.initState();
    if (_serviceAccountSupport) {
      _fetchUser();
    }
  }

  Future<void> _fetchUser() async {
    final row = objectBox.store
        .box<CookieManager>()
        .query(CookieManager_.uid.equals(widget.service.uid))
        .build()
        .findFirst();

    setState(() {
      _signed = row?.signed??false;
    });

    if (row?.signed != true) return;

    _error = null;
    await getUser(widget.service).then((user) {
      setState(() {
        _user = user;
      });
    }).catchError((err) {
      setState(() {
        _error = err;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.surface,
                child: Image.network(
                  widget.service.faviconUrl,
                  headers: { "referer": widget.service.baseUrl },
                  fit: BoxFit.cover,
                )),
            const SizedBox(width: 5.0),
            _buildUserAvatar(),
          ],
        ),
        const SizedBox(height: 12.0),
        _buildUserDetails(context),
      ],
    );
  }

  Widget _buildUserAvatar() {
    switch (_status) {
      case "NOT_SUPPORT":
        return CircleAvatar(
            backgroundColor: Theme.of(context).colorScheme.surface,
            child: const Icon(
              MaterialCommunityIcons.block_helper,
              // color: Colors.red,
            ));
      case "LOADING":
        return CircularProgressIndicator();
      case "NOT_SIGN":
        return CircleAvatar(
            backgroundColor: Theme.of(context).colorScheme.surface,
            child: const Icon(
              MaterialCommunityIcons.help,
            ));
      case "ERROR":
        return CircleAvatar(
            backgroundColor: Theme.of(context).colorScheme.surface,
            child: const Icon(
              MaterialCommunityIcons.alert_circle_outline,
              color: Colors.orange,
            ));
      default:
        return CircleAvatar(
            backgroundColor: Colors.grey.shade300,
            child: Image.network(
              _user!.photoUrl,
              fit: BoxFit.cover,
            ));
    }
  }

  Widget _buildUserDetails(BuildContext context) {
    Widget oneLine;
    switch (_status) {
      case "NOT_SUPPORT":
        oneLine = Text(
          'This service does not support accounts.',
          style: TextStyle(
            fontSize: 14.0,
            color: Colors.red.shade400,
            fontWeight: FontWeight.bold,
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
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        );
        break;
      case "NOT_SIGN":
        oneLine = InkWell(
            onTap: () async {
              await context.push("/webview/${widget.service.uid}");
              await _fetchUser();

              if (_signed != true) {
                showSnackBar(Text('Sign in failed.'));
              }
            },
            child: Text(
              "(Tap to sign in)",
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
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
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 5.0),
            TextButton(
              onPressed: _fetchUser,
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
              _user!.fullName,
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ));
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        oneLine,
        Text(
          widget.service.name,
          style: TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.w500,
            color: Colors.grey.shade400,
          ),
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
