import 'package:honyomi/core_services/base_service.dart';

import 'services/truyengg/main.dart';

class GG extends TruyenGGService {
  @override
  final String uid ="truyenqq2";
}

List<BaseService> services = [TruyenGGService(), GG()];

BaseService getService(String id) {
  for (final service in services) {
    if (service.uid == id) {
      return service;
    }
  }

  throw Exception('Service not found');
}
