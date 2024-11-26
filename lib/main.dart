import 'package:honyomi/router/index.dart';

import 'globals.dart';

import 'package:flutter/material.dart';
import 'package:go_transitions/go_transitions.dart';

void main() {
  runApp(const MainApp());
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
