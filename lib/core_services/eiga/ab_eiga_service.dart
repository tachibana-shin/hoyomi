import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hoyomi/core_services/eiga/main.dart';

export 'package:hoyomi/core_services/service.dart';

part 'ab_eiga_service.freezed.dart';

@freezed
sealed class EigaSourceContext with _$EigaSourceContext {
  const factory EigaSourceContext({
    required String eigaId,
    required MetaEiga metaEiga,
    required EigaEpisode episode,
    required SourceVideo source,
  }) = _EigaSourceContext;
}

abstract class ABEigaService extends Service
    with EigaFollowGeneralMixin, EigaWatchTimeGeneralMixin {
  Future<EigaHome> home();

  Future<EigaCategory> getCategory({
    required String categoryId,
    required int page,
    required Map<String, List<String>?> filters,
  });

  EigaParam parseURL(String url);

  Future<MetaEiga> getDetails(String eigaId);
  Future<EigaEpisodes> getEpisodes(String eigaId);

  Future<List<ServerSource>> getServers({
    required String eigaId,
    required EigaEpisode episode,
  }) {
    throw UnimplementedError();
  }

  Future<SourceVideo> getSource({
    required String eigaId,
    required EigaEpisode episode,
    ServerSource? server,
  });

  Future<SourceContent> fetchSourceContent({required SourceVideo source}) {
    throw UnimplementedError();
  }

  Future<List<Subtitle>> getSubtitles({
    required String eigaId,
    required EigaEpisode episode,
    required SourceVideo source,
  }) {
    throw UnimplementedError();
  }

  Future<Vtt?> getSeekThumbnail(EigaSourceContext context) {
    throw UnimplementedError();
  }

  Future<OpeningEnding?> getOpeningEnding(EigaSourceContext context) {
    throw UnimplementedError();
  }

  Future<List<Eiga>> getSuggest({
    required MetaEiga metaEiga,
    required String eigaId,
    int? page,
  }) {
    throw UnimplementedError();
  }

  Future<EigaCategory> search({
    required String keyword,
    required int page,
    required Map<String, List<String>?> filters,
    required bool quick,
  });
}
