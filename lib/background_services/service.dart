// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:hoyomi/constraints/x_platform.dart';
import 'package:hoyomi/core_services/comic/export.dart';
import 'package:hoyomi/plugins/export.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqlite_async/sqlite_async.dart';

class _ComicFollowCache {
  final migrations =
      SqliteMigrations()..add(
        SqliteMigration(1, (tx) async {
          // comics table
          await tx.execute('''
            CREATE TABLE IF NOT EXISTS comics (
              sourceId TEXT NOT NULL,
              comic_text_id TEXT NOT NULL,
              meta TEXT NOT NULL,

              created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
              updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

              PRIMARY KEY (sourceId, comic_text_id)
            )
          ''');
        }),
      );

  late final SqliteDatabase _db;

  Future<void> initialize() async {
    final document = await getApplicationDocumentsDirectory();

    _db = SqliteDatabase(path: '${document.path}/comic_follow_cache.sqlite');

    await migrations.migrate(_db);
  }

  Future<void> upsert(ComicFollow follow, [SqliteWriteContext? context]) async {
    await _db.execute(
      '''
        INSERT INTO comics (
          sourceId,
          comic_text_id,
          meta,
          created_at,
          updated_at
        )
        VALUES (?, ?, ?, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)
        ON CONFLICT(comic_text_id) DO UPDATE SET
          sourceId = excluded.sourceId,
          meta = excluded.meta,
          updated_at = CURRENT_TIMESTAMP
      ''',
      [follow.sourceId, follow.item.comicId, jsonEncode(follow)],
    );
  }

  Future<void> upserts(List<ComicFollow> listFollow) async {
    await _db.writeTransaction((ctx) async {
      for (final follow in listFollow) {
        await upsert(follow, ctx);
      }
    });
  }

  Future<List<({String sourceId, String comicTextId})>> getAllIds() async {
    final all = await _db.getAll('''
        SELECT sourceId, comic_text_id
        FROM comics
      ''');

    return all
        .map(
          (row) => (
            sourceId: row['sourceId'] as String,
            comicTextId: row['comic_text_id'] as String,
          ),
        )
        .toList();
  }
}

Future<void> initializeService() async {
  if (XPlatform.isAndroid || XPlatform.isIOS) {
  final service = FlutterBackgroundService();

  await service.configure(
    iosConfiguration: IosConfiguration(
      autoStart: true,
      onForeground: onStart,
      onBackground: onIosBackground,
    ),
    androidConfiguration: AndroidConfiguration(
      autoStart: true,
      onStart: onStart,
      isForegroundMode: false,
      autoStartOnBoot: true,
    ),
  );
  // service.invoke('stop');
  } else {
    onStart();
  }
}

@pragma('vm:entry-point')
Future<bool> onIosBackground(ServiceInstance service) async {
  WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();

  await initializeFirebase();

  return true;
}

@pragma('vm:entry-point')
void onStart([ServiceInstance? service]) async {
  service?.on("stop").listen((event) {
    service.stopSelf();
    print("background process is now stopped");
  });

  service?.on("start").listen((event) {});

  final comicFollowCache = _ComicFollowCache();

  await comicFollowCache.initialize();
  await initializeFirebase();

  print('start service');

  final allComicFollows = <ComicFollow>[];

  final ignore = [
    for (final item in await comicFollowCache.getAllIds())
      Ignore(sourceId: item.sourceId, comicTextId: item.comicTextId),
  ];

  int page = 1;
  while (true) {
    final paginate = await ComicFollowGeneralMixin.getAllListFollow(
      page: page++,
      status: StatusEnum.ongoing,
      ignore: ignore,
    );
    print(paginate.items);

    allComicFollows.addAll(paginate.items);

    await comicFollowCache.upserts(paginate.items);

    print('Updated page $page comics');

    if (paginate.page >= paginate.totalPages) break;

    await Future.delayed(Duration(seconds: 1));
  }

  print('allComicFollows: ${allComicFollows.length}');
}
