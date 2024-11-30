import 'package:honyomi/core_services/interfaces/basic_book.dart';
import 'package:honyomi/core_services/interfaces/basic_image.dart';
import 'package:honyomi/core_services/interfaces/basic_section.dart';
import 'package:honyomi/core_services/interfaces/book_param.dart';
import 'package:honyomi/core_services/interfaces/meta_book.dart';
import 'package:honyomi/core_services/interfaces/paginate.dart';
import 'package:honyomi/core_services/utils_service.dart';

abstract class BaseService extends UtilsService {
  @override
  String get name;
  @override
  String get uid;
  String get faviconUrl;
  String get baseUrl;
  String? rss;

  Future<Iterable<BasicSection>> home();
  Future<MetaBook> getDetails(String slug);
  Future<Iterable<BasicImage>> getPages(String manga, String chap);
  String getURL(String comicId, String chapterId);
  BookParam parseURL(String url);
  Future<Iterable<BasicBook>> quickSearch(String keyword);
  Future<Paginate<BasicBook>> search(String keyword, {int? page});
}
