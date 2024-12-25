import 'package:honyomi/core_services/base_service.dart';
import 'package:honyomi/core_services/eiga/interfaces/base_eiga_home.dart';
import 'package:honyomi/core_services/eiga/interfaces/eiga_param.dart';
import 'package:honyomi/core_services/eiga/interfaces/episodes_eiga.dart';
import 'package:honyomi/core_services/eiga/interfaces/meta_eiga.dart';

abstract class EigaBaseService extends BaseService {
  Future<BaseEigaHome> home();
  EigaParam parseURL(String url);
  
  Future<MetaEiga> getDetails(String eigaId);
  Future<EpisodesEiga> getEpisodes(String eigaId);
}
