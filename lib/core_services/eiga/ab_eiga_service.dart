import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hoyomi/core_services/eiga/main.dart';

export 'package:hoyomi/core_services/service.dart';

part 'ab_eiga_service.freezed.dart';
part 'ab_eiga_service.g.dart';

abstract class ABEigaService extends Service
    with EigaFollowGeneralMixin, EigaWatchTimeGeneralMixin {
  Future<SourceContent> fetchSourceContent({required SourceVideo source}) {
    throw UnimplementedError();
  }

  Future<EigaCategory> getCategory({
    required String categoryId,
    required int page,
    required Map<String, List<String>?> filters,
  });

  Future<EigaCategory> getExplorer({
    required int page,
    required Map<String, List<String>?> filters,
  }) {
    throw UnimplementedError();
  }

  Future<MetaEiga> getDetails(String eigaId);

  Future<EigaEpisodes> getEpisodes(String eigaId);

  Future<OpeningEnding?> getOpeningEnding(EigaSourceContext context) {
    throw UnimplementedError();
  }

  Future<Vtt?> getSeekThumbnail(EigaSourceContext context) {
    throw UnimplementedError();
  }

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

  Future<List<Subtitle>> getSubtitles({
    required String eigaId,
    required EigaEpisode episode,
    required SourceVideo source,
  }) {
    throw UnimplementedError();
  }

  Future<List<Eiga>> getSuggest({
    required MetaEiga metaEiga,
    required String eigaId,
    int? page,
  }) {
    throw UnimplementedError();
  }

  Future<String> getURL(String eigaId, {String? episodeId}) {
    throw UnimplementedError();
  }

  Future<EigaHome> home();

  Future<EigaCategory> search({
    required String keyword,
    required int page,
    required Map<String, List<String>?> filters,
    required bool quick,
  });
}

@freezed
sealed class EigaSourceContext with _$EigaSourceContext {
  const factory EigaSourceContext({
    required String eigaId,
    required MetaEiga metaEiga,
    required EigaEpisode episode,
    required SourceVideo source,
  }) = _EigaSourceContext;

  factory EigaSourceContext.fromJson(Map<String, dynamic> json) =>
      _$EigaSourceContextFromJson(json);
}
