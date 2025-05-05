import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:background_downloader/background_downloader.dart' hide Database;
import 'package:crypto/crypto.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hoyomi/core_services/comic/main.dart';
import 'package:kaeru/kaeru.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:retry/retry.dart';
import 'package:pool/pool.dart';
import 'package:sqlite_async/sqlite_async.dart';

part 'comic_downloader.freezed.dart';

typedef DownloaderChapterReturn = ({bool done, Object? error, double progress});
typedef InsertPageReturn = ({OImage image, String pageId, String path});
typedef InsertChapterReturn =
    ({String chapterDbId, List<InsertPageReturn> pages});

@freezed
sealed class LoadedComic with _$LoadedComic {
  const factory LoadedComic({
    required MetaComic meta,
    required List<LoadedChapter> chapters,
  }) = _LoadedComic;
}

@freezed
sealed class LoadedChapter with _$LoadedChapter {
  const factory LoadedChapter({
    required String id,
    required String chapterId,
    required int pageCount,
    required int doneAt,
    required List<LoadedPage> pages,
  }) = _LoadedChapter;
}

@freezed
sealed class LoadedPage with _$LoadedPage {
  const factory LoadedPage({
    required OImage image,
    required String path,
    required bool downloaded,
  }) = _LoadedPage;
}

/// Design filesystem
///
/// comic_offline
///   truyenqq
///     tonikaku-kawaii-992
///       chapter-1-2245
///         page-1.jpg
///         page-2.jpg
///         page-3.jpg
///         page-4.jpg
///         page-5.jpg
///         page-6.jpg
///         page-7.jpg
///
class ComicDownloader {
  final migrations =
      SqliteMigrations()..add(
        SqliteMigration(1, (tx) async {
          // comics table
          await tx.execute('''
            CREATE TABLE IF NOT EXISTS comics (
              id TEXT NOT NULL,
              service_id TEXT NOT NULL,
              comic_id TEXT NOT NULL,
              image_path TEXT NOT NULL,
              meta_json TEXT NOT NULL,
              PRIMARY KEY (id, service_id, comic_id),
              UNIQUE (service_id, comic_id)
            );
          ''');

          // chapters table
          await tx.execute('''
            CREATE TABLE IF NOT EXISTS chapters (
              id TEXT NOT NULL,
              comic_db_id TEXT NOT NULL,
              comic_id TEXT NOT NULL,
              chapter_id TEXT NOT NULL,
              page_count INTEGER NOT NULL,
              downloaded_at INTEGER NOT NULL,
              done_at INTEGER NOT NULL,
              PRIMARY KEY (id, comic_db_id, chapter_id),
              UNIQUE (comic_db_id, chapter_id),
              UNIQUE (comic_id, chapter_id)
            );
          ''');

          // pages table
          await tx.execute('''
            CREATE TABLE IF NOT EXISTS pages (
              id TEXT NOT NULL,
              chapter_db_id TEXT NOT NULL,
              index_order INTEGER NOT NULL,
              o_image TEXT NOT NULL,
              path TEXT NOT NULL,
              downloaded INTEGER NOT NULL DEFAULT 0,
              PRIMARY KEY (id, chapter_db_id, index_order),
              UNIQUE (chapter_db_id, index_order)
            );
          ''');
        }),
      );

  final _storeInsertComicFuture = <String, Future<String>>{};
  final _storeChaptersDownload = Ref(<String, Ref<DownloaderChapterReturn>>{});

  late final Directory _document;
  late final SqliteDatabase _db;

  static ComicDownloader? _instance;
  // Avoid self instance
  ComicDownloader._() {
    init();
  }
  static ComicDownloader get instance => _instance ??= ComicDownloader._();

  Future<void> init() async {
    await initDatabase();
  }

  Future<void>? _initDatabaseFuture;
  bool _initdDatabase = false;
  Future<void> initDatabase() async {
    if (_initdDatabase) return;
    if (_initDatabaseFuture != null) return _initDatabaseFuture;

    if (kDebugMode) {
      print('init database');
    }

    Future<void> init() async {
      _document = await getApplicationDocumentsDirectory();

      _db = SqliteDatabase(path: '${_document.path}/comic_offline.sqlite');
      await migrations.migrate(_db);
    }

    _initDatabaseFuture = init();

    return await  _initDatabaseFuture!.then((_) {
      _initdDatabase = true;
      _initDatabaseFuture = null;
    });
  }

  Future<Ref<LoadedChapter?>> getDownloadedChapter({
    required ABComicService service,
    required String comicId,
    required String chapterId,
  }) async {
    await initDatabase();

    final row = await _db.getOptional(
      '''
        SELECT * FROM comics
        WHERE service_id = ?
        AND comic_id = ?
        LIMIT 1
      ''',
      [service.uid, comicId],
    );
    if (row == null) return Ref(null);

    final comicDbId = row['id'] as String;
    // final meta = MetaComic.fromJson(jsonDecode(row['meta_json'] as String));

    final chapter = await _db.getOptional(
      '''
        SELECT * FROM chapters
        WHERE comic_db_id = ?
        AND chapter_id = ?
      ''',
      [comicDbId, chapterId],
    );
    if (chapter == null) return Ref(null);

    final pages = await _db.getAll(
      '''
        SELECT * FROM pages
        WHERE chapter_db_id = ?
        ORDER BY index_order
      ''',
      [chapter['id'] as String],
    );

    final images =
        pages.map((p) {
          final oImage = OImage.fromJson(jsonDecode(p['o_image'] as String));
          final path = p['path'] as String;
          final downloaded = (p['downloaded'] as int) == 1;
          return LoadedPage(image: oImage, path: path, downloaded: downloaded);
        }).toList();

    return Ref(
      LoadedChapter(
        id: chapter['id'] as String,
        chapterId: chapter['chapter_id'] as String,
        pageCount: chapter['page_count'] as int,
        doneAt: chapter['done_at'] as int,
        pages: images,
      ),
    );
  }

  Future<String> _insertComic$(
    String comicDbId, {
    required Service service,
    required String comicId,
    required MetaComic metaComic,
  }) async {
    final metaJson = jsonEncode(metaComic.toJson());

    // download image
    final pathPoster = join('comic_offline', service.uid, comicId, 'poster');
    final filePoster = File(join(_document.path, pathPoster));
    if (!await filePoster.exists()) {
      final (baseDirectory, directory, filename) = await Task.split(
        filePath: filePoster.path,
      );
      final task = DownloadTask(
        url: metaComic.image.src,
        headers: metaComic.image.headers?.toMap(),
        baseDirectory: baseDirectory,
        directory: directory,
        filename: filename,
        updates: Updates.none,
        requiresWiFi: true,
        retries: 5,
        allowPause: false,
      );

      final result = await FileDownloader().download(task);

      if (result.status != TaskStatus.complete) {
        throw Exception('Error download image');
      }
    }

    try {
      await _db.execute(
        '''
          INSERT OR REPLACE INTO comics (
            id,
            service_id,
            comic_id,
            image_path,
            meta_json
          ) VALUES (?, ?, ?, ?, ?)
        ''',
        [comicDbId, service.uid, comicId, pathPoster, metaJson],
      );

      return comicDbId;
    } catch (e) {
      debugPrint('Failed to insert comic: $e');
      rethrow;
    }
  }

  Future<String> _insertComic({
    required Service service,
    required String comicId,
    required MetaComic metaComic,
  }) {
    final comicDbId =
        sha256.convert(utf8.encode('${service.uid}@$comicId')).toString();

    return _storeInsertComicFuture[comicDbId] ??= _insertComic$(
      comicDbId,
      service: service,
      comicId: comicId,
      metaComic: metaComic,
    ).catchError((error) {
      _storeInsertComicFuture.remove(comicDbId);
      throw error;
    });
  }

  Future<InsertChapterReturn> _insertChapter({
    required ABComicService service,
    required String comicId,
    required MetaComic metaComic,
    required String chapterId,
    required ComicChapter chapter,
    required List<OImage> pages,
  }) async {
    final comicDbId = await _insertComic(
      service: service,
      comicId: comicId,
      metaComic: metaComic,
    );

    final chapterDbId =
        sha256.convert(utf8.encode('$comicDbId@$chapterId')).toString();
    final now = DateTime.now().millisecondsSinceEpoch;

    try {
      await _db.execute(
        '''
          INSERT OR REPLACE INTO chapters (
            id,
            comic_db_id,
            comic_id,
            chapter_id,
            page_count,
            downloaded_at,
            done_at
          ) VALUES (?, ?, ?, ?, ?, ?, ?)
        ''',
        [chapterDbId, comicDbId, comicId, chapterId, pages.length, now, 0],
      );

      final List<InsertPageReturn> results = [];
      for (var i = 0; i < pages.length; i++) {
        final oImageJson = jsonEncode(pages[i].toJson());
        final path = _expectedPagePath(service, comicId, chapterId, i);

        final pageId =
            sha256.convert(utf8.encode('$chapterDbId@$i')).toString();

        await _db.execute(
          '''
            INSERT OR IGNORE INTO pages (
              id,
              chapter_db_id,
              index_order,
              o_image,
              path,
              downloaded
            ) VALUES (?, ?, ?, ?, ?, ?)
          ''',
          [
            pageId,
            chapterDbId,
            i,
            oImageJson,
            path,
            0, // Not downloaded yet
          ],
        );

        results.add((image: pages[i], pageId: pageId, path: path));
      }

      return (chapterDbId: chapterDbId, pages: results);
    } catch (e) {
      debugPrint('Failed to insert chapter: $e');
      rethrow;
    }
  }

  String _expectedPagePath(
    ABComicService service,
    String comicId,
    String chapterId,
    int pageIndex,
  ) {
    return join(
      'comic_offline',
      service.uid,
      comicId,
      chapterId,
      'page-$pageIndex',
    );
  }

  Ref<DownloaderChapterReturn>? getDownloaderState({
    required ABComicService service,
    required String comicId,
    required String chapterId,
  }) {
    final uid = '$chapterId@$comicId@${service.uid}';

    if (_storeChaptersDownload.value.containsKey(uid)) {
      return _storeChaptersDownload.value[uid]!;
    }

    return null;
  }

  Future<DownloaderChapterReturn> downloadChapter({
    required ABComicService service,
    required String comicId,
    required MetaComic metaComic,
    required String chapterId,
    required ComicChapter chapter,
    required List<OImage> pages,
  }) async {
    await initDatabase();

    final uid = '$chapterId@$comicId@${service.uid}';
    final cache = getDownloaderState(
      service: service,
      comicId: comicId,
      chapterId: chapterId,
    );
    if (cache != null) return cache.value;

    final $mapProgress = List.generate(pages.length, (_) => 0.0);
    final result = Ref<DownloaderChapterReturn>((
      progress: 0.0,
      done: false,
      error: null,
    ));

    void computeTotalProgress() {
      result.value = (
        done: false,
        error: null,
        progress:
            $mapProgress.fold(0.0, (old, current) => old + current) /
            pages.length,
      );
    }

    final pool = Pool(10);
    final retry = RetryOptions();

    final (chapterDbId: chapterDbId, pages: results) = await _insertChapter(
      service: service,
      comicId: comicId,
      metaComic: metaComic,
      chapterId: chapterId,
      chapter: chapter,
      pages: pages,
    );

    bool notSupportFetchPage = false;

    Future.wait<void>(
          results.indexed.map(
            (entry) => pool.withResource(
              () => retry.retry<void>(() async {
                final file = File(join(_document.path, entry.$2.path));

                final (baseDirectory, directory, filename) = await Task.split(
                  filePath: file.path,
                );
                final task = DownloadTask(
                  url: entry.$2.image.src,
                  headers: entry.$2.image.headers?.toMap(),
                  baseDirectory: baseDirectory,
                  directory: directory,
                  filename: filename,
                  updates: Updates.none,
                  requiresWiFi: true,
                  retries: 5,
                  allowPause: false,
                );

                final result = await FileDownloader().download(task);

                switch (result.status) {
                  case TaskStatus.complete:
                    {
                      print('Success!');

                      if (!notSupportFetchPage) {
                        try {
                          Uint8List buffer = await file.readAsBytes();
                          buffer = await service.fetchPage(
                            buffer,
                            entry.$2.image,
                          );
                          // save to file
                          await file.writeAsBytes(buffer);
                        } on UnimplementedError {
                          /// pass
                          notSupportFetchPage = true;
                        }
                      }

                      $mapProgress[entry.$1] = 1;
                      computeTotalProgress();

                      await _db.execute(
                        '''
                          UPDATE pages
                          SET downloaded = 1
                          WHERE id = ?
                        ''',
                        [entry.$2.pageId],
                      );

                      return;
                    }

                  case TaskStatus.canceled:
                    if (kDebugMode) {
                      print('Download was canceled');
                    }
                  case TaskStatus.paused:
                    if (kDebugMode) {
                      print('Download was paused');
                    }
                  default:
                    if (kDebugMode) {
                      print('Download not successful');
                    }
                    throw Exception('Download not successful');
                }
              }),
            ),
          ),
        )
        .then((_) async {
          result.value = (progress: 1, done: true, error: null);

          await _db.execute(
            '''
            UPDATE chapters
            SET done_at = ?
            WHERE id = ?
            ''',
            [DateTime.now().millisecondsSinceEpoch, chapterDbId],
          );
        })
        .catchError((err) {
          result.value = (
            progress: result.value.progress,
            error: err,
            done: false,
          );
        });

    _storeChaptersDownload.value = {
      ..._storeChaptersDownload.value,
      uid: result,
    };

    return result.value;
  }

  Future<void> deleteChapter(String chapterDbId) async {
    try {
      final pages = await _db.getAll(
        '''
          SELECT path FROM pages
          WHERE chapter_db_id = ?
        ''',
        [chapterDbId],
      );

      for (final page in pages) {
        final file = File(join(_document.path, page['path'] as String));
        if (await file.exists()) {
          await file.delete();
        }
      }

      await _db.writeTransaction((tx) async {
        await tx.execute('DELETE FROM pages WHERE chapter_db_id = ?', [
          chapterDbId,
        ]);
        await tx.execute('DELETE FROM chapters WHERE id = ?', [chapterDbId]);
      });
    } catch (e, st) {
      debugPrint('Failed to delete chapter: $e\n$st');
      rethrow;
    }
  }

  Future<void> deleteComic(String comicDbId) async {
    try {
      final chapters = await _db.getAll(
        '''
          SELECT id FROM chapters
          WHERE comic_db_id = ?
        ''',
        [comicDbId],
      );

      for (final chapter in chapters) {
        final chapterDbId = chapter['id'] as String;
        await deleteChapter(chapterDbId);
      }

      _db.execute('DELETE FROM comics WHERE id = ?', [comicDbId]);

      final parts = comicDbId.split('@');
      if (parts.length >= 2) {
        final serviceUid = parts[0];
        final comicId = parts[1];
        final comicDir = Directory(
          join(_document.path, 'comic_offline', serviceUid, comicId),
        );
        if (await comicDir.exists()) {
          await comicDir.delete(recursive: true);
        }
      }
    } catch (e, st) {
      debugPrint('Failed to delete comic: $e\n$st');
      rethrow;
    }
  }

  Future<void> clearAll() async {
    try {
      final comicDir = Directory(join(_document.path, 'comic_offline'));
      if (await comicDir.exists()) {
        await comicDir.delete(recursive: true);
      }

      final dbFile = File('${_document.path}/comic_offline.sqlite');
      if (await dbFile.exists()) {
        await dbFile.delete();
      }

      _storeChaptersDownload.value = {};

      debugPrint('All offline data cleared.');
    } catch (e, st) {
      debugPrint('Failed to clear all data: $e\n$st');
      rethrow;
    }
  }
}
