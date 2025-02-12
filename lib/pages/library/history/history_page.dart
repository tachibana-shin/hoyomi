import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:hoyomi/controller/history.dart';
import 'package:hoyomi/core_services/book/interfaces/basic_book.dart';
import 'package:hoyomi/core_services/book/interfaces/meta_book.dart';
import 'package:hoyomi/database/drift.dart';
import 'package:hoyomi/widgets/book/horizontal_book_list.dart';
import 'package:hoyomi/widgets/pull_to_refresh.dart';
import 'package:hoyomi/widgets/book/vertical_book_list.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: History(),
    );
  }
}

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  final _history = HistoryController.instance;
  final List<Book> _items = [];
  int _page = 1;

  final ScrollController _scrollController = ScrollController();
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  bool _initd = false;

  @override
  void initState() {
    super.initState();

    onUserScrolls();
    _scrollController.addListener(onUserScrolls);
    _initd = true;
  }

  Future<void> _onRefresh() async {
    onUserScrolls();
  }

  bool keepFetchingData = true;
  Completer<bool>? _scrollCompleter;
  Future<void> onUserScrolls() async {
    if (!keepFetchingData) return;
    if (!(_scrollCompleter?.isCompleted ?? true)) return;

    if (_initd) {
      double screenSize = MediaQuery.of(context).size.height,
          scrollLimit = _scrollController.position.maxScrollExtent,
          missingScroll = scrollLimit - screenSize,
          scrollLimitActivation = scrollLimit - missingScroll * 0.05;

      if (_scrollController.position.pixels < scrollLimitActivation) return;
      if (!(_scrollCompleter?.isCompleted ?? true)) return;
    }
    _scrollCompleter = Completer();

    final data = await _history.getListHistory(30, offset: (_page - 1) * 30);
    if (mounted) {
      setState(() {
        _items.addAll(data);

        if (data.length < 30) {
          _page++;
          keepFetchingData = true;
        }

        _scrollCompleter!.complete(keepFetchingData);
      });
    }
  }

  // _groupsのgetter
  List<MapEntry<DateTime, List<Book>>> get _groups {
    // グループを日付で分類
    final Map<DateTime, List<Book>> groupedItems = {};

    for (var book in _items) {
      // 同じ日付でグループ化 (年月日のみを使用)
      final dateOnly = DateTime(
          book.updatedAt.year, book.updatedAt.month, book.updatedAt.day);

      if (!groupedItems.containsKey(dateOnly)) {
        groupedItems[dateOnly] = [];
      }
      groupedItems[dateOnly]!.add(book);
    }

    return groupedItems.entries.toList();
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          scrolledUnderElevation: 0.0,
          title: const Text('My book history'),
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
    return PullToRefresh(
      controller: _refreshController,
      onRefresh: _onRefresh,
      initialData: null,
      builder: (data) => Scrollbar(
          controller: _scrollController,
          thumbVisibility: true,
          radius: const Radius.circular(15),
          child: GroupedListView<MapEntry<DateTime, List<Book>>, DateTime>(
              controller: _scrollController,
              elements: _groups,
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
              ) {
                final items = currentElement.value
                    .map((item) => MetaBook.fromJson(jsonDecode(item.meta)));
                int index = 0;

                return VerticalBookList(
                  itemsFuture: Future.wait(
                      currentElement.value.indexed.map((item) async {
                    final bookHistory = currentElement.value.elementAt(index);
                    final book = items.elementAt(index);

                    final current =
                        await _history.getLastChapter(bookHistory.id);

                    final currentEpisodeIndex = current == null
                        ? -1
                        : book.chapters.toList().lastIndexWhere((chapter) {
                            return current.chapterId == chapter.chapterId;
                          });

                    final percentRead =
                        (book.chapters.length - currentEpisodeIndex) /
                            book.chapters.length;
                    // currentElement.value
                    //     .elementAt(index)
                    //     .histories
                    //     .fold(0.0, (p, c) => p + c.currentPage / c.maxPage) /
                    // items.elementAt(index).chapters.length

                    return BasicBookExtend(
                        book: BasicBook.fromMeta(
                          item.$2.bookId,
                          book: MetaBook.fromJson(jsonDecode(item.$2.meta)),
                        ),
                        sourceId:
                            currentElement.value.elementAt(item.$1).sourceId,
                        percentRead: percentRead);
                  }).toList()),
                  more: null,
                  title: '',
                );
              })),
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
