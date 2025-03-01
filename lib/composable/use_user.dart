import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hoyomi/controller/service_setting.dart';
import 'package:hoyomi/core_services/exception/user_not_found_exception.dart';
import 'package:hoyomi/core_services/mixin/auth_mixin.dart';
import 'package:hoyomi/core_services/service.dart';
import 'package:hoyomi/core_services/interfaces/user.dart';
import 'package:signals/signals.dart' as core_signals;
import 'package:signals/signals_flutter.dart' as flutter_signals;

class UserData {
  final core_signals.Signal<User?> user;
  final core_signals.Signal<String?> error;
  final core_signals.Signal<bool> fetching;
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
  flutter_signals.SignalsMixin? context,
}) {
  final user = context != null
      ? context.createSignal<User?>(null)
      : core_signals.signal<User?>(null);
  final error = context != null
      ? context.createSignal<String?>(null)
      : core_signals.signal<String?>(null);
  final fetching = context != null
      ? context.createSignal<bool>(true)
      : core_signals.signal<bool>(true);

  Future<void> refresh() async {
    fetching.value = true;
    error.value = null;

    try {
      if (service is! Service) return;

      final record = await ServiceSettingController.getAsync(
        sourceId: (service as Service).uid,
      );

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
        debugPrint('Error: $err');

        if (err is UserNotFoundException) {
          if (context != null && (context as State).mounted) {
            user.value = null;
          }

          return;
        }
        if (context != null && (context as State).mounted) {
          error.value = '$err';
        }
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
