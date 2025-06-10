import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hoyomi_bridge/export.dart';
import 'package:eval_annotation/eval_annotation.dart';

part 'eiga_context.freezed.dart';

@freezed
@Bind()
sealed class EigaContext with _$EigaContext {
  const factory EigaContext({
    required String eigaId,
    required MetaEiga metaEiga,
    required EigaEpisode episode,
    Season? season,
  }) = _EigaContext;
}
