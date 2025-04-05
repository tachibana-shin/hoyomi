import 'package:flutter_fullscreen/flutter_fullscreen.dart';
import 'package:hoyomi/constraints/x_platform.dart';

Future<void> initializeFullscreen() async {
  if (!XPlatform.isAndroid && !XPlatform.isIOS) {
    await FullScreen.ensureInitialized();
  }
}

Future<void> setFullScreen(bool value) async {
  FullScreen.setFullScreen(value);
}
