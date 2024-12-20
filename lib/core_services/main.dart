import 'package:honyomi/core_services/base_service.dart';
import 'package:honyomi/core_services/book/book_base_service.dart';
import 'package:honyomi/core_services/eiga/eiga_base_service.dart';
import 'package:honyomi/core_services/eiga/services/animevietsub/main.dart';

import 'book/services/truyengg/main.dart';
import 'book/services/truyenqq/main.dart';

List<BookBaseService> bookServices = [TruyenGGService(), TruyenQQService()];

BookBaseService getBookService(String id) {
  for (final service in bookServices) {
    if (service.uid == id) {
      return service;
    }
  }

  throw Exception('Service not found');
}

List<EigaBaseService> eigaServices = [AnimeVietsubService()];

EigaBaseService getEigaService(String id) {
  for (final service in eigaServices) {
    if (service.uid == id) {
      return service;
    }
  }

  throw Exception('Service not found');
}

BaseService getBaseService(String uid) {
  try {
    return getBookService(uid);
  } catch (err) {
    return getEigaService(uid);
  }
}
