import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:hoyomi/controller/history.dart';
import 'package:hoyomi/core_services/comic/interfaces/comic_chapter.dart';
import 'package:hoyomi/core_services/comic/mixin/comic_auth_mixin.dart';
import 'package:hoyomi/core_services/comic/comic_service.dart';
import 'package:hoyomi/core_services/interfaces/o_image.dart';
import 'package:hoyomi/core_services/comic/interfaces/comic_modes.dart';
import 'package:hoyomi/core_services/comic/interfaces/meta_comic.dart';
import 'package:hoyomi/database/scheme/history_chap.dart';
import 'package:hoyomi/screens/details_comic/horizon_reader.dart';
import 'package:hoyomi/screens/details_comic/vertical_reader.dart';
import 'package:hoyomi/screens/details_comic/webtoon_reader.dart';
import 'package:hoyomi/widgets/button_inset.dart';
import 'package:hoyomi/widgets/comments/widget/comments_sheet.dart';
import 'package:hoyomi/widgets/image_picker.dart';
import 'package:hoyomi/widgets/comic/sheet_chapters.dart';
import 'package:hoyomi/widgets/tap_listener.dart';
import 'package:kaeru/kaeru.dart';
import 'package:mediaquery_sizer/mediaquery_sizer.dart';

class ImageWithGroup extends OImage {
  final ComicChapter chapter;
  final int index;

  ImageWithGroup(
      {required this.chapter,
      required this.index,
      required super.src,
      super.headers});
}

class MangaReader extends StatefulWidget {
  final ComicService service;
  final String comicId;

  final List<OImage> pages;
  final MetaComic comic;
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
    required this.chapterId,
    required this.getPages,
    required this.onChangeChap,
    required this.onChangeEnabled,
  });

  @override
  createState() => _MangaReaderState();
}

class _MangaReaderState extends State<MangaReader>
    with AutomaticKeepAliveClientMixin, KaeruMixin, KaeruListenMixin {
  @override
  bool get wantKeepAlive => true;

  late final Computed<ComicChapter?> _nextChapter;
  late final Computed<ComicChapter?> _prevChapter;

  final Set<int> _skipImages = {};

  late final Ref<String> _chapterId = ref(widget.chapterId);
  late final Ref<List<ImageWithGroup>> _pages;
  late final Ref<ComicModes> _mode;

  late final _showToolbar = ref(true);
  late final _useTwoPage = ref(false);

  Map<String, HistoryChap>? _historyChapters;

  late final _currentPage = ref(0.0);
  late final Computed<double> _realCurrentPage;
  late final Computed<int> _realLength;

  @override
  void initState() {
    final chapter = _getChapterObject(chapterId: _chapterId.value)!;
    _pages = ref(widget.pages.indexed.map((params) {
      final (index, page) = params;

      return ImageWithGroup(
        chapter: chapter,
        index: index,
        src: page.src,
        headers: page.headers,
      );
    }).toList());

    final startPage = computed(() {
      return _pages.value.indexWhere((page) =>
          page.chapter.chapterId == _chapterId.value &&
          page.src != OImage.fake);
    });
    final stopPage = computed(() {
      return _pages.value.lastIndexWhere((page) =>
          page.chapter.chapterId == _chapterId.value &&
          page.src != OImage.fake);
    });

    _mode =
        ref(widget.service.getComicModes(widget.comic) ?? ComicModes.webToon);
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
      final index = widget.comic.chapters
          .indexWhere((chapter) => chapter.chapterId == _chapterId.value);
      if (index < 1) return null;

      return widget.comic.chapters.elementAtOrNull(index - 1);
    });
    _nextChapter = computed(() {
      final index = widget.comic.chapters
          .indexWhere((chapter) => chapter.chapterId == _chapterId.value);

      return widget.comic.chapters.elementAtOrNull(index + 1);
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
            final $pages =
                (await widget.getPages(nextChapter.chapterId)).indexed.map(
                      (params) => ImageWithGroup(
                        chapter: nextChapter,
                        index: params.$1,
                        src: params.$2.src,
                        headers: params.$2.headers,
                      ),
                    );

            chaptersLoadedStore[nextChapter.chapterId] = true;

            if (mounted) {
              _pages.value = [
                ..._pages.value,
                ImageWithGroup(
                  chapter: currentChapter,
                  index: -1,
                  src: OImage.fake,
                ),
                ...$pages
              ];
            }
          } finally {
            prefetchingNext = false;
          }
        }
      }
    });

    super.initState();

    _updateGetHistory();
  }

  void _updateGetHistory() async {
    final history = HistoryController();
    final map = await history.getHistory(widget.service.uid, widget.comicId);

    if (mounted && map != null) {
      setState(() {
        _historyChapters = {for (var item in map) item.chapterId: item};
      });
    }
  }

  void _updateRoute() {
    final currentGroup = _pages.value[_currentPage.value.round()].chapter
        .chapterId; // Get the group id of the current page
    if (_chapterId.value != currentGroup) {
      _chapterId.value = currentGroup;
      _updateGetHistory();
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

  ComicChapter? _getChapterObject({required String chapterId}) {
    return widget.comic.chapters
        .firstWhereOrNull((chapter) => chapter.chapterId == chapterId);
  }

  Widget _buildPlacePage(
      {required ComicChapter chapter,
      ComicChapter? prevChapter,
      ComicChapter? nextChapter}) {
    return SizedBox(
      width: double.infinity,
      height: _usingPageView
          ? double.infinity
          : MediaQuery.of(context).size.height / 2,
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
                prevChapter.name,
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
              chapter.name,
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
                nextChapter.name,
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildPage(int index) {
    final item = _pages.value.elementAt(index);
    if (item.src == OImage.fake) {
      final prevPage = index < 1 ? null : _pages.value.elementAt(index - 1);
      if (prevPage != null && prevPage.chapter != item.chapter) {
        return _buildPlacePage(
            chapter: item.chapter, prevChapter: prevPage.chapter);
      }

      final nextPage = _pages.value.elementAtOrNull(index + 1);
      if (nextPage != null && nextPage.chapter != item.chapter) {
        return _buildPlacePage(
            chapter: item.chapter, nextChapter: nextPage.chapter);
      }
    }

    return OImage.network(
      item.src,
      sourceId: widget.service.uid,
      headers: item.headers,
      fit: BoxFit.contain,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) {
          return child;
        }

        return SizedBox(
          height: 100.h(context),
          child: _buildPageLoading(loadingProgress),
        );
      },
    );
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
            child: Watch(() => _buildReader(_pages.value, _mode.value)),
          ),
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
      child: Watch(() => Slider(
            min: 0.0,
            max: _realLength.value - 1,
            value: min(_realCurrentPage.value, _realLength.value - 1),
            onChanged: (value) {
              _currentPage.value = value; //.toInt();
            },
          )),
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
                          Icon(MaterialCommunityIcons.screen_rotation),
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
                  Watch(() => ToggleButtons(
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
                          _buildIconWithLabel(
                            MaterialCommunityIcons.cog,
                            "Standard",
                          ),
                          _buildIconWithLabel(
                            MaterialCommunityIcons.arrow_left,
                            "RTL",
                          ),
                          _buildIconWithLabel(
                            MaterialCommunityIcons.format_vertical_align_center,
                            "Vertical",
                          ),
                          _buildIconWithLabel(
                            MaterialCommunityIcons.web,
                            "Webtoon",
                          ),
                        ],
                      )),
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
                              Icon(MaterialCommunityIcons.book),
                              SizedBox(width: 16.0),
                              Text('Use Two Page'),
                            ],
                          ),
                          Transform.scale(
                            scale: 0.8,
                            child: Watch(() => Switch(
                                  value: _useTwoPage.value,
                                  onChanged: (value) {
                                    _useTwoPage.value = value;
                                  },
                                )),
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
                              Icon(MaterialCommunityIcons.autorenew),
                              SizedBox(width: 16.0),
                              Text('Auto Scroll'),
                            ],
                          ),
                          Transform.scale(
                            scale: 0.8,
                            child: Switch(
                              value: autoScroll,
                              onChanged: (value) {
                                setState(() {
                                  autoScroll = value;
                                });
                              },
                            ),
                          ),
                        ],
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
      builder: (context) => ImagePicker(
        images: _pages.value,
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
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (context) => CommentsSheet(
        comicId: widget.comicId,
        chapterId: _chapterId.value,
        service: widget.service as ComicAuthMixin,
      ),
    );
  }

  void _showPanelListChapters() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (context) => SheetChapters(
        comic: widget.comic,
        sourceId: widget.service.uid,
        comicId: widget.comicId,
        histories: _historyChapters,
        currentChapterId: _chapterId.value,
        initialChildSize: 0.6,
      ),
    );
  }

  Widget _buildIconWithLabel(IconData icon, String label) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 20), // Smaller icon size
        const SizedBox(height: 4.0),
        Text(
          label,
          style: const TextStyle(fontSize: 12.0), // Smaller font size
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildReader(List<ImageWithGroup> pages, ComicModes mode) {
    if (mode == ComicModes.webToon) {
      return WebToonReader(
        itemCount: pages.length,
        itemBuilder: (BuildContext context, int index) {
          // final currPage = pages.elementAt(index);

          final page = _buildPage(index);

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
        itemCount: pages.length,
        itemBuilder: (BuildContext context, int index) {
          return _buildPage(index);
        },
        currentPage: _currentPage,
      );
    }

    return Watch(() => HorizonReader(
          itemCount: pages.length,
          itemBuilder: (BuildContext context, int index) {
            return _buildPage(index);
          },
          currentPage: _currentPage,
          builderImage: (int index) {
            final item = pages.elementAt(index);

            return OImage.network(
              item.src,
              sourceId: widget.service.uid,
              headers: item.headers,
              fit: BoxFit.contain,
            );
          },
          rtl: mode == ComicModes.rightToLeft,
          twoPage: _useTwoPage.value,
        ));
  }

  Widget _buildPageLoading(ImageChunkEvent? loadingProgress) {
    return Center(
      child: CircularProgressIndicator(
        value: loadingProgress?.expectedTotalBytes != null
            ? loadingProgress!.cumulativeBytesLoaded /
                (loadingProgress.expectedTotalBytes!)
            : null,
      ),
    );
  }

  Widget _buildBottomBar() {
    return Watch(() => AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          transitionBuilder: (child, animation) {
            const begin = Offset(0.0, kToolbarHeight * 2.5);
            const end = Offset.zero;
            const curve = Curves.easeInOut;

            var tween = Tween(
              begin: begin,
              end: end,
            ).chain(CurveTween(curve: curve));
            var offsetAnimation = animation.drive(tween);

            return SlideTransition(position: offsetAnimation, child: child);
          },
          child: !_showToolbar.value
              ? null
              : Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Material(
                            color: Colors.transparent,
                            child: Watch(() => AbsorbPointer(
                                  absorbing: _prevChapter.value == null,
                                  child: Ink(
                                    decoration: ShapeDecoration(
                                      color: Theme.of(
                                        context,
                                      )
                                          .colorScheme
                                          .surface
                                          .withValues(alpha: 0.9),
                                      shape: CircleBorder(),
                                    ),
                                    child: IconButton(
                                      iconSize: 30.0,
                                      icon: Icon(
                                        MaterialCommunityIcons.skip_previous,
                                      ),
                                      color: _prevChapter.value != null
                                          ? Theme.of(
                                              context,
                                            ).colorScheme.onSurface
                                          : Theme.of(context)
                                              .colorScheme
                                              .onSurface
                                              .withValues(alpha: 0.5),
                                      onPressed: () {
                                        context.replace(
                                          "/details_comic/${widget.service}/${widget.comicId}/view?chap=${_prevChapter.value!.chapterId}",
                                          extra: {'comic': widget.comic},
                                        );
                                      },
                                    ),
                                  ),
                                )),
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
                          Material(
                            color: Colors.transparent,
                            child: Watch(() => AbsorbPointer(
                                absorbing: _nextChapter.value == null,
                                child: Ink(
                                  decoration: ShapeDecoration(
                                    color: Theme.of(
                                      context,
                                    )
                                        .colorScheme
                                        .surface
                                        .withValues(alpha: 0.9),
                                    shape: CircleBorder(),
                                  ),
                                  child: IconButton(
                                    iconSize: 30.0,
                                    icon:
                                        Icon(MaterialCommunityIcons.skip_next),
                                    color: _nextChapter.value != null
                                        ? Theme.of(
                                            context,
                                          ).colorScheme.onSurface
                                        : Theme.of(context)
                                            .colorScheme
                                            .onSurface
                                            .withValues(alpha: 0.5),
                                    onPressed: () {
                                      context.replace(
                                        "/details_comic/${widget.service}/${widget.comicId}/view?chap=${_nextChapter.value!.chapterId}",
                                        extra: {'comic': widget.comic},
                                      );
                                    },
                                  ),
                                ))),
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
                                      icon: Ionicons.heart_outline,
                                      text: 'Like',
                                      onPressed: () {},
                                    ),
                                  ),
                                  Expanded(
                                    child: ButtonInset(
                                      icon: Ionicons.chatbox_ellipses_outline,
                                      text: 'Comments',
                                      disabled:
                                          widget.service is! ComicAuthMixin ||
                                              (widget.service as ComicAuthMixin)
                                                      .getComments ==
                                                  null,
                                      onPressed: _showPanelComments,
                                    ),
                                  ),
                                  Expanded(
                                      child: Watch(() => ButtonInset(
                                            icon: Ionicons.list,
                                            text:
                                                '${_realCurrentPage.value.toInt() + 1} / ${_realLength.value}',
                                            onPressed: _showPanelListChapters,
                                          ))),
                                  Expanded(
                                    child: ButtonInset(
                                      icon: Ionicons.settings_outline,
                                      text: 'Settings',
                                      onPressed: _showPanelSettings,
                                    ),
                                  ),
                                  Expanded(
                                    child: ButtonInset(
                                      icon: Ionicons.arrow_forward,
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
        ));
  }

  void _prevPage() {
    _currentPage.value = max(0, _currentPage.value - 1);
  }

  void _nextPage() {
    _currentPage.value = min(_pages.value.length - 1, _currentPage.value + 1);
  }

  void _onTapGrid(int row, int column) {
    debugPrint("row = $row, column = $column");

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
