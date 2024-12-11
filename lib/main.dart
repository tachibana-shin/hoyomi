import 'dart:io';

import 'package:honyomi/background_services/book_changes.dart';
import 'package:honyomi/plugins/objectbox.dart';
import 'package:honyomi/router/index.dart';

import 'globals.dart';

import 'package:flutter/material.dart';
import 'package:go_transitions/go_transitions.dart';

Future<void> main() async {
  // init store
  await initObjectBox();

  runApp(const MainApp());

  BookChanges().checkUpdateAll();

  // register background service
  if (Platform.isAndroid || Platform.isIOS) {
    BookChanges().initializeBackgroundService();
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    /// Set default transition values for the entire app.
    GoTransition.defaultCurve = Curves.easeInOut;
    GoTransition.defaultDuration = const Duration(milliseconds: 600);

    return MaterialApp.router(
      title: 'Flutter App',
      scaffoldMessengerKey: snackbarKey,
      theme: ThemeData(
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(
        useMaterial3: true,
      ),
      themeMode: ThemeMode.system,
      scrollBehavior: AppScrollBehavior(),
      routerConfig: router,
    );
  }
}
