import 'package:honyomi/database/isar.dart';
import 'package:honyomi/database/scheme/settings.dart';

class SettingsController {
  final  _settingsBox = isar.settings;

  Settings? _settings;

  Future<Settings> getSettings() async{
    if (_settings != null) return _settings!;

    _settings =await _settingsBox.get(0);
    if (_settings == null) {
      _settings = Settings();
      _settingsBox.put(_settings!);
    }

    return _settings!;
  }
  
  void setSettings(Settings settings) {
    _settings = settings;
    _settingsBox.put(_settings!);
  }
}
