import 'package:drift/drift.dart';
import 'package:hoyomi/database/drift.dart';

class SettingsController {
  final AppDatabase _db = AppDatabase(); // Drift database instance
  Setting? _settings;

  // Method to retrieve settings
  Future<Setting> getSettings() async {
    if (_settings != null) return _settings!;

    // Fetch settings using Drift's DAO
    final settings =
        await _db.managers.settings.limit(1).getSingleOrNull(); // Use Drift

    // If settings not found, create default and save
    if (settings == null) {
      await _db.managers.settings.create((row) => row());
      return getSettings();
    } else {
      _settings = settings;
      return _settings!;
    }
  }

  // Method to set/update settings
  Future<void> setSettings(Setting settings) async {
    _settings = settings;
    
    // Update the settings using Drift's DAO
    await _db.settings.insertOne(settings);
  }
}
