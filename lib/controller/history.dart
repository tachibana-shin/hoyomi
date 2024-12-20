import 'dart:convert';

import 'package:honyomi/core_services/book/interfaces/meta_book.dart';
import 'package:honyomi/database/isar.dart';
import 'package:honyomi/database/scheme/book.dart';
import 'package:honyomi/database/scheme/history_chap.dart';

import 'package:isar/isar.dart';

class HistoryController {
  final _bookBox = isar.books;
  final _historyChapBox = isar.historyChaps;

  Future<IsarLinks<HistoryChap>?> getHistory(
      String sourceId, String bookId) async {
    return (await _bookBox
            .filter()
            .bookIdEqualTo(bookId)
            .sourceIdEqualTo(sourceId)
            .findFirst())
        ?.histories;
  }

  Future<Book> createBook(
    String sourceId, {
    required String bookId,
    required MetaBook book,
    bool? followed,
  }) async {
    Book? bookObject = await _bookBox
        .filter()
        .sourceIdEqualTo(sourceId)
        .and()
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

    await _bookBox.put(bookObject);
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

      await _historyChapBox.put(existingHistory);
      await _bookBox.put(book);
    } else {
      final newHistory = HistoryChap(
          chapterId: chapterId,
          currentPage: currentPage,
          maxPage: maxPage,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now());

      newHistory.book.value = book;
      book.updatedAt = newHistory.updatedAt;

      await _historyChapBox.put(newHistory);
      await _bookBox.put(book);
    }
  }

  Future<HistoryChap?> getCurrentPage(Book book,
      {required String chapterId}) async {
    return await _historyChapBox
        .filter()
        .chapterIdEqualTo(chapterId)
        .and()
        .book((q) => q.idEqualTo(book.id))
        .findFirst();
  }

  Future<List<Book>> getListHistory(int limit, {required int offset}) async {
    final query = _bookBox
        .filter()
        .histories((q) => q.chapterIdIsNotEmpty())
        .sortByUpdatedAtDesc()
        .offset(offset)
        .limit(limit);

    final items = await query.findAll();
    final dropOut = limit - items.length;

    if (dropOut > 0 && items.isNotEmpty) {
      items
          .addAll(await getListHistory(dropOut, offset: offset + items.length));
    }

    return items;
  }

  Future<List<Book>> getListFollows(int limit, {required int offset}) async {
    final query = _bookBox
        .filter()
        .followedAtIsNotNull()
        .sortByFollowedAtDesc()
        .offset(offset)
        .limit(limit);

    return await query.findAll();
  }
}
