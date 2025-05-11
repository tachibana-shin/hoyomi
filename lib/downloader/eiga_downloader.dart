import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:background_downloader/background_downloader.dart' hide Database;
import 'package:crypto/crypto.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hls_parser/flutter_hls_parser.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hoyomi/apis/show_snack_bar.dart';
import 'package:hoyomi/core_services/eiga/main.dart';
import 'package:hoyomi/plugins/export.dart';
import 'package:kaeru/kaeru.dart';
import 'package:path/path.dart';
import 'package:retry/retry.dart';
import 'package:pool/pool.dart';
import 'package:sqlite_async/sqlite_async.dart';

part 'eiga_downloader.freezed.dart';

typedef DownloaderEpisodeReturn =
    ({
      Service service,
      MetaEiga eiga,
      EigaEpisode episode,
      bool done,
      Object? error,
      double progress,
    });
typedef InsertPageReturn =
    ({OImage image, String pageId, String path, bool done});
typedef InsertEpisodeReturn =
    ({String episodeDbId, List<InsertPageReturn> pages});

typedef DownloadedEigaInfo =
    ({
      String sourceId,
      String eigaId,
      MetaEiga meta,
      String imagePath,
      Map<String, LoadedEpisode> episodes,
    });

@freezed
sealed class LoadedEiga with _$LoadedEiga {
  const factory LoadedEiga({
    required MetaEiga meta,
    required List<LoadedEpisode> episodes,
  }) = _LoadedEiga;
}

@freezed
sealed class LoadedEpisode with _$LoadedEpisode {
  const factory LoadedEpisode({
    required String id,
    required String episodeId,
    required int pageCount,
    required int count,
    required int doneAt,
    required List<LoadedPage> pages,
    required Ref<DownloaderEpisodeReturn>? progress,
  }) = _LoadedEpisode;
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
/// eiga_offline
///   truyenqq
///     tonikaku-kawaii-992
///       episode-1-2245
///         page-1.jpg
///         page-2.jpg
///         page-3.jpg
///         page-4.jpg
///         page-5.jpg
///         page-6.jpg
///         page-7.jpg
///
class EigaDownloader {
  static final migrations =
      SqliteMigrations()..add(
        SqliteMigration(1, (tx) async {
          // eigas table
          await tx.execute('''
            CREATE TABLE IF NOT EXISTS eigas (
              id TEXT NOT NULL,
              service_id TEXT NOT NULL,
              eiga_id TEXT NOT NULL,
              image_path TEXT NOT NULL,
              meta_json TEXT NOT NULL,
              PRIMARY KEY (id, service_id, eiga_id),
              UNIQUE (service_id, eiga_id)
            );
          ''');

          // episodes table
          await tx.execute('''
            CREATE TABLE IF NOT EXISTS episodes (
              id TEXT NOT NULL,
              eiga_db_id TEXT NOT NULL,
              eiga_id TEXT NOT NULL,
              episode_id TEXT NOT NULL,
              video_path NOT NULL,
              downloaded_at INTEGER NOT NULL,
              done_at INTEGER NOT NULL,
              PRIMARY KEY (id, eiga_db_id, episode_id),
              UNIQUE (eiga_db_id, episode_id),
              UNIQUE (eiga_id, episode_id)
            );
          ''');

          // segments table
          await tx.execute('''
            CREATE TABLE IF NOT EXISTS segments (
              id TEXT NOT NULL,
              episode_db_id TEXT NOT NULL,
              path TEXT NOT NULL,
              downloaded INTEGER NOT NULL DEFAULT 0,
              PRIMARY KEY (id, episode_db_id)
            );
          ''');
        }),
      );

  static String expectedPosterPath(ABEigaService service, String eigaId) {
    return join('eiga_offline', service.uid, eigaId, 'poster');
  }

  static String expectedPagePath(
    ABEigaService service,
    String eigaId,
    String episodeId,
    int pageIndex,
  ) {
    return join(
      'eiga_offline',
      service.uid,
      eigaId,
      episodeId,
      'page-$pageIndex',
    );
  }

  static String generateEigaDbId(Service service, String eigaId) {
    final eigaDbId =
        sha256.convert(utf8.encode('${service.uid}@$eigaId')).toString();

    return eigaDbId;
  }

  static List<OImage> getPagesWithOffline(LoadedEpisode downloaded) {
    return downloaded.pages
        .map(
          (page) =>
              page.downloaded
                  ? OImage(
                    src: 'file:${page.path}',
                    headers: page.image.headers,
                    extra: page.image.extra,
                  )
                  : page.image,
        )
        .toList();
  }

  static Future<Uint8List?> getPage(OImage image) async {
    if (image.src.startsWith('file:')) {
      final file = File(
        join(applicationDocumentDirectory.path, image.src.substring(5)),
      );

      if (!await file.exists()) return null;

      return file.readAsBytes();
    } else {
      return null;
    }
  }

  final _storeInsertEigaFuture = <String, Future<String>>{};
  final _storeEpisodesDownload = Ref(<String, Ref<DownloaderEpisodeReturn>>{});

  late final Directory _document = applicationDocumentDirectory;
  late final SqliteDatabase _db;

  static EigaDownloader? _instance;
  // Avoid self instance
  EigaDownloader._() {
    init();
  }
  static EigaDownloader get instance => _instance ??= EigaDownloader._();

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
      _db = SqliteDatabase(path: '${_document.path}/eiga_offline.sqlite');
      await migrations.migrate(_db);
    }

    _initDatabaseFuture = init();

    return await _initDatabaseFuture!.then((_) {
      _initdDatabase = true;
      _initDatabaseFuture = null;
    });
  }

  Future<LoadedEpisode?> getDownloadedEpisode({
    required ABEigaService service,
    required String eigaId,
    required String episodeId,
  }) async {
    await initDatabase();

    final eigaDbId = generateEigaDbId(service, eigaId);
    // final meta = MetaEiga.fromJson(jsonDecode(row['meta_json'] as String));

    final episode = await _db.getOptional(
      '''
        SELECT * FROM episodes
        WHERE eiga_db_id = ?
        AND episode_id = ?
      ''',
      [eigaDbId, episodeId],
    );
    if (episode == null) return null;

    final pages = await _db.getAll(
      '''
        SELECT * FROM pages
        WHERE episode_db_id = ?
        ORDER BY index_order
      ''',
      [episode['id'] as String],
    );

    final images =
        pages.map((p) {
          final oImage = OImage.fromJson(jsonDecode(p['o_image'] as String));
          final path = p['path'] as String;
          final downloaded = (p['downloaded'] as int) == 1;
          return LoadedPage(image: oImage, path: path, downloaded: downloaded);
        }).toList();

    return LoadedEpisode(
      id: episode['id'] as String,
      episodeId: episode['episode_id'] as String,
      pageCount: episode['page_count'] as int,
      count: pages.fold(0, (prev, page) => prev + page['downloaded'] as int),
      doneAt: episode['done_at'] as int,
      pages: images,
      progress: null,
    );
  }

  Future<String> _insertEiga$(
    String eigaDbId, {
    required Service service,
    required String eigaId,
    required MetaEiga metaEiga,
  }) async {
    final metaJson = jsonEncode(metaEiga.toJson());

    // download image
    final pathPoster = join('eiga_offline', service.uid, eigaId, 'poster');
    final filePoster = File(join(_document.path, pathPoster));
    if (!await filePoster.exists()) {
      final (baseDirectory, directory, filename) = await Task.split(
        filePath: filePoster.path,
      );
      final task = DownloadTask(
        url: metaEiga.image.src,
        headers: metaEiga.image.headers?.toMap(),
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
          INSERT OR REPLACE INTO eigas (
            id,
            service_id,
            eiga_id,
            image_path,
            meta_json
          ) VALUES (?, ?, ?, ?, ?)
        ''',
        [eigaDbId, service.uid, eigaId, pathPoster, metaJson],
      );

      return eigaDbId;
    } catch (e) {
      debugPrint('Failed to insert eiga: $e');
      rethrow;
    }
  }

  Future<String> _insertEiga({
    required Service service,
    required String eigaId,
    required MetaEiga metaEiga,
  }) {
    final eigaDbId = generateEigaDbId(service, eigaId);

    return _storeInsertEigaFuture[eigaDbId] ??= _insertEiga$(
      eigaDbId,
      service: service,
      eigaId: eigaId,
      metaEiga: metaEiga,
    ).catchError((error) {
      _storeInsertEigaFuture.remove(eigaDbId);
      throw error;
    });
  }

  Future<InsertEpisodeReturn> _insertEpisode({
    required ABEigaService service,
    required String eigaId,
    required MetaEiga metaEiga,
    required String episodeId,
    required EigaEpisode episode,
  }) async {
    final eigaDbId = await _insertEiga(
      service: service,
      eigaId: eigaId,
      metaEiga: metaEiga,
    );

    final episodeDbId =
        sha256.convert(utf8.encode('$eigaDbId@$episodeId')).toString();

    final now = DateTime.now().millisecondsSinceEpoch;

    try {
      await _db.execute(
        '''
          INSERT OR REPLACE INTO episodes (
            id,
            eiga_db_id,
            eiga_id,
            episode_id,
            page_count,
            downloaded_at,
            done_at
          ) VALUES (?, ?, ?, ?, ?, ?, ?)
        ''',
        [episodeDbId, eigaDbId, eigaId, episodeId, pages.length, now, 0],
      );

      final List<InsertPageReturn> results = [];
      for (var i = 0; i < pages.length; i++) {
        final oImageJson = jsonEncode(pages[i].toJson());
        final path = expectedPagePath(service, eigaId, episodeId, i);

        final pageId =
            sha256.convert(utf8.encode('$episodeDbId@$i')).toString();

        final page = await _db.getOptional(
          '''
            SELECT downloaded FROM pages
            WHERE id = ?
          ''',
          [pageId],
        );

        if (page != null && page['downloaded'] == 1) {
          results.add((
            image: pages[i],
            pageId: pageId,
            path: path,
            done: true,
          ));
        } else {
          await _db.execute(
            '''
              INSERT OR IGNORE INTO pages (
                id,
                episode_db_id,
                index_order,
                o_image,
                path,
                downloaded
              ) VALUES (?, ?, ?, ?, ?, ?)
            ''',
            [
              pageId,
              episodeDbId,
              i,
              oImageJson,
              path,
              0, // Not downloaded yet
            ],
          );

          results.add((
            image: pages[i],
            pageId: pageId,
            path: path,
            done: false,
          ));
        }
      }

      return (episodeDbId: episodeDbId, pages: results);
    } catch (e) {
      debugPrint('Failed to insert episode: $e');
      rethrow;
    }
  }

  Ref<DownloaderEpisodeReturn>? getDownloaderState({
    required ABEigaService service,
    required String eigaId,
    required String episodeId,
  }) {
    final uid = '$episodeId@$eigaId@${service.uid}';

    if (_storeEpisodesDownload.value.containsKey(uid)) {
      return _storeEpisodesDownload.value[uid]!;
    }

    return null;
  }

  List<Ref<DownloaderEpisodeReturn>> getAllDownloaderState() {
    return _storeEpisodesDownload.value.values.toList();
  }

  Future<DownloaderEpisodeReturn?> downloadEpisode(
    BuildContext context, {
    required ABEigaService service,
    required String eigaId,
    required MetaEiga metaEiga,
    required String episodeId,
    required EigaEpisode episode,
  }) async {
    await initDatabase();

    final servers = await service
        .getServers(eigaId: eigaId, episode: episode)
        .onError<UnimplementedError>((_, _) => const <ServerSource>[]);

    if (!context.mounted) {
      showSnackBar(
        Text('Please don\'t lease page until the download process begin'),
      );
      return null;
    }

    // show dialog for select server
    final server = servers.firstOrNull;

    final source = await service.getSource(
      eigaId: eigaId,
      episode: episode,
      server: server,
    );

    late final SourceContent content;
    try {
      content = await service.fetchSourceContent(source: source);
    } on UnimplementedError {
      if (source.type == 'hls') {
        content = SourceContent(
          content: await service.fetch(
            source.url.toString(),
            headers: source.headers,
          ),
          url: source.url,
          headers: source.headers,
          type: source.type,
        );
      } else {
        content = SourceContent(
          content: '',
          url: source.url,
          headers: source.headers,
          type: source.type,
        );
      }
    }

    _downloadVideo(content);

    if (content.url) final uid = '$episodeId@$eigaId@${service.uid}';
    final cache = getDownloaderState(
      service: service,
      eigaId: eigaId,
      episodeId: episodeId,
    );
    if (cache != null) return cache.value;

    final out = await getDownloadedEpisode(
      service: service,
      eigaId: eigaId,
      episodeId: episodeId,
    );
    if (out != null && out.doneAt > 0) return null;

    final (episodeDbId: episodeDbId, pages: results) = await _insertEpisode(
      service: service,
      eigaId: eigaId,
      metaEiga: metaEiga,
      episodeId: episodeId,
      episode: episode,
      pages: pages,
    );

    final $mapProgress = List.generate(pages.length, (_) => 0.0);
    final result = Ref<DownloaderEpisodeReturn>((
      service: service,
      eiga: metaEiga,
      episode: episode,
      progress: 0.0,
      done: false,
      error: null,
    ));

    void computeTotalProgress() {
      result.value = (
        service: service,
        eiga: metaEiga,
        episode: episode,
        done: false,
        error: null,
        progress:
            $mapProgress.fold(0.0, (old, current) => old + current) /
            pages.length,
      );
    }

    final pool = Pool(10);
    final retry = RetryOptions();

    bool notSupportFetchPage = false;

    Future.wait<void>(
          results.indexed.map(
            (entry) => pool.withResource(
              () => retry.retry<void>(() async {
                if (entry.$2.done) {
                  $mapProgress[entry.$1] = 1;
                  computeTotalProgress();

                  return;
                }

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
          result.value = (
            service: service,
            eiga: metaEiga,
            episode: episode,
            progress: 1,
            done: true,
            error: null,
          );

          await _db.execute(
            '''
            UPDATE episodes
            SET done_at = ?
            WHERE id = ?
            ''',
            [DateTime.now().millisecondsSinceEpoch, episodeDbId],
          );
        })
        .catchError((err) {
          result.value = (
            service: service,
            eiga: metaEiga,
            episode: episode,
            progress: result.value.progress,
            error: err,
            done: false,
          );
        });

    _storeEpisodesDownload.value = {
      ..._storeEpisodesDownload.value,
      uid: result,
    };

    return result.value;
  }

  Future<bool> _downloadVideo(
    Service service,
    SourceContent content, {
    required String path,
    required void Function(double progress) onProgress,
  }) async {
    if (content.type == 'hls') {
      var playlist = await HlsPlaylistParser.create().parseString(
        content.url,
        content.content,
      );

      if (playlist is HlsMasterPlaylist) {
        final firstResolution = playlist.variants.first;
        final url2 = content.url.resolveUri(firstResolution.url);

        final content2 = await service.fetch(
          url2.toString(),
          headers: content.headers,
        );

        final manifest = await HlsPlaylistParser.create().parseString(
          url2,
          content2,
        );

        if (manifest is HlsMasterPlaylist) {
          throw Exception('Deep master playlist not support');
        }

        playlist = manifest;
      }

      if (playlist is! HlsMediaPlaylist) throw Exception('Invalid playlist');

      
    final pool = Pool(10);
    final retry = RetryOptions();

    Future.wait<void>(
        (playlist).segments.indexed.map(
            (entry) => pool.withResource(
              () => retry.retry<void>(() async {
                final file = File(join(_document.path, entry.$2.path));

                if (entry.$2.done) {
                  $mapProgress[entry.$1] = 1;
                  computeTotalProgress();

                  return;
                }

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
          result.value = (
            service: service,
            comic: metaComic,
            chapter: chapter,
            progress: 1,
            done: true,
            error: null,
          );

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
            service: service,
            comic: metaComic,
            chapter: chapter,
            progress: result.value.progress,
            error: err,
            done: false,
          );
        });

    } else {
      final file = File(join(_document.path, path));

      final (baseDirectory, directory, filename) = await Task.split(
        filePath: file.path,
      );

      // normal download
      final task = DownloadTask(
        url: content.url.toString(),
        headers: content.headers?.toMap(),
        baseDirectory: baseDirectory,
        directory: directory,
        filename: filename,
        updates: Updates.progress,
        requiresWiFi: true,
        retries: 5,
        allowPause: false,
      );

      final result = await FileDownloader().download(
        task,
        onProgress: onProgress,
      );

      switch (result.status) {
        case TaskStatus.complete:
          return true;

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
    }
  }

  Future<MetaEiga?> getMetaOffline(ABEigaService service, String eigaId) async {
    final eigaDbId = generateEigaDbId(service, eigaId);

    final row = await _db.getOptional(
      '''
        SELECT meta_json FROM eigas
        WHERE id = ?
        LIMIT 1
      ''',
      [eigaDbId],
    );
    if (row == null) return null;

    return compute(
      (json) => MetaEiga.fromJson(jsonDecode(json)),
      row['meta_json'],
    );
  }

  /// すべてのダウンロード済みのコミックの詳細情報を取得する関数
  Future<List<DownloadedEigaInfo>> getAllDownloadedEigas() async {
    _storeEpisodesDownload.value;

    await initDatabase();

    // 取得対象: eigas テーブルに登録された全てのエントリ
    final eigaRows = await _db.getAll('SELECT * FROM eigas');

    return Future.wait(
      eigaRows.map((row) async {
        final meta = MetaEiga.fromJson(jsonDecode(row['meta_json'] as String));
        final sourceId = row['service_id'] as String;
        final eigaId = row['eiga_id'] as String;
        final imagePath = row['image_path'] as String;
        final episodes = await Future.wait(
          (await _db.getAll('SELECT * from episodes WHERE eiga_db_id = ?', [
            row['id'] as String,
          ])).map((episode) async {
            final uid = '${episode['episode_id']}@$eigaId@$sourceId';

            final pages = await _db.getAll(
              '''
                SELECT * FROM pages
                WHERE episode_db_id = ?
                ORDER BY index_order
              ''',
              [episode['id'] as String],
            );

            final images =
                pages.map((p) {
                  final oImage = OImage.fromJson(
                    jsonDecode(p['o_image'] as String),
                  );
                  final path = p['path'] as String;
                  final downloaded = (p['downloaded'] as int) == 1;
                  return LoadedPage(
                    image: oImage,
                    path: path,
                    downloaded: downloaded,
                  );
                }).toList();

            return LoadedEpisode(
              id: episode['id'] as String,
              episodeId: episode['episode_id'] as String,
              pageCount: episode['page_count'] as int,
              count: pages.fold(
                0,
                (prev, page) => prev + page['downloaded'] as int,
              ),
              doneAt: episode['done_at'] as int,
              pages: images,
              progress: _storeEpisodesDownload.value[uid],
            );
          }).toList(),
        );

        return (
          sourceId: sourceId,
          eigaId: eigaId,
          meta: meta,
          imagePath: imagePath,
          episodes: Map.fromEntries(
            episodes.map((episode) => MapEntry(episode.episodeId, episode)),
          ),
        );
      }),
    );
  }

  Future<void> deleteEpisode(String episodeDbId) async {
    try {
      final pages = await _db.getAll(
        '''
          SELECT path FROM pages
          WHERE episode_db_id = ?
        ''',
        [episodeDbId],
      );

      for (final page in pages) {
        final file = File(join(_document.path, page['path'] as String));
        if (await file.exists()) {
          await file.delete();
        }
      }

      await _db.writeTransaction((tx) async {
        await tx.execute('DELETE FROM pages WHERE episode_db_id = ?', [
          episodeDbId,
        ]);
        await tx.execute('DELETE FROM episodes WHERE id = ?', [episodeDbId]);
      });
    } catch (e, st) {
      debugPrint('Failed to delete episode: $e\n$st');
      rethrow;
    }
  }

  Future<void> deleteEiga(String eigaDbId) async {
    try {
      final episodes = await _db.getAll(
        '''
          SELECT id FROM episodes
          WHERE eiga_db_id = ?
        ''',
        [eigaDbId],
      );

      for (final episode in episodes) {
        final episodeDbId = episode['id'] as String;
        await deleteEpisode(episodeDbId);
      }

      await _db.execute('DELETE FROM eigas WHERE id = ?', [eigaDbId]);

      final parts = eigaDbId.split('@');
      if (parts.length >= 2) {
        final serviceUid = parts[0];
        final eigaId = parts[1];
        final eigaDir = Directory(
          join(_document.path, 'eiga_offline', serviceUid, eigaId),
        );
        if (await eigaDir.exists()) {
          await eigaDir.delete(recursive: true);
        }
      }
    } catch (e, st) {
      debugPrint('Failed to delete eiga: $e\n$st');
      rethrow;
    }
  }

  Future<void> clearAll() async {
    try {
      final eigaDir = Directory(join(_document.path, 'eiga_offline'));
      if (await eigaDir.exists()) {
        await eigaDir.delete(recursive: true);
      }

      final dbFile = File('${_document.path}/eiga_offline.sqlite');
      if (await dbFile.exists()) {
        await dbFile.delete();
      }

      _storeEpisodesDownload.value = {};

      debugPrint('All offline data cleared.');
    } catch (e, st) {
      debugPrint('Failed to clear all data: $e\n$st');
      rethrow;
    }
  }
}
