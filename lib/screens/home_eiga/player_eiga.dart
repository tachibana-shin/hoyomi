import 'dart:convert';
import 'dart:core';
import 'dart:io';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hls_parser/flutter_hls_parser.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hoyomi/core_services/eiga/interfaces/opening_ending.dart';
import 'package:hoyomi/core_services/eiga/interfaces/source_content.dart';
import 'package:hoyomi/core_services/eiga/interfaces/watch_time_data.dart';
import 'package:hoyomi/core_services/interfaces/o_image.dart';
import 'package:hoyomi/core_services/interfaces/vtt.dart';
import 'package:hoyomi/globals.dart';
import 'package:hoyomi/transition/slide_fade_transition.dart';
import 'package:hoyomi/utils/debouncer.dart';
import 'package:hoyomi/utils/proxy_cache.dart';
import 'package:hoyomi/utils/throttler.dart';
import 'package:hoyomi/widgets/eiga/slider_eiga.dart';
import 'package:http/http.dart';
import 'package:hoyomi/utils/format_duration.dart';
import 'package:mediaquery_sizer/mediaquery_sizer.dart';
import 'package:signals/signals_flutter.dart';
import 'package:subtitle_wrapper_package/subtitle_wrapper_package.dart';
import 'package:video_player/video_player.dart';

import 'package:hoyomi/core_services/eiga/interfaces/source_video.dart';
import 'package:hoyomi/core_services/eiga/interfaces/subtitle.dart' as type;
import 'package:hoyomi/utils/save_file_cache.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

// import 'package:bitmovin_player/bitmovin_player.dart';
// import 'package:theoplayer/theoplayer.dart';

// import 'package:video_player_oneplusdream/video_player_oneplusdream.dart';
// import 'package:video_player_oneplusdream_example/cache.dart';

class PlayerEiga extends StatefulWidget {
  final ValueNotifier<String> eigaId;
  final ValueNotifier<String?> episodeId;
  final ValueNotifier<String> titleNotifier;
  final ValueNotifier<String> subtitleNotifier;
  final ValueNotifier<WatchTimeData?> watchTimeDataNotifier;
  final String sourceId;

  final ValueNotifier<SourceVideo?> sourceNotifier;
  final ValueNotifier<OImage?> posterNotifier;
  final Signal<Vtt?> thumbnailVtt;
  final Signal<OpeningEnding?> openingEndingNotifier;
  final Future<SourceContent> Function({required SourceVideo source})?
      fetchSourceContent;

  final double aspectRatio;

  final void Function() onBack;
  final void Function(bool isFullscreen) onTapPlaylist;
  final void Function({required Duration position, required Duration duration})
      onWatchTimeUpdate;
  final Signal<List<type.Subtitle>> subtitlesNotifier;
  final Signal<void Function()?> onNext;
  final Signal<void Function()?> onPrev;

  final ValueNotifier<Widget Function(BuildContext context)?> overlayNotifier;

  const PlayerEiga(
      {super.key,
      required this.eigaId,
      required this.episodeId,
      required this.titleNotifier,
      required this.subtitleNotifier,
      required this.watchTimeDataNotifier,
      required this.sourceId,
      required this.sourceNotifier,
      required this.posterNotifier,
      required this.thumbnailVtt,
      required this.openingEndingNotifier,
      required this.fetchSourceContent,
      required this.aspectRatio,
      required this.onBack,
      required this.onTapPlaylist,
      required this.onWatchTimeUpdate,
      required this.subtitlesNotifier,
      required this.onNext,
      required this.onPrev,
      required this.overlayNotifier});
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

enum _StateOpeningEnding { opening, ending, none, skip }

// https://pub.dev/packages/double_tap_player_view
// sharara
// video player widget
// video player
// djangoflow_video_player
class _PlayerEigaState extends State<PlayerEiga> with SignalsMixin {
  ///  control player
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
  late final _controller = createSignal<VideoPlayerController?>(null);
  final SubtitleController subtitleController = SubtitleController();

  final _durationAnimate = const Duration(milliseconds: 300);

  late final _availableResolutions = createListSignal<_VariantMeta>([]);
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

  late final _showControls = createSignal(false);
  late final _pauseAutoHideControls = createSignal(false);
  late final _autoPlay = createSignal(true);
  late final _subtitleCode = createSignal<String?>(null);
  late final _playbackSpeed = createSignal(1.0);
  late final _qualityCode = createSignal<String?>(null);
  late final _fullscreen = createSignal(false);

  late final _error = createSignal<String?>(null);
  late final _position = createSignal(Duration());
  late final _duration = createSignal(Duration());
  late final _loading = createSignal(true);
  late final _playing = createSignal(true);
  late final _aspectRatio = createSignal<double>(1.0);

  late final _stateOpeningEnding = createSignal(_StateOpeningEnding.none);
  late final _visibleTooltipSkipOE = createComputed(() {
    final isOpening = _stateOpeningEnding() == _StateOpeningEnding.opening;
    final visible =
        isOpening || _stateOpeningEnding() == _StateOpeningEnding.ending;

    return visible;
  });

  final ValueNotifier<bool> _firstLoadedSource = ValueNotifier(false);

  bool _needRestoreWatchTime = false;
  bool _restoredWatchTime = false;

  late Debouncer _initialDebouncer;
  late Throttler _subsequentThrottler;
  bool _firstUpdateWatchTime = true;

  @override
  void initState() {
    super.initState();

    _initialDebouncer = Debouncer(milliseconds: 7500); // 7.5
    _subsequentThrottler = Throttler(milliseconds: 30000); // 30

    _onSourceChanged();
    widget.sourceNotifier.addListener(_onSourceChanged);
    _onPauseAutoHideControlsChanged();
    createEffect(_onPauseAutoHideControlsChanged);
    _onWatchTimeChanged();
    widget.watchTimeDataNotifier.addListener(_onWatchTimeChanged);
  }

  void _onPauseAutoHideControlsChanged() {
    if (!_pauseAutoHideControls.value) {
      _activeTime = DateTime.now();
    }
  }

  void _onWatchTimeChanged() {
    final watchTime = widget.watchTimeDataNotifier.value?.watchTime;
    _firstUpdateWatchTime = false;
    if (watchTime == null) {
      _needRestoreWatchTime = false;
      _restoredWatchTime = true;
      return;
    }

    if (kDebugMode) {
      print(watchTime);
    }

    _needRestoreWatchTime = true;
    _restoredWatchTime = false;
    _controller.value?.seekTo(watchTime.position);

    showSnackBar(
        Text('Watching time restored ${formatDuration(watchTime.position)}'));
  }

  void _onSourceChanged() {
    if (widget.sourceNotifier.value != null) {
      _setupPlayer(widget.sourceNotifier.value!);
    }
    _firstLoadedSource.value = false;
  }

  void _setupPlayer(SourceVideo source) async {
    _availableResolutions.value = [];

    // not function get source
    if (widget.fetchSourceContent == null) {
      final url = Uri.parse(source.src);
      _controller.value?.dispose();
      _controller.value = VideoPlayerController.networkUrl(url,
          httpHeaders: source.headers,
          videoPlayerOptions: VideoPlayerOptions(
            allowBackgroundPlayback: true,
          ))
        ..addListener(_onPlayerValueChanged)
        ..initialize().then((_) {
          // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
          if (!_playing.value) _controller.value?.play();
        }).catchError((err) {
          debugPrint('Error: $err');
          _error.value = err + '';
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

    await ProxyCache.instance.start();

    if (!mounted) return;

    _controller.value?.dispose();
    _controller.value = VideoPlayerController.networkUrl(
        ProxyCache.instance.getUrlHttp(fileCache),
        httpHeaders: source.headers,
        videoPlayerOptions: VideoPlayerOptions(
          allowBackgroundPlayback: true,
        ))
      ..addListener(_onPlayerValueChanged)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        if (!_playing.value) _controller.value?.play();
      }).catchError((err) {
        debugPrint('Error: $err');
        _error.value = '$err';
      });

    if (source.type == 'hls') {
      _initializeHls(
          content: content.content, url: content.url, headers: content.headers);
    }
  }

  DateTime _activeTime = DateTime.now();
  void _onPlayerValueChanged() {
    if (_controller.value?.value.hasError == true) {
      WakelockPlus.disable();
      debugPrint(
          "[video_player]: ${_error.value = _controller.value!.value.errorDescription}");
    } else {
      _error.value = null;
    }

    _position.value = _controller.value?.value.position ?? _position.value;
    _duration.value = _controller.value?.value.duration ?? Duration.zero;
    _loading.value = _controller.value?.value.isInitialized != true ||
        _controller.value!.value.isBuffering;
    final playing = _controller.value?.value.isPlaying ?? _playing.value;
    if (_playing.value != playing) {
      _playing.value = playing;

      if (_playing.value) {
        WakelockPlus.enable();
      } else {
        WakelockPlus.disable();
      }
    }
    if (_aspectRatio.value != _controller.value?.value.aspectRatio) {
      _aspectRatio.value =
          _controller.value?.value.aspectRatio ?? _aspectRatio.value;
    }
    _firstLoadedSource.value = true;

    if (_needRestoreWatchTime) {
      final watchTime = widget.watchTimeDataNotifier.value?.watchTime;
      if (watchTime != null &&
          _controller.value != null &&
          _controller.value!.value.isInitialized &&
          _controller.value!.value.position > Duration.zero) {
        _controller.value!.seekTo(watchTime.position);
        _needRestoreWatchTime = false;
        _restoredWatchTime = true;
      }
    }

    if (!_needRestoreWatchTime &&
        _restoredWatchTime &&
        widget.watchTimeDataNotifier.value?.eigaId == widget.eigaId.value &&
        widget.watchTimeDataNotifier.value?.episodeId ==
            widget.episodeId.value &&
        _duration.value > Duration.zero &&
        _controller.value!.value.position > Duration.zero) {
      if (_firstUpdateWatchTime) {
        _initialDebouncer.run(() {
          widget.onWatchTimeUpdate(
              position: _position.value, duration: _duration.value);
        });
      } else {
        _subsequentThrottler.run(() {
          widget.onWatchTimeUpdate(
              position: _position.value, duration: _duration.value);
        });
      }
    }

    // if (_controller.value?.isBlank == true ||
    //    _loading.value) {
    //   _activeTime = DateTime.now();
    //   _onCanPlay = true;
    // } else {
    //   _onCanPlay = false;
    // }
    if (_pauseAutoHideControls.value) {
      _activeTime = DateTime.now();
    }

    if (_activeTime.difference(DateTime.now()).inSeconds.abs() > 3) {
      _showControls.value = false;
    }

    _updateDurationRangeOpeningEnding();
  }

  void _onTapToggleControls() {
    if (_pauseAutoHideControls.value) return;

    _showControls.value = !_showControls.value;
    if (_showControls.value) {
      _activeTime = DateTime.now();
    }
  }

  void _updateDurationRangeOpeningEnding() {
    final opEnd = widget.openingEndingNotifier();
    if (opEnd == null) return;

    final opening = opEnd.opening;
    final ending = opEnd.ending;

    final inOpening = opening == null
        ? false
        : opening.start <= _position.value && opening.end >= _position.value;
    if (inOpening) {
      if (_stateOpeningEnding.value == _StateOpeningEnding.opening ||
          _stateOpeningEnding.value == _StateOpeningEnding.skip) {
        return;
      }
      _stateOpeningEnding.value = _StateOpeningEnding.opening;
    } else if (ending == null
        ? false
        : ending.start <= _position.value && ending.end >= _position.value) {
      if (_stateOpeningEnding.value == _StateOpeningEnding.ending ||
          _stateOpeningEnding.value == _StateOpeningEnding.skip) {
        return;
      }
      _stateOpeningEnding.value = _StateOpeningEnding.ending;
    } else {
      _stateOpeningEnding.value = _StateOpeningEnding.none;
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

    return Watch(
        (context2) => _fullscreen()
            ? SizedBox.shrink()
            : Stack(children: [
                Padding(
                    padding: EdgeInsets.only(bottom: SliderEiga.thumbSize),
                    child: AspectRatio(
                        aspectRatio: widget.aspectRatio, child: _buildStack())),
                _buildMobileSliderProgress(),
              ]),
        dependencies: [_fullscreen]);
  }

  Widget _buildStack() {
    return Stack(children: [
      Positioned(
          top: 0,
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(color: Colors.black)),
      Positioned(
          top: 0,
          left: 0,
          right: 0,
          bottom: 0,
          child: Opacity(
            opacity: 0.0,
            child: GestureDetector(
              onTap: _onTapToggleControls,
              child: Container(color: Colors.black),
            ),
          )),
      GestureDetector(
          onTap: _onTapToggleControls,
          child: LayoutBuilder(
              builder: (context, constraints) => Watch((context) {
                    final controller = _controller();
                    if (controller == null) return SizedBox.shrink();

                    final qualityCode = _qualityCode();

                    final calcMaxWidth = 100.w(context);
                    // aspect = width / height => height = width / aspect
                    final calcMaxHeight = _fullscreen()
                        ? 100.h(context)
                        : calcMaxWidth / widget.aspectRatio;

                    final maxWidth = calcMaxWidth;
                    final maxHeight = calcMaxHeight;

                    final aspectRatio = _aspectRatio();

                    final aspectRatioView = maxWidth / maxHeight;
                    // try maxHeight
                    // aspect = w / h
                    // width = height * aspectRatio
                    // if with > maxWidth then width = maxWidth, height = maxWidth / aspectRatio
                    double width, height;
                    if (aspectRatioView < aspectRatio) {
                      width = maxWidth;
                      height = width / aspectRatio;
                    } else {
                      height = maxHeight;
                      width = height * aspectRatio;
                    }

                    return SubtitleWrapper(
                        enabled: qualityCode != null,
                        videoPlayerController: controller,
                        subtitleController: subtitleController,
                        subtitleStyle: SubtitleStyle(
                          textColor: Colors.white,
                          hasBorder: true,
                        ),
                        videoChild: Center(
                            child: SizedBox(
                                width: width,
                                height: height,
                                child: VideoPlayer(controller))));
                  }))),
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
                child: OImage.network(widget.posterNotifier.value!.src,
                    sourceId: widget.sourceId,
                    headers: widget.posterNotifier.value!.headers,
                    fit: BoxFit.cover));
          }),
      Watch((context) {
        return AnimatedSwitcher(
            duration: _durationAnimate,
            transitionBuilder: (child, animation) => FadeTransition(
                  opacity: animation,
                  child: child,
                ),
            child: _showControls()
                ? GestureDetector(
                    onTap: _onTapToggleControls,
                    child: Container(
                        color: Colors.black.withValues(alpha: 0.5),
                        child: Stack(children: [
                          _buildMobileTopControls(),
                          _buildMobileControls(),
                          _buildMobileBottomControls()
                        ])))
                : SizedBox.shrink());
      }, dependencies: [_showControls]),
      _buildIndicator(),
      _buildError(),
      Watch(
          (context) =>
              _fullscreen() ? _buildMobileSliderProgress() : SizedBox.shrink(),
          dependencies: [_fullscreen]),
      _buildPopupOpeningEnding(),
      _buildOverlayInherit()
    ]);
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
                    icon: Watch(
                        (context) => Transform.rotate(
                            angle: _fullscreen() ? 1.5 * pi : 0.0,
                            child: Icon(Icons.arrow_back_ios)),
                        dependencies: [_fullscreen]),
                    color: Colors.white,
                    onPressed: () {
                      if (_fullscreen.value) {
                        _setFullscreen(false);
                      } else {
                        widget.onBack();
                      }
                    }),
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
                  onPressed: () => widget.onTapPlaylist(_fullscreen.value),
                ),
                // icon subtitle
                Watch((context) {
                  final isEnabled = _availableResolutions.isNotEmpty;
                  return Opacity(
                      opacity: isEnabled ? 1.0 : 0.5,
                      child: IgnorePointer(
                          ignoring: !isEnabled,
                          child: IconButton(
                              icon: Icon(_subtitleCode() == null
                                  ? MaterialCommunityIcons.subtitles_outline
                                  : MaterialCommunityIcons.subtitles),
                              color: Colors.white,
                              onPressed: () => _subtitleCode() == null
                                  ? _showSubtitleOptions()
                                  : _setSubtitleCode(null))));
                }, dependencies: [_availableResolutions]),
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
    return Watch((context) {
      if (_error() != null) {
        return SizedBox.shrink();
      }

      return Center(
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        SizedBox(width: 8.0),
        Watch((context) {
          final onPrev = widget.onPrev();

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
        }, dependencies: [widget.onPrev]),
        Watch(
            (context) => IgnorePointer(
                ignoring: _loading(),
                child: Opacity(
                    opacity: _loading() ? 0 : 1,
                    child: ElevatedButton(
                      onPressed: () {
                        _activeTime = DateTime.now();
                        _setPlaying(!_playing());
                      },
                      style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(15),
                          backgroundColor: Colors.grey.shade300.withAlpha(20),
                          shadowColor: Colors.transparent),
                      child: Icon(
                        _playing() ? Icons.pause : Icons.play_arrow,
                        color: Colors.white,
                        size: 42.0,
                      ),
                    ))),
            dependencies: [_loading, _playing]),
        Watch((context) {
          final onNext = widget.onNext();

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
        }, dependencies: [widget.onNext]),
        SizedBox(width: 8.0),
      ]));
    });
  }

  Widget _buildIndicator() {
    return Watch((context) {
      if (!_loading()) return SizedBox.shrink();

      return Positioned(
          top: 0,
          left: 0,
          bottom: 0,
          right: 0,
          child: Center(
              child: GestureDetector(
                  onTap: () {
                    _setPlaying(!_playing.value);
                  },
                  child: CircularProgressIndicator(
                    strokeWidth: 5.0,
                    color: Colors.white,
                  ))));
    }, dependencies: [_loading]);
  }

  Widget _buildError() {
    return Watch((context) {
      final error = _error();
      if (error == null) return SizedBox.shrink();

      return Positioned(
          top: 0,
          left: 0,
          right: 0,
          bottom: 0,
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: Center(
                child: Text(error,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.white,
                        ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis),
              ))); // error
    }, dependencies: [_error]);
  }

  Widget _buildMobileBottomControls() {
    return Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Watch(
                    (context) => Text(formatDuration(_position()),
                        style: TextStyle(color: Colors.white)),
                    dependencies: [_position]),
                Watch(
                    (context) => Text(' / ${formatDuration(_duration())}',
                        style: TextStyle(color: Colors.grey.shade300)),
                    dependencies: [_duration]),
              ],
            ),
            Row(mainAxisSize: MainAxisSize.min, children: [
              // full screen
              Watch(
                  (context) => IconButton(
                        icon: Icon(_fullscreen()
                            ? Icons.fullscreen_exit
                            : Icons.fullscreen),
                        color: Colors.white,
                        onPressed: () => _setFullscreen(!_fullscreen.value),
                      ),
                  dependencies: [_fullscreen]),
            ])
          ]),
        ));
  }

  Widget _buildMobileSliderProgress() {
    return Watch(
        (context) => Positioned(
            top: 0,
            bottom: _fullscreen() ? kToolbarHeight : 0,
            left: _fullscreen() ? 16.0 : 0,
            right: _fullscreen() ? 16.0 : 0,
            child: AnimatedOpacity(
                duration: _durationAnimate,
                opacity: (_fullscreen() ? _showControls() : true) ? 1.0 : 0.0,
                child: IgnorePointer(
                    ignoring: !(_fullscreen() ? _showControls() : true),
                    child: SliderEiga(
                      progress: _position.readonly(),
                      duration: _duration.readonly(),
                      showThumb: _showControls.readonly(),
                      pauseAutoHideControls: _pauseAutoHideControls.readonly(),
                      vttThumbnail: widget.thumbnailVtt.readonly(),
                      openingEnding: widget.openingEndingNotifier.readonly(),
                      onSeek: (position) {
                        final duration = _duration.value;
                        final seek = duration * position;
                        _controller.value?.seekTo(seek);
                      },
                    )))),
        dependencies: [_showControls, _fullscreen]);
  }

  Widget _buildPopupOpeningEnding() {
    return Watch((context) {
      if (widget.openingEndingNotifier() == null) return SizedBox.shrink();

      final visible = _visibleTooltipSkipOE();

      final opening = widget.openingEndingNotifier()!.opening;
      final ending = widget.openingEndingNotifier()!.ending;

      final widgetTextSeconds = Text(
          visible
              ? '${_stateOpeningEnding() == _StateOpeningEnding.opening ? (opening!.end.inSeconds - _position.value.inSeconds).round() : (ending!.end.inSeconds - _position.value.inSeconds).round()} seconds'
              : '0 seconds',
          style: TextStyle(
            color: Color.fromRGBO(209, 213, 219, 1.0),
            fontSize: 11.0,
          ));

      return AnimatedSwitcher(
        duration: Duration(milliseconds: 444),
        transitionBuilder: (child, animation) => FadeTransition(
          opacity: animation,
          child: child,
        ),
        child: visible
            ? Positioned(
                right: 10,
                bottom: 30,
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: 12.0,
                      vertical: Platform.isWindows ? 8.0 : 2.0),
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(28, 28, 28, 0.9),
                      borderRadius: BorderRadius.circular(5.0)),
                  child: Row(mainAxisSize: MainAxisSize.min, children: [
                    Wrap(
                      alignment: WrapAlignment.center,
                      children: [
                        Text('Skip ',
                            style:
                                TextStyle(color: Colors.white, fontSize: 12.0)),
                        Text(
                            _stateOpeningEnding() == _StateOpeningEnding.opening
                                ? 'Opening'
                                : 'Ending',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12.0,
                                fontWeight: FontWeight.w500)),
                      ],
                    ),
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: 8.0)
                            .copyWith(right: 0.0),
                        width: 1.0,
                        height: 30.0,
                        color: Color.fromRGBO(255, 255, 255, 0.28)),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextButton(
                            onPressed: () {
                              if (_stateOpeningEnding() ==
                                  _StateOpeningEnding.opening) {
                                _controller.value?.seekTo(widget
                                    .openingEndingNotifier.value!.opening!.end);
                              } else {
                                _controller.value?.seekTo(widget
                                    .openingEndingNotifier.value!.ending!.end);
                              }
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('Skip (Enter)',
                                    style: TextStyle(
                                      color:
                                          Colors.white.withValues(alpha: 0.9),
                                      fontSize: 12.0,
                                    )),
                                widgetTextSeconds
                              ],
                            )),
                        InkWell(
                            onTap: () {
                              _stateOpeningEnding.value =
                                  _StateOpeningEnding.skip;
                            },
                            borderRadius: BorderRadius.circular(5.0),
                            highlightColor: Colors.black,
                            child: Icon(Icons.close,
                                size: 16.0, color: Colors.white))
                      ],
                    )
                  ]),
                ))
            : null,
      );
    }, dependencies: [_stateOpeningEnding, widget.openingEndingNotifier]);
  }

  Widget _buildOverlayInherit() {
    return ValueListenableBuilder(
        valueListenable: widget.overlayNotifier,
        builder: (context, value, child) {
          final child = AnimatedSwitcher(
              duration: _durationAnimate,
              transitionBuilder: (child, animation) =>
                  SlideFadeTransition(animation: animation, child: child),
              child: value != null ? value(context) : null);

          return Positioned(
              top: 0,
              bottom: 0,
              left: 0,
              right: 0,
              child: Stack(children: [
                if (value != null)
                  Positioned(
                      top: 0,
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          widget.overlayNotifier.value = null;
                        },
                        child: Container(color: Colors.black.withAlpha(0)),
                      )),
                child,
              ]));
        });
  }

  void _setFullscreen(bool value) {
    _fullscreen.value = value;

    if (value) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeRight,
        DeviceOrientation.landscapeLeft,
      ]);
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
      Navigator.push(
          context,
          MaterialPageRoute(
              fullscreenDialog: true,
              builder: (context) => Material(child: _buildStack())));
    } else {
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
          overlays: SystemUiOverlay.values);
      Navigator.pop(context);
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
          return Watch(
              (context) => ListView.builder(
                    shrinkWrap: true,
                    itemCount: widget.subtitlesNotifier.value.length,
                    itemBuilder: (context, index) {
                      final item =
                          widget.subtitlesNotifier.value.elementAt(index);

                      return ListTile(
                        leading: _subtitleCode() == item.code
                            ? Icon(Icons.check)
                            : Text(''),
                        title: Text(item.language),
                        onTap: () {
                          Navigator.pop(context);
                          _subtitleCode.value = item.code;
                        },
                      );
                    },
                  ),
              dependencies: [widget.subtitlesNotifier]);
        });
  }

  void _showPlaybackOptions() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        showDragHandle: true,
        builder: (context) {
          return Watch(
              (context) => ListView.builder(
                    shrinkWrap: true,
                    itemCount: _playbackList.length,
                    itemBuilder: (context, index) {
                      final item = _playbackList.elementAt(index);

                      return ListTile(
                        leading: _playbackSpeed() == item.value
                            ? Icon(Icons.check)
                            : Text(''),
                        title: Text(item.label),
                        onTap: () {
                          Navigator.pop(context);
                          _playbackSpeed.value = item.value;
                        },
                      );
                    },
                  ),
              dependencies: [_playbackSpeed]);
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
          return Watch(
              (context) => ListView.builder(
                    shrinkWrap: true,
                    itemCount: _availableResolutions.length,
                    itemBuilder: (context, index) {
                      final item = _availableResolutions.elementAt(index);

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
                  ),
              dependencies: [_availableResolutions]);
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
          return Watch(
              (context) => ListView(
                    shrinkWrap: true,
                    children: [
                      if (_availableResolutions.isNotEmpty)
                        ListTile(
                          leading: Icon(Icons.tune),
                          title:
                              Text('Quality', style: TextStyle(fontSize: 14.0)),
                          trailing: Text(
                              _availableResolutions.firstWhere((item) {
                                return item.code == _qualityCode.value;
                              },
                                  orElse: () =>
                                      _availableResolutions.first).label,
                              style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.secondary)),
                          onTap: () {
                            Navigator.pop(context);
                            _showQualityOptions();
                          },
                        ),
                      ListTile(
                        leading: Icon(Icons.speed_outlined),
                        title: Text('Playback Speed',
                            style: TextStyle(fontSize: 14.0)),
                        trailing: Text(
                            _playbackList.firstWhere((item) {
                              return item.value == _playbackSpeed.value;
                            }).label,
                            style: TextStyle(
                                color:
                                    Theme.of(context).colorScheme.secondary)),
                        onTap: () {
                          Navigator.pop(context);
                          _showPlaybackOptions();
                        },
                      ),
                      Opacity(
                          opacity: _availableResolutions.isNotEmpty ? 1.0 : 0.5,
                          child: IgnorePointer(
                              ignoring: !_availableResolutions.isNotEmpty,
                              child: ListTile(
                                leading: Icon(Icons.subtitles_outlined),
                                title: Text('Subtitle',
                                    style: TextStyle(fontSize: 14.0)),
                                trailing: _subtitleCode() == null
                                    ? null
                                    : Text(
                                        widget.subtitlesNotifier.value
                                            .firstWhere((item) {
                                          return item.code ==
                                              _subtitleCode.value;
                                        }).language,
                                        style: TextStyle(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .secondary)),
                                onTap: () {
                                  Navigator.pop(context);
                                  _showSubtitleOptions();
                                },
                              ))),
                      ListTile(
                        leading: Icon(Icons.lock_outline),
                        title: Text('Screen Lock',
                            style: TextStyle(fontSize: 14.0)),
                        onTap: () {
                          Navigator.pop(context);
                          // Add additional functionality here
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.autorenew_outlined),
                        title:
                            Text('Auto Play', style: TextStyle(fontSize: 14.0)),
                        trailing: Switch(
                          value: _autoPlay(),
                          onChanged: (value) {
                            _autoPlay.value = value;
                          },
                        ),
                        onTap: () {
                          _autoPlay.value = !_autoPlay();
                        },
                      ),
                    ],
                  ),
              dependencies: [_availableResolutions]);
        });
  }

  @override
  void dispose() {
    _controller.value?.dispose();

    widget.sourceNotifier.removeListener(_onSourceChanged);
    widget.watchTimeDataNotifier.removeListener(_onWatchTimeChanged);

    super.dispose();
  }
}
