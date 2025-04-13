// ignore: avoid_web_libraries_in_flutter
import 'dart:html';

import 'volume_controller_stub.dart';

class VolumeController implements VolumeControllerStub {
  // 動画の音量を取得する。見つからなければデフォルト1を返す
  @override
  getVolume() async {
    final video = document.querySelector('video') as VideoElement?;
    return video?.volume.toDouble() ?? 1.0;
  }

  // 動画の音量を設定する。video タグが存在しない場合は何もしない
  @override
  setVolume(double value) async {
    final video = document.querySelector('video') as VideoElement?;
    if (video != null) {
      video.volume = value.clamp(0.0, 1.0); // 音量は 0.0 から 1.0 の範囲に制限
    }
  }

  @override
  Future<void> updateShowSystemUI(bool state) async {}
}
