import 'dart:convert';

import 'package:hoyomi/database/isar.dart';
import 'package:hoyomi/database/scheme/service_setting.dart';
import 'package:isar/isar.dart';

class ServiceSettingController {
  static final _serviceSettingBox = isar.serviceSettings;
  static final Map<String, Future<ServiceSetting?>> _dataStore = {};
  static final Map<String, ServiceSetting?> _dataStoreSync = {};
  static final Map<String, Map> _dataStoreSettings = {};

  static Map? getSettings({required String sourceId}) {
    final data = get(sourceId: sourceId);

    try {
      return _dataStoreSettings[sourceId] ??= jsonDecode(
        data?.settings ?? '{}',
      );
    } catch (err) {
      return null;
    }
  }

  static ServiceSetting? get({required String sourceId}) {
    return _dataStoreSync[sourceId] ??=
        _serviceSettingBox.where().sourceIdEqualTo(sourceId).findFirstSync();
  }

  static Future<ServiceSetting?> getAsync({required String sourceId}) {
    return _dataStore[sourceId] ??=
        _dataStoreSync[sourceId] != null
            ? Future.value(_dataStoreSync[sourceId])
            : _serviceSettingBox.where().sourceIdEqualTo(sourceId).findFirst();
  }

  static Future<void> save(ServiceSetting data) async {
    await isar.writeTxn(() async {
      await isar.serviceSettings.put(data);

      _dataStore.remove(data.sourceId);
      _dataStoreSettings.remove(data.sourceId);
      _dataStoreSync[data.sourceId] = data;
    });
  }
}
