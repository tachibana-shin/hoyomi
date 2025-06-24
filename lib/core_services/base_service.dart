import 'package:hoyomi/constraints/x_platform.dart';

import 'service_init.dart';

abstract class BaseService {
  final kIsWeb = XPlatform.isWeb;

  ServiceInit get init;
  String get uid => init.uid ?? name.toLowerCase().replaceAll(r'\s', '-');
  String get name => init.name;
  String get baseUrl;
}
