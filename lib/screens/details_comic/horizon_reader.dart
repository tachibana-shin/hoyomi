import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hoyomi/notifier+/notifier_plus_mixin.dart';

class HorizonReader extends StatefulWidget {
  final int itemCount;
  final Widget Function(BuildContext context, int index) itemBuilder;
  final ValueNotifier<double> currentPage;

  final Image Function(int page) builderImage;
  final bool rtl;
  final bool twoPage;

  const HorizonReader(
      {super.key,
      required this.itemCount,
      required this.itemBuilder,
      required this.currentPage,
      required this.builderImage,
      required this.rtl,
      required this.twoPage});

  @override
  State<HorizonReader> createState() => _HorizonReaderState();
}

class _HorizonReaderState extends State<HorizonReader> with NotifierPlusMixin {
  late final PageController _controller;
  final Map<int, double> _aspectRatios = {};
  final Map<int, double> _imagesLoaded = {};

  bool _jumping = false;

  Map<int, List<int>>? __mapPage;
  Map<int, List<int>> get _mapPage {
    if (__mapPage != null) return __mapPage!;

    Map<int, List<int>> map = {};

    double currentPage = 0;
    for (int i = 0; i < widget.itemCount; i++) {
      final size = _getSizePage(i);

      final key = currentPage.floor();
      if (map.containsKey(key)) {
        map[key]!.add(i);
      } else {
        map[key] = [i];
      }

      currentPage += size;
    }

    return __mapPage = map;
  }

  int get _itemCount {
    if (!widget.twoPage) return widget.itemCount;
    return _mapPage.length;
  }

  @override
  void initState() {
    super.initState();

    _controller = PageController(initialPage: widget.currentPage.value.toInt());

    listenNotifier(widget.currentPage, () {
      if (_controller.position.isScrollingNotifier.value) return;
      _jumping = true;

      _controller.animateToPage(widget.currentPage.value.toInt(),
          duration: Duration(milliseconds: 200), curve: Curves.easeInOut);
      Timer(Duration(milliseconds: 50), () {
        _jumping = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: _controller,
        reverse: widget.rtl,
        // allowImplicitScrolling: true,
        onPageChanged: (page) {
          if (_jumping) return;

          widget.currentPage.value = page.toDouble();
          for (int i = 0; i < 5; i++) {
            if (page + i >= widget.itemCount) break;
            if (_imagesLoaded.containsKey(page + i)) continue;

            _fetchAspectRatio(page + i);
          }
        },
        itemCount: _itemCount,
        itemBuilder: (context, index) {
          if (widget.twoPage) {
            final children = _mapPage[index]!.map((i) {
              return Expanded(child: widget.itemBuilder(context, i));
            }).toList();

            return InteractiveViewer(
              panEnabled: true,
              minScale: 1.0,
              maxScale: 2.0,
              trackpadScrollCausesScale: true,
              child: Row(
                children: widget.rtl ? children.reversed.toList() : children,
              ),
            );
          }

          return InteractiveViewer(
            panEnabled: true,
            minScale: 1.0,
            maxScale: 2.0,
            trackpadScrollCausesScale: true,
            child: widget.itemBuilder(context, index),
          );
        });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool _isImageVertical(int index) {
    return _aspectRatios[index] != null && _aspectRatios[index]! > 1;
  }

  double _getSizePage(int index) {
    if (widget.twoPage == false || _isImageVertical(index)) {
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

  Future<double?> _fetchAspectRatio(int index) async {
    if (_aspectRatios.containsKey(index)) {
      return _aspectRatios[index];
    }

    try {
      final image = widget.builderImage(index);

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
}
