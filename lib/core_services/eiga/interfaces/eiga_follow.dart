import 'package:hoyomi/core_services/eiga/export.dart';

class EigaFollow {
  final String sourceId;
  final Eiga item;
  final DateTime? updatedAt;
  final EigaEpisode? lastEpisode;

  const EigaFollow({
    required this.sourceId,
    required this.item,
    this.updatedAt,
    this.lastEpisode,
  });

  factory EigaFollow.createFakeData() {
    return EigaFollow(
      sourceId: '',
      item: Eiga.createFakeData(),
      updatedAt: DateTime.now(),
      lastEpisode: EigaEpisode(
        episodeId: 'fake_episode_id',
        name: 'Fake Episode',
      ),
    );
  }
}
