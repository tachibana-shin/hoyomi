import 'package:flutter/material.dart';
import 'package:honyomi/screens/home_eiga/im.dart';
import 'package:honyomi/utils/save_file_cache.dart';
import 'package:video_player/video_player.dart';

// import 'package:bitmovin_player/bitmovin_player.dart';
// import 'package:theoplayer/theoplayer.dart';

// import 'package:video_player_oneplusdream/video_player_oneplusdream.dart';
// import 'package:video_player_oneplusdream_example/cache.dart';

class PlayerEiga extends StatefulWidget {
  const PlayerEiga({super.key});
  @override
  State<PlayerEiga> createState() => _PlayerEigaState();
}

// https://pub.dev/packages/double_tap_player_view
// sharara
// video player widget
// video player
// djangoflow_video_player
class _PlayerEigaState extends State<PlayerEiga> {
  /// Basic control player
//  late final ShararaVideoPlayerController controller;
//   @override
//   void initState() {
//     controller = ShararaVideoPlayerController.networkUrl(Uri.parse("https://sample-files-online.com/samples/countdownload/535"));
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return AspectRatio(aspectRatio: 16/9,
//     child: ShararaVideoPlayer(
//         controller: controller
//     ));
//   }

  /// Like <video>
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();

    saveFileCache(content: b64, path: "test.m3u8").then((file) {
      _controller = VideoPlayerController.file(file,
          httpHeaders: {'referer': 'https://animevietsub.tv/'})
        ..initialize().then((_) {
          // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
          setState(() {});
        });
    });
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: Stack(children: [
              VideoPlayer(_controller),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(_controller.value.isPlaying
                          ? Icons.pause
                          : Icons.play_arrow),
                      onPressed: () {
                        setState(() {
                          if (_controller.value.isPlaying) {
                            _controller.pause();
                          } else {
                            _controller.play();
                          }
                        });
                      },
                    ),
                    Text(
                      '${_controller.value.position.inSeconds}/${_controller.value.duration.inSeconds}',
                      style: TextStyle(color: Colors.white),
                    ),
                    Expanded(
                      child: Slider(
                        value: _controller.value.position.inSeconds.toDouble(),
                        min: 0,
                        max: _controller.value.duration.inSeconds.toDouble(),
                        onChanged: (value) {
                          _controller.seekTo(Duration(seconds: value.toInt()));
                        },
                      ),
                    ),
                  ],
                ),
              )
            ]))
        : Container();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
