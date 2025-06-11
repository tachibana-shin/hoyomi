import 'dart:io';
import 'dart:typed_data';

import 'export.dart';

String transformService(String code) {
  code = code.replaceFirst('extends ABComicService', '');
  code = code.replaceAll(
    "import 'compiler/lib_eval.dart';",
    "import 'package:hoyomi_bridge/lib_eval.dart';",
  );

  return code;
}

/// A dynamic overrideable implementation of [ABComicService]
class DynamicComicService extends ABComicService {
  final ServiceInit _init;
  @override
  ServiceInit get init => _init;

  /// Optional bridger
  @override
  Bridger? bridger;

  DynamicComicService(this._init);

  // ==== Function fields ====

  late String Function(String comicId, {String? chapterId}) _getURL;
  late ComicParam Function(String url) _parseURL;
  late Future<ComicHome> Function() _home;
  late Future<ComicCategory> Function(
    String categoryId,
    int page,
    Map<String, List<String>?> filters,
  )
  _getCategory;
  late Future<MetaComic> Function(String comicId) _getDetails;
  late Future<List<OImage>> Function(String mangaId, String chapterId)
  _getPages;
  late Future<ComicCategory> Function(
    String keyword,
    int page,
    Map<String, List<String>?> filters,
    bool quick,
  )
  _search;

  Future<Uint8List> Function(Uint8List buffer, OImage source)? _fetchPage;
  Future<List<Comic>> Function(MetaComic comic, int? page)? _getSuggest;
  String Function(MetaComic comic)? _getComicModes;

  // ==== Setters ====

  void setFnGetURL(String Function(String comicId, {String? chapterId}) fn) =>
      _getURL = fn;
  void setFnParseURL(ComicParam Function(String url) fn) => _parseURL = fn;
  void setFnHome(Future<ComicHome> Function() fn) => _home = fn;
  void setFnGetCategory(
    Future<ComicCategory> Function(
      String categoryId,
      int page,
      Map<String, List<String>?> filters,
    )
    fn,
  ) => _getCategory = fn;
  void setFnGetDetails(Future<MetaComic> Function(String comicId) fn) =>
      _getDetails = fn;
  void setFnGetPages(
    Future<List<OImage>> Function(String mangaId, String chapterId) fn,
  ) => _getPages = fn;
  void setFnSearch(
    Future<ComicCategory> Function(
      String keyword,
      int page,
      Map<String, List<String>?> filters,
      bool quick,
    )
    fn,
  ) => _search = fn;

  void setFnFetchPage(
    Future<Uint8List> Function(Uint8List buffer, OImage source) fn,
  ) => _fetchPage = fn;
  void setFnGetSuggest(
    Future<List<Comic>> Function(MetaComic comic, int? page) fn,
  ) => _getSuggest = fn;
  void setFnGetComicModes(String Function(MetaComic comic) fn) =>
      _getComicModes = fn;

  // ==== Overrides ====

  @override
  String getURL(String comicId, {String? chapterId}) =>
      _getURL(comicId, chapterId: chapterId);

  @override
  ComicParam parseURL(String url) => _parseURL(url);

  @override
  Future<ComicHome> home() => _home();

  @override
  Future<ComicCategory> getCategory({
    required String categoryId,
    required int page,
    required Map<String, List<String>?> filters,
  }) => _getCategory(categoryId, page, filters);

  @override
  Future<MetaComic> getDetails(String comicId) => _getDetails(comicId);

  @override
  Future<List<OImage>> getPages(String manga, String chap) =>
      _getPages(manga, chap);

  @override
  Future<Uint8List> fetchPage(Uint8List buffer, OImage source) {
    if (_fetchPage != null) {
      return _fetchPage!(buffer, source);
    }
    return super.fetchPage(buffer, source);
  }

  @override
  Future<List<Comic>> getSuggest(MetaComic comic, {int? page}) {
    if (_getSuggest != null) {
      return _getSuggest!(comic, page);
    }
    return super.getSuggest(comic, page: page);
  }

  @override
  Future<ComicCategory> search({
    required String keyword,
    required int page,
    required Map<String, List<String>?> filters,
    required bool quick,
  }) => _search(keyword, page, filters, quick);

  @override
  String getComicModes(MetaComic comic) {
    if (_getComicModes != null) {
      return _getComicModes!(comic);
    }
    return super.getComicModes(comic);
  }
}

void main() async {
  final runtime = await compile({
    'hello': {
      'service.dart': transformService(
        await File('lib/service_test.dart').readAsString(),
      ),
      'main.dart': '''
import 'dart:convert';

import 'package:hoyomi_bridge/lib_eval.dart';
import 'package:hoyomi_bridge/export.dart';

import 'service.dart';

void main() {
print('ok');
}

void initService() => print(jsonEncode(NetTruyenService().init));
// void getInit() => _service.init;
''',
      'main2.dart': '''
       import 'package:hoyomi_bridge/main.dart';
       import 'dart:convert';
       void main() {
         final book = OImage(src: 'https://google.com/favicon.ico');
         print(jsonEncode(book));
         print(DateFormat('yyyy-MM-dd').parse('2025-11-22'));
       }
     ''',
    },
  });

  final init = await runtime.executeLib(
    'package:hello/main.dart',
    'initService',
  );
  // final init = await runtime.executeLib('package:hello/maim.dart', 'getInit');

  print(init);

  // final x = DynamicComicService(init);
  // await installLibEval(runtime, baseUrl: x.baseUrl, fetch: x.fetch);

  runtime.executeLib('package:hello/main.dart', 'main');
}
