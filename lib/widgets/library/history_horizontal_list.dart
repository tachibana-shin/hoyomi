import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:honyomi/controller/history.dart';
import 'package:honyomi/core_services/book/interfaces/basic_book.dart';
import 'package:honyomi/core_services/book/interfaces/meta_book.dart';
import 'package:honyomi/database/scheme/book.dart';
import 'package:honyomi/widgets/book/horizontal_book_list.dart';

class HistoryHorizontalList extends StatefulWidget {
  const HistoryHorizontalList({super.key});

  @override
  State<HistoryHorizontalList> createState() => _HistoryHorizontalListState();
}

class _HistoryHorizontalListState extends State<HistoryHorizontalList> {
  late final Future<List<Book>> _itemsFuture;

  @override
  initState() {
    super.initState();
    _itemsFuture = HistoryController().getListHistory(10, offset: 0);
  }

  @override
  Widget build(BuildContext context) {
    return HorizontalBookList(
      itemsFuture: _itemsFuture
          .then((items) async => Future.wait(items.map((item) async {
                final meta = MetaBook.fromJson(jsonDecode(item.meta));
                final book = BasicBook.fromMeta(item.bookId, book: meta);

                final current =
                    await HistoryController().getLastChapter(item.id);

                final currentEpisodeIndex = current == null
                    ? -1
                    : meta.chapters.lastIndexWhere((chapter) {
                        return current.chapterId == chapter.chapterId;
                      });

                return BasicBookExtend(
                    sourceId: item.sourceId,
                    book: book,
                    percentRead: (meta.chapters.length - currentEpisodeIndex) /
                        meta.chapters.length);
              }))),
      more: '/library/history',
      title: 'History',
    );
  }
}
