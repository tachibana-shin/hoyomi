import 'package:flutter/material.dart';
import 'package:hoyomi/screens/home_comic/manga_reader.dart';
import 'package:kaeru/kaeru.dart';

class WebToonReader extends StatefulWidget {
  // final int itemCount;
  final Ref<List<ImageWithGroup>> pages;
  final Widget Function(BuildContext context, int index) itemBuilder;
  final Ref<double> currentPage;

  const WebToonReader({
    super.key,
    // required this.itemCount,
    required this.pages,
    required this.itemBuilder,
    required this.currentPage,
  });

  @override
  State<WebToonReader> createState() => _WebToonReaderState();
}

class _WebToonReaderState extends State<WebToonReader>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  final _scrollController = ScrollController();

  final Map<int, GlobalKey> _itemKeys = {};

  GlobalKey _getKey(int index) {
    return _itemKeys.putIfAbsent(index, () => GlobalKey());
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    for (var entry in _itemKeys.entries) {
      final ctx = entry.value.currentContext;
      if (ctx == null) continue;

      final box = ctx.findRenderObject();
      if (box is! RenderBox) continue;

      final offset = box.localToGlobal(Offset.zero);

      if (offset.dy >= 0 && offset.dy < MediaQuery.of(context).size.height) {
        widget.currentPage.value = entry.key.toDouble();
        break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    
    return Watch(() {
      return ListView.builder(
        controller: _scrollController,
        itemCount: widget.pages.value.length,
        itemBuilder: (context, index) {
          return Container(
            key: _getKey(index),
            child: widget.itemBuilder(context, index),
          );
        },
      );
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
