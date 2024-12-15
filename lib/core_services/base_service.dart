import 'package:honyomi/core_services/utils_service.dart';

abstract class BaseService extends UtilsService {
  @override
  String get name;
  @override
  String get uid;
  String get faviconUrl;
  String get baseUrl;
  String? rss;
}
