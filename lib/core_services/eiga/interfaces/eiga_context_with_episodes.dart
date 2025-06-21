import 'package:freezed_annotation/freezed_annotation.dart';

import '../export.dart';

part 'eiga_context_with_episodes.freezed.dart';
part 'eiga_context_with_episodes.g.dart';

@freezed
sealed class EigaContextWithEpisodes with _$EigaContextWithEpisodes {
  const factory EigaContextWithEpisodes({
    required String eigaId,
    required MetaEiga metaEiga,
    Season? season,
    required List<EigaEpisode> episodes,
  }) = _EigaContextWithEpisodes;

  factory EigaContextWithEpisodes.fromJson(Map<String, dynamic> json) =>
      _$EigaContextWithEpisodesFromJson(json);
}
