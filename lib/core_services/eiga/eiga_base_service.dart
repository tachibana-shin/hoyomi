import 'package:honyomi/core_services/base_service.dart';
import 'package:honyomi/core_services/eiga/interfaces/base_eiga_home.dart';
import 'package:honyomi/core_services/eiga/interfaces/eiga_param.dart';

abstract class EigaBaseService extends BaseService {
  Future<BaseEigaHome> home();
  EigaParam parseURL(String url);
}
