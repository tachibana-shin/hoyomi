import 'dart:typed_data';
import 'package:hoyomi_bridge/export.dart';

abstract class ABComicService extends BaseService {
  String getURL(String comicId, {String? chapterId});
  ComicParam parseURL(String url);

  Future<ComicHome> home();

  Future<ComicCategory> getCategory({
    required String categoryId,
    required int page,
    required Map<String, List<String>?> filters,
  });

  Future<MetaComic> getDetails(String comicId);
  Future<List<OImage>> getPages(String manga, String chap);
  Future<Uint8List> fetchPage(Uint8List buffer, OImage source) {
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
  String getComicModes(MetaComic comic) {
    throw UnimplementedError();
  }
}
