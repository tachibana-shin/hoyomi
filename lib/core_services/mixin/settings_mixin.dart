import 'package:hoyomi/controller/service_settings_controller.dart';
import 'package:hoyomi/core_services/base_service.dart';
import 'package:hoyomi/database/scheme/service_settings.dart';

import '../interfaces/main.dart';

mixin SettingsMixin on BaseService {
  ServiceSettings? _serviceSettings;
  bool _stateReady = false;

  Future<void> initState() async {
    if (_stateReady) return;
    _stateReady = true;

    _serviceSettings = await ServiceSettingsController.instance.get(uid);
    ServiceSettingsController.instance.watch(
      uid,
      (newData) => _serviceSettings = newData,
    );
    _initSettings();
  }

  void _initSettings() {
    // init settings appear
    if (init.settings != null) {
      for (final field in init.settings!) {
        if (field is FieldInput && field.appear) {
          if (getSetting(key: field.key) == null) {
            setSetting(field.key, field.defaultValue);
          }
        }
      }
    }
  }

  String? getSetting({required String key}) {
    final value = _serviceSettings?.settings?[key];

    if (value == null || value.isEmpty) return null;
    return value;
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
