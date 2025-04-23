import 'package:hoyomi/controller/general_settings_controller.dart';
import 'package:kaeru/kaeru.dart';

import 'database/scheme/general_settings.dart';

final showListEpisodeWithGrid = Ref(false);

Future<void> initializeStore() async {
  final settings =
      await GeneralSettingsController.instance.get() ?? GeneralSettings();
  showListEpisodeWithGrid.value = settings.showListEpisodeWithGrid;

  watch$([showListEpisodeWithGrid], () {
    GeneralSettingsController.instance.save((settings) => settings.copyWith(
      showListEpisodeWithGrid: showListEpisodeWithGrid.value,
    ));
  });
}
