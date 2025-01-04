import 'dart:convert';
import 'dart:core';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hls_parser/flutter_hls_parser.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:honyomi/core_services/eiga/interfaces/source_content.dart';
import 'package:honyomi/core_services/interfaces/basic_image.dart';
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
  final ValueNotifier<BasicImage?> posterNotifier;
  final Future<SourceContent> Function({required SourceVideo source})?
      fetchSourceContent;

  final double aspectRatio;

  final void Function() onBack;
  final ValueNotifier<List<type.Subtitle>> subtitlesNotifier;
  final ValueNotifier<void Function()?> onNext;
  final ValueNotifier<void Function()?> onPrev;

  const PlayerEiga({
    super.key,
    required this.titleNotifier,
    required this.subtitleNotifier,
    required this.sourceNotifier,
    required this.posterNotifier,
    required this.fetchSourceContent,
    required this.aspectRatio,
    required this.onBack,
    required this.subtitlesNotifier,
    required this.onNext,
    required this.onPrev,
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
  final ValueNotifier<VideoPlayerController?> _controller = ValueNotifier(null);
  final SubtitleController subtitleController = SubtitleController();

  final _durationAnimate = const Duration(milliseconds: 300);

  final ValueNotifier<List<_VariantMeta>> _availableResolutions =
      ValueNotifier([]);
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

  final ValueNotifier<bool> _showControls = ValueNotifier(false);
  final ValueNotifier<bool> _autoPlay = ValueNotifier(true);
  final ValueNotifier<String?> _subtitleCode = ValueNotifier(null);
  final ValueNotifier<double> _playbackSpeed = ValueNotifier(1.0);
  final ValueNotifier<String?> _qualityCode = ValueNotifier(null);
  final ValueNotifier<bool> _fullscreen = ValueNotifier(false);

  final ValueNotifier<String?> _error = ValueNotifier(null);
  final ValueNotifier<Duration> _position = ValueNotifier(Duration());
  final ValueNotifier<Duration> _duration = ValueNotifier(Duration());
  final ValueNotifier<bool> _loading = ValueNotifier(true);
  final ValueNotifier<bool> _playing = ValueNotifier(true);

  final ValueNotifier<bool> _firstLoadedSource = ValueNotifier(false);

  @override
  void initState() {
    super.initState();

    void run() {
      if (widget.sourceNotifier.value != null) {
        _setupPlayer(widget.sourceNotifier.value!);
      }
      _firstLoadedSource.value = false;
    }

    run();
    widget.sourceNotifier.addListener(run);
  }

  void _setupPlayer(SourceVideo source) async {
    _availableResolutions.value = [];

    // not function get source
    if (widget.fetchSourceContent == null) {
      final url = Uri.parse(source.src);
      _controller.value?.dispose();
      _controller.value =
          VideoPlayerController.networkUrl(url, httpHeaders: source.headers)
            ..addListener(_onPlayerValueChanged)
            ..initialize().then((_) {
              // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
              if (!_playing.value) _controller.value?.play();
            });

      final response = await get(url, headers: source.headers);
      if (response.statusCode > 299) throw response;

      if (source.type == 'hls') {
        _initializeHls(
            content: response.body, url: url, headers: source.headers);
      }

      return;
    }
    final content = await widget.fetchSourceContent!(source: source);
    final fileCache = await saveFileCache(
        content: content.content,
        path: "${sha256.convert(utf8.encode(content.content))}.m3u8");
    if (!mounted) return;

    _controller.value?.dispose();
    _controller.value =
        VideoPlayerController.file(fileCache, httpHeaders: source.headers)
          ..addListener(_onPlayerValueChanged)
          ..initialize().then((_) {
            // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
            if (!_playing.value) _controller.value?.play();
          });

    if (source.type == 'hls') {
      _initializeHls(
          content: content.content, url: content.url, headers: content.headers);
    }
  }

  DateTime _activeTime = DateTime.now();
  void _onPlayerValueChanged() {
    if (_controller.value?.value.hasError == true) {
      debugPrint(
          "[video_player]: ${_error.value = _controller.value!.value.errorDescription}");
    } else {
      _error.value = null;
    }
    _position.value = _controller.value?.value.position ?? Duration();
    _duration.value = _controller.value?.value.duration ?? Duration();
    _loading.value = _controller.value?.value.isInitialized != true ||
        _controller.value!.value.isBuffering;
    _playing.value = _controller.value?.value.isPlaying ?? _playing.value;
    _firstLoadedSource.value = true;

    if (_controller.value?.isBlank == true ||
        _controller.value?.value.isInitialized == true &&
            _controller.value?.value.isBuffering != true) {
      _activeTime = DateTime.now();
    }

    if (_activeTime.difference(DateTime.now()).inSeconds.abs() > 3) {
      _showControls.value = false;
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

      _availableResolutions.value = playlist.variants.map((variant) {
        return _VariantMeta(
            variant: variant,
            code: variant.url.toString(),
            label: variant.format.label ??
                variant.format.height?.toString() ??
                variant.format.id ??
                variant.url.toString(),
            headers: {...headers, 'referer': variant.url.toString()});
      }).toList();
      _setQualityCode(_availableResolutions.value.first.code);
    } else if (playlist is HlsMediaPlaylist) {
      // media m3u8 file
      debugPrint("[initialize_hls]: no action because is media playlist");
    }
  }

  @override
  Widget build(BuildContext context) {
    // if (_controller?.value.isInitialized != true) return SizedBox.shrink();

    return AspectRatio(
        aspectRatio: widget.aspectRatio,
        child: Stack(children: [
          ValueListenableBuilder<VideoPlayerController?>(
              valueListenable: _controller,
              builder: (context, controller, child) {
                if (controller == null) return SizedBox.shrink();

                return ValueListenableBuilder<String?>(
                    valueListenable: _qualityCode,
                    builder: (context, value, child) {
                      return GestureDetector(
                          onTap: () {
                            _showControls.value = !_showControls.value;
                            _activeTime = DateTime.now();
                          },
                          child: SubtitleWrapper(
                            enabled: value != null,
                            videoPlayerController: controller,
                            subtitleController: subtitleController,
                            subtitleStyle: SubtitleStyle(
                              textColor: Colors.white,
                              hasBorder: true,
                            ),
                            videoChild: VideoPlayer(controller),
                          ));
                    });
              }),
          ListenableBuilder(
              listenable:
                  Listenable.merge([widget.posterNotifier, _firstLoadedSource]),
              builder: (context, child) {
                if (widget.posterNotifier.value == null ||
                    _firstLoadedSource.value) {
                  return SizedBox.shrink();
                }

                return Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: BasicImage.network(widget.posterNotifier.value!.src,
                        headers: widget.posterNotifier.value!.headers,
                        fit: BoxFit.cover));
              }),
          ListenableBuilder(
              listenable: Listenable.merge([_showControls, _playing]),
              builder: (context, child) {
                bool ended = false;
                return AnimatedOpacity(
                    opacity: !_playing.value || _showControls.value ? 1.0 : 0.0,
                    duration: _durationAnimate,
                    onEnd: () => ended = true,
                    child: Visibility(
                        visible: (!_playing.value || _showControls.value)
                            ? true
                            : !ended,
                        child: GestureDetector(
                            onTap: () =>
                                _showControls.value = !_showControls.value,
                            child: Container(
                                color: Colors.black.withValues(alpha: 0.5),
                                child: Stack(children: [
                                  _buildMobileTopControls(),
                                  _buildMobileControls(),
                                  _buildIndicator(),
                                  _buildMobileBottomControls()
                                ])))));
              }),
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
              Expanded(
                  child: Row(children: [
// button back
                IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    color: Colors.white,
                    onPressed: widget.onBack),
                SizedBox(width: 8.0),
                // 2 line text
                Expanded(
                    child: Column(
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
                ))
              ])),
              Row(children: [
                IconButton(
                  icon: Icon(MaterialCommunityIcons.playlist_play),
                  color: Colors.white,
                  onPressed: () {},
                ),
                // icon subtitle
                ValueListenableBuilder(
                    valueListenable: _subtitleCode,
                    builder: (context, value, child) {
                      return IconButton(
                          icon: Icon(value == null
                              ? MaterialCommunityIcons.subtitles_outline
                              : MaterialCommunityIcons.subtitles),
                          color: Colors.white,
                          onPressed: () => value == null
                              ? _showSubtitleOptions()
                              : _setSubtitleCode(null));
                    }),
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
    return ValueListenableBuilder(
        valueListenable: _error,
        builder: (context, error, child) {
          if (error != null) {
            return Center(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                  SizedBox(width: 8.0),
                  Text(error,
                      style: Theme.of(context).textTheme.bodySmall,
                      maxLines: 2),
                  SizedBox(width: 8.0),
                ]));
          }

          return Center(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                SizedBox(width: 8.0),
                ValueListenableBuilder<void Function()?>(
                  valueListenable: widget.onPrev,
                  builder: (context, onPrev, child) {
                    return Opacity(
                        opacity: onPrev == null ? 0.5 : 1.0,
                        child: IgnorePointer(
                            ignoring: onPrev == null,
                            child: ElevatedButton(
                              onPressed: onPrev,
                              style: ElevatedButton.styleFrom(
                                  shape: CircleBorder(),
                                  padding: EdgeInsets.all(15),
                                  backgroundColor: Colors.black.withAlpha(20),
                                  shadowColor: Colors.transparent),
                              child: Icon(
                                MaterialCommunityIcons.skip_previous,
                                color: Colors.white,
                                size: 25.0,
                              ),
                            )));
                  },
                ),
                ListenableBuilder(
                  listenable: Listenable.merge([_playing, _loading]),
                  builder: (context, child) {
                    if (_loading.value) {
                      return SizedBox(
                          width: 50.0, height: 50.0, child: SizedBox.shrink());
                    }

                    return ElevatedButton(
                      onPressed: () {
                        _setPlaying(!_playing.value);
                      },
                      style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(15),
                          backgroundColor: Colors.grey.shade300.withAlpha(20),
                          shadowColor: Colors.transparent),
                      child: Icon(
                        _playing.value ? Icons.pause : Icons.play_arrow,
                        color: Colors.white,
                        size: 42.0,
                      ),
                    );
                  },
                ),
                ValueListenableBuilder<void Function()?>(
                  valueListenable: widget.onNext,
                  builder: (context, onNext, child) {
                    return Opacity(
                      opacity: onNext == null ? 0.5 : 1.0,
                      child: IgnorePointer(
                        ignoring: onNext == null,
                        child: ElevatedButton(
                          onPressed: onNext,
                          style: ElevatedButton.styleFrom(
                            shape: CircleBorder(),
                            padding: EdgeInsets.all(15),
                            backgroundColor: Colors.grey.shade300.withAlpha(20),
                            shadowColor: Colors.transparent,
                          ),
                          child: Icon(
                            MaterialCommunityIcons.skip_next,
                            color: Colors.white,
                            size: 25.0,
                          ),
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(width: 8.0),
              ]));
        });
  }

  Widget _buildIndicator() {
    return ValueListenableBuilder(
        valueListenable: _loading,
        builder: (context, value, child) {
          if (!value) return SizedBox.shrink();

          return CircularProgressIndicator(
            strokeWidth: 5.0,
            color: Colors.white,
          );
        });
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
                ValueListenableBuilder(
                  valueListenable: _position,
                  builder: (context, value, child) {
                    return Text(formatDuration(value),
                        style: TextStyle(color: Colors.white));
                  },
                ),
                ValueListenableBuilder(
                  valueListenable: _duration,
                  builder: (context, value, child) {
                    return Text(' / ${formatDuration(value)}',
                        style: TextStyle(color: Colors.grey.shade300));
                  },
                ),
              ],
            ),
            Row(mainAxisSize: MainAxisSize.min, children: [
              // full screen
              ValueListenableBuilder(
                valueListenable: _fullscreen,
                builder: (context, value, child) {
                  return IconButton(
                    icon:
                        Icon(value ? Icons.fullscreen_exit : Icons.fullscreen),
                    color: Colors.white,
                    onPressed: () => _setFullscreen(!value),
                  );
                },
              ),
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
            child: ValueListenableBuilder(
              valueListenable: _duration,
              builder: (context, duration, child) {
                return ValueListenableBuilder(
                    valueListenable: _position,
                    builder: (context, position, child) {
                      return Slider(
                        value: position.inSeconds.toDouble(),
                        min: 0.0,
                        max: duration.inSeconds.toDouble(),
                        onChanged: (value) {
                          _controller.value
                              ?.seekTo(Duration(seconds: value.toInt()));
                        },
                      );
                    });
              },
            )));
  }

  void _setFullscreen(bool value) {
    _fullscreen.value = value;

    if (value) {
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

  void _setPlaying(bool value) {
    if (value) {
      _controller.value?.play();
    } else {
      _controller.value?.pause();
    }
  }

  void _showSubtitleOptions() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        showDragHandle: true,
        builder: (context) {
          return ValueListenableBuilder(
              valueListenable: _subtitleCode,
              builder: (context, subtitleCode, child) => ListView.builder(
                    shrinkWrap: true,
                    itemCount: widget.subtitlesNotifier.value.length,
                    itemBuilder: (context, index) {
                      final item =
                          widget.subtitlesNotifier.value.elementAt(index);

                      return ListTile(
                        leading: subtitleCode == item.code
                            ? Icon(Icons.check)
                            : Text(''),
                        title: Text(item.language),
                        onTap: () {
                          Navigator.pop(context);
                          _subtitleCode.value = item.code;
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
          return ValueListenableBuilder(
              valueListenable: _playbackSpeed,
              builder: (context, playbackSpeed, child) => ListView.builder(
                    shrinkWrap: true,
                    itemCount: _playbackList.length,
                    itemBuilder: (context, index) {
                      final item = _playbackList.elementAt(index);

                      return ListTile(
                        leading: playbackSpeed == item.value
                            ? Icon(Icons.check)
                            : Text(''),
                        title: Text(item.label),
                        onTap: () {
                          Navigator.pop(context);
                          _playbackSpeed.value = item.value;
                        },
                      );
                    },
                  ));
        });
  }

  void _setQualityCode(String? value) {
    if (_availableResolutions.value.isNotEmpty) return;

    _qualityCode.value = value;

    final resolution = _availableResolutions.value.firstWhere((item) {
      return item.code == value;
    }, orElse: () => _availableResolutions.value.first);

    _setupPlayer(SourceVideo(
      src: resolution.variant.url.toString(),
      type: 'hls',
      headers: resolution.headers,
      url: resolution.variant.url,
    ));
  }

  void _showQualityOptions() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        showDragHandle: true,
        builder: (context) {
          return ValueListenableBuilder(
              valueListenable: _availableResolutions,
              builder: (context, value, child) => ListView.builder(
                    shrinkWrap: true,
                    itemCount: value.length,
                    itemBuilder: (context, index) {
                      final item = value.elementAt(index);

                      return ListTile(
                        leading: _qualityCode.value == item.code
                            ? Icon(Icons.check)
                            : Text(''),
                        title: Text(item.label),
                        onTap: () {
                          Navigator.pop(context);
                          _qualityCode.value = item.code;
                        },
                      );
                    },
                  ));
        });
  }

  void _setSubtitleCode(String? value) {
    _subtitleCode.value = value;
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
          return ValueListenableBuilder(
              valueListenable: _availableResolutions,
              builder: (context, availableResolutions, child) => ListView(
                    shrinkWrap: true,
                    children: [
                      if (availableResolutions.isNotEmpty)
                        ValueListenableBuilder(
                            valueListenable: _qualityCode,
                            builder: (context, value, child) => ListTile(
                                  leading: Icon(Icons.tune),
                                  title: Text('Quality',
                                      style: TextStyle(fontSize: 14.0)),
                                  trailing: Text(
                                      availableResolutions.firstWhere((item) {
                                        return item.code == value;
                                      },
                                          orElse: () =>
                                              availableResolutions.first).label,
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary)),
                                  onTap: () {
                                    Navigator.pop(context);
                                    _showQualityOptions();
                                  },
                                )),
                      ValueListenableBuilder(
                          valueListenable: _playbackSpeed,
                          builder: (context, value, child) => ListTile(
                                leading: Icon(Icons.speed_outlined),
                                title: Text('Playback Speed',
                                    style: TextStyle(fontSize: 14.0)),
                                trailing: Text(
                                    _playbackList.firstWhere((item) {
                                      return item.value == value;
                                    }).label,
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary)),
                                onTap: () {
                                  Navigator.pop(context);
                                  _showPlaybackOptions();
                                },
                              )),
                      ValueListenableBuilder(
                          valueListenable: _subtitleCode,
                          builder: (context, value, child) => ListTile(
                                leading: Icon(Icons.subtitles_outlined),
                                title: Text('Subtitle',
                                    style: TextStyle(fontSize: 14.0)),
                                trailing: value == null
                                    ? null
                                    : Text(
                                        widget.subtitlesNotifier.value
                                            .firstWhere((item) {
                                          return item.code == value;
                                        }).language,
                                        style: TextStyle(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .secondary)),
                                onTap: () {
                                  Navigator.pop(context);
                                  _showSubtitleOptions();
                                },
                              )),
                      ListTile(
                        leading: Icon(Icons.lock_outline),
                        title: Text('Screen Lock',
                            style: TextStyle(fontSize: 14.0)),
                        onTap: () {
                          Navigator.pop(context);
                          // Add additional functionality here
                        },
                      ),
                      ValueListenableBuilder(
                          valueListenable: _autoPlay,
                          builder: (context, value, child) => ListTile(
                                leading: Icon(Icons.autorenew_outlined),
                                title: Text('Auto Play',
                                    style: TextStyle(fontSize: 14.0)),
                                trailing: Switch(
                                  value: value,
                                  onChanged: (value) {
                                    _autoPlay.value = value;
                                  },
                                ),
                                onTap: () {
                                  _autoPlay.value = !value;
                                },
                              )),
                    ],
                  ));
        });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.value?.dispose();
  }
}
