import 'package:dio/dio.dart' hide Headers;
import 'package:hoyomi/core_services/exception/user_not_found_exception.dart';
import 'package:hoyomi/core_services/service.dart';
import 'package:hoyomi/env.dart';
import 'package:hoyomi/general_api/export.dart';
import 'package:hoyomi/utils/authentication.dart';

import '../interfaces/main.dart';
import 'eiga_watch_time_mixin.dart';

mixin EigaWatchTimeGeneralMixin on Service implements EigaWatchTimeMixin {
  static final _baseApiGeneral = Env.baseApiGeneral;
  static GeneralApiClient? _client;

  static GeneralApiClient _getClient() {
    return _client ??= GeneralApiClient(
      Dio(BaseOptions(headers: {'content-type': 'application/json'})),
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

  static Future<List<EigaHistory>> getAllWatchHistory({
    required int page,
  }) async {
    final user = await Authentication.instance.getUserAsync();
    if (user == null) throw UserNotFoundException();

    final idToken = await user.getIdTokenResult();

    final body = await _getClient().client.getApiEigaGetWatchHistory(
      page: page,
      authorization: 'Bearer ${idToken.token}',
      sourceId: '',
    );

    return body.data.map((history) {
      return EigaHistory(
        sourceId: history.sourceId,
        item: Eiga(
          name: history.name,
          eigaId: history.eigaTextId,
          originalName: history.seasonName,
          image: OImage(src: history.poster),
        ),
        watchUpdatedAt: DateTime.parse(history.createdAt),
        lastEpisode: EigaEpisode(
          name: history.watchName,
          episodeId: history.watchId,
        ),
        watchTime: WatchTime(
          position: Duration(seconds: history.watchCur.round()),
          duration: Duration(seconds: history.watchDur.round()),
        ),
      );
    }).toList();
  }

  @override
  Future<List<EigaHistory>> getWatchHistory({required int page}) async {
    final user = await Authentication.instance.getUserAsync();
    if (user == null) throw UserNotFoundException();

    final idToken = await user.getIdTokenResult();

    final body = await _getClient().client.getApiEigaGetWatchHistory(
      sourceId: uid,
      page: page,
      authorization: 'Bearer ${idToken.token}',
    );

    return body.data.map((history) {
      return EigaHistory(
        sourceId: history.sourceId,
        item: Eiga(
          name: history.name,
          eigaId: history.eigaTextId,
          originalName: history.seasonName,
          image: OImage(
            src: history.poster,
            headers: Headers({'referer': baseUrl}),
          ),
        ),
        watchUpdatedAt: DateTime.parse(history.createdAt),
        lastEpisode: EigaEpisode(
          name: history.watchName,
          episodeId: history.watchId,
        ),
        watchTime: WatchTime(
          position: Duration(seconds: history.watchCur.round()),
          duration: Duration(seconds: history.watchDur.round()),
        ),
      );
    }).toList();
  }

  @override
  Future<WatchTime> getWatchTime(context) async {
    final user = await Authentication.instance.getUserAsync();
    if (user == null) throw UserNotFoundException();

    final idToken = await user.getIdTokenResult();

    final body = await _getClient().client.getApiEigaGetWatchTime(
      sourceId: uid,
      eigaTextId: context.eigaId,
      chapId: context.episode.episodeId,
      authorization: 'Bearer ${idToken.token}',
    );
    final data = body.data;

    if (data == null) throw Exception('No watch time found');

    return WatchTime(
      position: Duration(seconds: data.cur.round()),
      duration: Duration(seconds: data.dur.round()),
    );
  }

  @override
  getWatchTimeEpisodes({
    required String eigaId,
    required List<EigaEpisode> episodes,
  }) async {
    final user = await Authentication.instance.getUserAsync();
    if (user == null) throw UserNotFoundException();

    final idToken = await user.getIdTokenResult();

    final body = await _getClient().client.getApiEigaGetWatchTimeEpisodes(
      sourceId: uid,
      eigaTextId: eigaId,
      authorization: 'Bearer ${idToken.token}',
    );

    return {
      for (final item in body.data)
        item.chapId: WatchTimeUpdated(
          position: Duration(seconds: item.cur.round()),
          duration: Duration(seconds: item.dur.round()),
          updatedAt: DateTime.parse(item.updatedAt),
        ),
    };
  }

  @override
  Future<void> setWatchTime(context, {required watchTime}) async {
    final user = await Authentication.instance.getUserAsync();
    if (user == null) throw UserNotFoundException();

    final idToken = await user.getIdTokenResult();

    await _getClient().client.postApiEigaSetWatchTime(
      body: SetWatchTimeBodySchema(
        sourceId: uid,
        // data
        name: context.metaEiga.name,
        poster: context.metaEiga.poster?.src ?? context.metaEiga.image.src,
        eigaTextId: context.eigaId,
        seasonName: context.season?.name ?? '',
        cur: watchTime.position.inMilliseconds / 1e3,
        dur: watchTime.duration.inMilliseconds / 1e3,
        episodeName: context.episode.name,
        episodeId: context.episode.episodeId,
      ),
      authorization: 'Bearer ${idToken.token}',
    );
  }
}
