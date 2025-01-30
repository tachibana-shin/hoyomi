import 'package:hoyomi/core_services/base_service.dart';
import 'package:hoyomi/core_services/eiga/interfaces/base_eiga_home.dart';
import 'package:hoyomi/core_services/eiga/interfaces/base_eiga_section.dart';
import 'package:hoyomi/core_services/eiga/interfaces/basic_eiga.dart';
import 'package:hoyomi/core_services/eiga/interfaces/eiga_param.dart';
import 'package:hoyomi/core_services/eiga/interfaces/episode_eiga.dart';
import 'package:hoyomi/core_services/eiga/interfaces/episodes_eiga.dart';
import 'package:hoyomi/core_services/eiga/interfaces/meta_eiga.dart';
import 'package:hoyomi/core_services/eiga/interfaces/opening_ending.dart';
import 'package:hoyomi/core_services/eiga/interfaces/source_content.dart';
import 'package:hoyomi/core_services/eiga/interfaces/source_video.dart';
import 'package:hoyomi/core_services/eiga/interfaces/subtitle.dart';
import 'package:hoyomi/core_services/interfaces/basic_vtt.dart';

abstract class EigaBaseService extends BaseService {
  Future<BaseEigaHome> home();

  Future<BaseEigaSection> getSection(
      {required String sectionId,
      required int page,
      required Map<String, List<String>?> filters});

  EigaParam parseURL(String url);

  Future<MetaEiga> getDetails(String eigaId);
  Future<EpisodesEiga> getEpisodes(String eigaId);
  Future<SourceVideo> getSource(
      {required String eigaId, required EpisodeEiga episode});
  Future<SourceContent> Function({required SourceVideo source})?
      fetchSourceContent;
  Future<BasicVtt?> Function(
      {required String eigaId,
      required EpisodeEiga episode,
      required int episodeIndex,
      required MetaEiga metaEiga})? getThumbnail;

  Future<List<Subtitle>> getSubtitles(
      {required String eigaId, required EpisodeEiga episode});

  Future<OpeningEnding?> getOpeningEnding(
      {required String eigaId,
      required EpisodeEiga episode,
      required int episodeIndex,
      required MetaEiga metaEiga});

  Future<List<BasicEiga>> Function({
    required MetaEiga eiga,
    required String eigaId,
    int? page,
  })? getSuggest;
}
