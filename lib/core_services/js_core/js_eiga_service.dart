import 'dart:async';
import 'dart:convert';

import 'package:hoyomi/core_services/eiga/export.dart';
import 'package:hoyomi/js_runtime/js_runtime.dart';

class JSEigaService extends ABEigaService {
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

  JSEigaService(
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
  Future<SourceContent> fetchSourceContent({
    required SourceVideo source,
  }) async {
    return SourceContent.fromJson(
      await (await runtime).evalFn('__plugin.fetchSourceContent', [source]),
    );
  }

  @override
  Future<EigaCategory> getCategory({
    required String categoryId,
    required int page,
    required Map<String, List<String>?> filters,
  }) async {
    return EigaCategory.fromJson(
      await (await runtime).evalFn('__plugin.getCategory', [
        {'categoryId': categoryId, 'page': page, 'filters': filters},
      ]),
    );
  }

  @override
  Future<EigaCategory> getExplorer({
    required int page,
    required Map<String, List<String>?> filters,
  }) async {
    return EigaCategory.fromJson(
      await (await runtime).evalFn('__plugin.getExplorer', [page, filters]),
    );
  }

  @override
  Future<MetaEiga> getDetails(String eigaId) async {
    return MetaEiga.fromJson(
      await (await runtime).evalFn('__plugin.getDetails', [eigaId]),
    );
  }

  @override
  Future<EigaEpisodes> getEpisodes(String eigaId) async {
    return EigaEpisodes.fromJson(
      await (await runtime).evalFn('__plugin.getEpisodes', [eigaId]),
    );
  }

  @override
  Future<OpeningEnding?> getOpeningEnding(EigaSourceContext context) async {
    final data = await (await runtime).evalFn('__plugin.getOpeningEnding', [
      context,
    ]);
    if (data == null) return null;

    return OpeningEnding.fromJson(data);
  }

  @override
  Future<Vtt?> getSeekThumbnail(EigaSourceContext context) async {
    final data = await (await runtime).evalFn('__plugin.getSeekThumbnail', [
      context,
    ]);
    if (data == null) return null;

    return Vtt.fromJson(data);
  }

  @override
  Future<List<ServerSource>> getServers({
    required String eigaId,
    required EigaEpisode episode,
  }) async {
    return List.from(
      await (await runtime).evalFn('__plugin.getServers', [
        {'eigaId': eigaId, 'episode': episode},
      ]),
    ).map((element) => ServerSource.fromJson(element)).toList();
  }

  @override
  Future<SourceVideo> getSource({
    required String eigaId,
    required EigaEpisode episode,
    ServerSource? server,
  }) async {
    return SourceVideo.fromJson(
      await (await runtime).evalFn('__plugin.getSource', [
        {'eigaId': eigaId, 'episode': episode, 'server': server},
      ]),
    );
  }

  @override
  Future<List<Subtitle>> getSubtitles({
    required String eigaId,
    required EigaEpisode episode,
    required SourceVideo source,
  }) async {
    return List.from(
      await (await runtime).evalFn('__plugin.getSubtitles', [
        {'eigaId': eigaId, 'episode': episode, 'source': source},
      ]),
    ).map((element) => Subtitle.fromJson(element)).toList();
  }

  @override
  Future<List<Eiga>> getSuggest({
    required MetaEiga metaEiga,
    required String eigaId,
    int? page,
  }) async {
    return List.from(
      await (await runtime).evalFn('__plugin.getSuggest', [
        {'metaEiga': metaEiga, 'eigaId': eigaId, 'page': page},
      ]),
    ).map((element) => Eiga.fromJson(element)).toList();
  }

  @override
  Future<String> getURL(String eigaId, {String? episodeId}) async {
    return await (await runtime).evalFn('__plugin.getURL', [eigaId, episodeId]);
  }

  @override
  Future<EigaHome> home() async {
    return EigaHome.fromJson(
      await (await runtime).evalFn('__plugin.home', const []),
    );
  }

  @override
  Future<EigaCategory> search({
    required String keyword,
    required int page,
    required Map<String, List<String>?> filters,
    required bool quick,
  }) async {
    return EigaCategory.fromJson(
      await (await runtime).evalFn('__plugin.search', [
        {'keyword': keyword, 'page': page, 'filters': filters, 'quick': quick},
      ]),
    );
  }

  /// =============== Internal plugin support flags ===============
  bool _supportGetFollows = true;
  bool _supportGetFollowsCount = true;
  bool _supportIsFollow = true;
  bool _supportSetFollow = true;
  bool _supportGetWatchHistory = true;
  bool _supportGetWatchTime = true;
  bool _supportGetWatchTimeEpisodes = true;
  bool _supportSetWatchTime = true;

  /// =============== Overridden with fallback if plugin unimplemented ===============

  @override
  Future<Paginate<EigaFollow>> getFollows({required int page}) async {
    if (!_supportGetFollows) return await super.getFollows(page: page);
    try {
      final json = await (await runtime).evalFn('__plugin.getFollows', [page]);
      return Paginate(
        items:
            List.from(
              json['items'],
            ).map((item) => EigaFollow.fromJson(item)).toList(),
        page: json['page'],
        totalItems: json['totalItems'],
        totalPages: json['totalPages'],
      );
    } on UnimplementedError {
      _supportGetFollows = false;
      return await super.getFollows(page: page);
    }
  }

  @override
  Future<int> getFollowsCount(eigaId, metaEiga) async {
    if (!_supportGetFollowsCount) {
      return await super.getFollowsCount(eigaId, metaEiga);
    }
    try {
      return await (await runtime).evalFn('__plugin.getFollowsCount', [
        eigaId,
        metaEiga,
      ]);
    } on UnimplementedError {
      _supportGetFollowsCount = false;
      return await super.getFollowsCount(eigaId, metaEiga);
    }
  }

  @override
  Future<bool> isFollow(String eigaId) async {
    if (!_supportIsFollow) return await super.isFollow(eigaId);
    try {
      return await (await runtime).evalFn('__plugin.isFollow', [eigaId]);
    } on UnimplementedError {
      _supportIsFollow = false;
      return await super.isFollow(eigaId);
    }
  }

  @override
  Future<void> setFollow(EigaContextWithEpisodes context, bool value) async {
    if (!_supportSetFollow) return await super.setFollow(context, value);
    try {
      await (await runtime).evalFn('__plugin.setFollow', [context, value]);
    } on UnimplementedError {
      _supportSetFollow = false;
      return await super.setFollow(context, value);
    }
  }

  @override
  Future<List<EigaHistory>> getWatchHistory({required int page}) async {
    if (!_supportGetWatchHistory) {
      return await super.getWatchHistory(page: page);
    }
    try {
      return List.from(
        await (await runtime).evalFn('__plugin.getWatchHistory', [page]),
      ).map((element) => EigaHistory.fromJson(element)).toList();
    } on UnimplementedError {
      _supportGetWatchHistory = false;
      return await super.getWatchHistory(page: page);
    }
  }

  @override
  Future<WatchTime> getWatchTime(EigaContext context) async {
    if (!_supportGetWatchTime) return await super.getWatchTime(context);
    try {
      return WatchTime.fromJson(
        await (await runtime).evalFn('__plugin.getWatchTime', [context]),
      );
    } on UnimplementedError {
      _supportGetWatchTime = false;
      return await super.getWatchTime(context);
    }
  }

  @override
  Future<Map<String, WatchTimeUpdated>> getWatchTimeEpisodes({
    required String eigaId,
    required List<EigaEpisode> episodes,
  }) async {
    if (!_supportGetWatchTimeEpisodes) {
      return await super.getWatchTimeEpisodes(
        eigaId: eigaId,
        episodes: episodes,
      );
    }
    try {
      return await (await runtime).evalFn('__plugin.getWatchTimeEpisodes', [
        {'eigaId': eigaId, 'episodes': episodes},
      ]);
    } on UnimplementedError {
      _supportGetWatchTimeEpisodes = false;
      return await super.getWatchTimeEpisodes(
        eigaId: eigaId,
        episodes: episodes,
      );
    }
  }

  @override
  Future<void> setWatchTime(
    EigaContext context, {
    required WatchTime watchTime,
  }) async {
    if (!_supportSetWatchTime) {
      return await super.setWatchTime(context, watchTime: watchTime);
    }
    try {
      await (await runtime).evalFn('__plugin.setWatchTime', [
        context,
        {'watchTime': watchTime},
      ]);
    } on UnimplementedError {
      _supportSetWatchTime = false;
      return await super.setWatchTime(context, watchTime: watchTime);
    }
  }

  @override
  void dispose() {
    _runtime?.dispose();
    _setupRuntimePending?.then((runtime) => runtime.dispose());
    super.dispose();
  }
}
