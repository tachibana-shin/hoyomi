import 'package:honyomi/core_services/interfaces/basic_image.dart';
import 'package:honyomi/core_services/interfaces/basic_section.dart';
import 'package:honyomi/core_services/interfaces/meta_book.dart';
import 'package:honyomi/core_services/utils_service.dart';

abstract class BaseService extends UtilsService {
  String get name;
  String get uid;
  String get faviconUrl;
  String get baseUrl;

  Future<Iterable<BasicSection>> home();
  Future<MetaBook> getDetails(String slug);
  Future<Iterable<BasicImage>> getPages(String manga, String chap);
  String getURL(String comicId, String chapterId);
}
