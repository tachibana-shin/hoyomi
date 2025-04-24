import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hoyomi/core_services/interfaces/o_image.dart';

part 'eiga_episode.freezed.dart';
part 'eiga_episode.g.dart';

@freezed
sealed class EigaEpisode with _$EigaEpisode {
  const factory EigaEpisode({
    required String name,
    required String episodeId,
    OImage? image,
    String? description,
    String? extra,
    @Default(-1) int index,
  }) = _EigaEpisode;

  factory EigaEpisode.fromJson(Map<String, dynamic> json) =>
      _$EigaEpisodeFromJson(json);

  factory EigaEpisode.createFakeData() {
    return EigaEpisode(name: "Episode 1", episodeId: "1");
  }
}
