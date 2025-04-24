import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:hoyomi/database/scheme/subtitle_settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SubtitleSettingsController extends ChangeNotifier {
  static SubtitleSettingsController? _instance;
  // Avoid self instance
  SubtitleSettingsController._();
  static SubtitleSettingsController get instance =>
      _instance ??= SubtitleSettingsController._();

  late final SharedPreferencesAsync asyncPrefs = SharedPreferencesAsync();

  SubtitleSettings? _cacheDefault;

  Future<SubtitleSettings?> get() async {
    if (_cacheDefault != null) return _cacheDefault;

    final json = await asyncPrefs.getString('subtitle_settings/default');
    if (json == null) return null;

    return _cacheDefault = SubtitleSettings.fromJson(jsonDecode(json));
  }

  Future<void> save(SubtitleSettings settings) async {
    await asyncPrefs.setString(
      'subtitle_settings/default',
      jsonEncode(settings.toJson()),
    );
    _cacheDefault = settings;
    notifyListeners();
  }
}
