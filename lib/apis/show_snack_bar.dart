import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

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

void showSnackError(String source, Object error) {
  if (error is Response) {
    debugPrint('[$source]: ${error.body}');
  } else {
    debugPrint('[$source]: $error (${StackTrace.current})');
  }

  showSnackBar(
    Text(
      // if is response show status and body
      error is Response
          ? 'Error<$source>: ${error.statusCode} ${utf8.decode(error.bodyBytes)}'
          : 'Error<$source>: error.toString()',
    ),
    action: SnackBarAction(
      label: 'Close',
      onPressed: () {
        snackbarKey.currentState?.hideCurrentSnackBar();
      },
    ),
  );
}
