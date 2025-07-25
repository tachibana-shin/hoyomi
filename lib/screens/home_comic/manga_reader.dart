import 'dart:async';
import 'dart:math';
import 'dart:ui';
import 'dart:ui' as ui;

import 'package:awesome_extensions/awesome_extensions.dart' hide NavigatorExt;
import 'package:battery_plus/battery_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:getwidget/getwidget.dart';
import 'package:go_router/go_router.dart';
import 'package:hoyomi/apis/show_snack_bar.dart';
import 'package:hoyomi/constraints/arc_icons.dart';
import 'package:hoyomi/constraints/fluent.dart';
import 'package:hoyomi/constraints/x_platform.dart';
import 'package:hoyomi/core_services/comic/main.dart';
import 'package:hoyomi/plugins/export.dart';
import 'package:hoyomi/rust_isolate/auto_trim_image_isolate.dart';
import 'package:hoyomi/screens/export.dart';
import 'package:hoyomi/stores.dart';
import 'package:hoyomi/utils/export.dart';
import 'package:hoyomi/widgets/export.dart';
import 'package:iconify_flutter/icons/eva.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:iconify_flutter/icons/ion.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:intl/intl.dart';
import 'package:kaeru/kaeru.dart';
import 'package:mediaquery_sizer/mediaquery_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../downloader/comic_downloader.dart';

class ImageWithGroup {
  final OImage image;
  final ComicChapter chapter;
  final int index;

  ImageWithGroup({
    required this.chapter,
    required this.index,
    required this.image,
  });
}

class MangaReader extends StatefulWidget {
  final ABComicService service;
  final String comicId;

  final List<OImage> pages;
  final MetaComic comic;
  final ComicModes mode;
  final String chapterId;
  final Future<List<OImage>> Function(String chapterId) getPages;

  final Function(String chap) onChangeChap;
  final Function(bool enabled) onChangeEnabled;

  const MangaReader({
    super.key,
    required this.service,
    required this.comicId,
    required this.pages,
    required this.comic,
    required this.mode,
    required this.chapterId,
    required this.getPages,
    required this.onChangeChap,
    required this.onChangeEnabled,
  });

  @override
  createState() => _MangaReaderState();
}

class _MangaReaderState extends State<MangaReader>
    with
        AutomaticKeepAliveClientMixin,
        KaeruMixin,
        KaeruListenMixin,
        KaeruLifeMixin {
  @override
  bool get wantKeepAlive => true;

  late final Computed<ComicChapter?> _currChapter;
  late final Computed<ComicChapter?> _nextChapter;
  late final Computed<ComicChapter?> _prevChapter;

  final Set<int> _skipImages = {};

  late final Ref<String> _chapterId = ref(widget.chapterId);
  late final Ref<List<ImageWithGroup>> _pages;
  late final Ref<ComicModes> _mode;

  late final _showToolbar = ref(true);
  late final _useTwoPage = ref(false);

  late final _currentPage = ref(0.0);
  late final Computed<double> _realCurrentPage;
  late final Computed<int> _realLength;

  late final Map<Service, bool> _serviceSupportFetchPage = {};

  late final _watchPageChapters =
      computed<Future<Map<String, WatchPageUpdated>?>>(() async {
        final chapters = widget.comic.chapters.sortAsc;

        try {
          return await widget.service.getWatchPageEpisodes(
            comicId: widget.comicId,
            chapters: chapters,
          );
        } on UnimplementedError {
          return null;
        }
      });

  // tiny status system
  late final _batteryLevel = ref<int?>(null);
  late final _batteryState = ref<BatteryState?>(null);
  late final _batterySaveM = ref<bool?>(null);
  bool _use24h = false;
  late final _currentTime = ref<String?>(null);

  // image cache
  late final _pageMemoryCacheStore = <OImage, FutureCache<ui.Image>>{};
  late final _progressCacheStore = <OImage, Ref<double>>{};

  // created at
  late final _createdAt = DateTime.now();

  // skip restore page if scroll
  late final _skipRestoreWatch = <String>{};

  @override
  void initState() {
    _currChapter = computed(() {
      final index = widget.comic.chapters.sortAsc.indexWhere(
        (chapter) => chapter.chapterId == _chapterId.value,
      );

      if (index == -1) return null;

      return widget.comic.chapters.sortAsc.elementAtOrNull(index);
    });

    _pages = ref(
      widget.pages.indexed
          .map((params) {
            if (_currChapter.value == null) return null;

            final (index, page) = params;

            return ImageWithGroup(
              chapter: _currChapter.value!,
              index: index,
              image: page,
            );
          })
          .whereType<ImageWithGroup>()
          .toList(),
    );

    final startPage = computed(() {
      return _pages.value.indexWhere(
        (page) =>
            page.chapter.chapterId == _chapterId.value &&
            page.image.src != OImage.fake,
      );
    });
    final stopPage = computed(() {
      return _pages.value.lastIndexWhere(
        (page) =>
            page.chapter.chapterId == _chapterId.value &&
            page.image.src != OImage.fake,
      );
    });

    _mode = ref(widget.mode);
    final asyncPrefs = SharedPreferencesAsync();
    watch([_mode], () {
      asyncPrefs.setString('comic_mode_${widget.comicId}', _mode.value.name);
    });

    _realCurrentPage = computed(() {
      final pages = _pages.value;
      final currentPage = _currentPage.value.round();
      final index = pages[currentPage].index;

      if (index == -1) {
        if (currentPage <= 0) return pages.first.index.toDouble();
        if (currentPage >= pages.length - 1) return pages.last.index.toDouble();

        return pages.elementAt(currentPage - 1).index.toDouble();
      }

      return index.toDouble();
    });
    _realLength = computed(() {
      final start = startPage.value;
      final stop = stopPage.value;

      return stop - start + 1;
    });

    _prevChapter = computed(() {
      final current = _currChapter.value;
      if (current == null) return null;

      final index = widget.comic.chapters.sortAsc.indexOf(current) - 1;
      if (index == -1) return null;

      return widget.comic.chapters.sortAsc.elementAtOrNull(index);
    });
    _nextChapter = computed(() {
      final current = _currChapter.value;
      if (current == null) return null;

      final index = widget.comic.chapters.sortAsc.indexOf(current) + 1;
      if (index == widget.comic.chapters.sortAsc.length) return null;

      return widget.comic.chapters.sortAsc.elementAtOrNull(index);
    });

    // bool prefetchingPrev = false;
    bool prefetchingNext = false;
    final Map<String, bool> chaptersLoadedStore = {};
    listen(_currentPage, () async {
      _updateRoute();

      // if (_currentPage.value <= 0 && _usingPageView) {
      //   // prefetch previous chap
      //   final prevChapter = _prevChapter.value;
      //   if (prevChapter != null && !prefetchingPrev) {
      //     // prefetch prev
      //     prefetchingPrev = true;
      //     try {
      //       if (chaptersLoadedStore[prevChapter.chapterId] == true) return;
      //       final $pages =
      //           (await widget.getPages(prevChapter.chapterId)).indexed.map(
      //                 (params) => ImageWithGroup(
      //                   chapter: prevChapter,
      //                   index: params.$1,
      //                   src: params.$2.src,
      //                   headers: params.$2.headers,
      //                 ),
      //               );

      //       chaptersLoadedStore[prevChapter.chapterId] = true;

      //       if (mounted) {
      //         _pages.value = [
      //           ...$pages,
      //           ImageWithGroup(
      //             chapter: prevChapter,
      //             index: -1,
      //             src: OImage.fake,
      //           ),
      //           ..._pages.value
      //         ];
      //       }
      //     } finally {
      //       prefetchingPrev = false;
      //     }
      //   }

      //   return;
      // }

      if (_currentPage.value + 5 >= _pages.value.length - 1) {
        // prefetch next chap
        // getPages()
        final nextChapter = _nextChapter.value;
        if (nextChapter != null && !prefetchingNext) {
          // prefetch next
          prefetchingNext = true;
          try {
            if (chaptersLoadedStore[nextChapter.chapterId] == true) return;

            final currentChapter = _pages.value.last.chapter;

            final List<OImage> pages$$ = await ComicDownloader.instance
                .getDownloadedChapter(
                  service: widget.service,
                  comicId: widget.comicId,
                  chapterId: nextChapter.chapterId,
                )
                .then((downloaded) async {
                  if (downloaded != null && downloaded.doneAt > 0) {
                    return ComicDownloader.getPagesWithOffline(downloaded);
                  }

                  return await widget.getPages(nextChapter.chapterId);
                });

            final $pages = pages$$.indexed.map(
              (params) => ImageWithGroup(
                chapter: nextChapter,
                index: params.$1,
                image: params.$2,
              ),
            );

            chaptersLoadedStore[nextChapter.chapterId] = true;

            if (mounted) {
              _pages.value = [
                ..._pages.value,
                ImageWithGroup(
                  chapter: currentChapter,
                  index: -1,
                  image: OImage(src: OImage.fake),
                ),
                ...$pages,
              ];
            }
          } finally {
            prefetchingNext = false;
          }
        }
      }
    });

    /// battery system
    final battery = Battery();

    battery.batteryLevel.then((level) {
      if (mounted) _batteryLevel.value = level;
    });
    battery.batteryState.then((state) {
      if (mounted) _batteryState.value = state;
    });
    if (!XPlatform.isWeb) {
      battery.isInBatterySaveMode.then((state) {
        if (mounted) _batterySaveM.value = state;
      });
      onBeforeUnmount(
        battery.onBatteryStateChanged.listen((state) {
          _batteryState.value = state;
        }).cancel,
      );
    }
    onBeforeUnmount(
      Timer.periodic(Duration(seconds: 10), (timer) {
        final battery = Battery();

        battery.batteryLevel.then((level) {
          if (mounted) _batteryLevel.value = level;
        });
        battery.batteryState.then((state) {
          if (mounted) _batteryState.value = state;
        });
        if (!XPlatform.isWeb) {
          battery.isInBatterySaveMode.then((state) {
            if (mounted) _batterySaveM.value = state;
          });
        }
      }).cancel,
    );

    /// current time
    onBeforeUnmount(
      Timer.periodic(Duration(seconds: 1), (timer) {
        if (!mounted) return;
        final now = DateTime.now();

        final format = DateFormat(_use24h ? 'HH:mm' : 'hh:mm a');
        _currentTime.value = format.format(now);
      }).cancel,
    );

    /// history read
    watch([_realCurrentPage], () {
      if (_currChapter.value != null &&
          !_skipRestoreWatch.contains(_chapterId.value)) {
        _saveWatchPage(
          service: widget.service,
          comicId: widget.comicId,
          chapter: _currChapter.value!,
          metaComic: widget.comic,
          watchPage: WatchPage(
            currentPage: _realCurrentPage.value.toInt(),
            totalPage: _realLength.value,
          ),
          force: false,
        );
      }
    });
    watch([_currChapter], () {});
    // save watch page if exit reader
    onBeforeUnmount(() {
      if ((_realCurrentPage.value - _realLength.value).abs() <= 1) {
        _forceUpdateWatchPage();
        logger.i('save watch page because exit reader');
      }
    });

    watchEffect(() async {
      if (_currChapter.value != null) {
        try {
          final watchPage = await widget.service.getWatchPage(
            comicId: widget.comicId,
            chapter: _currChapter.value!,
            metaComic: widget.comic,
          );

          // pages always ready
          _currentPage.value = watchPage.currentPage.toDouble();
          showSnackBar(
            Text(
              'Read page restored ${((_currentPage.value + 1) / watchPage.totalPage * 100).round()}%',
            ),
          );
        } catch (error, trace) {
          if (error is! UnimplementedError) {
            logger.e(error, stackTrace: trace);
          }
        }
      }
    });

    // status state manager
    onBeforeUnmount(() {
      SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.manual,
        overlays: SystemUiOverlay.values,
      );
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.black),
      );
    });
    watch([_showToolbar], () async {
      if (_showToolbar.value) {
        await SystemChrome.setEnabledSystemUIMode(
          SystemUiMode.manual,
          overlays: SystemUiOverlay.values,
        );
        SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle(statusBarColor: Colors.black),
        );
      } else {
        await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
      }
    });

    // preload page
    watch([_currentPage, _pages], () async {
      final maxLoad = _useTwoPage.value ? 40 : 20;

      for (int i = _currentPage.value.floor(); i < _pages.value.length; i++) {
        if (!mounted) break;
        if (_pages.value.elementAt(i).image.src == OImage.fake) continue;

        if (_progressCacheStore[_pages.value.elementAt(i).image] != null) {
          continue;
        }

        if (i - _currentPage.value > maxLoad) break;
        logger.i('[manga_reader]: preload image $i');

        final progress =
            _progressCacheStore[_pages.value.elementAt(i).image] ??= ref(-1.0);

        // await Future.any([
        _fetchPage(i, false, progress: progress);
        // Future.delayed(Duration(milliseconds: 500)),
        // ]);
      }
    }, immediate: true);
    super.initState();
  }

  void _forceUpdateWatchPage() {
    _saveWatchPage(
      service: widget.service,
      comicId: widget.comicId,
      chapter: _currChapter.value!,
      metaComic: widget.comic,
      watchPage: WatchPage(
        currentPage: _realCurrentPage.value.toInt(),
        totalPage: _realLength.value,
      ),
      force: true,
    );
    logger.i('save watch page');
  }

  Timer? _timer;
  void _saveWatchPage({
    required ComicWatchPageMixin service,
    required String comicId,
    required ComicChapter chapter,
    required MetaComic metaComic,
    required WatchPage watchPage,
    required bool force,
  }) {
    if (DateTime.now().difference(_createdAt) < Duration(seconds: 3)) return;

    if (force) {
      _timer?.cancel();
      _timer = null;
    }

    if (_timer != null) return;
    if (watchPage.currentPage.toInt() == 0 ||
        watchPage.totalPage.toInt() == 0 ||
        watchPage.currentPage > watchPage.totalPage) {
      return;
    }

    void run() {
      _timer = null;
      service.setWatchPage(
        comicId: comicId,
        chapter: chapter,
        metaComic: metaComic,
        watchPage: watchPage,
      );
    }

    if (force) {
      run();
    } else {
      _timer = Timer(Duration(seconds: 10), run);
    }
  }

  void _updateRoute() {
    final currentGroup =
        _pages
            .value[_currentPage.value.round()]
            .chapter
            .chapterId; // Get the group id of the current page
    if (_chapterId.value != currentGroup) {
      _forceUpdateWatchPage();
      _skipRestoreWatch.add(currentGroup);
      _chapterId.value = currentGroup;
      widget.onChangeChap(currentGroup);
      // GoRouter.of(context)
      // context.go("/details_comic/${widget.sourceId}/${widget.chapterId}/view?chap=$currentGroup");
    }
  }

  bool get _usingPageView {
    // timer.cancel();
    return modeUsingPageView(_mode.value);
  }

  // void _lazyLoadImages() {
  //   setState(() {
  //     int startIndex = (_currentPage.floor() - 5).clamp(0, pages.length - 1);
  //     int endIndex = (_currentPage.ceil() + 5).clamp(0, pages.length - 1);

  //     for (int i = startIndex; i <= endIndex; i++) {
  //       if (_isImageLoaded[i] != true) {
  //         _isImageLoaded[i] = true;
  //         // if (_usingPageView && _useTwoPage) {
  //         _fetchAspectRatio(i);
  //         // }
  //       }
  //     }
  //   });
  // }

  Widget _buildPlacePage({
    required ComicChapter chapter,
    ComicChapter? prevChapter,
    ComicChapter? nextChapter,
  }) {
    return SizedBox(
      width: 100.w(context),
      height: _usingPageView ? 100.h(context) : 50.h(context),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (prevChapter != null) ...[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 20.0),
              child: Text(
                "Previous chapter:",
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 20.0),
              child: Text(
                [
                  prevChapter.name,
                  if (prevChapter.fullName != null)
                    ' - ${prevChapter.fullName}',
                ].join(''),
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(height: 20.0),
          ],
          Padding(
            padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 20.0),
            child: Text("Current chapter:", style: TextStyle(fontSize: 16.0)),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 20.0),
            child: Text(
              [
                chapter.name,
                if (chapter.fullName != null) ' - ${chapter.fullName}',
              ].join(''),
              style: TextStyle(fontSize: 18.0),
            ),
          ),
          if (nextChapter != null) ...[
            SizedBox(height: 20.0),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 20.0),
              child: Text(
                "Next chapter:",
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 20.0),
              child: Text(
                [
                  nextChapter.name,
                  if (nextChapter.fullName != null)
                    ' - ${nextChapter.fullName}',
                ].join(''),
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Future<ui.Image> _decodeWithDescriptor(Uint8List bytes) async {
    final buffer = await ImmutableBuffer.fromUint8List(bytes);
    final descriptor = await ImageDescriptor.encoded(buffer);
    final codec = await descriptor.instantiateCodec();
    final frame = await codec.getNextFrame();

    return frame.image;
  }

  Future<FutureCache<ui.Image>> _fetchPage(
    int index,
    bool wait, {
    required Ref<double> progress,
  }) async {
    final item = _pages.value.elementAt(index);

    final cache = _pageMemoryCacheStore[item.image];
    if (cache != null && cache.error == null) {
      await cache.future;

      return cache;
    }

    if (!mounted) throw Exception('Break by unmounted');

    _pageMemoryCacheStore[item.image] = FutureCache(
      ComicDownloader.getPage(item.image).then((buffer) {
        if (!mounted) throw Exception('Break by unmounted');

        if (buffer != null) return _decodeWithDescriptor(buffer);
        return widget.service.dioCache
            .get(
              item.image.src,
              options: Options(
                headers: item.image.headers?.toMap(),
                responseType: ResponseType.bytes,
              ),
              onReceiveProgress: (count, total) {
                progress.value = (count / total);
              },
            )
            .then((res) => Uint8List.fromList(res.data))
            .then((buffer) async {
              if (!mounted) throw Exception('Break by unmounted');

              if (_serviceSupportFetchPage[widget.service] != false) {
                try {
                  buffer = await widget.service.fetchPage(buffer, item.image);
                } on UnimplementedError {
                  _serviceSupportFetchPage[widget.service] = false;
                }
              }

              if (!mounted) throw Exception('Break by unmounted');

              if (comicAutoTrimImage.value) {
                buffer = await autoTrimImageIsolate(image: buffer);
              }

              return _decodeWithDescriptor(buffer);
            });
      }),
    );

    await _pageMemoryCacheStore[item.image]!.future;

    // final image = _pageMemoryCacheStore[item.image]!.data!;

    // if (mounted) {
    //   final future = precacheImage(image, context);
    //   if (wait) await future;
    // }

    return _pageMemoryCacheStore[item.image]!;
  }

  Widget _buildPage(int index, {Key? key}) {
    final item = _pages.value.elementAt(index);
    if (item.image.src == OImage.fake) {
      final prevPage = index < 1 ? null : _pages.value.elementAt(index - 1);
      if (prevPage != null && prevPage.chapter != item.chapter) {
        return _buildPlacePage(
          chapter: item.chapter,
          prevChapter: prevPage.chapter,
        );
      }

      final nextPage = _pages.value.elementAtOrNull(index + 1);
      if (nextPage != null && nextPage.chapter != item.chapter) {
        return _buildPlacePage(
          chapter: item.chapter,
          nextChapter: nextPage.chapter,
        );
      }
    }

    // return CachedNetworkImage(
    //   key: key,
    //   imageUrl: item.image.src,
    //   httpHeaders:
    //       Headers({
    //         'set-cookie': widget.service.getSetting(key: 'cookie') ?? '',
    //         'user-agent': widget.service.getSetting(key: 'user_agent') ?? '',
    //         ...item.image.headers?.toMap() ?? {},
    //       }).toMap(),
    //   placeholder:
    //       (context, url) =>
    //           SizedBox(height: 100.h(context), child: _buildPageLoading(null)),
    //   errorWidget: (context, url, error) => Icon(Icons.error),
    //   fit: BoxFit.cover,
    // );

    final source = item;

    final cache = _pageMemoryCacheStore[source.image];
    if (cache != null && cache.data != null) {
      return RawImage(image: cache.data!, fit: BoxFit.contain);
    }

    final progress = _progressCacheStore[source.image] ??= ref(-1.0);
    return FutureBuilder(
      future: _fetchPage(index, false, progress: progress),
      builder: (context, snapshot) {
        return snapshot.when(
          error:
              (error, stack) => SizedBox(
                height: 100.h(context),
                child: Text('Error: $error ($stack)'),
              ),
          loading:
              () => SizedBox(
                height: 100.h(context),
                child: Watch(() => _buildPageLoading(progress.value)),
              ),
          data: (data, _) => RawImage(image: data.data!, fit: BoxFit.contain),
        );
      },
    );

    // return OImage.oNetwork(
    //   source,
    //   sourceId: widget.service.uid,
    //   fit: BoxFit.contain,
    //   loadingBuilder: (context, child, loadingProgress) {
    //     if (loadingProgress == null) {
    //       return child;
    //     }

    //     return SizedBox(
    //       height: 100.h(context),
    //       child: _buildPageLoading(loadingProgress),
    //     );
    //   },
    // );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    // return InfiniteScrollPageView(
    //   prep: pages.toList(),
    //   pages: pages.toList(),
    //   app: pages.toList(),
    // );
    return Scaffold(
      body: Stack(
        children: [
          TapListener(
            rows: 3,
            columns: 3,
            onTap: _onTapGrid,
            child:
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 900),
                  child: _buildReader(),
                ).alignAtTopCenter(),
          ),
          Positioned(left: 0, right: 0, bottom: 0, child: _buildTinyStatus()),
          Positioned(left: 0, right: 0, bottom: 0, child: _buildBottomBar()),
        ],
      ),
    );
  }

  Widget _buildProgressControl() {
    return SliderTheme(
      data: SliderThemeData(
        thumbShape: SliderComponentShape.noThumb,
        trackHeight: 15.0,
        overlayShape: SliderComponentShape.noOverlay,
      ),
      child: Watch(
        () => Slider(
          min: 0.0,
          max: _realLength.value - 1,
          value: min(_realCurrentPage.value, _realLength.value - 1),
          onChanged: (value) {
            _currentPage.value = value; //.toInt();
          },
        ),
      ),
    );
  }

  void _showPanelSettings() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (context) {
        bool autoScroll = false;

        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // List Item: Rotate Screen
                  InkWell(
                    customBorder: const StadiumBorder(),
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 12.0,
                      ),
                      child: Row(
                        children: const [
                          Iconify(Ic.outline_screen_rotation),
                          SizedBox(width: 16.0),
                          Text('Rotate Screen'),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 12.0),

                  // Text: Mode
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Mode",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8.0),

                  // Button Group
                  Watch(
                    () => ToggleButtons(
                      isSelected: [
                        _mode.value == ComicModes.leftToRight,
                        _mode.value == ComicModes.rightToLeft,
                        _mode.value == ComicModes.topToBottom,
                        _mode.value == ComicModes.webToon,
                      ],
                      onPressed: (index) {
                        _mode.value = ComicModes.values.elementAt(index);
                      },
                      borderRadius: BorderRadius.circular(15.0),
                      selectedColor: Colors.black,
                      fillColor: Theme.of(context).colorScheme.primary,
                      color: Theme.of(context).colorScheme.onSurface,
                      constraints: const BoxConstraints(
                        minHeight: 50.0,
                        minWidth: 70.0,
                      ),
                      children: [
                        _buildIconWithLabel(Mdi.cog, "Standard"),
                        _buildIconWithLabel(Mdi.arrow_left, "RTL"),
                        _buildIconWithLabel(
                          Mdi.format_vertical_align_center,
                          "Vertical",
                        ),
                        _buildIconWithLabel(Mdi.web, "Webtoon"),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16.0),

                  // Description Text
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Mode saved to this comic",
                      style: TextStyle(color: Colors.grey, fontSize: 14.0),
                    ),
                  ),
                  const SizedBox(height: 12.0),

                  // List Item: Use Two Page
                  InkWell(
                    customBorder: const StadiumBorder(),
                    onTap: () {
                      _useTwoPage.value = !_useTwoPage.value;
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 12.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: const [
                              Iconify(Mdi.book),
                              SizedBox(width: 16.0),
                              Text('Use Two Page'),
                            ],
                          ),
                          Watch(
                            () => Switch(
                              value: _useTwoPage.value,
                              onChanged: (value) {
                                _useTwoPage.value = value;
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // List Item: Auto Scroll
                  InkWell(
                    customBorder: const StadiumBorder(),
                    onTap: () {
                      setState(() {
                        autoScroll = !autoScroll;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 12.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: const [
                              Iconify(Mdi.autorenew),
                              SizedBox(width: 16.0),
                              Text('Auto Scroll'),
                            ],
                          ),
                          Switch(
                            value: autoScroll,
                            onChanged: (value) {
                              setState(() {
                                autoScroll = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),

                  // switch auto trim image
                  InkWell(
                    customBorder: const StadiumBorder(),
                    onTap:
                        () =>
                            comicAutoTrimImage.value =
                                !comicAutoTrimImage.value,
                    child: Watch(
                      () => Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8.0,
                          horizontal: 12.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: const [
                                Iconify(ArcIcons.cacheCleaner),
                                SizedBox(width: 16.0),
                                Text('Auto trim page'),
                              ],
                            ),
                            Switch(
                              value: comicAutoTrimImage.value,
                              onChanged:
                                  (value) => comicAutoTrimImage.value = value,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void _showPanelSkipPages() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder:
          (context) => ImagePicker(
            images: _pages.value.map((page) => page.image).toList(),
            sourceId: widget.service.uid,
            onChange: (selected) {
              setState(() {
                _skipImages.clear();
                _skipImages.addAll(selected);
              });
            },
          ),
    );
  }

  void _showPanelComments() {
    if (_currChapter.value == null) return;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      backgroundColor: Theme.of(context).colorScheme.surface,
      builder:
          (context) => CommentsSheet(
            comicId: widget.comicId,
            metaComic: widget.comic,
            chapterId: _chapterId.value,
            chapter: _currChapter.value!,
            service: widget.service as ComicCommentMixin,
          ),
    );
  }

  void _showPanelListChapters() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder:
          (context) => SheetChapters(
            comic: widget.comic,
            service: widget.service,
            comicId: widget.comicId,
            currentChapterId: _chapterId.value,
            initialChildSize: 0.6,
            watchPageChapters: _watchPageChapters,
            lastReadChapter: null,
            replace: true,
            reverse: true,
          ),
    );
  }

  Widget _buildIconWithLabel(String icon, String label) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Iconify(icon, size: 20), // Smaller icon size
        const SizedBox(height: 4.0),
        Text(
          label,
          style: const TextStyle(fontSize: 12.0), // Smaller font size
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildReader() {
    return Watch(() {
      final mode = _mode.value;

      if (mode == ComicModes.webToon) {
        return WebToonReader(
          // itemCount: pages.length,
          pages: _pages,
          itemBuilder: (BuildContext context, int index, key) {
            // final currPage = pages.elementAt(index);

            final page = _buildPage(index, key: key);

            // if (index < pages.length - 1) {
            //   final nextPage = pages.elementAtOrNull(index + 1);

            //   if (nextPage != null &&
            //       nextPage.chapter.chapterId != currPage.chapter.chapterId) {
            //     final splash = _buildPlacePage(
            //         chapter: currPage.chapter, nextChapter: nextPage.chapter);

            //     return Column(children: [page, splash]);
            //   }
            // }

            // if (index > 0) {
            //   final prevPage = pages.elementAtOrNull(index - 1);

            //   if (prevPage != null &&
            //       prevPage.chapter.chapterId != currPage.chapter.chapterId) {
            //     final splash = _buildPlacePage(
            //         chapter: currPage.chapter, prevChapter: prevPage.chapter);

            //     return Column(children: [splash, page]);
            //   }
            // }

            return page;
          },
          currentPage: _currentPage,
        );
      }
      if (mode == ComicModes.topToBottom) {
        return VerticalReader(
          pages: _pages,
          itemBuilder: (BuildContext context, int index, key) {
            return _buildPage(index, key: key);
          },
          currentPage: _currentPage,
        );
      }

      return HorizonReader(
        pages: _pages,
        itemBuilder: (BuildContext context, int index, key) {
          return _buildPage(index, key: key);
        },
        currentPage: _currentPage,
        builderImage: (int index, key) async {
          final source = _pages.value.elementAt(index);

          final cache = _pageMemoryCacheStore[source.image];
          if (cache != null && cache.data != null) {
            return RawImage(image: cache.data!, fit: BoxFit.contain);
          }

          final data = await _fetchPage(
            index,
            false,
            progress:
                _progressCacheStore[_pages.value
                    .elementAt(index)
                    .image] ??= ref(-1.0),
          );

          return RawImage(image: data.data!, fit: BoxFit.contain);
        },
        rtl: mode == ComicModes.rightToLeft,
        twoPage: _useTwoPage.value,
      );
    });
  }

  Widget _buildPageLoading(double? progress) {
    return Center(
      child: SizedBox(
        width: 20.0,
        height: 20.0,
        child: CircularProgressIndicator(
          value: progress == null || progress <= 0 ? null : progress,
        ),
      ),
    );
  }

  Widget _buildBottomBar() {
    return Watch(
      () => AnimatedSlide(
        duration: Duration(milliseconds: 300),
        offset: _showToolbar.value ? Offset(0, 0) : Offset(0, 1),
        curve: Curves.easeInOut,
        child: AnimatedOpacity(
          duration: Duration(milliseconds: 300),
          opacity: _showToolbar.value ? 1.0 : 0.0,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Watch(
                      () => Opacity(
                        opacity: _prevChapter.value == null ? 0.8 : 1.0,
                        child: GFIconButton(
                          icon: Iconify(
                            Mdi.skip_previous,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                          shape: GFIconButtonShape.circle,
                          color: Theme.of(
                            context,
                          ).colorScheme.surface.withValues(alpha: 0.9),
                          onPressed:
                              _prevChapter.value == null
                                  ? null
                                  : () {
                                    context.pushReplacement(
                                      "/details_comic/${widget.service.uid}/${widget.comicId}/view?chap=${_prevChapter.value!.chapterId}",
                                      extra: {'comic': widget.comic},
                                    );
                                  },
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 6.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Material(
                            color: Theme.of(
                              context,
                            ).colorScheme.surface.withValues(alpha: 0.9),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16.0,
                                vertical: 15.0,
                              ),
                              child: _buildProgressControl(),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Watch(
                      () => Opacity(
                        opacity: _nextChapter.value == null ? 0.8 : 1.0,
                        child: GFIconButton(
                          icon: Iconify(
                            Mdi.skip_next,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                          shape: GFIconButtonShape.circle,
                          color: Theme.of(
                            context,
                          ).colorScheme.surface.withValues(alpha: 0.9),
                          onPressed:
                              _nextChapter.value == null
                                  ? null
                                  : () {
                                    context.pushReplacement(
                                      "/details_comic/${widget.service.uid}/${widget.comicId}/view?chap=${_nextChapter.value!.chapterId}",
                                      extra: {'comic': widget.comic},
                                    );
                                  },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8.0),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.0,
                ).add(EdgeInsets.only(bottom: 8.0)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                    child: Material(
                      color: Theme.of(
                        context,
                      ).scaffoldBackgroundColor.withValues(alpha: 0.8),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.0,
                          vertical: 8.0,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: ButtonInset(
                                icon: Eva.heart_outline,
                                text: 'Like',
                                onPressed: () {},
                              ),
                            ),
                            Expanded(
                              child: ButtonInset(
                                icon: Eva.message_square_outline,
                                text: 'Comments',
                                disabled: widget.service is! ComicCommentMixin,
                                onPressed: _showPanelComments,
                              ),
                            ),
                            Expanded(
                              child: Watch(
                                () => ButtonInset(
                                  icon: Eva.list_outline,
                                  text:
                                      '${_realCurrentPage.value.toInt() + 1} / ${_realLength.value}',
                                  onPressed: _showPanelListChapters,
                                ),
                              ),
                            ),
                            Expanded(
                              child: ButtonInset(
                                icon: Eva.settings_2_outline,
                                text: 'Settings',
                                onPressed: _showPanelSettings,
                              ),
                            ),
                            Expanded(
                              child: ButtonInset(
                                icon: Ion.arrow_forward,
                                text: 'Skip',
                                onPressed: _showPanelSkipPages,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTinyStatus() {
    return Watch(() {
      final currChapter = _currChapter.value;
      if (currChapter == null) return SizedBox.shrink();

      _use24h = context.alwaysUse24HourFormat;
      // ShaderMask(
      //   shaderCallback: (bounds) => LinearGradient(
      //     colors: [Colors.white, Colors.black],
      //     begin: Alignment.topLeft,
      //     end: Alignment.bottomRight,
      //   ).createShader(bounds),
      //   child:

      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StrokeText(
            '${currChapter.name}/${widget.comic.chapters.sortAsc.length}',
          ),
          10.0.widthBox,
          StrokeText(
            'Page.${_realCurrentPage.value.toInt() + 1}/${_realLength.value}',
          ),
          10.0.widthBox,
          StrokeText(
            '${((_realCurrentPage.value.toInt() + 1) * 100 / _realLength.value).round()}%',
          ),
          20.0.widthBox,
          Watch(() {
            final String icon = switch (_batteryState.value) {
              BatteryState.charging => Fluent.batteryCharge24,
              BatteryState.connectedNotCharging => Fluent.batteryWarning24,
              BatteryState.full => Fluent.batteryCheckmark24,
              BatteryState.unknown => Fluent.batteryWarning24,
              BatteryState.discharging || null => switch (_batteryLevel.value ??
                  0) {
                <= 10 => Fluent.battery024,
                <= 20 => Fluent.battery124,
                <= 30 => Fluent.battery224,
                <= 40 => Fluent.battery324,
                <= 50 => Fluent.battery424,
                <= 60 => Fluent.battery524,
                <= 70 => Fluent.battery624,
                <= 80 => Fluent.battery724,
                <= 90 => Fluent.battery824,
                < 100 => Fluent.battery924,
                >= 100 => Fluent.battery1024,
                int() => throw UnimplementedError(),
              },
            };
            late final Color color;
            if (_batteryState.value == BatteryState.charging) {
              color = Colors.green.shade600;
            } else if (_batterySaveM.value == true) {
              color = Colors.yellow.shade600;
            } else {
              color = switch (_batteryLevel.value ?? 0) {
                <= 20 => Colors.red.shade600,
                _ => Colors.white,
              };
            }

            return Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  child: Iconify(icon, color: Colors.black, size: 22),
                ),
                // Fill (white)
                Iconify(icon, color: color, size: 20),
              ],
            );
          }),
          // get current battery
          Watch(() => StrokeText('${_batteryLevel.value}%')),
          5.0.widthBox,
          // current time
          Watch(
            () => StrokeText(
              _currentTime.value ??
                  DateFormat(
                    _use24h ? 'HH:mm' : 'hh:mm a',
                  ).format(DateTime.now()),
            ),
          ),
        ],
      ).paddingHorizontal(8);
    });
  }

  void _prevPage() {
    _currentPage.value = max(0, _currentPage.value - 1);
  }

  void _nextPage() {
    _currentPage.value = min(_pages.value.length - 1, _currentPage.value + 1);
  }

  void _onTapGrid(int row, int column) {
    logger.i("row = $row, column = $column");

    if (row == 1 && column == 1) {
      // center

      _showToolbar.value = !_showToolbar.value;
      widget.onChangeEnabled(_showToolbar.value);
    }
    // click bottom
    if (column == 2) {
      // scroll 90% height screen
      switch (_mode.value) {
        case ComicModes.topToBottom:
          // next page;
          _nextPage();
          break;
        case ComicModes.webToon:
          break;
        default:
      }
      return;
    }
    // click top
    if (column == 0) {
      switch (_mode.value) {
        case ComicModes.topToBottom:
          // prev page
          _prevPage();
          break;
        case ComicModes.webToon:
          break;
        default:
      }
      return;
    }
    // click left
    if (row == 0) {
      switch (_mode.value) {
        case ComicModes.leftToRight:
          _prevPage();
          break;
        case ComicModes.rightToLeft:
          _nextPage();
          break;
        default:
      }
      return;
    }
    // click right
    if (row == 2) {
      switch (_mode.value) {
        case ComicModes.leftToRight:
          _nextPage();
          break;
        case ComicModes.rightToLeft:
          _prevPage();
          break;
        default:
      }
    }
  }
}
