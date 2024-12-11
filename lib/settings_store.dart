import 'package:mobx/mobx.dart';

part 'settings_store.g.dart';

class SettingsStore = SettingsStoreBase with _$SettingsStore;

abstract class SettingsStoreBase with Store {
  @observable
  /// Time to seconds
  /// Default to 3 hours
  int pollingIntervalBook = 60 * 60 * 3; // 30 hours

  
}
