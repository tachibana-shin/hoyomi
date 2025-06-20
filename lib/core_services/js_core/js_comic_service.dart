import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter_js/flutter_js.dart';
import 'package:hoyomi/core_services/comic/export.dart';
import 'package:hoyomi/js_runtime/js_runtime.dart';

class JSComicService extends ABComicService {
  final JavascriptRuntime _runtime;

  @override
  late final ServiceInit init;

  late final bool _$isAuth;

  JSComicService(this._runtime);
  @override
  bool? get $isAuth => _$isAuth;

  @override
  Future<Uint8List> fetchPage(Uint8List buffer, OImage source) async {
    return base64Decode(
      await _runtime.evalAsyncJson(
        'base64Encode(__plugin.fetchPage(base64Decode(${jsonEncode(base64Encode(buffer))}), ${jsonEncode(source.toJson())}))',
      ),
    );
  }

  @override
  Future<ComicCategory> getCategory({
    required String categoryId,
    required int page,
    required Map<String, List<String>?> filters,
  }) async {
    return ComicCategory.fromJson(
      await _runtime.evalAsyncJson(
        '__plugin.getCategory(${jsonEncode({'categoryId': categoryId, 'page': page, 'filters': filters})})',
      ),
    );
  }

  // Utils
  @override
  ComicModes getComicModes(MetaComic comic) {
    return jsonDecode(
      _runtime
          .evaluate('__plugin.getComicModes(${jsonEncode(comic)})')
          .stringResult,
    );
  }

  @override
  Future<MetaComic> getDetails(String comicId) async {
    return MetaComic.fromJson(
      await _runtime.evalAsyncJson(
        '__plugin.getDetails(${jsonEncode(comicId)})',
      ),
    );
  }

  @override
  Future<List<OImage>> getPages(String manga, String chap) async {
    return List.from(
      await _runtime.evalAsyncJson(
        '__plugin.getPages(${jsonEncode(manga)}, ${jsonEncode(chap)})',
      ),
    ).map((element) => OImage.fromJson(element)).toList();
  }

  @override
  Future<List<Comic>> getSuggest(MetaComic comic, {int? page}) async {
    return List.from(
      await _runtime.evalAsyncJson(
        '__plugin.getSuggest(${jsonEncode(comic)}, ${jsonEncode(page)})',
      ),
    ).map((element) => Comic.fromJson(element)).toList();
  }

  @override
  Future<String> getURL(String comicId, {String? chapterId}) async {
    return await _runtime.evalAsyncJson(
      '__plugin.getURL(${jsonEncode(comicId)}, ${jsonEncode(chapterId)})',
    );
  }

  @override
  Future<ComicHome> home() async {
    return ComicHome.fromJson(
      jsonDecode(await _runtime.evalAsyncJson('__plugin.home()')),
    );
  }

  @override
  Future<void> initState() async {
    init = ServiceInit.fromJson(
      jsonDecode(await _runtime.evalAsyncJson('__plugin.init')),
    );
    _$isAuth = jsonDecode(await _runtime.evalAsyncJson('__plugin.\$isAuth'));

    await super.initState();
  }

  @override
  Future<ComicCategory> search({
    required String keyword,
    required int page,
    required Map<String, List<String>?> filters,
    required bool quick,
  }) async {
    return ComicCategory.fromJson(
      await _runtime.evalAsyncJson(
        '__plugin.search(${jsonEncode({'keyword': keyword, 'page': page, 'filters': filters, 'quick': quick})})',
      ),
    );
  }

  static fromScript(String code) async {
    final runtime = await getJsRuntime();

    await runtime.evalAsync('''
      !(() => {
        $code;

        if (!globalThis.__\$HOYOMI_PLUGIN\$__) {
          throw Exception('No plugin found');
        }

        globalThis.__plugin = globalThis.__\$HOYOMI_PLUGIN\$__();
      })();
    ''');
  }
}
