import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hoyomi_bridge/export.dart';
import 'package:eval_annotation/eval_annotation.dart';

part 'eiga_episodes.freezed.dart';
part 'eiga_episodes.g.dart';

@freezed
@Bind()
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
