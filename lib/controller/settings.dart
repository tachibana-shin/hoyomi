import 'package:hoyomi/database/isar.dart';
import 'package:hoyomi/database/scheme/settings.dart';
import 'package:isar/isar.dart';

class SettingsController {
  final _settingsBox = isar.settings;

  Settings? _settings;

  Future<Settings> getSettings() async {
    if (_settings != null) return _settings!;

    _settings = await _settingsBox.getAsync(0);
    if (_settings == null) {
      _settings = Settings();
      await isar.writeAsync((isar) {
        isar.settings.put(_settings!);
      });
    }

    return _settings!;
  }

  Future<void> setSettings(Settings settings) async {
    _settings = settings;

    await isar.writeAsync((isar) {
      isar.settings.put(_settings!);
    });
  }
}
