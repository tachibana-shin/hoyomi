import 'package:hoyomi/core_services/comic/interfaces/main.dart';
import 'package:hoyomi/core_services/mixin/auth_mixin.dart';

mixin ComicWatchPageMixin on AuthMixin {
  Future<List<ComicHistory>> getWatchHistory({required int page});

  Future<WatchPage> getWatchPage({
    required String comicId,
    required ComicChapter chapter,
    required MetaComic metaComic,
  });

  Future<Map<String, WatchPage>> getWatchPageEpisodes({
    required String comicId,
    required List<ComicChapter> chapters,
  }) async {
    return {};
  }

  Future<void> setWatchPage({
    required String comicId,
    required ComicChapter chapter,
    required MetaComic metaComic,
    required WatchPage watchPage,
  });
}
