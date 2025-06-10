import 'package:eval_annotation/eval_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hoyomi_bridge/export.dart';

part 'eiga_source_context.freezed.dart';

@freezed
@Bind()
sealed class EigaSourceContext with _$EigaSourceContext {
  const factory EigaSourceContext({
    required String eigaId,
    required MetaEiga metaEiga,
    required EigaEpisode episode,
    required SourceVideo source,
  }) = _EigaSourceContext;
}
