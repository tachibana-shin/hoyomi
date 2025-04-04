import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'android_sdk_int.dart';

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

Future<void> initializeCert() async {
  if (!kIsWeb && androidSdkInt != null && androidSdkInt! < 25) {
    await _installCert();
  }
}
