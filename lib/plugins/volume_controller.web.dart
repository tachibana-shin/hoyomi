import 'package:web/web.dart';

// 動画の音量を取得する。見つからなければデフォルト1を返す
@override
Future<double?> getVolume() async {
  final video = document.querySelector('video') as HTMLVideoElement?;
  return video?.volume.toDouble() ?? 1.0;
}

// 動画の音量を設定する。video タグが存在しない場合は何もしない
@override
Future<void> setVolume(double value) async {
  final video = document.querySelector('video') as HTMLVideoElement?;
  if (video != null) {
    video.volume = value.clamp(0.0, 1.0); // 音量は 0.0 から 1.0 の範囲に制限
  }
}

@override
Future<void> updateShowSystemUI(bool state) async {}
