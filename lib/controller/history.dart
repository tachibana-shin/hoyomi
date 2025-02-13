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
        .filter()
        .sourceIdEqualTo(sourceId)
        .findFirst();
    if (book == null) return null;

    return _historyChapBox.filter().bookEqualTo(book.id!).findAll();
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
        .filter()
        .bookIdEqualTo(bookId)
        .findFirst();

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

    await isar.writeTxn(() async {
      await isar.books.put(bookObject!);
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

      await isar.writeTxn(() async {
        await isar.historyChaps.put(existingHistory);
        await isar.books.put(book);
      });
    } else {
      final newHistory = HistoryChap(
          chapterId: chapterId,
          currentPage: currentPage,
          maxPage: maxPage,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now());

      newHistory.book = book.id!;
      book.updatedAt = newHistory.updatedAt;

      await isar.writeTxn(() async {
        await isar.historyChaps.put(newHistory);
        await isar.books.put(book);
      });
    }
  }

  Future<HistoryChap?> getCurrentPage(Book book,
      {required String chapterId}) async {
    return _historyChapBox
        .where()
        .chapterIdEqualTo(chapterId)
        .filter()
        .bookEqualTo(book.id!)
        .findFirst();
  }

  Future<List<Book>> getListHistory(int limit, {required int offset}) async {
    final query = _bookBox.where().sortByUpdatedAtDesc();

    final items = await query.offset(offset).limit(limit).findAll();
    final dropOut = limit - items.length;

    if (dropOut > 0 && items.isNotEmpty) {
      items
          .addAll(await getListHistory(dropOut, offset: offset + items.length));
    }

    return items;
  }

  Future<List<Book>> getListFollows(int limit, {required int offset}) async {
    final query = _bookBox.where().followedAtIsNotNull().sortByFollowedAtDesc();

    return query.offset(offset).limit(limit).findAll();
  }

  Future<HistoryChap?> getLastChapter(int bookId) async {
    return _historyChapBox
        .filter()
        .bookEqualTo(bookId)
        .sortByUpdatedAtDesc()
        .findFirst();
  }
}
