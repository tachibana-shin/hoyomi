import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hoyomi_bridge/export.dart';
import 'package:eval_annotation/eval_annotation.dart';

part 'eiga_history.freezed.dart';

@freezed
@Bind()
sealed class EigaHistory with _$EigaHistory {
  const factory EigaHistory({
    required String sourceId,
    required Eiga item,
    required DateTime watchUpdatedAt,
    required EigaEpisode lastEpisode,
    required WatchTime watchTime,
  }) = _EigaHistory;

  factory EigaHistory.createFakeData() {
    return EigaHistory(
      sourceId: '',
      item: Eiga.createFakeData(),
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
