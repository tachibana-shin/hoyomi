import 'package:device_info_plus/device_info_plus.dart';
import 'package:hoyomi/constraints/x_platform.dart';

late final int? androidSdkInt;

Future<void> androidSdkIntInit() async {
  if (XPlatform.isAndroid) {
    final deviceInfo = DeviceInfoPlugin();
    final androidInfo = await deviceInfo.androidInfo;

    androidSdkInt = androidInfo.version.sdkInt;
  } else {
    androidSdkInt = null;
  }
}
