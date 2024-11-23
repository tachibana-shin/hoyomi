import 'package:honyomi/core_services/base_service.dart';

import 'truyengg/main.dart';

List<BaseService> services = [TruyenGGService(), TruyenGGService()];

BaseService getService(String id) {
  for (final service in services) {
    if (service.uid == id) {
      return service;
    }
  }

  throw Exception('Service not found');
}
