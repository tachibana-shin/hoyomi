import 'package:flutter/material.dart';
import 'package:hoyomi/screens/home_comic/manga_reader.dart';
import 'package:hoyomi/widgets/export.dart';
import 'package:jk_fast_listview/jk_fast_listview.dart';
import 'package:kaeru/kaeru.dart';
// import 'package:mediaquery_sizer/mediaquery_sizer.dart';

class WebToonReader extends StatefulWidget {
  // final int itemCount;
  final Ref<List<ImageWithGroup>> pages;
  final Widget Function(BuildContext context, int index, ValueKey? key)
  itemBuilder;
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
    with AutomaticKeepAliveClientMixin, KaeruMixin {
  @override
  bool get wantKeepAlive => true;

  late final _scrollController = ref(JkItemController());

  // final Map<int, GlobalKey> _itemKeys = {};
  int? _lastReportedPage;

  // GlobalKey _getKey(int index) {
  //   return _itemKeys.putIfAbsent(index, () => GlobalKey());
  // }

  @override
  void initState() {
    super.initState();
    // _scrollController.addListener(_onScroll);

    // watch([widget.pages], () => _itemKeys.clear());

    watch([widget.currentPage], () async {
      final pageIndex = widget.currentPage.value.toInt();
      // int i = 0;
      // while (i++ < 30) {
      // if (_lastReportedPage != pageIndex) {
      //     if (!mounted) break;
      //     _scrollToPage(pageIndex);
      //     await Future.delayed(Duration(milliseconds: 100));
      //     _onScroll();
      //     continue;
      //   }

      //   break;
      // }
      if (_lastReportedPage != pageIndex) {
        _scrollController.value = JkItemController(initialIndex: pageIndex);
      }
    }, immediate: true);
  }

  // void _onScroll() {
  //   for (var entry in _itemKeys.entries) {
  //     final ctx = entry.value.currentContext;
  //     if (ctx == null) continue;

  //     final box = ctx.findRenderObject();
  //     if (box is! RenderBox) continue;

  //     final offset = box.localToGlobal(Offset.zero);

  //     if (offset.dy >= 0 && offset.dy < MediaQuery.of(context).size.height) {
  //       widget.currentPage.value = (_lastReportedPage = entry.key).toDouble();
  //       break;
  //     }
  //   }
  // }

  // void _scrollToPage(int index) async {
  //   double bef = 0;
  //   int befIndex = -1;
  //   for (int i = 0; i <= index; i++) {
  //     final RenderBox? box =
  //         _getKey(i).currentContext?.findRenderObject() as RenderBox?;
  //     if (box != null) {
  //       bef += box.size.height;
  //       befIndex++;
  //     }
  //   }

  //   _scrollController.animateTo(
  //     100.h(context) * (index - (befIndex + 1)) + bef,
  //     duration: Duration(milliseconds: 10),
  //     curve: Curves.linear,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Watch(() {
      return ZoomViewer(
        minScale: 0.5,
        child: JkFastListView(
          key: ValueKey(_scrollController.value),
          itemController: _scrollController.value,
          onScrollPosition: (index, _) {
            widget.currentPage.value = (_lastReportedPage = index).toDouble();
          },
          itemCount: widget.pages.value.length,
          cacheExtent: 3,
          addRepaintBoundaries: false,
          itemBuilder: (context, index) {
            return Container(
              // key: _getKey(index),
              child: widget.itemBuilder(context, index, null),
            );
          },
        ),
      );
    });
  }
}
