import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:hoyomi/controller/history.dart';
import 'package:hoyomi/core_services/comic/interfaces/comic.dart' as i_comic;
import 'package:hoyomi/core_services/comic/interfaces/meta_comic.dart';
import 'package:hoyomi/widgets/comic/horizontal_comic_list.dart';
import 'package:hoyomi/widgets/comic/vertical_comic_list.dart';
import 'package:hoyomi/widgets/pull_refresh_page.dart';
import 'package:intl/intl.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final _controller = ScrollController();
  final _history = HistoryController();

  int _page = 1;

  // _groupsのgetter
  List<MapEntry<DateTime, List<ComicExtend>>> _groups(
      List<(DateTime, ComicExtend)> items) {
    // グループを日付で分類
    final Map<DateTime, List<ComicExtend>> groupedItems = {};

    for (var (updatedAt, comic) in items) {
      // 同じ日付でグループ化 (年月日のみを使用)
      final dateOnly = DateTime(updatedAt.year, updatedAt.month, updatedAt.day);

      if (!groupedItems.containsKey(dateOnly)) {
        groupedItems[dateOnly] = [];
      }
      groupedItems[dateOnly]!.add(comic);
    }

    return groupedItems.entries.toList();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          scrolledUnderElevation: 0.0,
          title: const Text('My comic history'),
          // back button
          leading: IconButton(
            icon: const Icon(MaterialCommunityIcons.arrow_left),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: _buildBody(context));
  }

  Widget _buildBody(BuildContext context) {
    return PullRefreshPage<List<(DateTime, ComicExtend)>>(
      onLoadData: () =>
          _history.getListHistory(30, offset: 0).then((items) => items
              .map(
                (item) => (
                  item.updatedAt,
                  ComicExtend(
                      comic: i_comic.Comic.fromMeta(
                        item.comicId,
                        comic: MetaComic.fromJson(jsonDecode(item.meta)),
                      ),
                      sourceId: item.sourceId)
                ),
              )
              .toList()),
      onLoadFake: () => List.generate(
          30,
          (_) => (
                DateTime.now(),
                ComicExtend(comic: i_comic.Comic.createFakeData(), sourceId: '')
              )),
      // onLoadMore: (oldData, endList) async {
      //   final data =
      //       await _history.getListHistory(30, offset: (_page - 1) * 30);
      //   _page++;

      //   if (data.length < 30) endList();

      //   return [
      //     ...oldData,
      //     ...data.map(
      //       (item) => (
      //         item.updatedAt,
      //         ComicExtend(
      //             comic: i_comic.Comic.fromMeta(
      //               item.comicId,
      //               comic: MetaComic.fromJson(jsonDecode(item.meta)),
      //             ),
      //             sourceId: item.sourceId)
      //       ),
      //     )
      //   ];
      // },
      builder: (data, _) => Scrollbar(
          controller: _controller,
          thumbVisibility: true,
          radius: const Radius.circular(15),
          child:
              GroupedListView<MapEntry<DateTime, List<ComicExtend>>, DateTime>(
                  controller: _controller,
                  elements: _groups(data),
                  order: GroupedListOrder.DESC,
                  sort: true,
                  reverse: false,
                  floatingHeader: false,
                  useStickyGroupSeparators: true,
                  stickyHeaderBackgroundColor: Colors.transparent,
                  // padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  groupBy: (element) => DateTime(
                        element.key.year,
                        element.key.month,
                        element.key.day,
                      ),
                  groupHeaderBuilder: (element) => Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                      child: Text(DateFormat.yMMMd().format(element.key))),
                  interdependentItemBuilder: (
                    context,
                    previousElement,
                    currentElement,
                    nextElement,
                  ) =>
                      VerticalComicList(
                        itemsFuture: Future.value(currentElement.value),
                        more: null,
                        title: '',
                      ))),
    );
  }
}

class GroupHeaderDate extends StatelessWidget {
  final DateTime date;

  const GroupHeaderDate({required this.date, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: Alignment.topCenter,
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.blueGrey,
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            child: Text(
              DateFormat.yMMMd().format(date),
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
