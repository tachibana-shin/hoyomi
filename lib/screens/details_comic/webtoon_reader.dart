import 'package:flutter/material.dart';
import 'package:kaeru/kaeru.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class WebToonReader extends StatefulWidget {
  final int itemCount;
  final Widget Function(BuildContext context, int index) itemBuilder;
  final Ref<double> currentPage;

  const WebToonReader(
      {super.key,
      required this.itemCount,
      required this.itemBuilder,
      required this.currentPage});

  @override
  State<WebToonReader> createState() => _WebToonReaderState();
}

class _WebToonReaderState extends State<WebToonReader> {
  final _itemScrollController = ItemScrollController();
  // final _scrollOffsetController = ScrollOffsetController();
  final _itemPositionsListener = ItemPositionsListener.create();
  // final _scrollOffsetListener = ScrollOffsetListener.create();

  @override
  void initState() {
    super.initState();

    // _controller = PageController(initialPage: widget.currentPage.value.toInt());

    bool jumping = false;
    _itemPositionsListener.itemPositions.addListener(() {
      if (!jumping) {
        final positions = _itemPositionsListener.itemPositions.value;
        final visibleItem =
            positions.where((pos) => pos.itemLeadingEdge >= 0).lastOrNull;

        if (visibleItem != null) {
          widget.currentPage.value = visibleItem.index.toDouble();
        }
      }
    });
    // listenerNotifier(widget.currentPage, () {
    //   jumping = true;

    //   _itemScrollController.scrollTo(
    //       index: widget.currentPage.value.toInt(),
    //       duration: Duration(milliseconds: 200),
    //       curve: Curves.easeInOut);
    //   Timer(Duration(milliseconds: 50), () {
    //     jumping = false;
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    return ScrollablePositionedList.builder(
      itemCount: widget.itemCount,
      itemBuilder: widget.itemBuilder,
      itemScrollController: _itemScrollController,
      // scrollOffsetController: _scrollOffsetController,
      itemPositionsListener: _itemPositionsListener,
      // scrollOffsetListener: _scrollOffsetListener,
      initialScrollIndex: widget.currentPage.value.toInt(),
    );
  }

  // @override
  // void dispose() {
  //   _controller.dispose();
  //   super.dispose();
  // }
}
