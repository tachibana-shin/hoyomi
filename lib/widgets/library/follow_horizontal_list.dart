import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hoyomi/controller/history.dart';
import 'package:hoyomi/core_services/book/interfaces/basic_book.dart';
import 'package:hoyomi/core_services/book/interfaces/meta_book.dart';
import 'package:hoyomi/database/scheme/book.dart';
import 'package:hoyomi/widgets/book/horizontal_book_list.dart';

class FollowHorizontalList extends StatefulWidget {
  const FollowHorizontalList({super.key});

  @override
  State<FollowHorizontalList> createState() => _FollowHorizontalListState();
}

class _FollowHorizontalListState extends State<FollowHorizontalList> {
  late final Future<List<Book>> _itemsFuture;

  @override
  initState() {
    super.initState();
    _itemsFuture = HistoryController().getListFollows(10, offset: 0);
  }

  @override
  Widget build(BuildContext context) {
    return HorizontalBookList(
        itemsFuture: _itemsFuture.then((items) => items
            .map(
              (item) => BasicBookExtend(
                  sourceId: item.sourceId,
                  book: BasicBook.fromMeta(item.bookId,
                      book: MetaBook.fromJson(jsonDecode(item.meta)))),
            )
            .toList()),
        more: '/library/follow',
        title: 'Follows');
  }
}
