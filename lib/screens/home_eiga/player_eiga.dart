import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hugeicons/hugeicons.dart';
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
  VideoPlayerController? _controller;

  final _durationAnimate = const Duration(milliseconds: 300);
  final _nextEpisode = "";
  final _prevEpisode = "";

  final bool _showControls = true;

  @override
  void initState() {
    super.initState();

    // saveFileCache(content: b64, path: "test.m3u8").then((file) {
    //   if (!mounted) return;

    // _controller = VideoPlayerController.networkUrl(
    //     Uri.parse('https://download.samplelib.com/mp4/sample-30s.mp4'),
    //     httpHeaders: {'referer': 'https://animevietsub.tv/'})
    //   ..initialize().then((_) {
    //     // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
    //     setState(() {});
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    // if (_controller?.value.isInitialized != true) return SizedBox.shrink();

    return AspectRatio(
        aspectRatio: 16 / 9,
        child: Stack(children: [
          // VideoPlayer(_controller!),
          Container(color: Colors.white),
          AnimatedOpacity(
              opacity: _showControls ? 1.0 : 0.0,
              duration: _durationAnimate,
              child: Container(
                  color: Colors.black.withOpacity(0.5),
                  child: Stack(children: [
                    _buildMobileTopControls(),
                    _buildMobileControls(),
                    _buildMobileBottomControls()
                  ]))),
          _buildMobileSliderProgress()
        ]));
  }

  Widget _buildMobileTopControls() {
    return Positioned(
        top: 0,
        left: 0,
        right: 0,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [
// button back
                IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(width: 8.0),
                // 2 line text
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Title',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500)),
                    Text('Episode',
                        style: TextStyle(
                            color: Colors.grey.shade300, fontSize: 14.0))
                  ],
                )
              ]),
              Row(children: [
                IconButton(
                  icon: Icon(MaterialCommunityIcons.playlist_play),
                  color: Colors.white,
                  onPressed: () {},
                ),
                // icon subtitle
                IconButton(
                  icon: Icon(MaterialCommunityIcons.subtitles_outline),
                  color: Colors.white,
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        showDragHandle: true,
                        builder: (context) {
                          return ListView(
                            shrinkWrap: true,
                            children: [
                              ListTile(
                                leading: Icon(Icons.language_outlined),
                                title: Text('English'),
                                onTap: () {
                                  Navigator.pop(context);
                                },
                              ),
                              ListTile(
                                leading: Icon(Icons.language_outlined),
                                title: Text('Vietnamese'),
                                onTap: () {
                                  Navigator.pop(context);
                                },
                              ),
                              ListTile(
                                leading: Icon(Icons.subtitles_outlined),
                                title: Text('Subtitle'),
                                onTap: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          );
                        });
                  },
                ),
                // icon settings
                IconButton(
                  icon: Icon(Icons.settings_outlined),
                  color: Colors.white,
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        showDragHandle: true,
                        builder: (context) {
                          return ListView(
                            shrinkWrap: true,
                            children: [
                              ListTile(
                                leading: Icon(Icons.tune),
                                title: Text('Quality',
                                    style: TextStyle(fontSize: 14.0)),
                                onTap: () {
                                  Navigator.pop(context);
                                },
                              ),
                              ListTile(
                                leading: Icon(Icons.speed_outlined),
                                title: Text('Playback Speed',
                                    style: TextStyle(fontSize: 14.0)),
                                onTap: () {
                                  Navigator.pop(context);
                                },
                              ),
                              ListTile(
                                leading: Icon(Icons.subtitles_outlined),
                                title: Text('Subtitle',
                                    style: TextStyle(fontSize: 14.0)),
                                onTap: () {
                                  Navigator.pop(context);
                                },
                              ),
                              ListTile(
                                leading: Icon(Icons.lock_outline),
                                title: Text('Screen Lock',
                                    style: TextStyle(fontSize: 14.0)),
                                onTap: () {
                                  Navigator.pop(context);
                                },
                              ),
                              ListTile(
                                leading: Icon(Icons.autorenew_outlined),
                                title: Text('Auto Play',
                                    style: TextStyle(fontSize: 14.0)),
                                onTap: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          );
                        });
                  },
                ),
              ])
            ],
          ),
        ));
  }

  Widget _buildMobileControls() {
    return Center(
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      SizedBox(width: 8.0),
      Opacity(
          opacity: _prevEpisode == null ? 0.5 : 1.0,
          child: IgnorePointer(
              ignoring: _prevEpisode == null,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(15),
                    backgroundColor: Colors.black.withOpacity(0.3),
                    shadowColor: Colors.transparent),
                child: Icon(
                  MaterialCommunityIcons.skip_previous,
                  color: Colors.white,
                  size: 25.0,
                ),
              ))),
      ElevatedButton(
        onPressed: () {
          setState(() {
            _playing = !_playing;
          });
        },
        style: ElevatedButton.styleFrom(
            shape: CircleBorder(),
            padding: EdgeInsets.all(15),
            backgroundColor: Colors.black.withOpacity(0.3),
            shadowColor: Colors.transparent),
        child: Icon(
          _playing ? Icons.pause : Icons.play_arrow,
          color: Colors.white,
          size: 42.0,
        ),
      ),
      Opacity(
          opacity: _nextEpisode == null ? 0.5 : 1.0,
          child: IgnorePointer(
              ignoring: _nextEpisode == null,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(14),
                    backgroundColor: Colors.black.withOpacity(0.3),
                    shadowColor: Colors.transparent),
                child: Icon(
                  MaterialCommunityIcons.skip_next,
                  color: Colors.white,
                  size: 25.0,
                ),
              ))),
      SizedBox(width: 8.0),
    ]));
  }

  Widget _buildMobileBottomControls() {
    return Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('00:00', style: TextStyle(color: Colors.white)),
                Text(' / 00:00', style: TextStyle(color: Colors.grey.shade300)),
              ],
            ),
            Row(mainAxisSize: MainAxisSize.min, children: [
              // full screen
              IconButton(
                icon: Icon(
                    _fullscreen ? Icons.fullscreen_exit : Icons.fullscreen),
                color: Colors.white,
                onPressed: () => setState(() {
                  _fullscreen = !_fullscreen;
                }),
              )
            ])
          ]),
        ));
  }

  Widget _buildMobileSliderProgress() {
    return Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: SliderTheme(
          data: SliderTheme.of(context).copyWith(
            trackHeight: 3.0,
            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 6.0),
            overlayShape: RoundSliderOverlayShape(overlayRadius: 0.0),
            activeTrackColor: Colors.red,
            inactiveTrackColor: Colors.white.withOpacity(0.5),
            thumbColor: Colors.red,
            overlayColor: Colors.red.withOpacity(0.2),
            thumbSelector:
                (textDirection, values, tapValue, thumbSize, trackSize, dx) {
              return Thumb.end;
            },
          ),
          child: Slider(
            value: _controller?.value.position.inSeconds.toDouble() ?? 0.0,
            min: 0.0,
            max: _controller?.value.duration.inSeconds.toDouble() ?? 1.0,
            onChanged: (value) {
              setState(() {
                _controller?.seekTo(Duration(seconds: value.toInt()));
              });
            },
          ),
        ));
  }

  bool get _playing =>
      _controller?.value.isInitialized == true && _controller!.value.isPlaying;
  set _playing(bool value) {
    if (value) {
      _controller!.play();
    } else {
      _controller!.pause();
    }
  }

  bool _$fullscreen = false;
  bool get _fullscreen => _$fullscreen;
  set _fullscreen(bool value) {
    _$fullscreen = value;

    if (_$fullscreen) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeRight,
        DeviceOrientation.landscapeLeft,
      ]);
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    } else {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
          overlays: SystemUiOverlay.values);
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
}
