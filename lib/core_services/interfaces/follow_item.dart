import 'package:hoyomi/core_services/eiga/interfaces/eiga_episode.dart';

class FollowItem<T> {
  final T item;
  final DateTime updatedAt;
  final EigaEpisode lastEpisode;

  const FollowItem({
    required this.item,
    required this.updatedAt,
    required this.lastEpisode,
  });

  factory FollowItem.createFakeData(T item) {
    return FollowItem(
      item: item,
      updatedAt: DateTime.now(),
      lastEpisode:
          EigaEpisode(episodeId: 'fake_episode_id', name: 'Fake Episode'),
    );
  }
}
