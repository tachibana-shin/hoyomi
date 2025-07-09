import 'package:video_player_media_kit/video_player_media_kit.dart';

Future<void> initializeVideoPolyfill() async {
  // if (XPlatform.isWindows || XPlatform.isLinux) {
  VideoPlayerMediaKit.ensureInitialized(
    android: true,
    iOS: true,
    macOS: true,
    windows: true,
    linux: true,
    web: true,
  );
  // }
}
