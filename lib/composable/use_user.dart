import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hoyomi/controller/cookie.dart';
import 'package:hoyomi/core_services/mixin/base_auth_mixin.dart';
import 'package:hoyomi/core_services/base_service.dart';
import 'package:hoyomi/core_services/interfaces/basic_user.dart';
import 'package:signals/signals.dart' as core_signals;
import 'package:signals/signals_flutter.dart' as flutter_signals;

class UserData {
  final core_signals.Signal<BasicUser?> user;
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

UserData useUser(BaseAuthMixin service,
    {bool immediate = true, flutter_signals.SignalsMixin? context}) {
  final user = context != null
      ? context.createSignal<BasicUser?>(null)
      : core_signals.signal<BasicUser?>(null);
  final error = context != null
      ? context.createSignal<String?>(null)
      : core_signals.signal<String?>(null);
  final fetching = context != null
      ? context.createSignal<bool>(true)
      : core_signals.signal<bool>(true);

  Future<void> refresh() async {
    fetching.value = true;

    try {
      if (service is! BaseService) return;

      final record = await CookieController.getAsync(
          sourceId: (service as BaseService).uid);

      if (record != null) {
        final json = record.user;

        if (context == null && context is State && (context as State).mounted) {
          user.value =
              json == null ? null : BasicUser.fromJson(jsonDecode(json));
        }
      }
      // fetch user online
      (service as BaseService)
          .fetchUser(row: record, recordLoaded: true)
          .then((value) {
        if (context == null && context is State && (context as State).mounted) {
          user.value = value;
        }
      }).catchError((err) {
        if (context == null && context is State && (context as State).mounted) {
          error.value = '$err';
        }
        debugPrint('Error: $err');
      });
    } finally {
      fetching.value = false;
    }
  }

  if (immediate) refresh();

  return UserData(
      user: user, error: error, fetching: fetching, refresh: refresh);
}
