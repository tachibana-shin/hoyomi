import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:hoyomi/core_services/exception/user_not_found_exception.dart';
import 'package:hoyomi/core_services/service.dart';
import 'package:hoyomi/env.dart';
import 'package:hoyomi/general_api/export.dart';
import 'package:hoyomi/utils/authentication.dart';
import 'package:http/http.dart';

import '../interfaces/main.dart';
import 'eiga_watch_time_mixin.dart';

mixin EigaWatchTimeGeneralMixin on Service implements EigaWatchTimeMixin {
  final _baseApiGeneral = Env.baseApiGeneral;
  GeneralApiClient? _client;

  /// General watch time support but service not auth
  @override
  final bool $noAuth = true;
  @override
  Future<User> getUser({required String cookie}) {
    throw UnimplementedError();
  }

  GeneralApiClient _getClient() {
    return _client ??= GeneralApiClient(Dio(), baseUrl: _baseApiGeneral);
  }

  @override
  Future<List<HistoryItem<Eiga>>> getWatchHistory({required int page}) async {
    final user = await Authentication.instance.getUserAsync();
    if (user == null) throw UserNotFoundException();

    final idToken = await user.getIdTokenResult();

    final body = await _getClient().client.getApiEigaGetWatchHistory(
        sourceId: uid, page: page, authorization: 'Bearer ${idToken.token}');

    return body.data.map((history) {
      return HistoryItem<Eiga>(
        item: Eiga(
          name: history.name,
          eigaId: history.eigaTextId,
          originalName: history.seasonName,
          image: OImage(src: history.poster),
        ),
        watchUpdatedAt: DateTime.parse(history.createdAt),
        lastEpisode:
            EigaEpisode(name: history.watchName, episodeId: history.watchId),
        watchTime: WatchTime(
          position: Duration(seconds: history.watchCur.round()),
          duration: Duration(seconds: history.watchDur.round()),
        ),
      );
    }).toList();
  }

  @override
  Future<WatchTime> getWatchTime({
    required String eigaId,
    required EigaEpisode episode,
    required int episodeIndex,
    required MetaEiga metaEiga,
  }) async {
    final user = await Authentication.instance.getUserAsync();
    if (user == null) throw UserNotFoundException();

    final idToken = await user.getIdTokenResult();

    final body = await _getClient().client.getApiEigaGetWatchTime(
        sourceId: uid,
        eigaTextId: eigaId,
        chapId: episode.episodeId,
        authorization: 'Bearer ${idToken.token}');
    final data = body.data;

    if (data == null) throw Exception('No watch time found');

    return WatchTime(
      position: Duration(seconds: data.cur.round()),
      duration: Duration(seconds: data.dur.round()),
    );
  }

  @override
  Future<Map<String, WatchTime>> getWatchTimeEpisodes({
    required String eigaId,
    required List<EigaEpisode> episodes,
  }) async {
    final user = await Authentication.instance.getUserAsync();
    if (user == null) throw UserNotFoundException();

    final idToken = await user.getIdTokenResult();

    final body = await _getClient().client.getApiEigaGetWatchTimeEpisodes(
        sourceId: uid,
        eigaTextId: eigaId,
        authorization: 'Bearer ${idToken.token}');

    return {
      for (final item in body.data)
        item.chapId: WatchTime(
          position: Duration(seconds: item.cur.round()),
          duration: Duration(seconds: item.dur.round()),
        )
    };
  }

  @override
  Future<void> setWatchTime({
    required String eigaId,
    required EigaEpisode episode,
    required int episodeIndex,
    required MetaEiga metaEiga,
    required Season season,
    required WatchTime watchTime,
  }) async {
    final user = await Authentication.instance.getUserAsync();
    if (user == null) throw UserNotFoundException();

    final idToken = await user.getIdTokenResult();

    await _getClient().client.postApiEigaSetWatchTime(
        body: QuerySchema(
          sourceId: uid,
          // data
          name: metaEiga.name,
          poster: metaEiga.poster?.src ?? metaEiga.image.src,
          eigaTextId: eigaId,
          seasonName: season.name,
          cur: watchTime.position.inMilliseconds / 1e3,
          dur: watchTime.duration.inMilliseconds / 1e3,
          episodeName: episode.name,
          episodeId: episode.episodeId,
        ),
        authorization: 'Bearer ${idToken.token}');

    final response = await post(
        Uri.parse(_baseApiGeneral).resolve('/api/eiga/set-watch-time'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${idToken.token}'
        },
        body: jsonEncode({}));

    if (response.statusCode != 200) {
      throw Exception('Failed to set watch time: ${response.statusCode}');
    }
  }
}
