import 'dart:typed_data';

import 'main.dart';

export 'package:hoyomi/core_services/service.dart';

abstract class ABComicService extends Service
    with ComicFollowGeneralMixin, ComicWatchPageGeneralMixin {
  Future<Uint8List> fetchPage(Uint8List buffer, OImage source) {
    throw UnimplementedError();
  }

  Future<ComicCategory> getCategory({
    required String categoryId,
    required int page,
    required Map<String, List<String>?> filters,
  });

  Future<ComicCategory> getExplorer({
    required int page,
    required Map<String, List<String>?> filters,
  }) {
    throw UnimplementedError();
  }

  // Utils
  ComicModes getComicModes(MetaComic comic) {
    throw UnimplementedError();
  }

  Future<MetaComic> getDetails(String comicId);
  Future<List<OImage>> getPages(String manga, String chap);
  Future<List<Comic>> getSuggest(MetaComic comic, {int? page}) {
    throw UnimplementedError();
  }

  Future<String> getURL(String comicId, {String? chapterId});

  Future<ComicHome> home();

  Future<ComicCategory> search({
    required String keyword,
    required int page,
    required Map<String, List<String>?> filters,
    required bool quick,
  });
}
