import 'package:flutter/material.dart';

final GlobalKey<ScaffoldMessengerState> snackbarKey =
    GlobalKey<ScaffoldMessengerState>();

void showSnackBar(Widget content) {
  snackbarKey.currentState?.showSnackBar(
      SnackBar(behavior: SnackBarBehavior.floating, content: content));
}
