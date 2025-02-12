import 'dart:convert';
import 'package:drift/drift.dart';
import 'package:hoyomi/database/drift.dart';
import 'package:hoyomi/core_services/book/interfaces/meta_book.dart';

class HistoryController {
  final AppDatabase _db;

  HistoryController._(this._db);
  static final HistoryController _instance =
      HistoryController._(AppDatabase());

  static HistoryController get instance => _instance;

  Future<List<HistoryChap>?> getHistory(String sourceId, String bookId) async {
    final book = await (_db.managers.books.filter(
            (t) => t.bookId.equals(bookId) & t.sourceId.equals(sourceId)))
        .getSingleOrNull();
    if (book == null) return null;

    return _db.managers.historyChaps
        .filter((t) => t.book.equals(book.id))
        .get();
  }

  Future<Book> createBook(
    String sourceId, {
    required String bookId,
    required MetaBook book,
    bool? followed,
  }) async {
    final bookObject = await _db.managers.books
        .filter((t) => t.sourceId.equals(sourceId) & t.bookId.equals(bookId))
        .getSingleOrNull();

    Book bookToSave = bookObject ??
        await _db.managers.books.createReturning((row) => row(
              sourceId: sourceId,
              bookId: bookId,
              status: book.status.name,
              meta: jsonEncode(book.toJson()),
              createdAt: DateTime.now(),
              updatedAt: DateTime.now(),
            ));

    BooksCompanion companion = BooksCompanion();

    if (followed != null) {
      companion = companion.copyWith(
        followedAt: Value(followed ? DateTime.now() : null),
      );
    }

    if (bookToSave.status != book.status.name) {
      companion = companion.copyWith(
        status: Value(book.status.name),
      );
    }

    final newMeta = jsonEncode(book.toJson());
    if (newMeta != bookToSave.meta) {
      companion = companion.copyWith(
        meta: Value(newMeta),
      );
    }

    await _db
        .update(_db.books)
        .replace(bookToSave.copyWithCompanion(companion));

    return bookToSave;
  }

  Future<void> saveHistory(
    Book book, {
    required String chapterId,
    required double currentPage,
    required int maxPage,
  }) async {
    final existingHistory = await getCurrentPage(book, chapterId: chapterId);

    if (existingHistory != null) {
      // Create companions to update the data
      final historyChapCompanion = HistoryChapsCompanion(
        currentPage: Value(currentPage),
        maxPage: Value(maxPage),
        updatedAt: Value(DateTime.now()),
      );

      final bookCompanion = BooksCompanion(
        updatedAt: Value(DateTime.now()),
      );

      await _db.transaction(() async {
        // Update both history and book
        await _db
            .update(_db.historyChaps)
            .replace(existingHistory.copyWithCompanion(historyChapCompanion));
        await _db
            .update(_db.books)
            .replace(book.copyWithCompanion(bookCompanion));
      });
    } else {
      // Insert new history if it doesn't exist
      final newHistory = HistoryChapsCompanion(
        chapterId: Value(chapterId),
        currentPage: Value(currentPage),
        maxPage: Value(maxPage),
        createdAt: Value(DateTime.now()),
        updatedAt: Value(DateTime.now()),
        book: Value(book.id),
      );

      final bookCompanion = BooksCompanion(
        updatedAt: Value(DateTime.now()),
      );

      await _db.transaction(() async {
        // Insert new history and update book
        await _db.into(_db.historyChaps).insert(newHistory);
        await _db
            .update(_db.books)
            .replace(book.copyWithCompanion(bookCompanion));
      });
    }
  }

  Future<HistoryChap?> getCurrentPage(Book book,
      {required String chapterId}) async {
    return _db.managers.historyChaps
        .filter((t) => t.chapterId.equals(chapterId) & t.book.equals(book.id))
        .getSingleOrNull();
  }

  Future<List<Book>> getListHistory(int limit, {required int offset}) async {
    final query = _db.select(_db.books)
      ..orderBy([
        (u) => OrderingTerm(expression: u.updatedAt, mode: OrderingMode.desc),
      ]);

    final items = await (query..limit(limit, offset: offset)).get();
    final dropOut = limit - items.length;

    if (dropOut > 0 && items.isNotEmpty) {
      items
          .addAll(await getListHistory(dropOut, offset: offset + items.length));
    }

    return items;
  }

  Future<List<Book>> getListFollows(int limit, {required int offset}) async {
    final query = _db.select(_db.books)
      ..where((t) => t.followedAt.isNotNull())
      ..orderBy([
        (u) => OrderingTerm(expression: u.followedAt, mode: OrderingMode.desc),
      ]);

    return (query..limit(limit, offset: offset)).get();
  }

  Future<HistoryChap?> getLastChapter(int bookId) async {
    return (_db.select(_db.historyChaps)
          ..where((t) => t.book.equals(bookId))
          ..orderBy([
            (u) =>
                OrderingTerm(expression: u.updatedAt, mode: OrderingMode.desc),
          ]))
        .getSingleOrNull();
  }
}
