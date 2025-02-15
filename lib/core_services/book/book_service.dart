import 'package:hoyomi/core_services/service.dart';
import 'package:hoyomi/core_services/book/interfaces/book_section.dart';
import 'package:hoyomi/core_services/interfaces/o_image.dart';
import 'package:hoyomi/core_services/book/interfaces/home_book_section.dart';
import 'package:hoyomi/core_services/book/interfaces/book_param.dart';
import 'package:hoyomi/core_services/book/interfaces/comic_modes.dart';
import 'package:hoyomi/core_services/book/interfaces/meta_book.dart';

abstract class BookService extends Service {
  String getURL(String bookId, {String? chapterId});
  BookParam parseURL(String url);

  Future<List<HomeBookSection>> home();

  Future<BookSection> getSection(
      {required String sectionId,
      required int page,
      required Map<String, List<String>?> filters});

  Future<MetaBook> getDetails(String bookId);
  Future<List<OImage>> getPages(String manga, String chap);

  Future<BookSection> Function(
    MetaBook book, {
    int? page,
  })? getSuggest;

  Future<BookSection> search(
      {required String keyword,
      required int page,
      required Map<String, List<String>?> filters});

  // Utils
  ComicModes? getComicModes(MetaBook book);
}
