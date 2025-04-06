import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hoyomi/core_services/eiga/interfaces/eiga_episode.dart';
import 'package:hoyomi/core_services/eiga/interfaces/watch_time.dart';

part 'history_item.freezed.dart';

@freezed
class HistoryItem<T> with _$HistoryItem<T> {
  const factory HistoryItem({
    required T item,
    required DateTime watchUpdatedAt,
    required EigaEpisode lastEpisode,
    required WatchTime watchTime,
  }) = _HistoryItem<T>;

  factory HistoryItem.createFakeData(T item) {
    return HistoryItem(
      item: item,
      watchUpdatedAt: DateTime.now(),
      lastEpisode: EigaEpisode(
        episodeId: 'fake_episode_id',
        name: 'Fake Episode',
      ),
      watchTime: WatchTime(
        position: Duration(minutes: 0),
        duration: Duration(minutes: 24),
      ),
    );
  }
}
