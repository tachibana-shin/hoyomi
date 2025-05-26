import 'package:freezed_annotation/freezed_annotation.dart';

import '../export.dart';

part 'eiga_context.freezed.dart';

@freezed
sealed class EigaContext with _$EigaContext {
  const factory EigaContext({
    required String eigaId,
    required EigaEpisode episode,
    required MetaEiga metaEiga,
    Season? season,
  }) = _EigaContext;
}
