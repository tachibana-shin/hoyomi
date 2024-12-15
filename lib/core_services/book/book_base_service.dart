import 'package:honyomi/core_services/base_service.dart';
import 'package:honyomi/core_services/book/interfaces/base_section.dart';
import 'package:honyomi/core_services/book/interfaces/basic_book.dart';
import 'package:honyomi/core_services/interfaces/basic_image.dart';
import 'package:honyomi/core_services/book/interfaces/basic_section.dart';
import 'package:honyomi/core_services/book/interfaces/book_param.dart';
import 'package:honyomi/core_services/book/interfaces/comic_modes.dart';
import 'package:honyomi/core_services/book/interfaces/meta_book.dart';
import 'package:honyomi/core_services/book/interfaces/paginate.dart';

abstract class BookBaseService extends BaseService {
  String getURL(String bookId, {String? chapterId});
  BookParam parseURL(String url);

  Future<Iterable<BasicSection>> home();

  Future<BaseSection> getSection(String sectionId,
      {int? page, Map<String, List<String>?>? filters});

  Future<MetaBook> getDetails(String bookId);
  Future<Iterable<BasicImage>> getPages(String manga, String chap);

  Future<BaseSection> Function(
    MetaBook book, {
    int? page,
  })? getSuggest;

  Future<Paginate<BasicBook>> search(String keyword, {int? page});

  // Utils
  ComicModes? getComicModes(MetaBook book);
}
