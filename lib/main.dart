import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:hoyomi/database/isar.dart';
import 'package:hoyomi/router/index.dart';

import 'globals.dart';

import 'package:flutter/material.dart';
import 'package:go_transitions/go_transitions.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (!kIsWeb) await _installCert();
  await initializeIsar();

  runApp(const MainApp());

  // register background service
  // if (Platform.isAndroid || Platform.isIOS) {
  //   BookChanges().initializeBackgroundService();
  // BookChanges().checkUpdateAll();
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
  ByteData data =
      await PlatformAssetBundle().load('assets/ca/lets-encrypt-r3.pem');
  SecurityContext.defaultContext
      .setTrustedCertificatesBytes(data.buffer.asUint8List());

  if (Platform.isAndroid) {
    final deviceInfo = DeviceInfoPlugin();
    final androidInfo = await deviceInfo.androidInfo;

    if (androidInfo.version.sdkInt < 25) {
      HttpOverrides.global = _MyHttpOverrides();
    }
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
