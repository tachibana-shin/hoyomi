import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:honyomi/controller/history.dart';
import 'package:honyomi/core_services/book/interfaces/basic_book.dart';
import 'package:honyomi/core_services/book/interfaces/meta_book.dart';
import 'package:honyomi/models/book.dart';
import 'package:honyomi/widgets/book/horizontal_book_list.dart';

class HistoryHorizontalList extends StatefulWidget {
  const HistoryHorizontalList({super.key});

  @override
  State<HistoryHorizontalList> createState() => _HistoryHorizontalListState();
}

class _HistoryHorizontalListState extends State<HistoryHorizontalList> {
  late final List<Book> _items;

  @override
  initState() {
    super.initState();
    _items = HistoryController(null).getListHistory(10, offset: 0);
  }

  @override
  Widget build(BuildContext context) {
    final books =
        _items.map((item) => MetaBook.fromJson(jsonDecode(item.meta)));
    int index = 0;

    return HorizontalBookList(
      itemsFuture: Future.value(_items
          .map(
            (item) =>
                BasicBook.fromMeta(item.bookId, book: books.elementAt(index++)),
          )
          .toList()),
      service: null,
      getService: (index) => _items.elementAt(index).sourceId,
      getPercentRead: (index) {
        final bookHistory = _items.elementAt(index);
        final book = books.elementAt(index);

        final current = bookHistory.histories
            .reduce((a, b) => a.updatedAt.isAfter(b.updatedAt) ? a : b);

        final currentEpisodeIndex =
            book.chapters.toList().lastIndexWhere((chapter) {
          return current.chapterId == chapter.chapterId;
        });

        return (book.chapters.length - currentEpisodeIndex) /
            book.chapters.length;
        // currentElement.value
        //     .elementAt(index)
        //     .histories
        //     .fold(0.0, (p, c) => p + c.currentPage / c.maxPage) /
        // books.elementAt(index).chapters.length
      },
      more: '/library/history',
      title: 'History',
    );
  }
}
