import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:honyomi/controller/history.dart';
import 'package:honyomi/core_services/interfaces/basic_book.dart';
import 'package:honyomi/core_services/interfaces/meta_book.dart';
import 'package:honyomi/models/book.dart';
import 'package:honyomi/widgets/horizontal_book_list.dart';

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
    return HorizontalBookList(
      booksFuture: Future.value(_items.map(
        (item) => BasicBook.fromMeta(item.bookId,
            book: MetaBook.fromJson(jsonDecode(item.meta))),
      )),
      service: null,
      getService: (index) => _items.elementAt(index).sourceId,
      more: '/library/history',
      title: 'History',
    );
  }
}
