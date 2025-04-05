import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hoyomi/core_services/exception/user_not_found_exception.dart';
import 'package:hoyomi/core_services/service.dart';
import 'package:hoyomi/utils/authentication.dart';
import 'package:http/http.dart';

import '../interfaces/main.dart';
import 'eiga_watch_time_mixin.dart';

mixin EigaWatchTimeGeneralMixin on Service implements EigaWatchTimeMixin {
  final String? _baseApiGeneral = dotenv.env['BASE_API_GENERAL'];

  /// General watch time support but service not auth
  @override
  final bool $noAuth = true;
  @override
  Future<User> getUser({required String cookie}) {
    throw UnimplementedError();
  }

  @override
  Future<List<HistoryItem<Eiga>>> getWatchHistory({required int page}) async {
    assert(_baseApiGeneral != null, 'BASE_API_GENERAL is not set');

    final user = await Authentication.instance.getUserAsync();
    if (user == null) throw UserNotFoundException();

    final idToken = await user.getIdTokenResult();

    final response = await get(
        Uri.parse(_baseApiGeneral!)
            .resolve('/api/eiga/get-watch-history?sourceId=$uid&page=$page'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${idToken.token}'
        });

    if (response.statusCode != 200) {
      throw Exception('Failed to get histories: ${response.statusCode}');
    }

    final body = jsonDecode(utf8.decode(response.bodyBytes)) as List;

    return body
        .map((raw) {
          final history = _WatchHistory.fromJson(raw);
          if (history.watchName == null) return null;

          return HistoryItem<Eiga>(
            item: Eiga(
              name: history.name,
              eigaId: history.eigaTextId,
              originalName: history.seasonName,
              image: OImage(src: history.poster),
            ),
            watchUpdatedAt: history.createdAt,
            lastEpisode: EigaEpisode(
                name: history.watchName ?? '',
                episodeId: history.watchId ?? ''),
            watchTime: WatchTime(
              position: Duration(seconds: history.watchCur?.round() ?? 0),
              duration: Duration(seconds: history.watchDur?.round() ?? 0),
            ),
          );
        })
        .where((item) => item != null)
        .cast<HistoryItem<Eiga>>()
        .toList();
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

    final body = jsonDecode(utf8.decode(response.bodyBytes));
    if (body == null) throw Exception('No watch time found');

    final history = _WatchTime.fromJson(body);
    return WatchTime(
      position: Duration(seconds: history.cur.round()),
      duration: Duration(seconds: history.dur.round()),
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
      throw Exception(
          'Failed to get watch time episodes: ${response.statusCode}');
    }

    final body = _WatchTimeEpisode.fromJsonList(
        jsonDecode(utf8.decode(response.bodyBytes)) as List);

    return {
      for (final item in body)
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
      throw Exception('Failed to set watch time: ${response.statusCode}');
    }
  }
}

/// ============== models ================
class _WatchHistory {
  final String sourceId;
  final String eigaTextId;
  final String name;
  final String poster;
  final String seasonName;
  final DateTime createdAt;
  final DateTime? watchUpdatedAt;
  final String? watchName;
  final String? watchId;
  final num? watchCur;
  final num? watchDur;

  _WatchHistory({
    required this.sourceId,
    required this.eigaTextId,
    required this.name,
    required this.poster,
    required this.seasonName,
    required this.createdAt,
    this.watchUpdatedAt,
    this.watchName,
    this.watchId,
    this.watchCur,
    this.watchDur,
  });

  factory _WatchHistory.fromJson(Map<String, dynamic> json) {
    return _WatchHistory(
      sourceId: json['source_id'] as String,
      eigaTextId: json['eiga_text_id'] as String,
      name: json['name'] as String,
      poster: json['poster'] as String,
      seasonName: json['season_name'] as String,
      createdAt: DateTime.parse(json['created_at']),
      watchUpdatedAt: json['watch_updated_at'] != null
          ? DateTime.parse(json['watch_updated_at'])
          : null,
      watchName: json['watch_name'] as String?,
      watchId: json['watch_id'] as String?,
      watchCur: json['watch_cur'] as num?,
      watchDur: json['watch_dur'] as num?,
    );
  }
}

class _WatchTime {
  final num cur;
  final num dur;
  final String name;
  final DateTime createdAt;
  final DateTime updatedAt;

  _WatchTime({
    required this.cur,
    required this.dur,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });

  factory _WatchTime.fromJson(Map<String, dynamic> json) {
    return _WatchTime(
      cur: json['cur'] as num,
      dur: json['dur'] as num,
      name: json['name'] as String,
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}

class _WatchTimeEpisode {
  final num cur;
  final num dur;
  final String name;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String chapId;

  _WatchTimeEpisode({
    required this.cur,
    required this.dur,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    required this.chapId,
  });

  factory _WatchTimeEpisode.fromJson(Map<String, dynamic> json) {
    return _WatchTimeEpisode(
      cur: json['cur'] as num,
      dur: json['dur'] as num,
      name: json['name'] as String,
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      chapId: json['chapId'] as String,
    );
  }

  static List<_WatchTimeEpisode> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => _WatchTimeEpisode.fromJson(json)).toList();
  }
}
