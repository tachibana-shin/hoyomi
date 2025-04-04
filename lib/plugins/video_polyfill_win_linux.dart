import 'package:hoyomi/constraints/x_platform.dart';
import 'package:video_player_media_kit/video_player_media_kit.dart';

Future<void> initializeVideoPolyfill() async {
  if (XPlatform.isWindows || XPlatform.isLinux) {
    VideoPlayerMediaKit.ensureInitialized(
      windows: XPlatform.isWindows,
      linux: XPlatform.isLinux,
    );
  }
}
