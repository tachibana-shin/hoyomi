import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:go_transitions/go_transitions.dart';
import 'package:hoyomi/database/isar.dart';
import 'package:hoyomi/apis/show_snack_bar.dart';
import 'package:hoyomi/router/index.dart';

import 'package:flutter/material.dart';
// import 'package:go_transitions/go_transitions.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  int? androidSdkInt;
  if (Platform.isAndroid) {
    final deviceInfo = DeviceInfoPlugin();
    final androidInfo = await deviceInfo.androidInfo;

    androidSdkInt = androidInfo.version.sdkInt;
  }

  if (!kIsWeb && androidSdkInt != null && androidSdkInt < 25) {
    await _installCert();
  }
  await initializeIsar();

  runApp(MainApp(androidSdkInt: androidSdkInt));

  // register background service
  // if (Platform.isAndroid || Platform.isIOS) {
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
    late final ThemeData theme;
    late final ThemeData darkTheme;
    if (androidSdkInt != null && androidSdkInt! < 29) {
      GoTransition.defaultCurve = Curves.easeInOut;
      GoTransition.defaultDuration = const Duration(milliseconds: 600);

      theme = ThemeData(useMaterial3: true).copyWith(
          pageTransitionsTheme: const PageTransitionsTheme(builders: {
        TargetPlatform.android: GoTransitions.zoom,
        TargetPlatform.iOS: GoTransitions.cupertino,
        TargetPlatform.macOS: GoTransitions.cupertino,
      }));
      darkTheme = ThemeData.dark(useMaterial3: true).copyWith(
          pageTransitionsTheme: const PageTransitionsTheme(builders: {
        TargetPlatform.android: GoTransitions.zoom,
        TargetPlatform.iOS: GoTransitions.cupertino,
        TargetPlatform.macOS: GoTransitions.cupertino,
      }));
    } else {
      theme = ThemeData(useMaterial3: true);
      darkTheme = ThemeData.dark(useMaterial3: true);
    }

    return MaterialApp.router(
      title: 'Flutter App',
      scaffoldMessengerKey: snackbarKey,
      theme: theme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      scrollBehavior: AppScrollBehavior(),
      routerConfig: router,
    );
  }
}
