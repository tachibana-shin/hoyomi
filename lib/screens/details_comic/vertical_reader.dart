import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hoyomi/notifier+/notifier_plus_mixin.dart';

class VerticalReader extends StatefulWidget {
  final int itemCount;
  final Widget Function(BuildContext context, int index) itemBuilder;
  final ValueNotifier<double> currentPage;

  const VerticalReader(
      {super.key,
      required this.itemCount,
      required this.itemBuilder,
      required this.currentPage});

  @override
  State<VerticalReader> createState() => _VerticalReaderState();
}

class _VerticalReaderState extends State<VerticalReader>
    with NotifierPlusMixin {
  late final PageController _controller;

  bool _jumping = false;

  @override
  void initState() {
    super.initState();

    _controller = PageController(initialPage: widget.currentPage.value.toInt());

    listenerNotifier(widget.currentPage, () {
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
        scrollDirection: Axis.vertical,
        allowImplicitScrolling: true,
        onPageChanged: (page) {
          if (_jumping) return;

          widget.currentPage.value = page.toDouble();
        },
        itemCount: widget.itemCount,
        itemBuilder: widget.itemBuilder);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
