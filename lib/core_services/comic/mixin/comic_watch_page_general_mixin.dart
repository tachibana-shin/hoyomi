import 'package:dio/dio.dart' hide Headers;
import 'package:hoyomi/core_services/exception/user_not_found_exception.dart';
import 'package:hoyomi/env.dart';
import 'package:hoyomi/general_api/export.dart';
import 'package:hoyomi/utils/authentication.dart';

import '../main.dart';

mixin ComicWatchPageGeneralMixin on Service implements ComicWatchPageMixin {
  static final _baseApiGeneral = Env.baseApiGeneral;
  static GeneralApiClient? _client;

  static GeneralApiClient _getClient() {
    return _client ??= GeneralApiClient(
      Dio(BaseOptions(contentType: 'application/json')),
      baseUrl: _baseApiGeneral,
    );
  }

  /// General watch page support but service not auth
  @override
  bool get $noAuth => !($isAuth ?? false);

  @override
  Future<User> getUser({required String cookie}) {
    throw UnimplementedError();
  }

  static Future<List<ComicHistory>> getAllWatchHistory({
    required int page,
  }) async {
    final user = await Authentication.instance.getUserAsync();
    if (user == null) throw UserNotFoundException();

    final idToken = await user.getIdTokenResult();

    final body = await _getClient().client.getApiComicGetWatchHistory(
      page: page,
      authorization: 'Bearer ${idToken.token}',
      sourceId: '',
    );

    return body.data.map((history) {
      return ComicHistory(
        sourceId: history.sourceId,
        item: Comic(
          name: history.name,
          comicId: history.comicTextId,
          originalName: history.originalName,
          image: OImage(src: history.poster),
        ),
        watchUpdatedAt: DateTime.parse(history.createdAt),
        lastChapter: ComicChapter(
          name: history.watchName,
          chapterId: history.watchId,
          order: -1,
        ),
        watchPage: WatchPage(
          currentPage: history.watchCur.toInt(),
          totalPage: history.watchDur.toInt(),
        ),
      );
    }).toList();
  }

  @override
  Future<List<ComicHistory>> getWatchHistory({required int page}) async {
    final user = await Authentication.instance.getUserAsync();
    if (user == null) throw UserNotFoundException();

    final idToken = await user.getIdTokenResult();

    final body = await _getClient().client.getApiComicGetWatchHistory(
      sourceId: uid,
      page: page,
      authorization: 'Bearer ${idToken.token}',
    );

    return body.data.map((history) {
      return ComicHistory(
        sourceId: history.sourceId,
        item: Comic(
          name: history.name,
          comicId: history.comicTextId,
          originalName: history.seasonName,
          image: OImage(
            src: history.poster,
            headers: Headers({'referer': baseUrl}),
          ),
        ),
        watchUpdatedAt: DateTime.parse(history.createdAt),
        lastChapter: ComicChapter(
          name: history.watchName,
          chapterId: history.watchId,
          order: -1,
        ),
        watchPage: WatchPage(
          currentPage: history.watchCur.toInt(),
          totalPage: history.watchDur.toInt(),
        ),
      );
    }).toList();
  }

  @override
  getWatchPage({
    required String comicId,
    required ComicChapter chapter,
    required MetaComic metaComic,
  }) async {
    final user = await Authentication.instance.getUserAsync();
    if (user == null) throw UserNotFoundException();

    final idToken = await user.getIdTokenResult();

    final body = await _getClient().client.getApiComicGetWatchPage(
      sourceId: uid,
      comicTextId: comicId,
      chapId: chapter.chapterId,
      authorization: 'Bearer ${idToken.token}',
    );
    final data = body.data;

    if (data == null) throw Exception('No watch page found');

    return WatchPageUpdated(
      currentPage: data.cur.toInt(),
      totalPage: data.dur.toInt(),
      updatedAt: DateTime.parse(data.updatedAt),
    );
  }

  @override
  getWatchPageEpisodes({
    required String comicId,
    required List<ComicChapter> chapters,
  }) async {
    final user = await Authentication.instance.getUserAsync();
    if (user == null) throw UserNotFoundException();

    final idToken = await user.getIdTokenResult();

    final body = await _getClient().client.getApiComicGetWatchPageEpisodes(
      sourceId: uid,
      comicTextId: comicId,
      authorization: 'Bearer ${idToken.token}',
    );

    return {
      for (final item in body.data)
        item.chapId: WatchPageUpdated(
          currentPage: item.cur.toInt(),
          totalPage: item.dur.toInt(),
          updatedAt: DateTime.parse(item.updatedAt),
        ),
    };
  }

  @override
  Future<void> setWatchPage({
    required String comicId,
    required ComicChapter chapter,
    required MetaComic metaComic,
    required WatchPage watchPage,
  }) async {
    final user = await Authentication.instance.getUserAsync();
    if (user == null) throw UserNotFoundException();

    final idToken = await user.getIdTokenResult();

    await _getClient().client.postApiComicSetWatchPage(
      body: SetWatchPageBodySchema(
        sourceId: uid,
        // data
        name: metaComic.name,
        originalName: metaComic.originalName ?? '',
        poster: metaComic.image.src,
        comicTextId: comicId,
        seasonName: '',
        status: SetWatchPageBodySchemaStatus.fromJson(metaComic.status.name),
        cur: watchPage.currentPage,
        dur: watchPage.totalPage,
        episodeName: chapter.name,
        episodeId: chapter.chapterId,
      ),
      authorization: 'Bearer ${idToken.token}',
    );
  }
}
