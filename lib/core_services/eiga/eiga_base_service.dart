import 'package:honyomi/core_services/base_service.dart';
import 'package:honyomi/core_services/eiga/interfaces/base_eiga_home.dart';
import 'package:honyomi/core_services/eiga/interfaces/eiga_param.dart';
import 'package:honyomi/core_services/eiga/interfaces/episode_eiga.dart';
import 'package:honyomi/core_services/eiga/interfaces/episodes_eiga.dart';
import 'package:honyomi/core_services/eiga/interfaces/meta_eiga.dart';
import 'package:honyomi/core_services/eiga/interfaces/source_content.dart';
import 'package:honyomi/core_services/eiga/interfaces/source_video.dart';
import 'package:honyomi/core_services/eiga/interfaces/subtitle.dart';

abstract class EigaBaseService extends BaseService {
  Future<BaseEigaHome> home();
  EigaParam parseURL(String url);

  Future<MetaEiga> getDetails(String eigaId);
  Future<EpisodesEiga> getEpisodes(String eigaId);
  Future<SourceVideo> getSource(
      {required String eigaId, required EpisodeEiga episode});
  Future<List<Subtitle>> getSubtitles(
      {required String eigaId, required EpisodeEiga episode});
  Future<SourceContent> Function({required SourceVideo source})?
      fetchSourceContent;
}
