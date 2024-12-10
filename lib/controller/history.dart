import 'dart:convert';

import 'package:honyomi/core_services/interfaces/meta_book.dart';
import 'package:honyomi/models/book.dart';
import 'package:honyomi/models/history_chap.dart';
import 'package:honyomi/objectbox.g.dart';
import 'package:honyomi/plugins/objectbox.dart';

class HistoryController {
  final Box<Book> _bookBox;
  final Box<HistoryChap> _historyChapBox;

  HistoryController(Store? store)
      : _bookBox = (store ?? objectBox.store).box<Book>(),
        _historyChapBox = (store ?? objectBox.store).box<HistoryChap>();

  ToMany<HistoryChap>? getHistory(String sourceId, String bookId) {
    return _bookBox
        .query(Book_.sourceId.equals(sourceId).and(Book_.bookId.equals(bookId)))
        .build()
        .findFirst()
        ?.histories;
  }

  Book createBook(
    String sourceId, {
    required String bookId,
    required MetaBook book,
    bool? followed,
  }) {
    Book? bookObject = _bookBox
        .query(Book_.sourceId.equals(sourceId).and(Book_.bookId.equals(bookId)))
        .build()
        .findFirst();

    if (bookObject == null) {
      bookObject = Book(
          bookId: bookId,
          sourceId: sourceId,
          meta: jsonEncode(book.toJson()),
          followedAt: followed == true ? DateTime.now() : null);
      // new book for box
      _bookBox.put(bookObject);
    } else if (followed != null) {
      bookObject.followedAt = followed == true ? DateTime.now() : null;
      _bookBox.put(bookObject);
    }

    return bookObject;
  }

  void saveHistory(Book book,
      {required String chapterId,
      required double currentPage,
      required int maxPage}) {
    final newHistory = HistoryChap(
        chapterId: chapterId, currentPage: currentPage, maxPage: maxPage);

    final existingHistory = getCurrentPage(book, chapterId: chapterId);

    if (existingHistory != null) {
      existingHistory.currentPage = newHistory.currentPage;
      existingHistory.maxPage = newHistory.maxPage;
      book.updatedAt = existingHistory.updatedAt = DateTime.now();

      _historyChapBox.put(existingHistory);
      _bookBox.put(book);
    } else {
      newHistory.book.target = book;
      book.updatedAt = newHistory.updatedAt;

      _historyChapBox.put(newHistory);
      _bookBox.put(book);
    }
  }

  HistoryChap? getCurrentPage(Book book, {required String chapterId}) {
    return _historyChapBox
        .query(HistoryChap_.chapterId
            .equals(chapterId)
            .and(HistoryChap_.book.equals(book.id)))
        .build()
        .findFirst();
  }

  List<Book> getListHistory(int limit, {required int offset}) {
    final query =
        _bookBox.query().order(Book_.updatedAt, flags: Order.descending).build()
          ..limit = limit
          ..offset = offset;

    return query.find();
  }

  List<Book> getListFollows(int limit, {required int offset}) {
    final query =
        _bookBox.query(Book_.followedAt.notNull()).order(Book_.followedAt, flags: Order.descending).build()
          ..limit = limit
          ..offset = offset;

    return query.find();
  }
}
