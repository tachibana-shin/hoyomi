import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:honyomi/core_services/interfaces/basic_image.dart';
import 'package:honyomi/core_services/interfaces/meta_book.dart';
import 'package:honyomi/utils/debouncer.dart';
import 'package:honyomi/widgets/button_inset.dart';
import 'package:honyomi/widgets/image_picker.dart';
import 'package:honyomi/widgets/sheet_chapters.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class BasicImageWithGroup extends BasicImage {
  final String groupId;

  BasicImageWithGroup(
      {required this.groupId, required super.src, super.headers});
}

class MangaReader extends StatefulWidget {
  final String sourceId;
  final String slug;

  final List<BasicImage> pages;
  final MetaBook book;
  final String chapter;
  final Future<Iterable<BasicImage>> Function(String chap) getPages;

  const MangaReader(
      {super.key,
      required this.sourceId,
      required this.slug,
      required this.pages,
      required this.book,
      required this.chapter,
      required this.getPages});

  @override
  // ignore: library_private_types_in_public_api, no_logic_in_create_state
  _MangaReaderState createState() => _MangaReaderState();
}

class _MangaReaderState extends State<MangaReader> {
  late List<BasicImageWithGroup> pages;

  double _currentPage = 0;
  int _mode = 3; // 0: Swipe Right, 1: Swipe Left, 2: Scroll, 3: WebToon
  bool _useTwoPage = false;

  bool _disposed = false;

// controller for PageView
  PageController _pageController = PageController(viewportFraction: 2);

  Key? _keyScroller;
  int _initialScrollIndex = 1;
  bool _disablingObserveScroll = false;
  ItemScrollController _itemScrollController = ItemScrollController();
  ItemPositionsListener _itemPositionsListener = ItemPositionsListener.create();

  late List<bool> _isImageLoaded;

  final Map<int, double?> _aspectRatios = {};
  Set<int> _skipImages = {};

  @override
  void initState() {
    pages = [
      if (_prevChapter != null)
        _buildSplashImage(
            groupId: _currentChapter.slug,
            chapterNext: null,
            chapterCurrent: _currentChapter.name,
            chapterPrev: _prevChapter!.name),
      ...widget.pages.map((page) {
        return BasicImageWithGroup(
            groupId: widget.chapter, src: page.src, headers: page.headers);
      })
    ];
    _currentPage =
        (_usingPageView ? _pageController.initialPage : _initialScrollIndex)
            .toDouble();

    super.initState();
    _refreshStoreImageLoaded();
    _lazyLoadImages();
    _prefetchChapSibling();

    _bindListenerScroll();
  }

  void _bindListenerScroll() {
    final debouncer = Debouncer(milliseconds: 50);
    _itemPositionsListener.itemPositions.addListener(() {
      if (_usingPageView || _disablingObserveScroll) return;

      debouncer.run(() {
        final positions = _itemPositionsListener.itemPositions.value;
        final visibleItem =
            positions.where((pos) => pos.itemLeadingEdge >= 0).lastOrNull;

        if (visibleItem != null) {
          setState(() {
            _currentPage = visibleItem.index.toDouble() - 1;
            _updateRoute();
            _lazyLoadImages();
            _prefetchChapSibling();
          });
        }
      });
    });
  }

  void _updateRoute() {
    final currentGroup = pages[_currentPage.round()]
        .groupId; // Get the group id of the current page
    if (widget.chapter != currentGroup) {
      // context.replaceNamed("details_comic_reader", pathParameters: {
      //   'sourceId': widget.sourceId,
      //   'slug': widget.slug,
      //   'chap': currentGroup
      // });
    }
  }

  void _changeMode(int mode) {
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
    return _mode <= 2;
  }

  void _changeTwoPage(bool enabled) {
    setState(() {
      _useTwoPage = enabled;
    });
  }

  void _refreshStoreImageLoaded() {
    _isImageLoaded = List.generate(pages.length, (index) => false);
  }

  void _lazyLoadImages() {
    setState(() {
      int startIndex = (_currentPage.floor() - 5).clamp(0, pages.length - 1);
      int endIndex = (_currentPage.ceil() + 5).clamp(0, pages.length - 1);

      for (int i = startIndex; i <= endIndex; i++) {
        _isImageLoaded[i] = true;
        if (_usingPageView && _useTwoPage) {
          _fetchAspectRatio(i);
        }
      }
    });
  }

  Chapter get _currentChapter => widget.book.chapters
      .firstWhere((element) => element.slug == widget.chapter);
  Chapter? get _nextChapter {
    for (int i = 0; i < widget.book.chapters.length - 1; i++) {
      if (widget.book.chapters.elementAt(i).slug == widget.chapter) {
        return widget.book.chapters.elementAtOrNull(i + 1);
      }
    }

    return null;
  }

  Chapter? get _prevChapter {
    for (int i = 1; i < widget.book.chapters.length; i++) {
      if (widget.book.chapters.elementAt(i).slug == widget.chapter) {
        return widget.book.chapters.elementAtOrNull(i - 1);
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
          final groupId = _nextChapter!.slug;
          final $pages = await widget.getPages(_nextChapter!.slug);
          if (_disposed) return;

          setState(() {
            if (_nextChapter != null) {
              pages.add(_buildSplashImage(
                  groupId: _nextChapter!.slug,
                  chapterNext: _nextChapter!.name,
                  chapterCurrent: _currentChapter.name,
                  chapterPrev: null));
            }
            pages.addAll($pages.map((page) => BasicImageWithGroup(
                groupId: groupId, src: page.src, headers: page.headers)));
            _refreshStoreImageLoaded();
            // NOTICE: No action `_pageController`
            // _pageController
            // _nextPages = null;
          });
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
          final groupId = _prevChapter!.slug;

          final $pages = [
            ...(await widget.getPages(_prevChapter!.slug)).map((page) =>
                BasicImageWithGroup(
                    groupId: groupId, src: page.src, headers: page.headers)),
            if (pages.elementAtOrNull(0)?.src != "fake:" &&
                _prevChapter != null)
              _buildSplashImage(
                  groupId: _currentChapter.slug,
                  chapterNext: null,
                  chapterCurrent: _currentChapter.name,
                  chapterPrev: _prevChapter!.name),
          ];
          if (_disposed) return;

          _disablingObserveScroll = true;
          setState(() {
            pages.insertAll(0, $pages);
            _refreshStoreImageLoaded();

            if (_usingPageView) {
              _currentPage =
                  ($pages.length.toDouble() + (_pageController.page ?? 0))
                      .round()
                      .toDouble();
            } else {
              _currentPage += $pages.length.toDouble() - 1;
              _initialScrollIndex = _currentPage.ceil();
            }

            _updatePositionView();

            // _prevPages = null;
          });
        } finally {
          _prefetchingPrev = false;
        }
      }
    }
    //
  }

  BasicImageWithGroup _buildSplashImage(
      {required String groupId,
      required String? chapterNext,
      required String? chapterPrev,
      required String chapterCurrent}) {
    return BasicImageWithGroup(groupId: groupId, src: "fake:", headers: {
      if (chapterPrev != null) 'prev': chapterPrev,
      'current': chapterCurrent,
      if (chapterNext != null) 'next': chapterNext
    });
  }

  Widget _buildImage(int index) {
    final item = pages.elementAt(index);
    if (item.src == "fake:") {
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
            ],
            if (item.headers!.containsKey("next")) ...[
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
            SizedBox(height: 20.0),
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
    _disposed = true;
    _pageController.dispose();
    super.dispose();
  }

  bool _isImageVertical(int index) {
    if (_mode <= 1) {
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

  int get _maxPage {
    if (_mode <= 1) {
      // swipe
      // ((widget.mangaPages.length - 1) / 2).ceil().toDouble();
      double page = 0;
      for (int i = 0; i < pages.length; i++) {
        page += _getSizePage(i);
      }

      return page.ceil();
    }

    return pages.length - 1;
  }

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
    // return InfiniteScrollPageView(
    //   prep: pages.toList(),
    //   pages: pages.toList(),
    //   app: pages.toList(),
    // );
    return Scaffold(
        body: Stack(children: [
      _buildReader(),
      Positioned(bottom: 0, left: 0, right: 0, child: _buildBottomBar())
    ]));
  }

  Widget _buildProgressControl() {
    return SliderTheme(
        data: SliderThemeData(
            thumbShape: SliderComponentShape.noThumb,
            trackHeight: 15.0,
            overlayShape: SliderComponentShape.noOverlay),
        child: Slider(
          min: 0.0,
          max: _maxPage.ceil().toDouble(),
          value: _currentPage.round().toDouble(),
          onChanged: (value) {
            setState(() {
              _currentPage = value; //.toInt();
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
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
      ),
      isScrollControlled: true,
      builder: (context) {
        bool autoScroll = false;

        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                    child: Container(
                      width: 40.0,
                      height: 4.0,
                      decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.circular(2.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),

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
                      _mode == 0,
                      _mode == 1,
                      _mode == 2,
                      _mode == 3,
                    ],
                    onPressed: (index) {
                      setState(() {
                        _changeMode(index);
                        _mode = index;
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
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
        ),
        isScrollControlled: true,
        builder: (context) => ImagePicker(
            images: pages,
            onChange: (selected) {
              setState(() {
                _skipImages = selected;
              });
            }));
  }

  void _showPanelListChapters() {
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
        ),
        isScrollControlled: true,
        builder: (context) => SheetChapters(
              book: widget.book,
              sourceId: widget.sourceId,
              slug: widget.slug,
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
    if (_mode >= 3) {
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
        reverse: _mode == 1, // Reverse for swipe right
        scrollDirection: _mode >= 2 ? Axis.vertical : Axis.horizontal,
        // allowImplicitScrolling: true,
        onPageChanged: (page) {
          setState(() {
            _currentPage = page.toDouble();
            _updateRoute();
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
                  children: _mode == 1 ? children.reversed.toList() : children,
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
    return Column(children: [
      Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
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
                            context.replace("/details_comic/${widget.sourceId}/${widget.slug}/view?chap=${_prevChapter!.slug}");
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
                            icon: Icon(MaterialCommunityIcons.skip_next),
                            color: _nextChapter != null
                                ? Theme.of(context).colorScheme.onSurface
                                : Theme.of(context)
                                    .colorScheme
                                    .onSurface
                                    .withOpacity(0.5),
                            onPressed: () {
                              context.go("/details_comic/${widget.sourceId}/${widget.slug}/view?chap=${_nextChapter!.slug}");
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
                              onPressed: () {},
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
    ]);
  }

  Widget _buildPage(int index) {
    if (_isImageLoaded[index]) {
      return _buildImage(index);
    } else {
      return _buildPageLoading(null);
    }
  }
}
