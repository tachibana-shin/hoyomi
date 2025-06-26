import 'package:hoyomi/controller/general_settings_controller.dart';
import 'package:kaeru/kaeru.dart';

import 'database/scheme/general_settings.dart';

final showListEpisodeWithGrid = Ref(false);
final lastTabActiveApp = Ref<String?>(null);
final newsKeywordComic = Ref<List<String>>([]);
final newsKeywordEiga = Ref<List<String>>([]);
final sortLibraryService = Ref<List<String>>([]);
final comicAutoTrimImage = Ref(false);

Future<void> initializeStore() async {
  final settings =
      await GeneralSettingsController.instance.get() ?? GeneralSettings();
  showListEpisodeWithGrid.value = settings.showListEpisodeWithGrid;
  lastTabActiveApp.value = settings.lastTabActiveApp;
  newsKeywordComic.value = settings.newsKeywordComic;
  newsKeywordEiga.value = settings.newsKeywordEiga;
  sortLibraryService.value = settings.sortLibraryService ?? <String>[];
  comicAutoTrimImage.value = settings.comicAutoTrimImage;

  watch$(
    [
      showListEpisodeWithGrid,
      lastTabActiveApp,
      newsKeywordComic,
      newsKeywordEiga,
      sortLibraryService,
      comicAutoTrimImage,
    ],
    () {
      GeneralSettingsController.instance.save(
        (settings) => settings.copyWith(
          showListEpisodeWithGrid: showListEpisodeWithGrid.value,
          lastTabActiveApp: lastTabActiveApp.value,
          newsKeywordComic: newsKeywordComic.value,
          newsKeywordEiga: newsKeywordEiga.value,
          sortLibraryService: sortLibraryService.value,
          comicAutoTrimImage: comicAutoTrimImage.value,
        ),
      );
    },
  );
}
