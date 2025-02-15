import 'package:hoyomi/core_services/service.dart';
import 'package:hoyomi/core_services/book/book_service.dart';
import 'package:hoyomi/core_services/eiga/eiga_service.dart';
import 'package:hoyomi/core_services/eiga/services/animevietsub/main.dart';

import 'book/services/truyengg/main.dart';
import 'book/services/truyenqq/main.dart';

List<BookService> bookServices = [TruyenGGService(), TruyenQQService()];

BookService getBookService(String id) {
  for (final service in bookServices) {
    if (service.uid == id) {
      return service;
    }
  }

  throw Exception('Service not found');
}

List<EigaService> eigaServices = [AnimeVietsubService()];

EigaService getEigaService(String id) {
  for (final service in eigaServices) {
    if (service.uid == id) {
      return service;
    }
  }

  throw Exception('Service not found');
}

Service getService(String uid) {
  try {
    return getBookService(uid);
  } catch (err) {
    return getEigaService(uid);
  }
}
