import 'package:hoyomi/database/isar.dart';
import 'package:hoyomi/database/scheme/settings.dart';

class SettingsController {
  static final SettingsController _instance = SettingsController._internal();
  static SettingsController get instance => _instance;

  bool initialized = false;

  SettingsController._internal();

  final _settingsBox = isar.settings;

  Settings? _settings;

  Future<Settings> getSettings() async {
    if (_settings != null) return _settings!;

    _settings = await _settingsBox.get(0);
    if (_settings == null) {
      _settings = Settings();
      await isar.writeTxn(() async {
        return isar.settings.put(_settings!);
      });
    }

    return _settings!;
  }

  Future<void> setSettings(Settings settings) async {
    _settings = settings;

    await isar.writeTxn(() async {
      return isar.settings.put(_settings!);
    });
  }
}
