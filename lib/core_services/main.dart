import 'package:flutter/material.dart';
import 'package:hoyomi/apis/show_snack_bar.dart';
import 'package:hoyomi/constraints/x_platform.dart';
import 'package:hoyomi/controller/general_settings_controller.dart';
import 'package:hoyomi/core_services/comic/ab_comic_service.dart';
import 'package:hoyomi/core_services/eiga/ab_eiga_service.dart';
import 'package:hoyomi/core_services/interfaces/main.dart';
import 'package:hoyomi/plugins/install_web_rules.dart';
import 'package:kaeru/kaeru.dart';

import 'comic/services/cuutruyen/main.dart';
import 'comic/services/truyengg/main.dart';
import 'comic/services/truyenqq/main.dart';

import 'eiga/services/animevietsub/main.dart';
import 'eiga/services/hianime/main.dart';
import 'eiga/services/kkphim/main.dart';
import 'eiga/services/nguonc/main.dart';
import 'eiga/services/ophim/main.dart';

final _allComicServices = Map.fromEntries(
  <ABComicService>[
    TruyenGGService(),
    CuuTruyenService(),
    TruyenQQService(),
  ].map((service) => MapEntry(service.uid, service)),
);
final _allEigaServices = Map.fromEntries(
  <ABEigaService>[
    AnimeVietsubService(),
    OPhimService(),
    KKPhimService(),
    NguonCService(),
    HiAnimeService(),
  ].map((service) => MapEntry(service.uid, service)),
);

final comicServices = Ref<List<ABComicService>>(
  _allComicServices.values.toList(),
);

ABComicService getComicService(String id) {
  for (final service in comicServices.value) {
    if (service.uid == id) {
      return service;
    }
  }

  throw Exception('Service not found');
}

final eigaServices = Ref<List<ABEigaService>>(_allEigaServices.values.toList());

ABEigaService getEigaService(String id) {
  for (final service in eigaServices.value) {
    if (service.uid == id) {
      return service;
    }
  }

  throw Exception('Service not found');
}

bool _setupServicesInitd = false;
Future<void> _setupServices() async {
  if (_setupServicesInitd) return;
  _setupServicesInitd = true;

  // comic services
  final settings = await GeneralSettingsController.instance.get();

  if (settings?.sortComicService != null) {
    comicServices.value =
        settings!.sortComicService!
            .map((id) {
              final service = _allComicServices[id];
              if (service == null) {
                showSnackBar(Text('Service $id not install.'));
              }

              return service;
            })
            .whereType<ABComicService>()
            .toList();
  }
  // eiga services
  if (settings?.sortEigaService != null) {
    eigaServices.value =
        settings!.sortEigaService!
            .map((id) {
              final service = _allEigaServices[id];
              if (service == null) {
                showSnackBar(Text('Service $id not install.'));
              }

              return service;
            })
            .whereType<ABEigaService>()
            .toList();
  }

  // watch change
  watch$([comicServices], () {
    GeneralSettingsController.instance.save(
      (settings) => settings.copyWith(
        sortComicService:
            comicServices.value.map((service) => service.uid).toList(),
      ),
    );
  });
  watch$([eigaServices], () {
    GeneralSettingsController.instance.save(
      (settings) => settings.copyWith(
        sortEigaService:
            eigaServices.value.map((service) => service.uid).toList(),
      ),
    );
  });
}

Service getService(String uid) {
  try {
    return getComicService(uid);
  } catch (err) {
    return getEigaService(uid);
  }
}

final allServices = Computed<List<Service>>(
  () => [...comicServices.value, ...eigaServices.value],
);

Future<void> initializeServices([List<Service>? services]) async {
  _setupServices();

  services ??= allServices.value;
  await Future.wait(services.map((service) => service.initState()));

  if (XPlatform.isWeb) await installWebRules(await dynamicWebRules(services));
}

Future<List<WebRule>> dynamicWebRules(List<Service> moreServices) async {
  final List<WebRule> rules = [];
  for (final service in {...allServices.value, ...moreServices}) {
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
