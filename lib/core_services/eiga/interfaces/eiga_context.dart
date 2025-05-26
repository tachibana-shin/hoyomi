import 'package:freezed_annotation/freezed_annotation.dart';

import '../export.dart';

part 'eiga_context.freezed.dart';

@freezed
sealed class EigaContext with _$EigaContext {
  const factory EigaContext({
    required String eigaId,
    required MetaEiga metaEiga,
    required EigaEpisode episode,
    Season? season,
  }) = _EigaContext;
}
