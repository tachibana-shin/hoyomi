import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hoyomi/controller/service_settings_controller.dart';
import 'package:hoyomi/core_services/exception/user_not_found_exception.dart';
import 'package:hoyomi/core_services/mixin/auth_mixin.dart';
import 'package:hoyomi/core_services/service.dart';
import 'package:hoyomi/core_services/interfaces/user.dart';
import 'package:kaeru/kaeru.dart';

class UserData {
  final Ref<User?> user;
  final Ref<String?> error;
  final Ref<bool> fetching;
  final Future<void> Function() refresh;

  const UserData({
    required this.user,
    required this.error,
    required this.fetching,
    required this.refresh,
  });
}

UserData useUser(
  AuthMixin service, {
  bool immediate = true,
  KaeruMixin? context,
}) {
  final user = context != null ? context.ref<User?>(null) : Ref<User?>(null);
  final error =
      context != null ? context.ref<String?>(null) : Ref<String?>(null);
  final fetching = context != null ? context.ref<bool>(true) : Ref<bool>(true);

  Future<void> refresh() async {
    fetching.value = true;
    error.value = null;

    try {
      if (service is! Service) return;

      final record = await ServiceSettingsController.instance
          .get((service as Service).uid);

      if (record != null) {
        final json = record.userDataCache;

        if (context != null && (context as State).mounted) {
          user.value = json == null ? null : User.fromJson(jsonDecode(json));
        }
      }
      // fetch user online
      (service as Service)
          .fetchUser(row: record, recordLoaded: true)
          .then((value) {
        if (context != null && (context as State).mounted) {
          user.value = value;
        }
      }).catchError((err) {
        if (err is UserNotFoundException) {
          if (context != null && (context as State).mounted) {
            user.value = null;
          }

          return;
        }
        if (context != null && (context as State).mounted) {
          error.value = '$err';
        }

        debugPrint('Error: $err (${StackTrace.current})');
      });
    } finally {
      fetching.value = false;
    }
  }

  if (immediate) refresh();

  return UserData(
    user: user,
    error: error,
    fetching: fetching,
    refresh: refresh,
  );
}
