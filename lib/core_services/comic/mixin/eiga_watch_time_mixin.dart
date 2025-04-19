import 'package:hoyomi/core_services/comic/interfaces/main.dart';
import 'package:hoyomi/core_services/mixin/auth_mixin.dart';

mixin ComicWatchTimeMixin on AuthMixin {
  Future<List<HistoryItem<Comic>>> getWatchHistory({required int page});

  Future<WatchPage> getWatchTime({
    required String eigaId,
    required ComicChapter episode,
    required MetaComic metaComic,
  });

  Future<Map<String, WatchPage>> getWatchTimeEpisodes({
    required String eigaId,
    required List<ComicChapter> episodes,
  }) async {
    return {};
  }

  Future<void> setWatchTime({
    required String eigaId,
    required ComicChapter episode,
    required MetaComic metaComic,
    required WatchPage watchPage,
  });
}
