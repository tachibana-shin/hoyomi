import 'package:hoyomi/core_services/comic/comic_service.dart';
import 'package:hoyomi/core_services/eiga/ab_eiga_service.dart';

import 'comic/services/truyengg/main.dart';
import 'comic/services/truyenqq/main.dart';
import 'eiga/services/animevietsub/main.dart';
import 'eiga/services/ophim/main.dart';

List<ABComicService> comicServices = [TruyenGGService(), TruyenQQService()];

ABComicService getComicService(String id) {
  for (final service in comicServices) {
    if (service.uid == id) {
      return service;
    }
  }

  throw Exception('Service not found');
}

List<ABEigaService> eigaServices = [AnimeVietsubService(), OPhimService()];

ABEigaService getEigaService(String id) {
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

Future<void> initializeServices() async {
  await Future.wait(allServices.map((service) => service.initState()));
}
