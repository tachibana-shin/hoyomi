// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hoyomi/core_services/eiga/interfaces/eiga_episode.dart';
import 'package:hoyomi/core_services/eiga/interfaces/watch_time.dart';

class HistoryItem<T> {
  final T item;
  final DateTime watchUpdatedAt;
  final EigaEpisode lastEpisode;
  final WatchTime watchTime;

  const HistoryItem({
    required this.item,
    required this.watchUpdatedAt,
    required this.lastEpisode,
    required this.watchTime,
  });
}

class WatchInfo {
  final DateTime createdAt;
  final String season;
  final String name;
  final String poster;
  final String seasonName;
  final DateTime watchUpdatedAt;
  final String watchName;
  final String watchId;
  final double watchCur;
  final double watchDur;

  WatchInfo({
    required this.createdAt,
    required this.season,
    required this.name,
    required this.poster,
    required this.seasonName,
    required this.watchUpdatedAt,
    required this.watchName,
    required this.watchId,
    required this.watchCur,
    required this.watchDur,
  });

  // From JSON
  factory WatchInfo.fromJson(Map<String, dynamic> json) {
    return WatchInfo(
      createdAt: DateTime.parse(json['created_at']),
      season: json['season'],
      name: json['name'],
      poster: json['poster'],
      seasonName: json['season_name'],
      watchUpdatedAt: DateTime.parse(json['watch_updated_at']),
      watchName: json['watch_name'],
      watchId: json['watch_id'],
      watchCur: json['watch_cur'].toDouble(),
      watchDur: json['watch_dur'].toDouble(),
    );
  }

  // To JSON
  Map<String, dynamic> toJson() {
    return {
      'created_at': createdAt.toIso8601String(),
      'season': season,
      'name': name,
      'poster': poster,
      'season_name': seasonName,
      'watch_updated_at': watchUpdatedAt.toIso8601String(),
      'watch_name': watchName,
      'watch_id': watchId,
      'watch_cur': watchCur,
      'watch_dur': watchDur,
    };
  }
}
