import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hoyomi/screens/home_comic/manga_reader.dart';
import 'package:kaeru/kaeru.dart';

class VerticalReader extends StatefulWidget {
  final Ref<List<ImageWithGroup>> pages;
  final Widget Function(BuildContext context, int index, ValueKey key)
  itemBuilder;
  final Ref<double> currentPage;

  const VerticalReader({
    super.key,
    required this.pages,
    required this.itemBuilder,
    required this.currentPage,
  });

  @override
  State<VerticalReader> createState() => _VerticalReaderState();
}

class _VerticalReaderState extends State<VerticalReader> with KaeruListenMixin {
  late final PageController _controller;

  bool _jumping = false;

  @override
  void initState() {
    super.initState();

    _controller = PageController(initialPage: widget.currentPage.value.toInt());

    listen(widget.currentPage, () {
      if (_controller.position.isScrollingNotifier.value) return;
      _jumping = true;

      _controller.animateToPage(
        widget.currentPage.value.toInt(),
        duration: Duration(milliseconds: 200),
        curve: Curves.easeInOut,
      );
      Timer(Duration(milliseconds: 50), () {
        _jumping = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Watch(
      () => PageView.builder(
        controller: _controller,
        scrollDirection: Axis.vertical,
        allowImplicitScrolling: true,
        onPageChanged: (page) {
          if (_jumping) return;

          widget.currentPage.value = page.toDouble();
        },
        itemCount: widget.pages.value.length,
        itemBuilder: (context, index) => InteractiveViewer(
          minScale: 0.5,
          child: widget.itemBuilder(
            context,
            index,
            ValueKey(widget.pages.value.elementAt(index).image.src),
          ),
        ),
      ),
    );
  }
}
