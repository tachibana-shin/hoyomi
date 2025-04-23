import 'dart:convert';

import 'package:hoyomi/database/scheme/general_settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GeneralSettingsController {
  static GeneralSettingsController? _instance;
  // Avoid self instance
  GeneralSettingsController._();
  static GeneralSettingsController get instance =>
      _instance ??= GeneralSettingsController._();

  late final SharedPreferencesAsync asyncPrefs = SharedPreferencesAsync();

  GeneralSettings? _cacheDefault;

  Future<GeneralSettings?> get() async {
    if (_cacheDefault != null) return _cacheDefault;

    final json = await asyncPrefs.getString('general_settings/default');
    if (json == null) return null;

    return _cacheDefault = GeneralSettings.fromJson(jsonDecode(json));
  }

  Future<void> save(GeneralSettings Function(GeneralSettings data) saveFn) async {
    final settings = saveFn(await get() ?? GeneralSettings());

    await asyncPrefs.setString(
        'general_settings/default', jsonEncode(settings.toJson()));
    _cacheDefault = settings;
  }
}
