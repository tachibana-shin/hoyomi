import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:go_transitions/go_transitions.dart';
import 'package:hoyomi/apis/show_snack_bar.dart';
import 'package:hoyomi/plugins/android_sdk_int.dart';
import 'package:hoyomi/plugins/dot_env.dart';
import 'package:hoyomi/plugins/firebase.dart';
import 'package:hoyomi/plugins/init_services.dart';
import 'package:hoyomi/router/index.dart';

import 'package:flutter/material.dart';
// import 'package:go_transitions/go_transitions.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDotEnv();

  await androidSdkIntInit();

  if (!kIsWeb && androidSdkInt != null && androidSdkInt! < 25) {
    await _installCert();
  }
  await initializeFirebase();
  await initializeServices();

  runApp(MainApp(androidSdkInt: androidSdkInt));

  // register background service
  // if (XPlatform.isAndroid || XPlatform.isIOS) {
  //   ComicChanges().initializeBackgroundService();
  // ComicChanges().checkUpdateAll();
  // }
}

class _MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

Future<void> _installCert() async {
  ByteData data = await PlatformAssetBundle().load(
    'assets/ca/lets-encrypt-r3.pem',
  );
  SecurityContext.defaultContext.setTrustedCertificatesBytes(
    data.buffer.asUint8List(),
  );

  HttpOverrides.global = _MyHttpOverrides();
}

class MainApp extends StatelessWidget {
  final int? androidSdkInt;

  const MainApp({super.key, required this.androidSdkInt});

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
      title: 'Flutter App',
      scaffoldMessengerKey: snackbarKey,
      theme: ThemeData(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      themeMode: ThemeMode.system,
      scrollBehavior: AppScrollBehavior(),
      routerConfig: router,
    );
  }
}
