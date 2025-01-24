import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hoyomi/controller/cookie.dart';
import 'package:hoyomi/core_services/base_auth_service.dart';
import 'package:hoyomi/core_services/base_service.dart';
import 'package:hoyomi/core_services/interfaces/basic_user.dart';
import 'package:signals/signals.dart';

class UserData {
  final Signal<BasicUser?> user;
  final Signal<String?> error;
  final Future<void> Function() refresh;

  const UserData({
    required this.user,
    required this.error,
    required this.refresh,
  });
}

Future<UserData> useUserAsync(BaseService service) async {
  assert(service is BaseAuthService);

  final user = signal<BasicUser?>(null);
  final error = signal<String?>(null);
  Future<void> refresh() async {
    final record = await CookieController.getAsync(sourceId: service.uid);

    if (record != null) {
      final json = record.user;

      user.value = BasicUser.fromJson(jsonDecode(json));

      // fetch user online
      service.fetchUser().then((value) {
        user.value = value;
      }).catchError((err) {
        error.value = '$err';
        debugPrint('Error: $err');
      });
    }
  }

  await refresh();

  return UserData(user: user, error: error, refresh: refresh);
}
