// Fullscreen mode fixed. Thanks for @Nandakishor Dhanaji Valakunde
// StackOverflow: https://stackoverflow.com/a/67961757

import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hls_parser/flutter_hls_parser.dart';
import 'package:get/get.dart' hide Response;
import 'package:go_router/go_router.dart';
import 'package:hoyomi/constraints/x_platform.dart';
import 'package:hoyomi/controller/general_settings_controller.dart';
import 'package:hoyomi/core_services/eiga/ab_eiga_service.dart';
import 'package:hoyomi/core_services/eiga/interfaces/main.dart' hide Subtitle;
import 'package:hoyomi/core_services/eiga/mixin/eiga_watch_time_mixin.dart';
import 'package:hoyomi/core_services/exception/user_not_found_exception.dart';
import 'package:hoyomi/apis/show_snack_bar.dart';
import 'package:hoyomi/database/scheme/general_settings.dart';
import 'package:hoyomi/logic/search_language.dart';
import 'package:hoyomi/plugins/fullscreen.dart';
import 'package:hoyomi/plugins/volume_controller.dart';
import 'package:hoyomi/utils/debouncer.dart';
import 'package:hoyomi/utils/proxy_cache.dart';
import 'package:hoyomi/widgets/eiga/html_subtitle_wrapper.dart';
import 'package:hoyomi/widgets/eiga/slider_eiga.dart';
import 'package:hoyomi/utils/format_duration.dart';
import 'package:hoyomi/widgets/iconify.dart';
import 'package:http/http.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:kaeru/kaeru.dart';
import 'package:mediaquery_sizer/mediaquery_sizer.dart';
import 'package:screen_brightness/screen_brightness.dart';
import 'package:video_player/video_player.dart';

import 'package:hoyomi/core_services/eiga/interfaces/subtitle.dart' as type;
import 'package:hoyomi/utils/save_file_cache.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

import 'widget/subtitle_settings_sheet.dart';
import 'widget/animated_icon_forward.dart';
import 'widget/animated_icon_rewind.dart';
import 'widget/area_forward.dart';
import 'widget/area_rewind.dart';
import 'widget/vertical_brightness_slider.dart';
import 'widget/vertical_volume_slider.dart';

// import 'package:bitmovin_player/bitmovin_player.dart';
// import 'package:theoplayer/theoplayer.dart';

// import 'package:video_player_oneplusdream/video_player_oneplusdream.dart';
// import 'package:video_player_oneplusdream_example/cache.dart';

class PlayerEiga extends StatefulWidget {
  final ABEigaService service;

  final Ref<String> eigaId;
  final Ref<MetaEiga> metaEiga;

  final Ref<String?> episodeId;
  final Ref<EigaEpisode?> episode;

  final Ref<Season?> season;

  final Computed<String> title;
  final Computed<String> subtitle;

  final double aspectRatio;

  final void Function(BuildContext context, bool isFullscreen) onTapPlaylist;
  final Ref<void Function()?> onNext;
  final Ref<void Function()?> onPrev;

  final Function(WatchTimeData data) onWatchTimeChanged;

  /// ================= player expose =================
  final Computed<Future<List<ServerSource>?>?> serversFuture;
  final Ref<String?> serverIdSelected;

  /// ================= /player expose =================

  const PlayerEiga({
    super.key,
    required this.service,
    required this.eigaId,
    required this.metaEiga,
    required this.episodeId,
    required this.episode,
    required this.season,
    required this.title,
    required this.subtitle,
    required this.aspectRatio,
    required this.onTapPlaylist,
    required this.onNext,
    required this.onPrev,
    required this.onWatchTimeChanged,
    required this.serversFuture,
    required this.serverIdSelected,
  });
  @override
  State<PlayerEiga> createState() => _PlayerEigaState();
}

class _VariantMeta {
  final Variant variant;
  final String code;
  final String label;
  final Headers? headers;

  _VariantMeta({
    required this.variant,
    required this.code,
    required this.label,
    required this.headers,
  });
}

enum _StateOpeningEnding { opening, ending, none, skip }

// https://pub.dev/packages/double_tap_player_view
// sharara
// video player widget
// video player
// djangoflow_video_player
class _PlayerEigaState extends State<PlayerEiga>
    with KaeruMixin, KaeruListenMixin, KaeruLifeMixin {
  ///  control player
  //  final ShararaVideoPlayerController controller;
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
  late final _controllerId = ref<String?>(null);
  late final _controller = ref<VideoPlayerController?>(null);

  final _durationAnimate = const Duration(milliseconds: 300);
  final _teenSeconds = const Duration(seconds: 10);

  late final _availableResolutions = ref<List<_VariantMeta>>([]);
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

  late final _showControls = ref(false);
  late final _pauseAutoHideControls = ref(false);
  late final _autoPlay = ref(true);
  late final _subtitleCode = ref<String?>(null);
  late final _playbackSpeed = ref(1.0);
  late final _qualityCode = ref<String?>(null);
  late final _fullscreen = ref(false);

  late final _error = ref<String?>(null);
  late final _position = ref(Duration());
  late final _duration = ref(Duration());
  late final _buffered = ref(Duration());
  late final _loading = ref(true);
  late final _playing = ref(true);
  late final _aspectRatio = ref<double>(1.0);

  late final _doubleTapToRewind = ref(0);
  late final _doubleTapToForward = ref(0);

  late final _appBrightness = ref(0.0);
  late final _systemVolume = ref(0.0);

  late final _showBrightness = ref(false);
  late final _showVolume = ref(false);

  late final AsyncComputed<List<ServerSource>?> _servers;
  late final Computed<ServerSource?> _server;
  late final AsyncComputed<SourceVideo?> _source;
  late final AsyncComputed<List<type.Subtitle>?> _subtitles;
  late final Computed<type.Subtitle?> _subtitle;
  late final AsyncComputed<WatchTimeData?> _watchTimeData;
  late final AsyncComputed<Vtt?> _thumbnailVtt;
  late final AsyncComputed<OpeningEnding?> _openingEnding;
  late final Computed<_StateOpeningEnding> _stateOpeningEnding;
  late final Computed<bool> _visibleTooltipSkipOE;

  String get uid => '${widget.episodeId.value}@${widget.eigaId.value}';

  bool _positionChangedByUser = false;
  void _resetPositionChangedByUser() {
    if (!mounted) return;
    _positionChangedByUser = false;
  }

  @override
  void initState() {
    super.initState();

    /// =================== Core data ====================
    final metaIsFake = computed(() => widget.metaEiga.value.fake);

    /// Servers
    _servers = asyncComputed(() async {
      return await widget.serversFuture.value;
    });

    /// Server
    _server = computed(() {
      if (metaIsFake.value || widget.episode.value == null) return null;

      final servers = _servers.value;
      if (servers == null || servers.isEmpty) return null;

      final serverId = widget.serverIdSelected.value;
      final server = serverId == null
          ? servers.first
          : servers.firstWhere((server) => server.serverId == serverId,
              orElse: () => servers.first);

      return server;
    });

    /// Source
    _source = asyncComputed(
      () async {
        if (metaIsFake.value || widget.episode.value == null) return null;
        widget.eigaId.value;
        _server.value;

        late final bool hasServers;
        try {
          final servers = await widget.serversFuture.value;
          hasServers = servers?.isNotEmpty == true;
        } on UnimplementedError {
          hasServers = false;
        }

        final episode = widget.episode.value;
        if (episode == null || (hasServers ? _server.value == null : false)) {
          return null;
        }

        return widget.service.getSource(
          eigaId: widget.eigaId.value,
          episode: episode,
          server: _server.value,
        );
      },
      onError: (error) {
        if (error is! UnimplementedError) showSnackError('source', error);
      },
      beforeUpdate: () => null,
    );

    /// Subtitles language
    _subtitles = asyncComputed(
      () async {
        final episode = widget.episode.value;
        if (metaIsFake.value || episode == null) return null;

        final source = _source.value;
        if (source == null) return null;

        try {
          return await widget.service.getSubtitles(
            eigaId: widget.eigaId.value,
            episode: episode,
            source: source,
          );
        } on UnimplementedError {
          return null;
        }
      },
      onError: (error) {
        if (error is! UnimplementedError) showSnackError('subtitle', error);
      },
    );

    /// watch subtitles
    watch([_subtitles], () {
      final subtitles = _subtitles.value;
      if (subtitles == null) return;

      if (_subtitleCode.value == null) {
        // detect user language
        final locale =
            PlatformDispatcher.instance.locale.languageCode.toUpperCase();
        debugPrint('current lang=$locale');
        final subtitle = subtitles.firstWhereOrNull((subtitle) =>
                searchLanguage(subtitle.code)?.codeShort == locale) ??
            subtitles.firstWhereOrNull(
                (subtitle) => searchLanguage(subtitle.code)?.codeShort == 'EN');

        _subtitleCode.value = subtitle?.code;
      }
    });

    /// _subtitle
    _subtitle = computed(() {
      final subtitles = _subtitles.value;
      if (subtitles == null || subtitles.isEmpty) {
        return null;
      }

      final subtitleCode = _subtitleCode.value;
      if (subtitleCode == null) {
        return null;
      }

      return subtitles.firstWhereOrNull((item) => item.code == subtitleCode) ??
          subtitles.first;
    });

    /// Watch data position
    _watchTimeData = asyncComputed<WatchTimeData?>(() async {
      if (widget.service is EigaWatchTimeMixin && !metaIsFake.value) {
        final eigaId = widget.eigaId.value;
        final episode = widget.episode.value;
        if (episode == null) return null;

        final episodeId = episode.episodeId;

        return (widget.service as EigaWatchTimeMixin)
            .getWatchTime(
              eigaId: eigaId,
              episode: episode,
              metaEiga: widget.metaEiga.value,
            )
            .then((data) => WatchTimeData(
                  eigaId: eigaId,
                  episodeId: episodeId,
                  watchTime: data,
                ))
            .catchError((error) {
          if (error is! UserNotFoundException) {
            debugPrint('Error: $error (${StackTrace.current})');
          }

          return WatchTimeData(
            eigaId: eigaId,
            episodeId: episodeId,
            watchTime: null,
          );
        });
      }
      return null;
    },
        onError: (error) => (error is Response)
            ? debugPrint('[watch_time]: ${error.statusCode}')
            : debugPrint('[watch_time]: $error (${StackTrace.current})'),
        beforeUpdate: () => null);

    /// Preview images
    _thumbnailVtt = asyncComputed(() async {
      if (widget.episode.value != null &&
          !metaIsFake.value &&
          _source.value != null) {
        try {
          return await widget.service.getSeekThumbnail(PropsGetSeekThumbnail(
            eigaId: widget.eigaId.value,
            episode: widget.episode.value!,
            metaEiga: widget.metaEiga.value,
            source: _source.value!,
          ));
        } on UnimplementedError {
          return null;
        }
      }
      return null;
    },
        onError: (error) => (error is Response)
            ? debugPrint('[seek_thumb]: ${error.statusCode}')
            : debugPrint('[seek_thumb]: $error (${StackTrace.current})'));

    /// Position opening / ending
    _openingEnding = asyncComputed(() async {
      if (widget.episode.value != null &&
          !metaIsFake.value &&
          _source.value != null) {
        try {
          return widget.service.getOpeningEnding(PropsGetOpeningEnding(
            eigaId: widget.eigaId.value,
            metaEiga: widget.metaEiga.value,
            episode: widget.episode.value!,
            source: _source.value!,
          ));
        } on UnimplementedError {
          return null;
        }
      }
      return null;
    },
        onError: (error) => (error is Response)
            ? debugPrint('[opening_ending]: ${error.statusCode}')
            : debugPrint('[opening_ending]: $error (${StackTrace.current})'));

    _stateOpeningEnding = computed(() {
      final opEnd = _openingEnding.value;
      if (opEnd == null) return _StateOpeningEnding.none;

      final opening = opEnd.opening;
      final ending = opEnd.ending;

      final inOpening = opening == null
          ? false
          : opening.start <= _position.value && opening.end >= _position.value;
      if (inOpening) {
        if (_stateOpeningEnding.value == _StateOpeningEnding.opening ||
            _stateOpeningEnding.value == _StateOpeningEnding.skip) {
          return _stateOpeningEnding.value;
        }
        return _StateOpeningEnding.opening;
      } else if (ending == null
          ? false
          : ending.start <= _position.value && ending.end >= _position.value) {
        if (_stateOpeningEnding.value == _StateOpeningEnding.ending ||
            _stateOpeningEnding.value == _StateOpeningEnding.skip) {
          return _stateOpeningEnding.value;
        }
        return _StateOpeningEnding.ending;
      } else {
        return _StateOpeningEnding.none;
      }
    });

    watch([_source], () {
      if (_source.value != null) {
        _setupPlayer(_source.value!, uid, isMaster: true);
      }
    }, immediate: true);

    int loopIdAutoIncrement = -1;
    onBeforeUnmount(() => loopIdAutoIncrement = -1);
    watch([_watchTimeData, _controller, _controllerId], () async {
      final watchTime = _watchTimeData.value?.watchTime;
      final controller = _controller.value;
      if (watchTime == null ||
          controller == null ||
          _controllerId.value != uid) {
        return;
      }

      if (kDebugMode) {
        print(watchTime);
      }

      final loopId = ++loopIdAutoIncrement;
      while (!controller.value.isInitialized && loopIdAutoIncrement == loopId) {
        if (!mounted) return;
        await Future.delayed(Duration(milliseconds: 300));
      }

      if (!mounted) return;

      /// Free memory
      if (loopIdAutoIncrement != loopId) return;

      await controller.pause();
      _position.value = watchTime.position;

      await _seekTo(controller, watchTime.position);

      if (!controller.value.isPlaying) controller.play();

      showSnackBar(
        Text('Watching time restored ${formatDuration(watchTime.position)}'),
      );
    }, immediate: true);

    /// =================== /Core data ====================

    _visibleTooltipSkipOE = computed(() {
      final isOpening =
          _stateOpeningEnding.value == _StateOpeningEnding.opening;
      final visible =
          isOpening || _stateOpeningEnding.value == _StateOpeningEnding.ending;

      return visible;
    });

    watch([_pauseAutoHideControls], () {
      if (!_pauseAutoHideControls.value) {
        _activeTime = DateTime.now();
      }
    }, immediate: true);

    /// ================== Control effect double tap to view =================
    final resetDoubleTapToRewind = Debouncer<void>(
        Duration(milliseconds: 1000), (_) => _doubleTapToRewind.value = 0);
    final resetDoubleTapToForward = Debouncer<void>(
        Duration(milliseconds: 1000), (_) => _doubleTapToForward.value = 0);

    onBeforeUnmount(() {
      resetDoubleTapToRewind.dispose();
      resetDoubleTapToForward.dispose();
    });

    // watch auto hide controls
    watch([_doubleTapToRewind], () {
      if (_doubleTapToRewind.value != 0) resetDoubleTapToRewind.run(null);
      _doubleTapToForward.value = 0;
    });
    watch([_doubleTapToForward], () {
      if (_doubleTapToForward.value != 0) resetDoubleTapToForward.run(null);
      _doubleTapToRewind.value = 0;
    });

    /// ================== /Control effect double tap to view =================

    /// ================== Brightness and volume system ===================
    // ScreenBrightness.instance.application
    //     .then((value) => _appBrightness.value = value);
    // Brightness
    GeneralSettingsController.instance.get().then((settings) async {
      if (!mounted) return;

      settings ??= GeneralSettings();

      var valueStore = settings.brightnessApp;
      if (valueStore != null) {
        await ScreenBrightness.instance
            .setApplicationScreenBrightness(valueStore);
      } else {
        valueStore = await ScreenBrightness.instance.application;
      }

      if (!mounted) return;

      _appBrightness.value = valueStore;

      watch([_appBrightness], () {
        ScreenBrightness.instance
            .setApplicationScreenBrightness(_appBrightness.value);
        settings = settings!.copyWith(brightnessApp: _appBrightness.value);

        GeneralSettingsController.instance.save(settings!);
      });
    });
    // Volume
    final volumeController = VolumeController();
    volumeController.getVolume().then((volume) {
      if (!mounted) return;

      _systemVolume.value = volume ?? 0;
      volumeController.updateShowSystemUI(false);
      watch([_systemVolume], () {
        volumeController.setVolume(_systemVolume.value);
      });
    });

    /// ================== /Brightness and volume system ===================
  }

  Future<void> _seekTo(
      VideoPlayerController controller, Duration position) async {
    _positionChangedByUser = true;
    await controller.seekTo(position);
    Future.microtask(_resetPositionChangedByUser);
  }

  Timer? _timer;
  void _emitWatchTimeUpdate() {
    if (_timer != null || widget.service is! EigaWatchTimeMixin) return;
    _timer = Timer(Duration(seconds: 30), () {
      _timer = null;
    });

    final eigaId = widget.eigaId.value;
    final metaEiga = widget.metaEiga.value;

    final episodeId = widget.episodeId.value;
    final episode = widget.episode.value;

    final season = widget.season.value;

    if (metaEiga.fake ||
        episodeId == null ||
        episode == null ||
        season == null) {
      return;
    }

    final watchTimeData = _watchTimeData.value;
    if (watchTimeData == null) {
      return debugPrint(
          'Skip saving watch time because watch time data loading.');
    }

    if (watchTimeData.eigaId != eigaId ||
        watchTimeData.episodeId != episodeId ||
        _duration.value == Duration.zero ||
        _controller.value == null ||
        _controller.value!.value.position == Duration.zero) {
      return;
    }

    final watchTime =
        WatchTime(position: _position.value, duration: _duration.value);

    widget.onWatchTimeChanged(WatchTimeData(
      eigaId: eigaId,
      episodeId: episodeId,
      watchTime: watchTime,
    ));
    (widget.service as EigaWatchTimeMixin)
        .setWatchTime(
      eigaId: eigaId,
      episode: episode,
      metaEiga: metaEiga,
      season: season,
      watchTime: watchTime,
    )
        .catchError((error) {
      if (error is! UserNotFoundException) {
        debugPrint('Error: $error (${StackTrace.current})');
      }
    });
  }

  void _setupPlayer(SourceVideo source, String id,
      {required bool isMaster}) async {
    if (isMaster) _availableResolutions.value = [];

    _loading.value = true;

    late final Uri url;
    String? content;
    try {
      final sourceContent =
          await widget.service.fetchSourceContent(source: source);
      content = sourceContent.content;

      final fileCache = await saveFileCache(
        content: sourceContent.content,
        path: "${sha256.convert(utf8.encode(sourceContent.content))}.m3u8",
      );
      if (!mounted) return;

      await ProxyCache.instance.start();

      if (!mounted) return;

      url = ProxyCache.instance.getUrlHttp(fileCache);
    } on UnimplementedError {
      url = Uri.parse(source.src);
    }

    _controller.value?.dispose();
    _controllerId.value = id;

    _controller.value = VideoPlayerController.networkUrl(
      url,
      httpHeaders: source.headers?.toMap() ?? const <String, String>{},
      videoPlayerOptions: VideoPlayerOptions(
        allowBackgroundPlayback: true,
      ),
    )
      ..addListener(_onPlayerValueChanged)
      ..initialize().then((_) {
        if (!_playing.value) _controller.value?.play();
      }).catchError((err) {
        debugPrint('Error: $err (${StackTrace.current})');
        _error.value = '$err';
      });

    content ??=
        await widget.service.fetch(url.toString(), headers: source.headers);

    if (isMaster && source.type == 'hls') {
      _initializeHls(
        content: content,
        url: url,
        headers: source.headers,
      );
    }
  }

  DateTime _activeTime = DateTime.now();
  void _onPlayerValueChanged() {
    final controller = _controller.value;

    if (controller?.value.hasError == true) {
      WakelockPlus.disable();
      debugPrint(
        "[video_player]: ${_error.value = controller!.value.errorDescription}",
      );
    } else {
      _error.value = null;
    }

    if (controller != null) {
      final positionChanged = _position.value != controller.value.position;
      _position.value = controller.value.position;
      _duration.value = controller.value.duration;
      _buffered.value =
          controller.value.buffered.fold(Duration.zero, (max, range) {
        return range.end > max ? range.end : max;
      });
      _loading.value = controller.value.isInitialized != true ||
          (controller.value.isBuffering &&
              _playing.value &&
              !(positionChanged && !_positionChangedByUser));
      final playing = controller.value.isPlaying;
      if (_playing.value != playing) {
        _playing.value = playing;

        if (_playing.value) {
          WakelockPlus.enable();
        } else {
          WakelockPlus.disable();
        }
      }
      _aspectRatio.value = controller.value.aspectRatio;

      _emitWatchTimeUpdate();
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
  }

  void _onTapToggleControls() {
    if (_pauseAutoHideControls.value) return;

    _showControls.value = !_showControls.value;
    if (_showControls.value) {
      _activeTime = DateTime.now();
    }
  }

  void _onDoubleTapPlayer(TapDownDetails details) {
    final controller = _controller.value;
    if (controller == null) return;

    final localOffset = details.localPosition;
    final dxRatio = localOffset.dx / 100.w(context); // Normalize x coordinate

    // Process only if tap is within left 1/3 or right 1/3 of the widget.
    if (dxRatio < 1 / 2) {
      debugPrint('tap left');
      _doubleTapToRewind.value++;

      _seekTo(
          controller,
          _position.value <= _teenSeconds
              ? Duration.zero
              : _position.value - _teenSeconds);

      return;
    }
    if (dxRatio > 1 / 2) {
      debugPrint('tap right');
      _doubleTapToForward.value++;

      _seekTo(
          controller,
          _position.value >= _duration.value - _teenSeconds
              ? _duration.value
              : _position.value + _teenSeconds);
    }
  }

  void _onVerticalDragUpdatePlayer(DragUpdateDetails details) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isLeftSide = details.globalPosition.dx < screenWidth / 2;

    if (details.primaryDelta != null) {
      if (isLeftSide) {
        _showBrightness.value = true;
        _appBrightness.value =
            (_appBrightness.value - details.primaryDelta! / 100)
                .clamp(0.0, 1.0);
        debugPrint('swipe to change brightness = ${_appBrightness.value}');
      } else {
        _showVolume.value = true;
        _systemVolume.value =
            (_systemVolume.value - details.primaryDelta! / 100).clamp(0.0, 1.0);
        debugPrint('swipe to change volume = ${_systemVolume.value}');
      }
    }
  }

  void _hideAllSlider() {
    _showBrightness.value = false;
    _showVolume.value = false;
  }

  void _onHorizontalDragStart(DragStartDetails _) {}
  void _onHorizontalDragUpdate(DragUpdateDetails _) {}
  void _onHorizontalDragEnd(DragEndDetails _) {}

  Future<void> _initializeHls({
    required String content,
    required Uri url,
    required Headers? headers,
  }) async {
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
          headers: headers,
        );
      }).toList();

      /// video_player always select media playlist first in master playlist
      _qualityCode.value = _availableResolutions.value.first.code;
    } else if (playlist is HlsMediaPlaylist) {
      // media m3u8 file
      debugPrint("[initialize_hls]: no action because is media playlist");
    }
  }

  @override
  Widget build(BuildContext context) {
    // if (_controller?.value.isInitialized != true) return SizedBox.shrink();

    return Watch(() => _fullscreen.value
        ? SizedBox.shrink()
        : Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: SliderEiga.thumbSize),
                child: AspectRatio(
                  aspectRatio: widget.aspectRatio,
                  child: _buildStack(context, isFullscreen: false),
                ),
              ),
              _buildMobileSliderProgress(),
            ],
          ));
  }

  Widget _buildStack(BuildContext context, {required bool isFullscreen}) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          bottom: 0,
          child: GestureDetector(
              onTap: _onTapToggleControls,
              onDoubleTapDown: _onDoubleTapPlayer,
              onVerticalDragUpdate: _onVerticalDragUpdatePlayer,
              onVerticalDragEnd: (_) => _hideAllSlider(),
              onVerticalDragCancel: _hideAllSlider,
              onHorizontalDragStart: _onHorizontalDragStart,
              onHorizontalDragUpdate: _onHorizontalDragUpdate,
              onHorizontalDragEnd: _onHorizontalDragEnd,
              onHorizontalDragCancel: _hideAllSlider,
              child: Container(color: Colors.black)),
        ),
        GestureDetector(
          onTap: _onTapToggleControls,
          onDoubleTapDown: _onDoubleTapPlayer,
          onVerticalDragUpdate: _onVerticalDragUpdatePlayer,
          onVerticalDragEnd: (_) => _hideAllSlider(),
          onVerticalDragCancel: _hideAllSlider,
          onHorizontalDragStart: _onHorizontalDragStart,
          onHorizontalDragUpdate: _onHorizontalDragUpdate,
          onHorizontalDragEnd: _onHorizontalDragEnd,
          // HELP: delayed widget for fix size not correct if fullscreen change
          child: Watch(() {
            final controller = _controller.value;
            if (controller == null) {
              return Center(
                  child: OImage.oNetwork(
                widget.metaEiga.value.poster ?? widget.metaEiga.value.image,
                sourceId: widget.service.uid,
                fit: BoxFit.cover,
              ));
            }

            // final videoChild =
            //     OrientationBuilder(builder: (context, orientation) {
            //   final isPortrait = orientation == Orientation.portrait;
            //   return Center(
            //     child: Stack(
            //       //This will help to expand video in Horizontal mode till last pixel of screen
            //       fit: isPortrait ? StackFit.loose : StackFit.expand,
            //       children: [
            //         AspectRatio(
            //           aspectRatio: _aspectRatio.value,
            //           child: VideoPlayer(controller),
            //         ),
            //       ],
            //     ),
            //   );
            // });

            // Thanks for @Nandakishor Dhanaji Valakunde
            // https://stackoverflow.com/a/67961757
            final videoChild = Center(
              child: AspectRatio(
                aspectRatio: _aspectRatio.value,
                child: VideoPlayer(controller),
              ),
            );

            return HtmlSubtitleWrapper(
              service: widget.service,
              subtitle: _subtitle,
              videoController: controller,
              child: videoChild,
            );
          }),
        ),
        Watch(() {
          final child = _showControls.value || _error.value != null
              ? GestureDetector(
                  onTap: _onTapToggleControls,
                  onDoubleTapDown: _onDoubleTapPlayer,
                  onVerticalDragUpdate: _onVerticalDragUpdatePlayer,
                  onVerticalDragEnd: (_) => _hideAllSlider(),
                  onVerticalDragCancel: _hideAllSlider,
                  onHorizontalDragStart: _onHorizontalDragStart,
                  onHorizontalDragUpdate: _onHorizontalDragUpdate,
                  onHorizontalDragEnd: _onHorizontalDragEnd,
                  child: Container(
                    color: Colors.black.withValues(alpha: 0.5),
                    child: Stack(
                      children: [
                        _buildMobileTopControls(),
                        _buildMobileControls(),
                        _buildMobileBottomControls(),
                      ],
                    ),
                  ),
                )
              : SizedBox.shrink();

          if (_error.value != null) return child;

          return AnimatedSwitcher(
              duration: _durationAnimate,
              transitionBuilder: (child, animation) =>
                  FadeTransition(opacity: animation, child: child),
              child: child);
        }),
        _buildError(),
        _buildIndicator(),
        Watch(() => _fullscreen.value
            ? _buildMobileSliderProgress()
            : SizedBox.shrink()),
        _buildUISwipeView(),
        _buildUIDoubleTapView(),
        _buildPopupOpeningEnding(),
      ],
    );
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
              child: Row(
                children: [
                  // button back
                  IconButton(
                    icon: Watch(() => Transform.rotate(
                          angle: _fullscreen.value ? 1.5 * pi : 0.0,
                          child: Icon(Icons.arrow_back_ios),
                        )),
                    color: Colors.white,
                    onPressed: () {
                      if (_fullscreen.value) {
                        _setFullscreen(false);
                      } else {
                        context.pop();
                      }
                    },
                  ),
                  SizedBox(width: 8.0),
                  // 2 line text
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Watch(() => Text(
                              widget.title.value,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                              ),
                            )),
                        Watch(() => Text(
                              widget.subtitle.value,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.grey.shade300,
                                fontSize: 14.0,
                              ),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                IconButton(
                  icon: const Iconify(Mdi.playlist_play),
                  color: Colors.white,
                  onPressed: () =>
                      widget.onTapPlaylist(context, _fullscreen.value),
                ),
                // icon subtitle
                Watch(() {
                  final isEnabled = _subtitles.value?.isNotEmpty == true;
                  return Opacity(
                    opacity: isEnabled ? 1.0 : 0.5,
                    child: IgnorePointer(
                      ignoring: !isEnabled,
                      child: IconButton(
                        icon: Iconify(
                          _subtitleCode.value == null
                              ? Mdi.subtitles_outline
                              : Mdi.subtitles,
                        ),
                        color: Colors.white,
                        onPressed: () => _subtitleCode.value == null
                            ? _showSubtitleOptions()
                            : (_subtitleCode.value = null),
                      ),
                    ),
                  );
                }),
                // icon settings
                IconButton(
                  icon: Icon(Icons.settings_outlined),
                  color: Colors.white,
                  onPressed: _showSettingOptions,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMobileControls() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(width: 8.0),
          Watch(() {
            final onPrev = widget.onPrev.value;

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
                    shadowColor: Colors.transparent,
                  ),
                  child: const Iconify(
                    Mdi.skip_previous,
                    color: Colors.white,
                    size: 25.0,
                  ),
                ),
              ),
            );
          }),
          Watch(() => IgnorePointer(
                ignoring: _loading.value,
                child: Opacity(
                  opacity: _loading.value ? 0 : 1,
                  child: ElevatedButton(
                    onPressed: () {
                      _activeTime = DateTime.now();
                      _setPlaying(!_playing.value);
                    },
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(15),
                      backgroundColor: Colors.grey.shade300.withAlpha(20),
                      shadowColor: Colors.transparent,
                    ),
                    child: Icon(
                      _playing.value ? Icons.pause : Icons.play_arrow,
                      color: Colors.white,
                      size: 42.0,
                    ),
                  ),
                ),
              )),
          Watch(() {
            final onNext = widget.onNext.value;

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
                  child: const Iconify(
                    Mdi.skip_next,
                    color: Colors.white,
                    size: 25.0,
                  ),
                ),
              ),
            );
          }),
          SizedBox(width: 8.0),
        ],
      ),
    );
  }

  Widget _buildIndicator() {
    return Watch(() {
      if (!_loading.value) return SizedBox.shrink();

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
            ),
          ),
        ),
      );
    });
  }

  Widget _buildError() {
    return Watch(() {
      final error = _error.value;
      if (error == null) return SizedBox.shrink();

      return Positioned(
        top: 0,
        left: 0,
        right: 0,
        bottom: 0,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Center(
            child: Text(
              error,
              style: Theme.of(
                context,
              ).textTheme.bodySmall?.copyWith(color: Colors.white),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ); // error
    });
  }

  Widget _buildMobileBottomControls() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Watch(() => Text(
                      formatDuration(_position.value),
                      style: TextStyle(color: Colors.white),
                    )),
                Watch(() => Text(
                      ' / ${formatDuration(_duration.value)}',
                      style: TextStyle(color: Colors.grey.shade300),
                    )),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // full screen
                Watch(() => IconButton(
                      icon: Icon(
                        _fullscreen.value
                            ? Icons.fullscreen_exit
                            : Icons.fullscreen,
                      ),
                      color: Colors.white,
                      onPressed: () => _setFullscreen(!_fullscreen.value),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMobileSliderProgress() {
    return Watch(() => Positioned(
          top: 0,
          bottom: _fullscreen.value ? kToolbarHeight : 0,
          left: _fullscreen.value ? 16.0 : 0,
          right: _fullscreen.value ? 16.0 : 0,
          child: FractionallySizedBox(
              widthFactor: 1.0,
              child: AnimatedOpacity(
                duration: _durationAnimate,
                opacity: (_fullscreen.value ? _showControls.value : true)
                    ? 1.0
                    : 0.0,
                child: IgnorePointer(
                  ignoring: !(_fullscreen.value ? _showControls.value : true),
                  child: SliderEiga(
                    key: Key(widget.key.hashCode.toString()),
                    progress: _position,
                    duration: _duration,
                    buffered: _buffered,
                    showThumb: _showControls,
                    pauseAutoHideControls: _pauseAutoHideControls,
                    vttThumbnail: _thumbnailVtt,
                    openingEnding: _openingEnding,
                    onSeek: (duration) {
                      final seek = _position.value = duration;

                      if (_controller.value != null) {
                        _seekTo(_controller.value!, seek);
                      }
                    },
                  ),
                ),
              )),
        ));
  }

  Widget _buildUISwipeView() {
    return LayoutBuilder(
        builder: (context, constrains) => Stack(children: [
              // left
              Watch(() => AnimatedSwitcher(
                  duration: const Duration(milliseconds: 200),
                  transitionBuilder: (child, animation) =>
                      FadeTransition(opacity: animation, child: child),
                  child: _showVolume.value
                      ? Stack(children: [
                          Positioned(
                              top: 0,
                              bottom: 0,
                              left: 30,
                              child: VerticalVolumeSlider(
                                volume: Prop(_systemVolume),
                              ))
                        ])
                      : SizedBox.shrink())),

              // right
              Watch(() => AnimatedSwitcher(
                  duration: const Duration(milliseconds: 200),
                  transitionBuilder: (child, animation) =>
                      FadeTransition(opacity: animation, child: child),
                  child: _showBrightness.value
                      ? Stack(children: [
                          Positioned(
                              top: 0,
                              bottom: 0,
                              right: 30,
                              child: VerticalBrightnessSlider(
                                brightness: Prop(_appBrightness),
                              ))
                        ])
                      : SizedBox.shrink())),
            ]));
  }

  Widget _buildUIDoubleTapView() {
    return LayoutBuilder(
        builder: (context, constrains) => Stack(children: [
              // left
              Watch(
                () => AnimatedSwitcher(
                  duration: const Duration(milliseconds: 200),
                  transitionBuilder: (child, animation) =>
                      FadeTransition(opacity: animation, child: child),
                  child: _doubleTapToRewind.value > 0
                      ? GestureDetector(
                          onTap: () {
                            _doubleTapToRewind.value++;

                            if (_controller.value != null) {
                              _seekTo(_controller.value!,
                                  _position.value - Duration(seconds: 10));
                            }
                          },
                          child: Stack(children: [
                            Positioned(
                              top: 0,
                              bottom: 0,
                              left: 0,
                              child: Container(
                                  width: constrains.biggest.width / 2,
                                  height: constrains.biggest.height * 2,
                                  clipBehavior: Clip.hardEdge,
                                  decoration:
                                      BoxDecoration(color: Colors.transparent),
                                  child: CustomPaint(painter: AreaRewind())),
                              // Center(child: AnimatedSkipIcon())
                            ),
                            Positioned(
                                top: 0,
                                bottom: 0,
                                left: 0,
                                child: Container(
                                    width: constrains.biggest.width / 2,
                                    height: constrains.biggest.height * 2,
                                    clipBehavior: Clip.hardEdge,
                                    decoration: BoxDecoration(
                                        color: Colors.transparent),
                                    child: Center(
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                          AnimatedIconRewind(),
                                          Text(
                                              '${_doubleTapToRewind.value}0 seconds',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12.0))
                                        ]))))
                          ]))
                      : SizedBox.shrink(),
                ),
              ),
              // right
              Watch(
                () => AnimatedSwitcher(
                  duration: const Duration(milliseconds: 200),
                  transitionBuilder: (child, animation) =>
                      FadeTransition(opacity: animation, child: child),
                  child: _doubleTapToForward.value > 0
                      ? GestureDetector(
                          onTap: () {
                            _doubleTapToForward.value++;

                            if (_controller.value != null) {
                              _seekTo(_controller.value!,
                                  _position.value + Duration(seconds: 10));
                            }
                          },
                          child: Stack(children: [
                            Positioned(
                              top: 0,
                              bottom: 0,
                              right: 0,
                              child: Container(
                                  width: constrains.biggest.width / 2,
                                  height: constrains.biggest.height * 2,
                                  clipBehavior: Clip.hardEdge,
                                  decoration:
                                      BoxDecoration(color: Colors.transparent),
                                  child: CustomPaint(painter: AreaForward())),
                              // Center(child: AnimatedSkipIcon())
                            ),
                            Positioned(
                                top: 0,
                                bottom: 0,
                                right: 0,
                                child: Container(
                                    width: constrains.biggest.width / 2,
                                    height: constrains.biggest.height * 2,
                                    clipBehavior: Clip.hardEdge,
                                    decoration: BoxDecoration(
                                        color: Colors.transparent),
                                    child: Center(
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                          AnimatedIconForward(),
                                          Text(
                                              '${_doubleTapToForward.value}0 seconds',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12.0))
                                        ]))))
                          ]))
                      : SizedBox.shrink(),
                ),
              ),
            ]));
  }

  Widget _buildPopupOpeningEnding() {
    return Watch(() {
      if (_openingEnding.value == null) {
        return SizedBox.shrink();
      }

      final visible = _visibleTooltipSkipOE.value;
      if (visible != true) return SizedBox.shrink();

      final opening = _openingEnding.value!.opening;
      final ending = _openingEnding.value!.ending;

      final widgetTextSeconds = Text(
        visible
            ? '${_stateOpeningEnding.value == _StateOpeningEnding.opening ? (opening!.end.inSeconds - _position.value.inSeconds).round() : (ending!.end.inSeconds - _position.value.inSeconds).round()} seconds'
            : '0 seconds',
        style: TextStyle(
          color: Color.fromRGBO(209, 213, 219, 1.0),
          fontSize: 11.0,
        ),
      );

      return Positioned(
        right: 10,
        bottom: 30,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 12.0,
            vertical: XPlatform.isWindows ? 8.0 : 2.0,
          ),
          decoration: BoxDecoration(
            color: Color.fromRGBO(28, 28, 28, 0.9),
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Wrap(
                alignment: WrapAlignment.center,
                children: [
                  Text(
                    'Skip ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.0,
                    ),
                  ),
                  Text(
                    _stateOpeningEnding.value == _StateOpeningEnding.opening
                        ? 'Opening'
                        : 'Ending',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 8.0,
                ).copyWith(right: 0.0),
                width: 1.0,
                height: 30.0,
                color: Color.fromRGBO(255, 255, 255, 0.28),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextButton(
                    onPressed: () {
                      if (_stateOpeningEnding.value ==
                          _StateOpeningEnding.opening) {
                        if (_controller.value != null) {
                          _seekTo(
                            _controller.value!,
                            _openingEnding.value!.opening!.end,
                          );
                        }
                      } else {
                        if (_controller.value != null) {
                          _seekTo(
                            _controller.value!,
                            _openingEnding.value!.ending!.end,
                          );
                        }
                      }
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Skip (Enter)',
                          style: TextStyle(
                            color: Colors.white.withValues(
                              alpha: 0.9,
                            ),
                            fontSize: 12.0,
                          ),
                        ),
                        widgetTextSeconds,
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      _stateOpeningEnding.force(_StateOpeningEnding.skip);
                    },
                    borderRadius: BorderRadius.circular(5.0),
                    highlightColor: Colors.black,
                    child: Icon(
                      Icons.close,
                      size: 16.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }

  void _setFullscreen(bool value) {
    _fullscreen.value = value;

    if (value) {
      if (XPlatform.isAndroid || XPlatform.isIOS) {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.landscapeRight,
          DeviceOrientation.landscapeLeft,
        ]);
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
      } else {
        setFullScreen(true);
      }

      Navigator.of(context).push(PageRouteBuilder(
          opaque: false,
          settings: RouteSettings(),
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(
                textScaler: TextScaler.linear(1.2),
              ),
              child: Scaffold(
                backgroundColor: Colors.transparent,
                extendBodyBehindAppBar: true,
                body: _buildStack(context, isFullscreen: true),
              ),
            );
          }));
    } else {
      if (XPlatform.isAndroid || XPlatform.isIOS) {
        SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
        SystemChrome.setEnabledSystemUIMode(
          SystemUiMode.manual,
          overlays: SystemUiOverlay.values,
        );
      } else {
        setFullScreen(false);
      }

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
      builder: (context) {
        final theme = Theme.of(context);
        final textTheme = theme.textTheme;
        final colorScheme = theme.colorScheme;

        return Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom,
            top: 16,
          ),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 400),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Subtitles',
                        style: textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.settings),
                      onPressed: () {
                        Navigator.pop(context);

                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (context) =>
                              SubtitleSettingsSheet(height: 50.h(context)),
                        );
                      },
                    )
                  ],
                ),
                const Divider(),
                Expanded(
                    child: Watch(() => ListView.builder(
                          shrinkWrap: true,
                          itemCount: _subtitles.value?.length ?? 0,
                          itemBuilder: (context, index) {
                            final item = _subtitles.value!.elementAt(index);

                            return ListTile(
                              dense: true,
                              visualDensity: VisualDensity.compact,
                              leading: _subtitle.value == item
                                  ? Icon(Icons.check,
                                      color: colorScheme.primary)
                                  : const SizedBox(width: 24), // for alignment
                              title: Text(
                                item.language,
                                style: textTheme.bodyMedium,
                              ),
                              onTap: () {
                                Navigator.pop(context);
                                _subtitleCode.value = item.code;
                              },
                            );
                          },
                        ))),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showPlaybackOptions() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (context) {
        return Watch(() => ListView.builder(
              shrinkWrap: true,
              itemCount: _playbackList.length,
              itemBuilder: (context, index) {
                final item = _playbackList.elementAt(index);

                return ListTile(
                  leading: _playbackSpeed.value == item.value
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
      },
    );
  }

  void _setQualityCode(String? value) {
    if (_availableResolutions.value.isEmpty) return;

    _qualityCode.value = value;

    final resolution = _availableResolutions.value.firstWhere((item) {
      return item.code == value;
    }, orElse: () => _availableResolutions.value.first);

    _setupPlayer(
      SourceVideo(
        src: resolution.variant.url.toString(),
        type: 'hls',
        headers: resolution.headers,
        url: resolution.variant.url,
      ),
      _controllerId.value ?? uid,
      isMaster: false,
    );
  }

  void _showQualityOptions() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (context) {
        return Watch(() => ListView.builder(
              shrinkWrap: true,
              itemCount: _availableResolutions.value.length,
              itemBuilder: (context, index) {
                final item = _availableResolutions.value.elementAt(index);

                return ListTile(
                  leading: _qualityCode.value == item.code
                      ? Icon(Icons.check)
                      : Text(''),
                  title: Text(item.label),
                  onTap: () {
                    Navigator.pop(context);
                    _setQualityCode(item.code);
                  },
                );
              },
            ));
      },
    );
  }

  void _showServerOptions() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'Server',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const Divider(height: 1),
            Expanded(
                child: Watch(() => ListView(
                      children: _servers.value?.map((server) {
                            return ListTile(
                              leading: server == _server.value
                                  ? Icon(Icons.check)
                                  : Text(''),
                              title: Text(server.name),
                              onTap: () {
                                Navigator.pop(context, server);
                                widget.serverIdSelected.value = server.serverId;
                              },
                            );
                          }).toList() ??
                          const <Widget>[],
                    ))),
            const SizedBox(height: 8),
          ],
        );
      },
    );
  }

  void _showSettingOptions() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (context) {
        return Watch(() => ListView(
              shrinkWrap: true,
              children: [
                if (_availableResolutions.value.isNotEmpty)
                  ListTile(
                    leading: Icon(Icons.tune),
                    title: Text('Quality', style: TextStyle(fontSize: 14.0)),
                    trailing: Text(
                      _availableResolutions.value.firstWhere(
                        (item) {
                          return item.code == _qualityCode.value;
                        },
                        orElse: () => _availableResolutions.value.first,
                      ).label,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      _showQualityOptions();
                    },
                  ),
                ListTile(
                  leading: Icon(Icons.speed_outlined),
                  title: Text(
                    'Playback Speed',
                    style: TextStyle(fontSize: 14.0),
                  ),
                  trailing: Text(
                    _playbackList.firstWhere((item) {
                      return item.value == _playbackSpeed.value;
                    }).label,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    _showPlaybackOptions();
                  },
                ),
                Opacity(
                  opacity: _subtitles.value?.isNotEmpty == true ? 1.0 : 0.5,
                  child: IgnorePointer(
                    ignoring: _subtitles.value?.isNotEmpty != true,
                    child: ListTile(
                      leading: Icon(Icons.subtitles_outlined),
                      title: Text(
                        'Subtitle',
                        style: TextStyle(fontSize: 14.0),
                      ),
                      trailing: _subtitle.value == null
                          ? null
                          : Text(
                              _subtitle.value!.language,
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                      onTap: () {
                        Navigator.pop(context);
                        _showSubtitleOptions();
                      },
                    ),
                  ),
                ),
                Watch(() => ListTile(
                    leading: Icon(Icons.cloud_outlined),
                    title: Text(
                      'Server play',
                      style: TextStyle(fontSize: 14.0),
                    ),
                    trailing: Text(
                      _server.value?.name ?? '',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      _showServerOptions();
                    })),
                ListTile(
                  leading: Icon(Icons.lock_outline),
                  title: Text(
                    'Screen Lock',
                    style: TextStyle(fontSize: 14.0),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    // Add additional functionality here
                  },
                ),
                ListTile(
                  leading: Icon(Icons.autorenew_outlined),
                  title: Text('Auto Play', style: TextStyle(fontSize: 14.0)),
                  trailing: Switch(
                    value: _autoPlay.value,
                    onChanged: (value) {
                      _autoPlay.value = value;
                    },
                  ),
                  onTap: () {
                    _autoPlay.value = !_autoPlay.value;
                  },
                ),
              ],
            ));
      },
    );
  }

  /// ============= system brightness and volume ===========
  Future<void> _resetAppBrightness() async {
    try {
      await ScreenBrightness.instance.resetApplicationScreenBrightness();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// ============= /system brightness and volume ===========

  @override
  void dispose() {
    _controller.value?.dispose();
    _resetAppBrightness();
    WakelockPlus.disable();

    super.dispose();
  }
}
