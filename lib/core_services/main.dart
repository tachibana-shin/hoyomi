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
import 'comic/services/nettruyen/main.dart';
import 'comic/services/truyengg/main.dart';
import 'comic/services/truyenqq/main.dart';
import 'eiga/services/animevietsub/main.dart';
import 'eiga/services/hianime/main.dart';
import 'eiga/services/kkphim/main.dart';
import 'eiga/services/nguonc/main.dart';
import 'eiga/services/ophim/main.dart';

export 'widget/export.dart';

final allServices = Computed<List<Service>>(
  () => [...comicServices.value, ...eigaServices.value],
);
final comicServices = Ref<List<ABComicService>>(
  _allComicServices.values.toList(),
);

final eigaServices = Ref<List<ABEigaService>>(_allEigaServices.values.toList());

final _allComicServices = Map.fromEntries(
  <ABComicService>[
    CuuTruyenService(),
    NetTruyenService(),
    TruyenGGService(),
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

bool _setupServicesInitd = false;

Future<List<WebRule>> dynamicWebRules(List<Service> moreServices) async {
  final List<WebRule> rules = [];
  for (final service in {...allServices.value, ...moreServices}) {
    if (service.init.webRules?.isNotEmpty == true) {
      rules.addAll(service.init.webRules!);
    }
    // try {
    //   rules.addAll(await service.init.dynamicWebRules());
    // } on UnimplementedError {
    //   continue;
    // }
  }

  return rules;
}
ABComicService getComicService(String id) {
  for (final service in comicServices.value) {
    if (service.uid == id) {
      return service;
    }
  }

  throw Exception('Service not found $id');
}

ABEigaService getEigaService(String id) {
  for (final service in eigaServices.value) {
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

Service? getServiceOrNull(String uid) {
  try {
    return getService(uid);
  } catch (err) {
    return null;
  }
}

Future<void> initializeServices([List<Service>? services]) async {
  await _setupServices();

  services ??= allServices.value;
  await Future.wait(services.map((service) => service.initState()));

  if (XPlatform.isWeb) await installWebRules(await dynamicWebRules(services));
}

Future<void> _setupServices() async {
  if (_setupServicesInitd) return;
  _setupServicesInitd = true;

  // comic services
  final settings = await GeneralSettingsController.instance.get();

  if (settings?.sortComicService != null) {
    final services =
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

    for (final service in _allComicServices.values) {
      if (!services.contains(service)) services.add(service);
    }

    comicServices.value = services;
  }
  // eiga services
  if (settings?.sortEigaService != null) {
    final services =
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

    for (final service in _allEigaServices.values) {
      if (!services.contains(service)) services.add(service);
    }

    eigaServices.value = services;
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
