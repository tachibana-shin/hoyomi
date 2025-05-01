import '../../mixin/export.dart';
import '../main.dart';

mixin ComicWatchPageMixin on AuthMixin {
  Future<List<ComicHistory>> getWatchHistory({required int page});

  Future<WatchPageUpdated> getWatchPage({
    required String comicId,
    required ComicChapter chapter,
    required MetaComic metaComic,
  });

  Future<Map<String, WatchPageUpdated>> getWatchPageEpisodes({
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
