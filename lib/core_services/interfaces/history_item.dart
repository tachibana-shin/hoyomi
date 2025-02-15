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
