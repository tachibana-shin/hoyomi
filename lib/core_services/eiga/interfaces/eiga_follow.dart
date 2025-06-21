import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hoyomi/core_services/eiga/export.dart';

part 'eiga_follow.freezed.dart';
part 'eiga_follow.g.dart';

@freezed
sealed class EigaFollow with _$EigaFollow {
  const factory EigaFollow({
    required String sourceId,
    required Eiga item,
    DateTime? updatedAt,
    EigaEpisode? lastEpisode,
  }) = _EigaFollow;

  factory EigaFollow.createFakeData() => EigaFollow(
    sourceId: '',
    item: Eiga.createFakeData(),
    updatedAt: DateTime.now(),
    lastEpisode: EigaEpisode(
      episodeId: 'fake_episode_id',
      name: 'Fake Episode',
    ),
  );

  factory EigaFollow.fromJson(Map<String, dynamic> json) =>
      _$EigaFollowFromJson(json);
}
