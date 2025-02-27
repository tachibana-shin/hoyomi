import 'package:hoyomi/core_services/service.dart';
import 'package:hoyomi/core_services/eiga/interfaces/eiga_home.dart';
import 'package:hoyomi/core_services/eiga/interfaces/eiga_section.dart';
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
abstract class EigaService extends Service {
  Future<EigaHome> home();

  Future<EigaSection> getSection({
    required String sectionId,
    required int page,
    required Map<String, List<String>?> filters,
  });

  EigaParam parseURL(String url);

  Future<MetaEiga> getDetails(String eigaId);
  Future<EigaEpisodes> getEpisodes(String eigaId);
  Future<SourceVideo> getSource({
    required String eigaId,
    required EigaEpisode episode,
  });
  Future<SourceContent> Function({required SourceVideo source})?
  fetchSourceContent;
  Future<Vtt?> Function({
    required String eigaId,
    required EigaEpisode episode,
    required int episodeIndex,
    required MetaEiga metaEiga,
  })?
  getThumbnail;

  Future<List<Subtitle>> getSubtitles({
    required String eigaId,
    required EigaEpisode episode,
  });

  Future<OpeningEnding?> getOpeningEnding({
    required String eigaId,
    required EigaEpisode episode,
    required int episodeIndex,
    required MetaEiga metaEiga,
  });

  Future<List<Eiga>> Function({
    required MetaEiga metaEiga,
    required String eigaId,
    int? page,
  })?
  getSuggest;

  Future<EigaSection> search({
    required String keyword,
    required int page,
    required Map<String, List<String>?> filters,
  });
}
