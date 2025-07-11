import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:hoyomi/core_services/comic/export.dart';
import 'package:hoyomi/js_runtime/extensions/rust_api.dart';
import 'package:hoyomi/js_runtime/js_runtime.dart';

class JSComicService extends ABComicService implements ComicCommentMixin {
  final Future<JsRuntime> Function() _getRuntime;
  JsRuntime? _runtime;
  FutureOr<JsRuntime> get runtime => _runtime ?? _setupRuntime();

  @override
  late final ServiceInit init;
  @override
  late final bool $isAuth;
  @override
  // ignore: overridden_fields
  late final String writeWith;

  JSComicService(
    this._getRuntime,
    this.init,
    this.$isAuth, {
    this.writeWith = 'js',
  });

  Future<JsRuntime>? _setupRuntimePending;
  Future<JsRuntime> _setupRuntime() {
    return _setupRuntimePending ??= __setupRuntime()
        .then((runtime) {
          _runtime = runtime;
          _setupRuntimePending = null;
          return runtime;
        })
        .catchError((error) {
          _setupRuntimePending = null;
          throw error;
        });
  }

  Future<JsRuntime> __setupRuntime() async {
    final runtime = await _getRuntime();

    runtime.setDio(dioCache);
    bus.on<HeadlessModeChanged>().listen((event) {
      runtime.setDio(dioCache);
    });

    await runtime.activateFetch();
    await runtime.activateRustApi();

    await runtime.evalAsync('__plugin._baseUrl = ${jsonEncode(baseUrl)}');

    return runtime;
  }

  @override
  Future<Uint8List> fetchPage(Uint8List buffer, OImage source) async {
    return await (await runtime).evalFn('__plugin.fetchPage', [
      buffer,
      source,
    ], base64: true);
  }

  @override
  Future<ComicCategory> getCategory({
    required String categoryId,
    required int page,
    required Map<String, List<String>?> filters,
  }) async {
    return ComicCategory.fromJson(
      await (await runtime).evalFn('__plugin.getCategory', [
        {'categoryId': categoryId, 'page': page, 'filters': filters},
      ]),
    );
  }

  // Utils
  @override
  Future<ComicModes> getComicModes(MetaComic comic) async {
    final out = await (await runtime).evalFn('__plugin.getComicModes', [comic]);

    return ComicModes.values.firstWhere(
      (mode) => mode.name == out,
      orElse: () => ComicModes.webToon,
    );
  }

  @override
  Future<MetaComic> getDetails(String comicId) async {
    return MetaComic.fromJson(
      await (await runtime).evalFn('__plugin.getDetails', [comicId]),
    );
  }

  @override
  Future<List<OImage>> getPages(String manga, String chap) async {
    return List.from(
      await (await runtime).evalFn('__plugin.getPages', [manga, chap]),
    ).map((element) => OImage.fromJson(element)).toList();
  }

  @override
  Future<List<Comic>> getSuggest({
    required MetaComic metaComic,
    required String comicId,
    int? page,
  }) async {
    return List.from(
      await (await runtime).evalFn('__plugin.getSuggest', [
        {'metaComic': metaComic, 'comicId': comicId, 'page': page},
      ]),
    ).map((element) => Comic.fromJson(element)).toList();
  }

  @override
  Future<String> getURL(String comicId, {String? chapterId}) async {
    return await (await runtime).evalFn('__plugin.getURL', [
      comicId,
      chapterId,
    ]);
  }

  @override
  Future<ComicHome> home() async {
    return ComicHome.fromJson(
      await (await runtime).evalFn('__plugin.home', const []),
    );
  }

  @override
  Future<ComicCategory> search({
    required String keyword,
    required int page,
    required Map<String, List<String>?> filters,
    required bool quick,
  }) async {
    return ComicCategory.fromJson(
      await (await runtime).evalFn('__plugin.search', [
        {'keyword': keyword, 'page': page, 'filters': filters, 'quick': quick},
      ]),
    );
  }

  /// ================ Extension =================

  @override
  Future<void> deleteComment(
    ComicCommentContext context, {
    required ComicComment comment,
  }) async {
    await (await runtime).evalFn('__plugin.deleteComment', [context, comment]);
  }

  @override
  Future<ComicComments> getComments(
    ComicCommentContext context, {
    int? page,
  }) async {
    return ComicComments.fromJson(
      await (await runtime).evalFn('__plugin.getComments', [context, page]),
    );
  }

  @override
  Future<bool> setLikeComment(
    ComicCommentContext context, {
    required ComicComment comment,
    required bool value,
  }) async {
    return await (await runtime).evalFn('__plugin.setLikeComment', [
      context,
      comment,
      value,
    ]);
  }

  bool _supportGetFollows = true;
  @override
  Future<Paginate<ComicFollow>> getFollows({required int page}) async {
    if (!_supportGetFollows) return await super.getFollows(page: page);

    try {
      final json = await (await runtime).evalFn('__plugin.getFollows', [page]);

      return Paginate(
        items:
            List.from(
              json['items'],
            ).map((item) => ComicFollow.fromJson(item)).toList(),
        page: json['page'],
        totalItems: json['totalItems'],
        totalPages: json['totalPages'],
      );
    } on UnimplementedError {
      _supportGetFollows = false;
      return await super.getFollows(page: page);
    }
  }

  bool _supportIsFollow = true;
  @override
  Future<bool> isFollow({required String comicId}) async {
    if (!_supportIsFollow) return await super.isFollow(comicId: comicId);

    try {
      return await (await runtime).evalFn('__plugin.isFollow', [comicId]);
    } on UnimplementedError {
      _supportIsFollow = false;
      return await super.isFollow(comicId: comicId);
    }
  }

  bool _supportSetFollow = true;
  @override
  Future<void> setFollow({
    required String comicId,
    required MetaComic metaComic,
    required bool value,
  }) async {
    if (!_supportSetFollow) {
      return await super.setFollow(
        comicId: comicId,
        metaComic: metaComic,
        value: value,
      );
    }

    try {
      await (await runtime).evalFn('__plugin.setFollow', [
        {'comicId': comicId, 'metaComic': metaComic, 'value': value},
      ]);
    } on UnimplementedError {
      _supportSetFollow = false;
      return await super.setFollow(
        comicId: comicId,
        metaComic: metaComic,
        value: value,
      );
    }
  }

  bool _supportGetWatchHistory = true;
  @override
  Future<List<ComicHistory>> getWatchHistory({required int page}) async {
    if (!_supportGetWatchHistory) {
      return await super.getWatchHistory(page: page);
    }

    try {
      return List.from(
        await (await runtime).evalFn('__plugin.getWatchHistory', [page]),
      ).map((element) => ComicHistory.fromJson(element)).toList();
    } on UnimplementedError {
      _supportGetWatchHistory = false;
      return await super.getWatchHistory(page: page);
    }
  }

  bool _supportGetWatchPage = true;
  @override
  Future<WatchPageUpdated> getWatchPage({
    required String comicId,
    required ComicChapter chapter,
    required MetaComic metaComic,
  }) async {
    if (!_supportGetWatchPage) {
      return await super.getWatchPage(
        comicId: comicId,
        chapter: chapter,
        metaComic: metaComic,
      );
    }

    try {
      return WatchPageUpdated.fromJson(
        await (await runtime).evalFn('__plugin.getWatchPage', [
          {'comicId': comicId, 'chapter': chapter, 'metaComic': metaComic},
        ]),
      );
    } on UnimplementedError {
      _supportGetWatchPage = false;

      return await super.getWatchPage(
        comicId: comicId,
        chapter: chapter,
        metaComic: metaComic,
      );
    }
  }

  bool _supportGetWatchPageEpisodes = true;
  @override
  Future<Map<String, WatchPageUpdated>> getWatchPageEpisodes({
    required String comicId,
    required List<ComicChapter> chapters,
  }) async {
    if (!_supportGetWatchPageEpisodes) {
      return await super.getWatchPageEpisodes(
        comicId: comicId,
        chapters: chapters,
      );
    }

    try {
      return await (await runtime).evalFn('__plugin.getWatchPageEpisodes', [
        {'comicId': comicId, 'chapters': chapters},
      ]);
    } on UnimplementedError {
      _supportGetWatchPageEpisodes = false;
      return await super.getWatchPageEpisodes(
        comicId: comicId,
        chapters: chapters,
      );
    }
  }

  bool _supportSetWatchPage = true;
  @override
  Future<void> setWatchPage({
    required String comicId,
    required ComicChapter chapter,
    required MetaComic metaComic,
    required WatchPage watchPage,
  }) async {
    if (!_supportSetWatchPage) {
      return await super.setWatchPage(
        comicId: comicId,
        chapter: chapter,
        metaComic: metaComic,
        watchPage: watchPage,
      );
    }

    try {
      await (await runtime).evalFn('__plugin.setWatchPage', [
        {
          'comicId': comicId,
          'chapter': chapter,
          'metaComic': metaComic,
          'watchPage': watchPage,
        },
      ]);
    } on UnimplementedError {
      _supportSetWatchPage = false;
      return await super.setWatchPage(
        comicId: comicId,
        chapter: chapter,
        metaComic: metaComic,
        watchPage: watchPage,
      );
    }
  }

  @override
  void dispose() {
    _runtime?.dispose();
    _setupRuntimePending?.then((runtime) => runtime.dispose());
    super.dispose();
  }
}
