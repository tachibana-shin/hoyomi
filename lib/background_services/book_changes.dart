import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:honyomi/core_services/interfaces/meta_book.dart';
import 'package:honyomi/core_services/interfaces/status_enum.dart';
import 'package:honyomi/core_services/main.dart';
import 'package:honyomi/models/book.dart';
import 'package:honyomi/objectbox.g.dart';
import 'package:honyomi/plugins/objectbox.dart';
import 'package:honyomi/settings_store.dart';

class BookChanges {
  final _bookBox = objectBox.store.box<Book>();
  final _settings = SettingsStore();

  Timer? _timer;

  // Method to initialize background service
  void initializeBackgroundService() {
    FlutterBackgroundService().configure(
      androidConfiguration: AndroidConfiguration(
        onStart: onStart,
        autoStart: true,
        isForegroundMode:
            false, // Can set this to true if you need foreground service
      ),
      iosConfiguration: IosConfiguration(
          autoStart: true,
          onForeground: onStart,
          onBackground: (ServiceInstance service) {
            WidgetsFlutterBinding.ensureInitialized();
            DartPluginRegistrant.ensureInitialized();

            return true;
          }),
    );
  }

  bool onStart(ServiceInstance instance) {
    // Start the periodic updates when the service is started
    _startPeriodicUpdates(instance);
    return true;
  }

  void _startPeriodicUpdates(ServiceInstance instance) {
    // Cancel the timer if it was already running
    _timer?.cancel();

    // Timer to call checkUpdateAll at regular intervals
    _timer = Timer.periodic(Duration(minutes: _settings.pollingIntervalBook),
        (timer) async {
      if (instance is AndroidServiceInstance
          ? await instance.isForegroundService()
          : true) {
        await checkUpdateAll();
      }
    });
  }

  Future<void> checkUpdateAll() async {
    final allBooks = fetchAndSortBooksForUpdate();

    final groupedBooks = groupBooksBySourceId(allBooks);

    List<Future<void>> tasks = [];

    for (final sourceId in groupedBooks.keys) {
      final booksWithSameSourceId = groupedBooks[sourceId]!;

      final chunkedBooks = _chunkList(booksWithSameSourceId, 5);

      for (final bookBatch in chunkedBooks) {
        tasks.add(Future.wait(bookBatch.map((book) async {
          final changes = await updateBook(
              sourceId: sourceId, book: book, saveDatabase: false);
          if (changes.isNotEmpty) {
            // Debug print if there are changes
            debugPrint("[changes]: $changes");
          }
        })));
      }
    }

    await Future.wait(tasks);
  }

  Future<Iterable<Chapter>> updateBook(
      {required String sourceId,
      required Book book,
      bool? saveDatabase}) async {
    final service = getService(sourceId);
    final newData = await service.getDetails(book.bookId);
    final oldData = MetaBook.fromJson(jsonDecode(book.meta));

    if (saveDatabase == true) {
      book.meta = jsonEncode(newData.toJson());
      _bookBox.put(book);
    }

    final oldChaptersSet =
        oldData.chapters.map((chapter) => chapter.chapterId).toSet();

    return newData.chapters
        .where((chapter) => !oldChaptersSet.contains(chapter.chapterId));
  }

  Map<String, List<Book>> groupBooksBySourceId(List<Book> allBooks) {
    final groupedBooks = HashMap<String, List<Book>>();

    for (final book in allBooks) {
      groupedBooks.putIfAbsent(book.sourceId, () => []).add(book);
    }

    return groupedBooks;
  }

  List<Book> fetchAndSortBooksForUpdate() {
    DateTime thirtyMinutesAgo = DateTime.now()
        .subtract(Duration(minutes: _settings.pollingIntervalBook));
    int thirtyMinutesAgoMillis = thirtyMinutesAgo.millisecondsSinceEpoch;

    final booksToUpdate = _bookBox
        .query(Book_.updatedAt
            .lessThan(thirtyMinutesAgoMillis)
            .and(Book_.status.equals(StatusEnum.ongoing.name)))
        .order(Book_.updatedAt, flags: Order.descending)
        .build()
        .find();

    return booksToUpdate;
  }

  List<List<T>> _chunkList<T>(List<T> list, int chunkSize) {
    List<List<T>> chunks = [];
    for (int i = 0; i < list.length; i += chunkSize) {
      chunks.add(list.sublist(
          i, i + chunkSize > list.length ? list.length : i + chunkSize));
    }
    return chunks;
  }
}
