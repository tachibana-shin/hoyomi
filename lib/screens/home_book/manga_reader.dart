import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:honyomi/controller/history.dart';
import 'package:honyomi/controller/settings.dart';
import 'package:honyomi/core_services/book/auth_service.dart';
import 'package:honyomi/core_services/book/book_base_service.dart';
import 'package:honyomi/core_services/interfaces/basic_image.dart';
import 'package:honyomi/core_services/book/interfaces/comic_modes.dart';
import 'package:honyomi/core_services/book/interfaces/meta_book.dart';
import 'package:honyomi/database/scheme/book.dart';
import 'package:honyomi/database/scheme/history_chap.dart';
import 'package:honyomi/database/scheme/settings.dart';
import 'package:honyomi/plugins/event_bus.dart';
import 'package:honyomi/utils/debouncer.dart';
import 'package:honyomi/widgets/button_inset.dart';
import 'package:honyomi/widgets/comments/widget/comments_sheet.dart';
import 'package:honyomi/widgets/image_picker.dart';
import 'package:honyomi/widgets/book/sheet_chapters.dart';
import 'package:honyomi/widgets/tap_listener.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

// ignore: constant_identifier_names
const FAKE = "fake:";

class BasicImageWithGroup extends BasicImage {
  final String chapterId;

  BasicImageWithGroup(
      {required this.chapterId, required super.src, super.headers});
}

class MangaReader extends StatefulWidget {
  final BookBaseService service;
  final String bookId;

  final List<BasicImage> pages;
  final MetaBook book;
  final String chapterId;
  final Future<List<BasicImage>> Function(String chapterId) getPages;

  final Function(String chap) onChangeChap;
  final Function(bool enabled) onChangeEnabled;

  const MangaReader({
    super.key,
    required this.service,
    required this.bookId,
    required this.pages,
    required this.book,
    required this.chapterId,
    required this.getPages,
    required this.onChangeChap,
    required this.onChangeEnabled,
  });

  @override
  createState() => _MangaReaderState();
}

class _MangaReaderState extends State<MangaReader>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  final _debouncerUpdateHistory = Debouncer(milliseconds: 500);
  final Map<int, double?> _aspectRatios = {};
  final Set<int> _skipImages = {};

  late final HistoryController _history;
  late final Future<Book> _historyObjectFuture;
  late final bool _restored;

  late List<BasicImageWithGroup> pages;
  late String _chapter;
  late ComicModes _mode;
  late List<bool> _isImageLoaded;

  bool _showToolbar = true;
  bool _useTwoPage = false;
  bool _disablingObserveScroll = false;

  double _currentPage = 0;

  PageController _pageController = PageController(viewportFraction: 2);
  Key? _keyScroller;
  int _initialScrollIndex = 0;
  ItemScrollController _itemScrollController = ItemScrollController();
  ItemPositionsListener _itemPositionsListener = ItemPositionsListener.create();

  Map<String, HistoryChap>? _historyChapters;
  Settings? _settingsObject;

  double get _realCurrentPage {
    for (int i = 0; i <= _currentPage; i++) {
      if (pages[i].chapterId == _chapter && pages[i].src != FAKE) {
        return _currentPage - i;
      }
    }
    return _currentPage;
  }

  int get _realLength {
    int start = -1;
    for (int i = 0; i < pages.length; i++) {
      if (pages[i].chapterId == _chapter) {
        start = i;
        break;
      }
    }

    if (start == -1) return 0;

    int stop = -1;
    for (int i = pages.length - 1; i > start; i--) {
      if (pages[i].chapterId == _chapter) {
        stop = i;
        break;
      }
    }

    if (stop == -1) return 0;

    return stop - start + 1;
  }

  @override
  void initState() {
    _history = HistoryController();
    _historyObjectFuture = _history.createBook(widget.service.uid,
        bookId: widget.bookId, book: widget.book);

    SettingsController().getSettings().then((object) {
      _settingsObject = object;
    });

    _mode = widget.service.getComicModes(widget.book) ?? ComicModes.webToon;
    _chapter = widget.chapterId;
    pages = [
      if (_prevChapter != null)
        _buildSplashImage(
            chapterId: _currentChapter.chapterId,
            chapterNext: null,
            chapterCurrent: _currentChapter.name,
            chapterPrev: _prevChapter!.name),
      ...widget.pages.map((page) {
        return BasicImageWithGroup(
            chapterId: _chapter, src: page.src, headers: page.headers);
      })
    ];

    _restoreCurrentPage();

    super.initState();
    _refreshStoreImageLoaded();
    _lazyLoadImages();
    _prefetchChapSibling();

    _bindListenerScroll();

    _updateGetHistory();
  }

  Future<void> _restoreCurrentPage() async {
    final historyChap = await _history
        .getCurrentPage(await _historyObjectFuture, chapterId: _chapter);

    _initialScrollIndex = (historyChap?.currentPage.floor() ?? 0) +
        (_prevChapter == null ? 0 : 1);
    _currentPage =
        (_usingPageView ? _pageController.initialPage : _initialScrollIndex)
            .toDouble();

    if (mounted) setState(() {});
    _restored = true;
  }

// history api
  void _updateHistory() {
    _debouncerUpdateHistory.run(() async {
      if (!_restored) return;
      if (!mounted) return;

      _history.saveHistory(await _historyObjectFuture,
          chapterId: _chapter,
          currentPage: _realCurrentPage,
          maxPage: _realLength);

      eventBus.fire(UpdatedHistory(bookId: widget.bookId, chapterId: _chapter));
    });
  }

  void _updateGetHistory() async {
    final history = HistoryController();
    final map = await history.getHistory(widget.service.uid, widget.bookId);

    if (mounted && map != null) {
      setState(() {
        _historyChapters = {for (var item in map) item.chapterId: item};
      });
    }
  }

  void _setToolbar(bool enabled) {
    setState(() {
      _showToolbar = enabled;
      widget.onChangeEnabled(enabled);
    });
  }

  void _bindListenerScroll() {
    final debouncer = Debouncer(milliseconds: 70);
    _itemPositionsListener.itemPositions.addListener(() {
      if (_usingPageView || _disablingObserveScroll) return;

      debouncer.run(() {
        final positions = _itemPositionsListener.itemPositions.value;
        final visibleItem =
            positions.where((pos) => pos.itemLeadingEdge >= 0).lastOrNull;

        if (visibleItem != null && mounted) {
          final newVal = visibleItem.index.toDouble() - 1;
          if (_currentPage != newVal) {
            setState(() {
              _currentPage = max(0, newVal);
              _updateRoute();
              _updateHistory();
              _lazyLoadImages();
              _prefetchChapSibling();
            });
          }
        }
      });
    });
  }

  void _updateRoute() {
    final currentGroup = pages[_currentPage.round()]
        .chapterId; // Get the group id of the current page
    if (_chapter != currentGroup) {
      setState(() {
        _chapter = currentGroup;
        _updateGetHistory();
        widget.onChangeChap(currentGroup);
      });
      // GoRouter.of(context)
      // context.go("/details_comic/${widget.sourceId}/${widget.chapterId}/view?chap=$currentGroup");
    }
  }

  void _changeMode(ComicModes mode) {
    setState(() {
      _mode = mode;
    });

    // Timer.periodic(Duration(milliseconds: 5), (timer) {
    //   if (_mode == 3
    //       ? _itemScrollController.isAttached
    //       : _pageController.hasClients) {
    _updatePositionView();
    // timer.cancel();
    // }
    // });
  }

  bool get _usingPageView {
    // timer.cancel();
    return modeUsingPageView(_mode);
  }

  void _changeTwoPage(bool enabled) {
    setState(() {
      _useTwoPage = enabled;
    });
  }

  void _refreshStoreImageLoaded() {
    setState(() {
      _isImageLoaded = List.generate(pages.length, (index) => false);
    });
  }

  void _lazyLoadImages() {
    setState(() {
      int startIndex = (_currentPage.floor() - 5).clamp(0, pages.length - 1);
      int endIndex = (_currentPage.ceil() + 5).clamp(0, pages.length - 1);

      for (int i = startIndex; i <= endIndex; i++) {
        if (_isImageLoaded[i] != true) {
          _isImageLoaded[i] = true;
          // if (_usingPageView && _useTwoPage) {
          _fetchAspectRatio(i);
          // }
        }
      }
    });
  }

  Chapter get _currentChapter => widget.book.chapters
      .firstWhere((element) => element.chapterId == _chapter);
  Chapter? get _nextChapter {
    for (int i = 1; i < widget.book.chapters.length; i++) {
      if (widget.book.chapters.elementAt(i).chapterId == _chapter) {
        return widget.book.chapters.elementAtOrNull(i - 1);
      }
    }

    return null;
  }

  Chapter? get _prevChapter {
    for (int i = 0; i < widget.book.chapters.length - 1; i++) {
      if (widget.book.chapters.elementAt(i).chapterId == _chapter) {
        return widget.book.chapters.elementAtOrNull(i + 1);
      }
    }

    return null;
  }

  bool _prefetchingPrev = false;
  bool _prefetchingNext = false;
  void _prefetchChapSibling() async {
    //
    if (_currentPage + 5 >= pages.length - 1) {
      // prefetch next chap
      // getPages()
      if (_nextChapter != null && !_prefetchingNext) {
        // prefetch next
        _prefetchingNext = true;
        try {
          final chapterId = _nextChapter!.chapterId;
          final $pages = await widget.getPages(_nextChapter!.chapterId);

          if (mounted) {
            setState(() {
              if (_nextChapter != null) {
                pages.add(_buildSplashImage(
                    chapterId: _nextChapter!.chapterId,
                    chapterNext: _nextChapter!.name,
                    chapterCurrent: _currentChapter.name,
                    chapterPrev: null));
              }
              pages.addAll($pages.map((page) => BasicImageWithGroup(
                  chapterId: chapterId, src: page.src, headers: page.headers)));
              _refreshStoreImageLoaded();
              // NOTICE: No action `_pageController`
              // _pageController
              // _nextPages = null;
            });
          }
        } finally {
          _prefetchingNext = false;
        }
      }
    }
    if (_currentPage - 1 + 1 <= 0 && _usingPageView) {
      // prefetch previous chap
      if (_prevChapter != null && !_prefetchingPrev) {
        // prefetch prev
        _prefetchingPrev = true;
        try {
          final chapterId = _prevChapter!.chapterId;

          final $pages = [
            ...(await widget.getPages(_prevChapter!.chapterId)).map((page) =>
                BasicImageWithGroup(
                    chapterId: chapterId,
                    src: page.src,
                    headers: page.headers)),
            if (pages.elementAtOrNull(0)?.src != FAKE && _prevChapter != null)
              _buildSplashImage(
                  chapterId: _currentChapter.chapterId,
                  chapterNext: null,
                  chapterCurrent: _currentChapter.name,
                  chapterPrev: _prevChapter!.name),
          ];

          _disablingObserveScroll = true;
          if (mounted) {
            setState(() {
              pages.insertAll(0, $pages);
              _refreshStoreImageLoaded();

              if (_usingPageView) {
                _currentPage =
                    ($pages.length.toDouble() + (_pageController.page ?? 0))
                        .round()
                        .toDouble();
                _updateHistory();
              } else {
                _currentPage += $pages.length.toDouble() - 1;
                _updateHistory();
                _initialScrollIndex = _currentPage.ceil();
              }

              _updatePositionView();

              // _prevPages = null;
            });
          }
        } finally {
          _prefetchingPrev = false;
        }
      }
    }
    //
  }

  BasicImageWithGroup _buildSplashImage(
      {required String chapterId,
      required String? chapterNext,
      required String? chapterPrev,
      required String chapterCurrent}) {
    return BasicImageWithGroup(chapterId: chapterId, src: FAKE, headers: {
      if (chapterPrev != null) 'prev': chapterPrev,
      'current': chapterCurrent,
      if (chapterNext != null) 'next': chapterNext
    });
  }

  Widget _buildImage(int index) {
    final item = pages.elementAt(index);
    if (item.src == FAKE) {
      return SizedBox(
        width: double.infinity,
        height: _usingPageView
            ? double.infinity
            : MediaQuery.of(context).size.height / 2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (item.headers!.containsKey("prev")) ...[
              Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 2.0, horizontal: 20.0),
                  child: Text(
                    "Previous chapter:",
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400),
                  )),
              Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 2.0, horizontal: 20.0),
                  child: Text(
                    item.headers!['prev']!,
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400),
                  )),
              SizedBox(height: 20.0),
            ],
            Padding(
                padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 20.0),
                child: Text(
                  "Current chapter:",
                  style: TextStyle(fontSize: 16.0),
                )),
            Padding(
                padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 20.0),
                child: Text(
                  item.headers!["current"]!,
                  style: TextStyle(fontSize: 18.0),
                )),
            if (item.headers!.containsKey("next")) ...[
              SizedBox(height: 20.0),
              Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 2.0, horizontal: 20.0),
                  child: Text(
                    "Next chapter:",
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400),
                  )),
              Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 2.0, horizontal: 20.0),
                  child: Text(
                    item.headers!['next']!,
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400),
                  )),
            ],
          ],
        ),
      );
    }

    return Image.network(
      item.src,
      headers: item.headers,
      fit: BoxFit.contain,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) {
          return child;
        }

        return SizedBox(
          height: MediaQuery.of(context).size.height,
          child: _buildPageLoading(loadingProgress),
        );
      },
    );
  }

  Future<double?> _fetchAspectRatio(int index) async {
    if (_aspectRatios.containsKey(index)) {
      return _aspectRatios[index];
    }

    try {
      final image = _buildImage(index);
      if (image is! Image) {
        setState(() {
          _aspectRatios[index] = 1.0;
        });

        return 1.0;
      }

      final imageStream = image.image.resolve(const ImageConfiguration());
      final completer = Completer<double>();

      imageStream.addListener(
        ImageStreamListener((ImageInfo info, bool _) {
          final width = info.image.width.toDouble();
          final height = info.image.height.toDouble();
          final ratio = width / height;

          setState(() {
            _aspectRatios[index] = ratio;
          });
          completer.complete(ratio);
        }),
      );

      return completer.future;
    } catch (e) {
      return null;
    }
  }

  // void _scrollToPosition(int index) {
  //   _itemScrollController.jumpTo(index: index);
  //   // _scrollController.animateTo(
  //   //   offset,
  //   //   duration: const Duration(milliseconds: 300),
  //   //   curve: Curves.easeInOut,
  //   // );
  // }

  void _updatePositionView() {
    if (!_usingPageView) {
      try {
        _itemScrollController.jumpTo(index: _currentPage.ceil() + 1);
      } catch (err) {
        _initialScrollIndex = _currentPage.ceil();
        _keyScroller = Key(DateTime.now().millisecondsSinceEpoch.toString());
        _itemScrollController = ItemScrollController();
        _itemPositionsListener = ItemPositionsListener.create();

        _bindListenerScroll();
      }

      _disablingObserveScroll = false;
      // _scrollToPosition(_currentPage * MediaQuery.of(context).size.height);
    } else {
      try {
        _pageController.jumpToPage(_currentPage.ceil());
      } catch (err) {
        _pageController = PageController(initialPage: _currentPage.ceil());
      }
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    eventBus.fire(UpdatedHistory(
        bookId: widget.bookId, chapterId: _chapter, force: true));
    super.dispose();
  }

  bool _isImageVertical(int index) {
    if (_mode == ComicModes.leftToRight || _mode == ComicModes.rightToLeft) {
      // swipe
      if (_skipImages.contains(index)) return true;

      return _aspectRatios[index] != null && _aspectRatios[index]! > 1;
    }

    return false;
  }

  double _getSizePage(int index) {
    if (_useTwoPage == false || _isImageVertical(index)) {
      return 1;
    }

    if (index % 2 == 0) {
      if (_isImageVertical(index + 1)) {
        return 1;
      }

      return 0.5;
    } else {
      // if (_isImageVertical(i - 1)) {
      //   page += 0.5;
      // } else {
      //   page += 0.5;
      // }
      return 0.5;
    }
  }

  // int get _maxPage {
  //   if ([ComicModes.leftToRight, ComicModes.rightToLeft].contains(_mode)) {
  //     // swipe
  //     // ((widget.mangaPages.length - 1) / 2).ceil().toDouble();
  //     double page = 0;
  //     for (int i = 0; i < pages.length; i++) {
  //       page += _getSizePage(i);
  //     }

  //     return page.ceil();
  //   }

  //   return pages.length - 1;
  // }

  Map<int, List<int>> get mapPageVertical {
    Map<int, List<int>> map = {};

    double currentPage = 0;
    for (int i = 0; i < pages.length; i++) {
      final size = _getSizePage(i);

      final key = currentPage.floor();
      if (map.containsKey(key)) {
        map[key]!.add(i);
      } else {
        map[key] = [i];
      }

      currentPage += size;
    }

    return map;
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
        body: Stack(children: [
      TapListener(
          rows: 3, columns: 3, onTap: _onTapGrid, child: _buildReader()),
      _buildBottomBar()
    ]));
  }

  Widget _buildProgressControl() {
    final max = _realLength.toDouble();
    final value = _realCurrentPage;

    return SliderTheme(
        data: SliderThemeData(
            thumbShape: SliderComponentShape.noThumb,
            trackHeight: 15.0,
            overlayShape: SliderComponentShape.noOverlay),
        child: Slider(
          min: 0.0,
          max: max,
          value: min(value, max),
          onChanged: (value) {
            setState(() {
              _currentPage = value; //.toInt();
              _updateHistory();
              _updateRoute();
              _updatePositionView();
              _lazyLoadImages();
            });
          },
        ));
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
                          vertical: 8.0, horizontal: 12.0),
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
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 8.0),

                  // Button Group
                  ToggleButtons(
                    isSelected: [
                      _mode == ComicModes.leftToRight,
                      _mode == ComicModes.rightToLeft,
                      _mode == ComicModes.topToBottom,
                      _mode == ComicModes.webToon,
                    ],
                    onPressed: (index) {
                      setState(() {
                        _changeMode(ComicModes.values.elementAt(index));
                      });
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
                          MaterialCommunityIcons.cog, "Standard"),
                      _buildIconWithLabel(
                          MaterialCommunityIcons.arrow_left, "RTL"),
                      _buildIconWithLabel(
                          MaterialCommunityIcons.format_vertical_align_center,
                          "Vertical"),
                      _buildIconWithLabel(
                          MaterialCommunityIcons.web, "Webtoon"),
                    ],
                  ),
                  const SizedBox(height: 16.0),

                  // Description Text
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Mode saved to this book",
                      style: TextStyle(color: Colors.grey, fontSize: 14.0),
                    ),
                  ),
                  const SizedBox(height: 12.0),

                  // List Item: Use Two Page
                  InkWell(
                    customBorder: const StadiumBorder(),
                    onTap: () {
                      setState(() {
                        _changeTwoPage(!_useTwoPage);
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 12.0),
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
                              child: Switch(
                                value: _useTwoPage,
                                onChanged: (value) {
                                  setState(() {
                                    _changeTwoPage(value);
                                  });
                                },
                              )),
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
                          vertical: 8.0, horizontal: 12.0),
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
                              )),
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
            images: pages,
            onChange: (selected) {
              setState(() {
                _skipImages.clear();
                _skipImages.addAll(selected);
              });
            }));
  }

  void _showPanelComments() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        showDragHandle: true,
        builder: (context) => CommentsSheet(
              bookId: widget.bookId,
              chapterId: _chapter,
              service: widget.service as AuthService,
            ));
  }

  void _showPanelListChapters() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        showDragHandle: true,
        builder: (context) => SheetChapters(
              book: widget.book,
              sourceId: widget.service.uid,
              bookId: widget.bookId,
              histories: _historyChapters,
              currentChapterId: _chapter,
              initialChildSize: 0.6,
            ));
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

  Widget _buildReader() {
    if (_mode == ComicModes.webToon) {
      return ScrollablePositionedList.builder(
        key: _keyScroller,
        initialScrollIndex: _initialScrollIndex,
        itemScrollController: _itemScrollController,
        itemPositionsListener: _itemPositionsListener,
        itemCount: pages.length,
        itemBuilder: (context, index) {
          return _buildPage(index);
        },
      );
    } else {
      return PageView.builder(
        controller: _pageController,
        reverse: _mode == ComicModes.rightToLeft, // Reverse for swipe right
        scrollDirection:
            _mode == ComicModes.topToBottom ? Axis.vertical : Axis.horizontal,
        // allowImplicitScrolling: true,
        onPageChanged: (page) {
          setState(() {
            _currentPage = page.toDouble();
            _updateRoute();
            _updateHistory();
            _lazyLoadImages();
            _prefetchChapSibling();
          });
        },
        itemCount: _useTwoPage ? (pages.length / 2).ceil() : pages.length,
        itemBuilder: (context, index) {
          if (_useTwoPage) {
            final children = mapPageVertical[index]!.map((i) {
              return Expanded(child: _buildPage(i));
            }).toList();

            return InteractiveViewer(
                panEnabled: true,
                minScale: 1.0,
                maxScale: 2.0,
                trackpadScrollCausesScale: true,
                child: Row(
                  children: _mode == ComicModes.rightToLeft
                      ? children.reversed.toList()
                      : children,
                ));
            // final firstPage = index * 2;
            // final children = [
            //   Expanded(child: _buildPage(firstPage)),
            //   if (firstPage < widget.mangaPages.length - 1)
            //     Expanded(child: _buildPage(firstPage + 1)),
            // ];

            // return Row(
            //   children: _mode == 1 ? children.reversed.toList() : children,
            // );
          }

          return InteractiveViewer(
              panEnabled: true,
              minScale: 1.0,
              maxScale: 2.0,
              trackpadScrollCausesScale: true,
              child: _buildPage(index));
        },
      );
    }
  }

  Widget _buildPageLoading(ImageChunkEvent? loadingProgress) {
    final screenSize = MediaQuery.of(context).size;

    return Center(
      child: SizedBox(
        width: screenSize.width,
        height: screenSize.height,
        child: Center(
          child: CircularProgressIndicator(
            value: loadingProgress?.expectedTotalBytes != null
                ? loadingProgress!.cumulativeBytesLoaded /
                    (loadingProgress.expectedTotalBytes!)
                : null,
          ),
        ),
      ),
    );
  }

  Widget _buildBottomBar() {
    return AnimatedPositioned(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOutCubic,
        bottom: _showToolbar ? 0 : -kToolbarHeight * 2.5,
        left: 0,
        right: 0,
        child: Column(children: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Material(
                        color: Colors.transparent,
                        child: AbsorbPointer(
                            absorbing: _prevChapter == null,
                            child: Ink(
                                decoration: ShapeDecoration(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .surface
                                      .withOpacity(0.9),
                                  shape: CircleBorder(),
                                ),
                                child: IconButton(
                                  iconSize: 30.0,
                                  icon: Icon(
                                    MaterialCommunityIcons.skip_previous,
                                  ),
                                  color: _prevChapter != null
                                      ? Theme.of(context).colorScheme.onSurface
                                      : Theme.of(context)
                                          .colorScheme
                                          .onSurface
                                          .withOpacity(0.5),
                                  onPressed: () {
                                    context.replace(
                                        "/details_comic/${widget.service}/${widget.bookId}/view?chap=${_prevChapter!.chapterId}",
                                        extra: {'book': widget.book});
                                  },
                                )))),
                    Expanded(
                        child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 6.0),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Material(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .surface
                                        .withOpacity(0.9),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16.0, vertical: 15.0),
                                      child: _buildProgressControl(),
                                    ))))),
                    Material(
                        color: Colors.transparent,
                        child: AbsorbPointer(
                            absorbing: _nextChapter == null,
                            child: Ink(
                                decoration: ShapeDecoration(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .surface
                                      .withOpacity(0.9),
                                  shape: CircleBorder(),
                                ),
                                child: IconButton(
                                    iconSize: 30.0,
                                    icon:
                                        Icon(MaterialCommunityIcons.skip_next),
                                    color: _nextChapter != null
                                        ? Theme.of(context)
                                            .colorScheme
                                            .onSurface
                                        : Theme.of(context)
                                            .colorScheme
                                            .onSurface
                                            .withOpacity(0.5),
                                    onPressed: () {
                                      context.replace(
                                          "/details_comic/${widget.service}/${widget.bookId}/view?chap=${_nextChapter!.chapterId}",
                                          extra: {'book': widget.book});
                                    }))))
                  ])),
          SizedBox(height: 8.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0)
                .add(EdgeInsets.only(bottom: 8.0)),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                    child: Material(
                        color: Theme.of(context)
                            .scaffoldBackgroundColor
                            .withOpacity(0.8),
                        child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12.0, vertical: 8.0),
                            child: Row(
                              children: [
                                Expanded(
                                    child: ButtonInset(
                                  icon: Ionicons.heart_outline,
                                  text: 'Like',
                                  onPressed: () {},
                                )),
                                Expanded(
                                    child: ButtonInset(
                                  icon: Ionicons.chatbox_ellipses_outline,
                                  text: 'Comments',
                                  disabled: widget.service is! AuthService ||
                                      (widget.service as AuthService)
                                              .getComments ==
                                          null,
                                  onPressed: _showPanelComments,
                                )),
                                Expanded(
                                    child: ButtonInset(
                                  icon: Ionicons.list,
                                  text: 'Chapters',
                                  onPressed: _showPanelListChapters,
                                )),
                                Expanded(
                                    child: ButtonInset(
                                  icon: Ionicons.settings_outline,
                                  text: 'Settings',
                                  onPressed: _showPanelSettings,
                                )),
                                Expanded(
                                    child: ButtonInset(
                                        icon: Ionicons.arrow_forward,
                                        text: 'Skip',
                                        onPressed: _showPanelSkipPages)),
                              ],
                            ))))),
          )
        ]));
  }

  Widget _buildPage(int index) {
    if (_settingsObject == null || !_settingsObject!.mangaReadLazyPage ||
        _isImageLoaded[index]) {
      return _buildImage(index);
    } else {
      return _buildPageLoading(null);
    }
  }

  void _onTapGrid(int row, int column) {
    debugPrint("row = $row, column = $column");

    if (row == 1 && column == 1) {
      // center

      _setToolbar(!_showToolbar);
    }
    // click bottom
    if (column == 2) {
      // scroll 90% height screen
      switch (_mode) {
        case ComicModes.topToBottom:
          // next page;
          _pageController.nextPage(
              duration: Duration(milliseconds: 300), curve: Curves.linear);
          break;
        case ComicModes.webToon:
          // scroll 90% height screen
          _itemScrollController.scrollTo(
              index: min(pages.length, _currentPage.round() + 1),
              duration: Duration(milliseconds: 300));
          break;
        default:
      }
    }
    // click top
    if (column == 0) {
      switch (_mode) {
        case ComicModes.topToBottom:
          // prev page
          _pageController.previousPage(
              duration: Duration(milliseconds: 300), curve: Curves.linear);
          break;
        case ComicModes.webToon:
          _itemScrollController.scrollTo(
              index: max(0, _currentPage.round() - 1),
              duration: Duration(milliseconds: 300));
          break;
        default:
      }
    }
    // click left
    if (row == 0) {
      switch (_mode) {
        case ComicModes.leftToRight:
          _pageController.previousPage(
              duration: Duration(milliseconds: 100), curve: Curves.linear);
          break;
        case ComicModes.rightToLeft:
          _pageController.nextPage(
              duration: Duration(milliseconds: 100), curve: Curves.linear);
          break;
        default:
      }
    }
    // click right
    if (row == 2) {
      switch (_mode) {
        case ComicModes.leftToRight:
          _pageController.nextPage(
              duration: Duration(milliseconds: 100), curve: Curves.linear);
          break;
        case ComicModes.rightToLeft:
          _pageController.previousPage(
              duration: Duration(milliseconds: 100), curve: Curves.linear);
          break;
        default:
      }
    }
  }
}
