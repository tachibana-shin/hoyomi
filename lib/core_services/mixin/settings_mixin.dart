import 'package:hoyomi/controller/service_settings_controller.dart';
import 'package:hoyomi/core_services/comic/interfaces/main.dart';
import 'package:hoyomi/database/scheme/service_settings.dart';

import '../service.dart';

mixin SettingsMixin on BaseService {
  ServiceSettings? _serviceSettings;
  bool _stateReady = false;

  Future<void> initState() async {
    if (_stateReady) return;
    _stateReady = true;

    _serviceSettings = await ServiceSettingsController.instance.get(uid);
    _initSettings();
  }

  void _initSettings() {
    // init settings appear
    if (init.settings != null) {
      for (final field in init.settings!) {
        if (field is FieldInput && field.appear) {
          if (getSetting(key: field.key) == null) {
            setSetting(field.key, field.defaultFn(this as Service));
          }
        }
      }
    }
  }

  String? getSetting({required String key}) {
    return _serviceSettings?.settings?[key];
  }

  Future<void> setSetting(String name, String value) async {
    var record =
        _serviceSettings ??
        ServiceSettings(
          sourceId: uid,
          settings: null,
          userDataCache: null,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

    try {
      record = record.copyWith(
        settings: {
          if (record.settings != null) ...record.settings!,
          name: value,
        },
      );
    } catch (err) {
      record = record.copyWith(settings: {name: value});
    }

    _serviceSettings = record;

    await ServiceSettingsController.instance.save(uid, record);
  }
}
