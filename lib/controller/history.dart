import 'dart:convert';

import 'package:hoyomi/core_services/book/interfaces/meta_book.dart';
import 'package:hoyomi/database/isar.dart';
import 'package:hoyomi/database/scheme/book.dart';
import 'package:hoyomi/database/scheme/history_chap.dart';

import 'package:isar/isar.dart';

class HistoryController {
  final _bookBox = isar.books;
  final _historyChapBox = isar.historyChaps;

  Future<List<HistoryChap>?> getHistory(String sourceId, String bookId) async {
    final book = await _bookBox
        .where()
        .bookIdEqualTo(bookId)
        .sourceIdEqualTo(sourceId)
        .findFirstAsync();
    if (book == null) return null;

    return _historyChapBox.where().bookEqualTo(book.id).findAll();
  }

  Future<Book> createBook(
    String sourceId, {
    required String bookId,
    required MetaBook book,
    bool? followed,
  }) async {
    Book? bookObject = await _bookBox
        .where()
        .sourceIdEqualTo(sourceId)
        .and()
        .bookIdEqualTo(bookId)
        .findFirstAsync();

    bookObject ??= Book(
      sourceId: sourceId,
      bookId: bookId,
      status: book.status.name,
      meta: jsonEncode(book.toJson()),
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    if (followed != null) {
      bookObject.followedAt = followed == true ? DateTime.now() : null;
    }

    if (bookObject.status != book.status.name) {
      bookObject.status = book.status.name;
    }

    final newMeta = jsonEncode(book.toJson());
    if (newMeta != bookObject.meta) {
      bookObject.meta = newMeta;
    }

    await isar.writeAsync((isar) {
      isar.books.put(bookObject!);
    });

    return bookObject;
  }

  Future<void> saveHistory(Book book,
      {required String chapterId,
      required double currentPage,
      required int maxPage}) async {
    final existingHistory = await getCurrentPage(book, chapterId: chapterId);

    if (existingHistory != null) {
      existingHistory.currentPage = currentPage;
      existingHistory.maxPage = maxPage;
      book.updatedAt = existingHistory.updatedAt = DateTime.now();

      await isar.writeAsync((isar) {
        isar.historyChaps.put(existingHistory);
        isar.books.put(book);
      });
    } else {
      final newHistory = HistoryChap(
          chapterId: chapterId,
          currentPage: currentPage,
          maxPage: maxPage,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now());

      newHistory.book = book.id;
      book.updatedAt = newHistory.updatedAt;

      await isar.writeAsync((isar) {
        isar.historyChaps.put(newHistory);
        isar.books.put(book);
      });
    }
  }

  Future<HistoryChap?> getCurrentPage(Book book,
      {required String chapterId}) async {
    return _historyChapBox
        .where()
        .chapterIdEqualTo(chapterId)
        .and()
        .bookEqualTo(book.id)
        .findFirstAsync();
  }

  Future<List<Book>> getListHistory(int limit, {required int offset}) async {
    final query = _bookBox.where().sortByUpdatedAtDesc();

    final items = await query.findAllAsync(offset: offset, limit: limit);
    final dropOut = limit - items.length;

    if (dropOut > 0 && items.isNotEmpty) {
      items
          .addAll(await getListHistory(dropOut, offset: offset + items.length));
    }

    return items;
  }

  Future<List<Book>> getListFollows(int limit, {required int offset}) async {
    final query = _bookBox.where().followedAtIsNotNull().sortByFollowedAtDesc();

    return query.findAllAsync(offset: offset, limit: limit);
  }

  Future<HistoryChap?> getLastChapter(int bookId) async {
    return _historyChapBox
        .where()
        .bookEqualTo(bookId)
        .sortByUpdatedAtDesc()
        .findFirstAsync();
  }
}
