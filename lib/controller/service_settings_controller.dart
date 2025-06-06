import 'dart:convert';

import 'package:hoyomi/database/scheme/service_settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

typedef WatchCallback = void Function(ServiceSettings newData);

class ServiceSettingsController {
  static ServiceSettingsController? _instance;
  // Avoid self instance
  ServiceSettingsController._();
  static ServiceSettingsController get instance =>
      _instance ??= ServiceSettingsController._();

  static final SharedPreferencesAsync asyncPrefs = SharedPreferencesAsync();
  static final Map<String, ServiceSettings?> _cacheStore = {};
  static final Map<String, List<WatchCallback>> _watchCallbacks = {};

  Future<ServiceSettings?> get(String name) async {
    if (_cacheStore[name] != null) return _cacheStore[name];

    final json = await asyncPrefs.getString('service_settings/$name');
    if (json == null) return null;

    return _cacheStore[name] = ServiceSettings.fromJson(jsonDecode(json));
  }

  Future<void> save(String name, ServiceSettings settings) async {
    await asyncPrefs.setString(
      'service_settings/$name',
      jsonEncode(settings.toJson()),
    );
    _cacheStore[name] = settings;
    _watchCallbacks[name]?.forEach((callback) => callback(settings));
  }

  void watch(String name, WatchCallback callback) {
    _watchCallbacks.putIfAbsent(name, () => []).add(callback);
  }
}
