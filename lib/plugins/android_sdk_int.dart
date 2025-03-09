import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';

late final int? androidSdkInt;

Future<void> androidSdkIntInit() async {
  if (Platform.isAndroid) {
    final deviceInfo = DeviceInfoPlugin();
    final androidInfo = await deviceInfo.androidInfo;

    androidSdkInt = androidInfo.version.sdkInt;
  } else {
    androidSdkInt = null;
  }
}
