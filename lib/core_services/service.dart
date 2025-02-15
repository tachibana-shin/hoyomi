import 'package:hoyomi/core_services/utils_service.dart';

abstract class Service extends UtilsService {
  @override
  String get name;
  @override
  String get uid;
  String get faviconUrl;
  String get baseUrl;
  String? rss;
}
