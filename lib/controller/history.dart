import 'dart:convert';

import 'package:hoyomi/core_services/comic/interfaces/meta_comic.dart';
import 'package:hoyomi/database/isar.dart';
import 'package:hoyomi/database/scheme/comic.dart';
import 'package:hoyomi/database/scheme/history_chap.dart';
import 'package:isar/isar.dart';

class HistoryController {
  final _comicBox = isar.comics;
  final _historyChapBox = isar.historyChaps;

  Future<List<HistoryChap>?> getHistory(String sourceId, String comicId) async {
    final comic =
        await _comicBox
            .where()
            .comicIdEqualTo(comicId)
            .filter()
            .sourceIdEqualTo(sourceId)
            .findFirst();
    if (comic == null) return null;

    return _historyChapBox.filter().comicEqualTo(comic.id!).findAll();
  }

  Future<Comic> createComic(
    String sourceId, {
    required String comicId,
    required MetaComic comic,
    bool? followed,
  }) async {
    Comic? comicObject =
        await _comicBox
            .where()
            .sourceIdEqualTo(sourceId)
            .filter()
            .comicIdEqualTo(comicId)
            .findFirst();

    comicObject ??= Comic(
      sourceId: sourceId,
      comicId: comicId,
      uid: Comic.genUid(sourceId, comicId: comicId),
      status: comic.status.name,
      meta: jsonEncode(comic.toJson()),
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    if (followed != null) {
      comicObject.followedAt = followed == true ? DateTime.now() : null;
    }

    if (comicObject.status != comic.status.name) {
      comicObject.status = comic.status.name;
    }

    final newMeta = jsonEncode(comic.toJson());
    if (newMeta != comicObject.meta) {
      comicObject.meta = newMeta;
    }

    await isar.writeTxn(() async {
      await isar.comics.put(comicObject!);
    });

    return comicObject;
  }

  Future<void> saveHistory(
    Comic comic, {
    required String chapterId,
    required double currentPage,
    required int maxPage,
  }) async {
    final existingHistory = await getCurrentPage(comic, chapterId: chapterId);

    if (existingHistory != null) {
      existingHistory.currentPage = currentPage;
      existingHistory.maxPage = maxPage;
      comic.updatedAt = existingHistory.updatedAt = DateTime.now();

      await isar.writeTxn(() async {
        await isar.historyChaps.put(existingHistory);
        await isar.comics.put(comic);
      });
    } else {
      final newHistory = HistoryChap(
        chapterId: chapterId,
        currentPage: currentPage,
        maxPage: maxPage,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      newHistory.comic = comic.id!;
      comic.updatedAt = newHistory.updatedAt;

      await isar.writeTxn(() async {
        await isar.historyChaps.put(newHistory);
        await isar.comics.put(comic);
      });
    }
  }

  Future<HistoryChap?> getCurrentPage(
    Comic comic, {
    required String chapterId,
  }) async {
    return _historyChapBox
        .where()
        .chapterIdEqualTo(chapterId)
        .filter()
        .comicEqualTo(comic.id!)
        .findFirst();
  }

  Future<List<Comic>> getListHistory(int limit, {required int offset}) async {
    final query = _comicBox.where().sortByUpdatedAtDesc();

    final items = await query.offset(offset).limit(limit).findAll();
    final dropOut = limit - items.length;

    if (dropOut > 0 && items.isNotEmpty) {
      items.addAll(
        await getListHistory(dropOut, offset: offset + items.length),
      );
    }

    return items;
  }

  Future<List<Comic>> getListFollows(int limit, {required int offset}) async {
    final query =
        _comicBox.where().followedAtIsNotNull().sortByFollowedAtDesc();

    return query.offset(offset).limit(limit).findAll();
  }

  Future<HistoryChap?> getLastChapter(int comicId) async {
    return _historyChapBox
        .filter()
        .comicEqualTo(comicId)
        .sortByUpdatedAtDesc()
        .findFirst();
  }
}
