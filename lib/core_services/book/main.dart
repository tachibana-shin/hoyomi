import 'package:honyomi/core_services/book/book_base_service.dart';

import 'services/truyengg/main.dart';
import 'services/truyenqq/main.dart';

List<BookBaseService> services = [TruyenGGService(), TruyenQQService()];

BookBaseService getService(String id) {
  for (final service in services) {
    if (service.uid == id) {
      return service;
    }
  }

  throw Exception('Service not found');
}
