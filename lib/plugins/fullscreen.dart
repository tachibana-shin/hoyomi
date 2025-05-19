import 'package:flutter_fullscreen/flutter_fullscreen.dart';
import 'package:fullscreen_window/fullscreen_window.dart';
import 'package:hoyomi/constraints/x_platform.dart';

Future<void> initializeFullscreen() async {
  if (!XPlatform.isAndroid && !XPlatform.isIOS) {
    await FullScreen.ensureInitialized();
  }
}

Future<void> setFullScreen(bool value) async {
  if (XPlatform.isWindows) {
    FullScreenWindow.setFullScreen(value);
  } else {
    FullScreen.setFullScreen(value);
  }
}
