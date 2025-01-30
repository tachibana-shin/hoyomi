import 'package:hoyomi/core_services/base_service.dart';
import 'package:hoyomi/core_services/book/interfaces/base_book_section.dart';
import 'package:hoyomi/core_services/book/interfaces/basic_book.dart';
import 'package:hoyomi/core_services/interfaces/basic_image.dart';
import 'package:hoyomi/core_services/book/interfaces/basic_book_section.dart';
import 'package:hoyomi/core_services/book/interfaces/book_param.dart';
import 'package:hoyomi/core_services/book/interfaces/comic_modes.dart';
import 'package:hoyomi/core_services/book/interfaces/meta_book.dart';
import 'package:hoyomi/core_services/book/interfaces/paginate.dart';

abstract class BookBaseService extends BaseService {
  String getURL(String bookId, {String? chapterId});
  BookParam parseURL(String url);

  Future<List<BasicBookSection>> home();

  Future<BaseBookSection> getSection(
      {required String sectionId,
      required int page,
      required Map<String, List<String>?> filters});

  Future<MetaBook> getDetails(String bookId);
  Future<List<BasicImage>> getPages(String manga, String chap);

  Future<BaseBookSection> Function(
    MetaBook book, {
    int? page,
  })? getSuggest;

  Future<Paginate<BasicBook>> search(String keyword, {int? page});

  // Utils
  ComicModes? getComicModes(MetaBook book);
}
