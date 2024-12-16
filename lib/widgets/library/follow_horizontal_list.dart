import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:honyomi/controller/history.dart';
import 'package:honyomi/core_services/book/interfaces/basic_book.dart';
import 'package:honyomi/core_services/book/interfaces/meta_book.dart';
import 'package:honyomi/models/book.dart';
import 'package:honyomi/widgets/book/horizontal_book_list.dart';

class FollowHorizontalList extends StatefulWidget {
  const FollowHorizontalList({super.key});

  @override
  State<FollowHorizontalList> createState() => _FollowHorizontalListState();
}

class _FollowHorizontalListState extends State<FollowHorizontalList> {
  late final List<Book> _items;

  @override
  initState() {
    super.initState();
    _items = HistoryController(null).getListFollows(10, offset: 0);
  }

  @override
  Widget build(BuildContext context) {
    return HorizontalBookList(
      itemsFuture: Future.value(_items.map(
        (item) => BasicBook.fromMeta(item.bookId,
            book: MetaBook.fromJson(jsonDecode(item.meta))),
      )),
      service: null,
      getService: (index) => _items.elementAt(index).sourceId,
      more: '/library/follow',
      title: 'Follows'
    );
  }
}
