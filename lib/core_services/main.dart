import 'package:honyomi/core_services/base_service.dart';

import 'services/truyengg/main.dart';
import 'services/truyenqq/main.dart';

List<BaseService> services = [TruyenGGService(), TruyenQQService()];

BaseService getService(String id) {
  for (final service in services) {
    if (service.uid == id) {
      return service;
    }
  }

  throw Exception('Service not found');
}
