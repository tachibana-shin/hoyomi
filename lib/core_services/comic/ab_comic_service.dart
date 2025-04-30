import 'dart:typed_data';

import 'package:hoyomi/core_services/comic/interfaces/main.dart';
import 'package:hoyomi/core_services/service.dart';

export 'package:hoyomi/core_services/service.dart';

abstract class ABComicService extends Service {
  String getURL(String comicId, {String? chapterId});
  ComicParam parseURL(String url);

  Future<List<HomeComicCategory>> home();

  Future<ComicCategory> getCategory({
    required String categoryId,
    required int page,
    required Map<String, List<String>?> filters,
  });

  Future<MetaComic> getDetails(String comicId);
  Future<List<OImage>> getPages(String manga, String chap);
  Future<Uint8List> fetchPage(OImage source) {
    throw UnimplementedError();
  }

  Future<List<Comic>> getSuggest(MetaComic comic, {int? page}) {
    throw UnimplementedError();
  }

  Future<ComicCategory> search({
    required String keyword,
    required int page,
    required Map<String, List<String>?> filters,
    required bool quick,
  });

  // Utils
  ComicModes getComicModes(MetaComic comic) {
    throw UnimplementedError();
  }
}
