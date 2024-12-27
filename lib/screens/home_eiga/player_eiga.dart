import 'dart:convert';
import 'dart:core';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hls_parser/flutter_hls_parser.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:honyomi/core_services/eiga/interfaces/source_content.dart';
import 'package:http/http.dart';
import 'package:play_video/function/format_duration.dart';
import 'package:subtitle_wrapper_package/subtitle_wrapper_package.dart';
import 'package:video_player/video_player.dart';

import 'package:honyomi/core_services/eiga/interfaces/source_video.dart';
import 'package:honyomi/core_services/eiga/interfaces/subtitle.dart' as type;
import 'package:honyomi/utils/save_file_cache.dart';

// import 'package:bitmovin_player/bitmovin_player.dart';
// import 'package:theoplayer/theoplayer.dart';

// import 'package:video_player_oneplusdream/video_player_oneplusdream.dart';
// import 'package:video_player_oneplusdream_example/cache.dart';

class PlayerEiga extends StatefulWidget {
  final ValueNotifier<String> titleNotifier;
  final ValueNotifier<String> subtitleNotifier;

  final ValueNotifier<SourceVideo?> sourceNotifier;
  final Future<SourceContent> Function({required SourceVideo source})? fetchSourceContent;

  final void Function() onBack;
  final ValueNotifier<List<type.Subtitle>> subtitlesNotifier;
  final void Function()? onNext;
  final void Function()? onPrev;

  const PlayerEiga({
    super.key,
    required this.titleNotifier,
    required this.subtitleNotifier,
    required this.sourceNotifier,
    this.fetchSourceContent,
    required this.onBack,
    required this.subtitlesNotifier,
    this.onNext,
    this.onPrev,
  });
  @override
  State<PlayerEiga> createState() => _PlayerEigaState();
}

class _VariantMeta {
  final Variant variant;
  final String code;
  final String label;
  final Map<String, String> headers;

  _VariantMeta(
      {required this.variant,
      required this.code,
      required this.label,
      required this.headers});
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
  final SubtitleController subtitleController = SubtitleController();

  final _durationAnimate = const Duration(milliseconds: 300);

  List<_VariantMeta> _availableResolutions = [];
  final _playbackList = const [
    (value: 0.25, label: '0.25x'),
    (value: 0.5, label: '0.5x'),
    (value: 0.75, label: '0.75x'),
    (value: 1.0, label: 'Normal'),
    (value: 1.25, label: '1.25x'),
    (value: 1.5, label: '1.5x'),
    (value: 1.75, label: '1.75x'),
    (value: 2.0, label: '2x'),
  ];

  final bool _showControls = true;
  bool _autoPlay = false;
  String? _$subtitleCode;
  double _playbackSpeed = 1.0;
  String? _$qualityCode;
  bool _$fullscreen = false;

  @override
  void initState() {
    super.initState();

    void run() {
      if (widget.sourceNotifier.value != null) {
        _setupPlayer(widget.sourceNotifier.value!);
      }
    }

    run();
    widget.sourceNotifier.addListener(run);
  }

  void _setupPlayer(SourceVideo source) async {
    _availableResolutions = [];

    // not function get source
    if (widget.fetchSourceContent == null) {
      final url = Uri.parse(source.src);
      _controller =
          VideoPlayerController.networkUrl(url, httpHeaders: source.headers)
            ..initialize().then((_) {
              // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
              setState(() {});
            });

      final response = await get(url, headers: source.headers);
      if (response.statusCode > 299) throw response;

      if (source.type == 'hls') {
        _initializeHls(
            content: response.body, url: url, headers: source.headers);
      }

      return;
    }

    setState(() {});

    final content = await widget.fetchSourceContent!(source: source);
    final fileCache = await saveFileCache(
        content: content.content,
        path: "${sha256.convert(utf8.encode(content.content))}.m3u8");
    if (!mounted) return;

    _controller =
        VideoPlayerController.file(fileCache, httpHeaders: source.headers)
          ..initialize().then((_) {
            // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
            setState(() {});
          });

    if (source.type == 'hls') {
      _initializeHls(
          content: content.content, url: content.url, headers: content.headers);
    }
  }

  Future<void> _initializeHls(
      {required String content,
      required Uri url,
      required Map<String, String> headers}) async {
    final playlist = await HlsPlaylistParser.create().parseString(url, content);

    if (playlist is HlsMasterPlaylist) {
      // master m3u8 file
      // no action
      for (var variant in playlist.variants) {
        debugPrint("[initialize_hls]: variant: ${variant.url}");
      }

      if (playlist.variants.isEmpty) return;

      _availableResolutions = playlist.variants.map((variant) {
        return _VariantMeta(
            variant: variant,
            code: variant.url.toString(),
            label: variant.format.label ??
                variant.format.height?.toString() ??
                variant.format.id ??
                variant.url.toString(),
            headers: {...headers, 'referer': variant.url.toString()});
      }).toList();
      _$qualityCode = _availableResolutions.first.code;
      setState(() {});
    } else if (playlist is HlsMediaPlaylist) {
      // media m3u8 file
      debugPrint("[initialize_hls]: no action because is media playlist");
    }
  }

  @override
  Widget build(BuildContext context) {
    // if (_controller?.value.isInitialized != true) return SizedBox.shrink();

    return AspectRatio(
        aspectRatio: 16 / 9,
        child: _controller == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Stack(children: [
                SubtitleWrapper(
                  enabled: _subtitleCode != null,
                  videoPlayerController: _controller!,
                  subtitleController: subtitleController,
                  subtitleStyle: SubtitleStyle(
                    textColor: Colors.white,
                    hasBorder: true,
                  ),
                  videoChild: VideoPlayer(_controller!),
                ),
                AnimatedOpacity(
                    opacity: _showControls ? 1.0 : 0.0,
                    duration: _durationAnimate,
                    child: Container(
                        color: Colors.black.withValues(alpha: 0.5),
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
                    onPressed: widget.onBack),
                SizedBox(width: 8.0),
                // 2 line text
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ValueListenableBuilder(
                        valueListenable: widget.titleNotifier,
                        builder: (context, value, child) => Text(value,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500))),
                    ValueListenableBuilder(
                        valueListenable: widget.subtitleNotifier,
                        builder: (context, value, child) => Text(value,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.grey.shade300, fontSize: 14.0)))
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
                  icon: Icon(_subtitleCode == null
                      ? MaterialCommunityIcons.subtitles_outline
                      : MaterialCommunityIcons.subtitles),
                  color: Colors.white,
                  onPressed: () => _subtitleCode == null
                      ? _showSubtitleOptions()
                      : setState(() => _subtitleCode = null),
                ),
                // icon settings
                IconButton(
                    icon: Icon(Icons.settings_outlined),
                    color: Colors.white,
                    onPressed: _showSettingOptions),
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
          opacity: widget.onPrev == null ? 0.5 : 1.0,
          child: IgnorePointer(
              ignoring: widget.onPrev == null,
              child: ElevatedButton(
                onPressed: widget.onPrev,
                style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(15),
                    backgroundColor: Colors.black.withValues(alpha: 0.3),
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
            backgroundColor: Colors.black.withValues(alpha: 0.3),
            shadowColor: Colors.transparent),
        child: Icon(
          _playing ? Icons.pause : Icons.play_arrow,
          color: Colors.white,
          size: 42.0,
        ),
      ),
      Opacity(
          opacity: widget.onNext == null ? 0.5 : 1.0,
          child: IgnorePointer(
              ignoring: widget.onNext == null,
              child: ElevatedButton(
                onPressed: widget.onNext,
                style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(14),
                    backgroundColor: Colors.black.withValues(alpha: 0.3),
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
                Text(formatDuration(_controller!.value.position),
                    style: TextStyle(color: Colors.white)),
                Text(' / ${formatDuration(_controller!.value.duration)}',
                    style: TextStyle(color: Colors.grey.shade300)),
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
            inactiveTrackColor: Colors.white.withValues(alpha: 0.5),
            thumbColor: Colors.red,
            overlayColor: Colors.red.withValues(alpha: 0.2),
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

  void _showSubtitleOptions() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        showDragHandle: true,
        builder: (context) {
          return StatefulBuilder(
              builder: (BuildContext context, setState2) => ListView.builder(
                    shrinkWrap: true,
                    itemCount: widget.subtitlesNotifier.value.length,
                    itemBuilder: (context, index) {
                      final item =
                          widget.subtitlesNotifier.value.elementAt(index);

                      return ListTile(
                        leading: _subtitleCode == item.code
                            ? Icon(Icons.check)
                            : Text(''),
                        title: Text(item.language),
                        onTap: () {
                          Navigator.pop(context);
                          setState(() {
                            setState2(() {
                              _subtitleCode = item.code;
                            });
                          });
                        },
                      );
                    },
                  ));
        });
  }

  void _showPlaybackOptions() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        showDragHandle: true,
        builder: (context) {
          return StatefulBuilder(
              builder: (BuildContext context, setState) => ListView.builder(
                    shrinkWrap: true,
                    itemCount: _playbackList.length,
                    itemBuilder: (context, index) {
                      final item = _playbackList.elementAt(index);

                      return ListTile(
                        leading: _playbackSpeed == item.value
                            ? Icon(Icons.check)
                            : Text(''),
                        title: Text(item.label),
                        onTap: () {
                          Navigator.pop(context);
                          setState(() {
                            _playbackSpeed = item.value;
                          });
                        },
                      );
                    },
                  ));
        });
  }

  String? get _qualityCode => _$qualityCode;
  set _qualityCode(String? value) {
    if (_availableResolutions.isNotEmpty) return;

    _$qualityCode = value;

    final resolution = _availableResolutions.firstWhere((item) {
      return item.code == value;
    }, orElse: () => _availableResolutions[0]);

    _setupPlayer(SourceVideo(
      src: resolution.variant.url.toString(),
      type: 'hls',
      headers: resolution.headers,
    ));
  }

  void _showQualityOptions() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        showDragHandle: true,
        builder: (_) {
          return StatefulBuilder(
              builder: (BuildContext context, setState) => ListView.builder(
                    shrinkWrap: true,
                    itemCount: _availableResolutions.length,
                    itemBuilder: (_, index) {
                      final item = _availableResolutions.elementAt(index);

                      return ListTile(
                        leading: _qualityCode == item.code
                            ? Icon(Icons.check)
                            : Text(''),
                        title: Text(item.label),
                        onTap: () {
                          Navigator.pop(context);
                          setState(() {
                            _qualityCode = item.code;
                          });
                        },
                      );
                    },
                  ));
        });
  }

  String? get _subtitleCode => _$subtitleCode;
  set _subtitleCode(String? value) {
    _$subtitleCode = value;
    if (value != null) {
      subtitleController.updateSubtitleUrl(
          url: widget.subtitlesNotifier.value.firstWhere((item) {
        return item.code == value;
      }).url);
    }
  }

  void _showSettingOptions() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        showDragHandle: true,
        builder: (context) {
          return ListView(
            shrinkWrap: true,
            children: [
              if (_availableResolutions.isNotEmpty)
                ListTile(
                  leading: Icon(Icons.tune),
                  title: Text('Quality', style: TextStyle(fontSize: 14.0)),
                  trailing: Text(
                      _availableResolutions.firstWhere((item) {
                        return item.code == _qualityCode;
                      }, orElse: () => _availableResolutions[0]).label,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary)),
                  onTap: () {
                    Navigator.pop(context);
                    _showQualityOptions();
                  },
                ),
              ListTile(
                leading: Icon(Icons.speed_outlined),
                title: Text('Playback Speed', style: TextStyle(fontSize: 14.0)),
                trailing: Text(
                    _playbackList.firstWhere((item) {
                      return item.value == _playbackSpeed;
                    }).label,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary)),
                onTap: () {
                  Navigator.pop(context);
                  _showPlaybackOptions();
                },
              ),
              ListTile(
                leading: Icon(Icons.subtitles_outlined),
                title: Text('Subtitle', style: TextStyle(fontSize: 14.0)),
                trailing: _subtitleCode == null
                    ? null
                    : Text(
                        widget.subtitlesNotifier.value.firstWhere((item) {
                          return item.code == _subtitleCode;
                        }).language,
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary)),
                onTap: () {
                  Navigator.pop(context);
                  _showSubtitleOptions();
                },
              ),
              ListTile(
                leading: Icon(Icons.lock_outline),
                title: Text('Screen Lock', style: TextStyle(fontSize: 14.0)),
                onTap: () {
                  Navigator.pop(context);
                  // Add additional functionality here
                },
              ),
              StatefulBuilder(
                  builder: (BuildContext context, setState) => ListTile(
                        leading: Icon(Icons.autorenew_outlined),
                        title:
                            Text('Auto Play', style: TextStyle(fontSize: 14.0)),
                        trailing: Switch(
                          value: _autoPlay,
                          onChanged: (value) {
                            setState(() {
                              _autoPlay = value;
                            });
                          },
                        ),
                        onTap: () => setState(() {
                          _autoPlay = !_autoPlay;
                        }),
                      )),
            ],
          );
        });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
}
