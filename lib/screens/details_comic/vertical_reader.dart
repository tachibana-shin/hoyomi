import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hoyomi/screens/home_comic/manga_reader.dart';
import 'package:kaeru/kaeru.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

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

      final hf =
          (_controller.page ?? _controller.initialPage) -
          widget.currentPage.value;
      if (hf.abs() > 1) {
        _jumping = true;
        _controller.jumpToPage(
          widget.currentPage.value.toInt(),
          // duration: Duration(milliseconds: 200),
          // curve: Curves.easeInOut,
        );
        Timer(Duration(milliseconds: 50), () {
          _jumping = false;
        });
      } else {
        if (hf > 0) {
          _controller.previousPage(
            duration: const Duration(milliseconds: 200),
            curve: Curves.linear,
          );
        } else {
          _controller.nextPage(
            duration: const Duration(milliseconds: 200),
            curve: Curves.linear,
          );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Watch(
      () => PhotoViewGallery.builder(
        scrollPhysics: const BouncingScrollPhysics(),
        backgroundDecoration: const BoxDecoration(color: Colors.transparent),
        wantKeepAlive: true,
        pageController: _controller,
        scrollDirection: Axis.vertical,
        onPageChanged: (page) {
          if (_jumping) return;

          widget.currentPage.value = page.toDouble();
        },
        itemCount: widget.pages.value.length,
        builder:
            (context, index) => PhotoViewGalleryPageOptions.customChild(
              initialScale: PhotoViewComputedScale.contained * 1.0,
              minScale: PhotoViewComputedScale.contained * 0.5,
              maxScale: PhotoViewComputedScale.contained * 2.5,
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
