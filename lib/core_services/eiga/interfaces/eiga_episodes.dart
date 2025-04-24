import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hoyomi/core_services/eiga/interfaces/eiga_episode.dart';
import 'package:hoyomi/core_services/interfaces/o_image.dart';

part 'eiga_episodes.freezed.dart';
part 'eiga_episodes.g.dart';

@freezed
sealed class EigaEpisodes with _$EigaEpisodes {
  const factory EigaEpisodes({
    required List<EigaEpisode> episodes,
    OImage? image,
    OImage? poster,
    DateTime? schedule,
  }) = _EigaEpisodes;

  factory EigaEpisodes.fromJson(Map<String, dynamic> json) =>
      _$EigaEpisodesFromJson(json);

  factory EigaEpisodes.createFakeData() {
    return EigaEpisodes(
      episodes: List.generate(12, (index) => EigaEpisode.createFakeData()),
    );
  }
}
