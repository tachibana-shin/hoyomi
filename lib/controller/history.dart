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
  }) {
    Book? bookObject = _bookBox
        .query(Book_.sourceId.equals(sourceId).and(Book_.bookId.equals(bookId)))
        .build()
        .findFirst();

    if (bookObject == null) {
      bookObject = Book(
          bookId: bookId, sourceId: sourceId, meta: jsonEncode(book.toJson()));
      // new book for box
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
      existingHistory.updatedAt = DateTime.now();
      _historyChapBox.put(existingHistory);
    } else {
      newHistory.book.target = book;
      _historyChapBox.put(newHistory);
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
}
