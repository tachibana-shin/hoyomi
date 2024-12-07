import 'package:honyomi/models/book.dart';
import 'package:honyomi/models/history.dart';
import 'package:honyomi/models/history_chap.dart';
import 'package:honyomi/objectbox.g.dart';
import 'package:honyomi/plugins/objectbox.dart';

class HistoryController {
  final Box<Book> _bookBox;
  final Box<History> _historyBox;

  HistoryController(Store? store)
      : _bookBox = (store ?? objectBox.store).box<Book>(),
        _historyBox = (store ?? objectBox.store).box<History>();

  ToMany<HistoryChap>? getHistory(String sourceId, String bookId) {
    return _bookBox
        .query(Book_.sourceId.equals(sourceId).and(Book_.bookId.equals(bookId)))
        .build()
        .findFirst()
        ?.history
        .target
        ?.chapters;
  }
}
