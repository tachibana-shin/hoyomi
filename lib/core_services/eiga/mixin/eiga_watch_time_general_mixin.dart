import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hoyomi/core_services/exception/user_not_found_exception.dart';
import 'package:hoyomi/core_services/service.dart';
import 'package:hoyomi/utils/authentication.dart';
import 'package:http/http.dart';

import '../interfaces/main.dart';
import 'eiga_watch_time_mixin.dart';

final _baseApiGeneral = dotenv.env['BASE_API_GENERAL'];
mixin EigaWatchTimeGeneralMixin on Service implements EigaWatchTimeMixin {
  /// General watch time support but service not auth
  @override
  final bool $noAuth = true;
  @override
  getUser({required String cookie}) {
    throw UnimplementedError();
  }

  @override
  Future<WatchTime> getWatchTime({
    required String eigaId,
    required EigaEpisode episode,
    required int episodeIndex,
    required MetaEiga metaEiga,
  }) async {
    assert(_baseApiGeneral != null, 'BASE_API_GENERAL is not set');

    final user = await Authentication.instance.getUserAsync();
    if (user == null) throw UserNotFoundException();

    final idToken = await user.getIdTokenResult();

    final response = await get(
        Uri.parse(_baseApiGeneral!).resolve(
            '/api/eiga/get-watch-time?eiga_text_id=$eigaId&chap_id=${episode.episodeId}&sourceId=$uid'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${idToken.token}'
        });

    if (response.statusCode != 200) {
      throw Exception('Failed to get watch time: ${response.statusCode}');
    }

    final body = jsonDecode(response.body);
    return WatchTime(
      position: Duration(seconds: (body['cur'] as num).round()),
      duration: Duration(seconds: (body['dur'] as num).round()),
    );
  }

  @override
  Future<Map<String, WatchTime>> getWatchTimeEpisodes({
    required String eigaId,
    required List<EigaEpisode> episodes,
  }) async {
    assert(_baseApiGeneral != null, 'BASE_API_GENERAL is not set');

    final user = await Authentication.instance.getUserAsync();
    if (user == null) throw UserNotFoundException();

    final idToken = await user.getIdTokenResult();

    final response = await get(
        Uri.parse(_baseApiGeneral!).resolve(
            '/api/eiga/get-watch-time-episodes?eiga_text_id=$eigaId&sourceId=$uid'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${idToken.token}'
        });

    if (response.statusCode != 200) {
      throw Exception('Failed to get watch time: ${response.statusCode}');
    }

    final body = jsonDecode(response.body) as List;

    return {
      for (final item in body)
        item['chapId'].toString(): WatchTime(
          position: Duration(seconds: (item['cur'] as num).round()),
          duration: Duration(seconds: (item['dur'] as num).round()),
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
    assert(_baseApiGeneral != null, 'BASE_API_GENERAL is not set');

    final user = await Authentication.instance.getUserAsync();
    if (user == null) throw UserNotFoundException();

    final idToken = await user.getIdTokenResult();

    final response = await post(
        Uri.parse(_baseApiGeneral!).resolve('/api/eiga/set-watch-time'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${idToken.token}'
        },
        body: jsonEncode({
          'sourceId': uid,
          // data
          'name': metaEiga.name,
          'poster': metaEiga.poster?.src ?? metaEiga.image.src,
          'eiga_text_id': eigaId,
          'season_name': season.name,
          'cur': watchTime.position.inMilliseconds / 1e3,
          'dur': watchTime.duration.inMilliseconds / 1e3,
          'episode_name': episode.name,
          'episode_id': episode.episodeId,
        }));

    if (response.statusCode != 200) {
      throw Exception('Failed to get watch time: ${response.statusCode}');
    }
  }
}
