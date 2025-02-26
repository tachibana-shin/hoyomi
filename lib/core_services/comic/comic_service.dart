import 'package:hoyomi/core_services/service.dart';
import 'package:hoyomi/core_services/comic/interfaces/comic_section.dart';
import 'package:hoyomi/core_services/interfaces/o_image.dart';
import 'package:hoyomi/core_services/comic/interfaces/home_comic_section.dart';
import 'package:hoyomi/core_services/comic/interfaces/comic_param.dart';
import 'package:hoyomi/core_services/comic/interfaces/comic_modes.dart';
import 'package:hoyomi/core_services/comic/interfaces/meta_comic.dart';

abstract class ComicService extends Service {
  String getURL(String comicId, {String? chapterId});
  ComicParam parseURL(String url);

  Future<List<HomeComicSection>> home();

  Future<ComicSection> getSection({
    required String sectionId,
    required int page,
    required Map<String, List<String>?> filters,
  });

  Future<MetaComic> getDetails(String comicId);
  Future<List<OImage>> getPages(String manga, String chap);

  Future<ComicSection> Function(MetaComic comic, {int? page})? getSuggest;

  Future<ComicSection> search({
    required String keyword,
    required int page,
    required Map<String, List<String>?> filters,
  });

  // Utils
  ComicModes? getComicModes(MetaComic comic);
}
