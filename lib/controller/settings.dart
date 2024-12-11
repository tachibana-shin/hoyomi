import 'package:honyomi/models/settings.dart';
import 'package:honyomi/objectbox.g.dart';
import 'package:honyomi/plugins/objectbox.dart';

class SettingsController {
  final Box<Settings> _settingsBox;

  Settings? _settings;

  SettingsController() : _settingsBox = objectBox.store.box<Settings>();

  Settings getSettings() {
    if (_settings != null) return _settings!;

    _settings = _settingsBox.query(Settings_.id.equals(0)).build().findFirst();
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
