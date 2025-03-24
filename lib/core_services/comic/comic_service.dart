import 'package:hoyomi/core_services/service.dart';
import 'package:hoyomi/core_services/comic/interfaces/comic_category.dart';
import 'package:hoyomi/core_services/interfaces/o_image.dart';
import 'package:hoyomi/core_services/comic/interfaces/home_comic_category.dart';
import 'package:hoyomi/core_services/comic/interfaces/comic_param.dart';
import 'package:hoyomi/core_services/comic/interfaces/comic_modes.dart';
import 'package:hoyomi/core_services/comic/interfaces/meta_comic.dart';

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

  Future<ComicCategory> Function(MetaComic comic, {int? page})? getSuggest;

  Future<ComicCategory> search({
    required String keyword,
    required int page,
    required Map<String, List<String>?> filters,
    required bool quick,
  });

  // Utils
  ComicModes? getComicModes(MetaComic comic);
}
