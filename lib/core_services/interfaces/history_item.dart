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

  factory HistoryItem.createFakeData(T item) {
    return HistoryItem(
      item: item,
      watchUpdatedAt: DateTime.now(),
      lastEpisode:
          EigaEpisode(episodeId: 'fake_episode_id', name: 'Fake Episode'),
      watchTime: WatchTime(
        position: Duration(minutes: 12),
        duration: Duration(minutes: 24),
      ),
    );
  }
}
