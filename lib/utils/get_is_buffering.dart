import 'package:flutter/foundation.dart';
import 'package:video_player/video_player.dart';

bool getIsBuffering(VideoPlayerController controller) {
  if (defaultTargetPlatform == TargetPlatform.android) {
    if (controller.value.isBuffering) {
      final position = controller.value.position.inMilliseconds;

      if (position >= controller.value.duration.inMilliseconds) return false;

      return position >=
          (controller.value.buffered.lastOrNull?.end.inMilliseconds ?? -1);
    }
  }

  return controller.value.isBuffering;
}
