import 'package:go_router/go_router.dart';
import 'package:go_transitions/go_transitions.dart';
import 'package:hoyomi/apis/show_snack_bar.dart';
import 'package:hoyomi/constraints/x_platform.dart';
import 'package:hoyomi/plugins/android_sdk_int.dart';
import 'package:hoyomi/plugins/firebase.dart';
import 'package:hoyomi/plugins/fullscreen.dart';
import 'package:hoyomi/plugins/init_services.dart';
import 'package:hoyomi/plugins/install_cert.dart';
import 'package:hoyomi/plugins/video_polyfill.dart';
import 'package:hoyomi/router/index.dart';

import 'package:flutter/material.dart';

// ignore: depend_on_referenced_packages
import 'package:flutter_web_plugins/url_strategy.dart';

import 'plugins/create_dio_client.dart';
import 'stores.dart';

// import 'package:go_transitions/go_transitions.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initializeVideoPolyfill();

  await androidSdkIntInit();
  await initializeCert();
  await initializeDioClient();
  await initializeFirebase();
  await initializeServices();
  await initializeFullscreen();
  await initializeStore();

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
    if ((!XPlatform.isAndroid && !XPlatform.isIOS) ||
        androidSdkInt != null && androidSdkInt! < 29) {
      GoTransition.defaultCurve = Curves.easeInOut;
      GoTransition.defaultDuration = const Duration(milliseconds: 800);
    }

    if (XPlatform.isWeb) {
      usePathUrlStrategy();
      GoRouter.optionURLReflectsImperativeAPIs = true;
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
