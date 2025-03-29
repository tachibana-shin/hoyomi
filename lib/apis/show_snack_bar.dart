import 'package:flutter/material.dart';

final GlobalKey<ScaffoldMessengerState> snackbarKey =
    GlobalKey<ScaffoldMessengerState>();

void showSnackBar(Widget content, {SnackBarAction? action}) {
  snackbarKey.currentState?.showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      clipBehavior: Clip.antiAlias,
      content: content,
      action: action,
      showCloseIcon: action == null,
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
    ),
  );
}
