import 'package:flutter_js/flutter_js.dart';
import 'package:hoyomi/core_services/eiga/export.dart';
import 'package:hoyomi/js_runtime/js_runtime.dart';

class JSEigaService extends ABEigaService {
  final JavascriptRuntime _runtime;

  @override
  late final ServiceInit init;

  late final bool _$isAuth;

  JSEigaService(this._runtime);
  @override
  bool? get $isAuth => _$isAuth;

  @override
  Future<SourceContent> fetchSourceContent({
    required SourceVideo source,
  }) async {
    return SourceContent.fromJson(
      await _runtime.evalFn('fetchSourceContent', [source]),
    );
  }

  @override
  Future<EigaCategory> getCategory({
    required String categoryId,
    required int page,
    required Map<String, List<String>?> filters,
  }) async {
    return EigaCategory.fromJson(
      await _runtime.evalFn('getCategory', [
        {'categoryId': categoryId, 'page': page, 'filters': filters},
      ]),
    );
  }

  @override
  Future<MetaEiga> getDetails(String eigaId) async {
    return MetaEiga.fromJson(await _runtime.evalFn('getDetails', [eigaId]));
  }

  @override
  Future<EigaEpisodes> getEpisodes(String eigaId) async {
    return EigaEpisodes.fromJson(
      await _runtime.evalFn('__plugin.getEpisodes', [eigaId]),
    );
  }

  @override
  Future<OpeningEnding?> getOpeningEnding(EigaSourceContext context) async {
    final data = await _runtime.evalFn('__plugin.getOpeningEnding', [context]);
    if (data == null) return null;

    return OpeningEnding.fromJson(data);
  }

  @override
  Future<Vtt?> getSeekThumbnail(EigaSourceContext context) async {
    final data = await _runtime.evalFn('__plugin.getSeekThumbnail', [context]);
    if (data == null) return null;

    return Vtt.fromJson(data);
  }

  @override
  Future<List<ServerSource>> getServers({
    required String eigaId,
    required EigaEpisode episode,
  }) async {
    return List.from(
      await _runtime.evalFn('__plugin.getServers', [
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
      await _runtime.evalFn('__plugin.getSource', [
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
      await _runtime.evalFn('__plugin.getSubtitles', [
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
      await _runtime.evalFn('__plugin.getSuggest', [
        {'metaEiga': metaEiga, 'eigaId': eigaId, 'page': page},
      ]),
    ).map((element) => Eiga.fromJson(element)).toList();
  }

  @override
  Future<String> getURL(String eigaId, {String? episodeId}) async {
    return await _runtime.evalFn('__plugin.getURL', [eigaId, episodeId]);
  }

  @override
  Future<EigaHome> home() async {
    return EigaHome.fromJson(await _runtime.evalFn('__plugin.home', const []));
  }

  @override
  Future<void> initState() async {
    init = ServiceInit.fromJson(await _runtime.evalAsyncJson('__plugin.init'));
    _$isAuth = await _runtime.evalAsyncJson('__plugin.\$isAuth');

    await super.initState();
  }

  @override
  Future<EigaCategory> search({
    required String keyword,
    required int page,
    required Map<String, List<String>?> filters,
    required bool quick,
  }) async {
    return EigaCategory.fromJson(
      await _runtime.evalFn('__plugin.search', [
        {'keyword': keyword, 'page': page, 'filters': filters, 'quick': quick},
      ]),
    );
  }

  @override
  Future<Paginate<EigaFollow>> getFollows({required int page}) async {
    final json = await _runtime.evalFn('__plugin.getFollows', [page]);

    return Paginate(
      items:
          List.from(
            json['items'],
          ).map((item) => EigaFollow.fromJson(item)).toList(),
      page: json['page'],
      totalItems: json['totalItems'],
      totalPages: json['totalPages'],
    );
  }

  @override
  Future<int> getFollowsCount(String eigaId) async {
    return await _runtime.evalFn('__plugin.getFollowsCount', [eigaId]);
  }

  @override
  Future<bool> isFollow(String eigaId) async {
    return await _runtime.evalFn('__plugin.isFollow', [eigaId]);
  }

  @override
  Future<void> setFollow(EigaContextWithEpisodes context, bool value) async {
    await _runtime.evalFn('__plugin.setFollow', [context, value]);
  }

  @override
  Future<List<EigaHistory>> getWatchHistory({required int page}) async {
    return List.from(
      await _runtime.evalFn('__plugin.getWatchHistory', [page]),
    ).map((element) => EigaHistory.fromJson(element)).toList();
  }

  @override
  Future<WatchTime> getWatchTime(EigaContext context) async {
    return WatchTime.fromJson(
      await _runtime.evalFn('__plugin.getWatchTime', [context]),
    );
  }

  @override
  Future<Map<String, WatchTimeUpdated>> getWatchTimeEpisodes({
    required String eigaId,
    required List<EigaEpisode> episodes,
  }) async {
    return await _runtime.evalFn('__plugin.getWatchTimeEpisodes', [
      {'eigaId': eigaId, 'episodes': episodes},
    ]);
  }

  @override
  Future<void> setWatchTime(
    EigaContext context, {
    required WatchTime watchTime,
  }) async {
    await _runtime.evalFn('__plugin.setWatchTime', [
      context,
      {'watchTime': watchTime},
    ]);
  }
}
