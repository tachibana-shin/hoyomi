import 'package:screen_brightness/screen_brightness.dart';

Future<void> setApplicationScreenBrightness(double brightness) async {
  await ScreenBrightness.instance.setApplicationScreenBrightness(brightness);
}

Future<double> getApplicationScreenBrightness() {
  return ScreenBrightness.instance.application;
}

Future<void> resetApplicationScreenBrightness() async {
  await ScreenBrightness.instance.resetApplicationScreenBrightness();
}
