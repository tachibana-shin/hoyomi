import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hoyomi_bridge/export.dart';
import 'package:eval_annotation/eval_annotation.dart';

part 'eiga_context_with_episodes.freezed.dart';

@freezed
@Bind()
sealed class EigaContextWithEpisodes with _$EigaContextWithEpisodes {
  const factory EigaContextWithEpisodes({
    required String eigaId,
    required MetaEiga metaEiga,
    Season? season,
    required List<EigaEpisode> episodes,
  }) = _EigaContextWithEpisodes;
}
