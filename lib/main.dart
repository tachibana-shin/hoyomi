import 'package:go_transitions/go_transitions.dart';
import 'package:hoyomi/apis/show_snack_bar.dart';
import 'package:hoyomi/plugins/android_sdk_int.dart';
import 'package:hoyomi/plugins/dot_env.dart';
import 'package:hoyomi/plugins/firebase.dart';
import 'package:hoyomi/plugins/fullscreen.dart';
import 'package:hoyomi/plugins/init_services.dart';
import 'package:hoyomi/plugins/install_cert.dart';
import 'package:hoyomi/plugins/video_polyfill.dart';
import 'package:hoyomi/router/index.dart';

import 'package:flutter/material.dart';
// import 'package:go_transitions/go_transitions.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initializeVideoPolyfill();

  await initializeDotEnv();

  await androidSdkIntInit();
  await initializeCert();
  await initializeFirebase();
  await initializeServices();
  await initializeFullscreen();

  runApp(MainApp());

  // register background service
  // if (XPlatform.isAndroid || XPlatform.isIOS) {
  //   ComicChanges().initializeBackgroundService();
  // ComicChanges().checkUpdateAll();
  // }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    /// Set default transition values for the entire app.
    // GoTransition.defaultCurve = Curves.easeInOut;
    // GoTransition.defaultDuration = const Duration(milliseconds: 600);
    if (androidSdkInt != null && androidSdkInt! < 29) {
      GoTransition.defaultCurve = Curves.easeInOut;
      GoTransition.defaultDuration = const Duration(milliseconds: 800);
    }

    return MaterialApp.router(
      title: 'Hoyomi',
      scaffoldMessengerKey: snackbarKey,
      theme: ThemeData(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      themeMode: ThemeMode.system,
      scrollBehavior: AppScrollBehavior(),
      routerConfig: router,
    );
  }
}
