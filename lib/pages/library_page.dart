import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:honyomi/controller/history.dart';
import 'package:honyomi/core_services/interfaces/basic_book.dart';
import 'package:honyomi/core_services/interfaces/meta_book.dart';
import 'package:honyomi/models/book.dart';
import 'package:honyomi/widgets/vertical_book_list.dart';
import 'package:intl/intl.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Library(),
    );
  }
}

class Library extends StatefulWidget {
  const Library({super.key});

  @override
  State<Library> createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
  final _history = HistoryController(null);
  final List<Book> _items = [];
  int _page = 1;

  final ScrollController _scrollController = ScrollController();

  bool _initd = false;

  @override
  void initState() {
    super.initState();

    onUserScrolls();
    _scrollController.addListener(onUserScrolls);
    _initd = true;
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

    setState(() {
      final data = _history.getListHistory(30, offset: (_page - 1) * 30);
      _items.addAll(data);

      if (data.length < 30) {
        _page++;
        keepFetchingData = true;
      }

      _scrollCompleter!.complete(keepFetchingData);
    });
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
  Widget build(BuildContext context) {
    return Scaffold(body: _buildBody(context));
  }

  Widget _buildBody(BuildContext context) {
    return Scrollbar(
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
              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: Text(DateFormat.yMMMd().format(element.key))),
          interdependentItemBuilder: (
            context,
            previousElement,
            currentElement,
            nextElement,
          ) =>
              VerticalBookList(
                  books: currentElement.value.map(
                    (item) => BasicBook.fromMeta(item.bookId,
                        book: MetaBook.fromJson(jsonDecode(item.meta))),
                  ),
                  booksFuture: null,
                  service: null,
                  getService: (index) =>
                      currentElement.value.elementAt(index).sourceId,
                  more: null,
                  title: '',
                  noHeader: true)),
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
