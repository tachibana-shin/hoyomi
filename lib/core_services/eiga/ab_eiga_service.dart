import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hoyomi/core_services/eiga/interfaces/server_source.dart';
import 'package:hoyomi/core_services/service.dart';
import 'package:hoyomi/core_services/eiga/interfaces/eiga_home.dart';
import 'package:hoyomi/core_services/eiga/interfaces/eiga_category.dart';
import 'package:hoyomi/core_services/eiga/interfaces/eiga.dart';
import 'package:hoyomi/core_services/eiga/interfaces/eiga_param.dart';
import 'package:hoyomi/core_services/eiga/interfaces/eiga_episode.dart';
import 'package:hoyomi/core_services/eiga/interfaces/eiga_episodes.dart';
import 'package:hoyomi/core_services/eiga/interfaces/meta_eiga.dart';
import 'package:hoyomi/core_services/eiga/interfaces/opening_ending.dart';
import 'package:hoyomi/core_services/eiga/interfaces/source_content.dart';
import 'package:hoyomi/core_services/eiga/interfaces/source_video.dart';
import 'package:hoyomi/core_services/eiga/interfaces/subtitle.dart';
import 'package:hoyomi/core_services/interfaces/vtt.dart';

export 'package:hoyomi/core_services/service.dart';

part 'ab_eiga_service.freezed.dart';

@freezed
class PropsGetSeekThumbnail with _$PropsGetSeekThumbnail {
  const factory PropsGetSeekThumbnail({
    required String eigaId,
    required MetaEiga metaEiga,
    required EigaEpisode episode,
    required SourceVideo source,
  }) = _PropsGetSeekThumbnail;
}

@freezed
class PropsGetOpeningEnding with _$PropsGetOpeningEnding {
  const factory PropsGetOpeningEnding({
    required String eigaId,
    required MetaEiga metaEiga,
    required EigaEpisode episode,
    required SourceVideo source,
  }) = _PropsGetOpeningEnding;
}

abstract class ABEigaService extends Service {
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

  Future<Vtt?> getSeekThumbnail(PropsGetSeekThumbnail props) {
    throw UnimplementedError();
  }

  Future<OpeningEnding?> getOpeningEnding(PropsGetOpeningEnding props) {
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
