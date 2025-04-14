import 'package:hoyomi/constraints/x_platform.dart';
import 'package:hoyomi/core_services/comic/ab_comic_service.dart';
import 'package:hoyomi/core_services/eiga/ab_eiga_service.dart';
import 'package:hoyomi/core_services/interfaces/main.dart';
import 'package:hoyomi/plugins/install_web_rules.dart';

import 'comic/services/truyengg/main.dart';
import 'comic/services/truyenqq/main.dart';
import 'eiga/services/animevietsub/main.dart';
import 'eiga/services/hianime/main.dart';
import 'eiga/services/kkphim/main.dart';
import 'eiga/services/nguonc/main.dart';
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

List<ABEigaService> eigaServices = [
  AnimeVietsubService(),
  OPhimService(),
  KKPhimService(),
  NguonCService(),
  HiAnimeService(),
];

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

  if (XPlatform.isWeb) await installWebRules(await dynamicWebRules());
}

Future<List<WebRule>> dynamicWebRules() async {
  final List<WebRule> rules = [];
  for (final service in allServices) {
    if (service.init.webRules?.isNotEmpty == true) {
      rules.addAll(service.init.webRules!);
    }
    try {
      rules.addAll(await service.init.dynamicWebRules());
    } on UnimplementedError {
      continue;
    }
  }

  return rules;
}
