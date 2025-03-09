import 'package:hoyomi/core_services/comic/comic_service.dart';
import 'package:hoyomi/core_services/eiga/eiga_service.dart';
import 'package:hoyomi/core_services/eiga/services/animevietsub/main.dart';

import 'comic/services/truyengg/main.dart';
import 'comic/services/truyenqq/main.dart';

List<ComicService> comicServices = [TruyenGGService(), TruyenQQService()];

ComicService getComicService(String id) {
  for (final service in comicServices) {
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
    return getComicService(uid);
  } catch (err) {
    return getEigaService(uid);
  }
}

List<Service> allServices = [...comicServices, ...eigaServices];
