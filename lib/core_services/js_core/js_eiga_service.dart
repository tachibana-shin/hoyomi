import 'dart:convert';

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
      await _runtime.evalAsyncJson(
        '__plugin.fetchSourceContent(${jsonEncode({'source': source})})',
      ),
    );
  }

  @override
  Future<EigaCategory> getCategory({
    required String categoryId,
    required int page,
    required Map<String, List<String>?> filters,
  }) async {
    return EigaCategory.fromJson(
      await _runtime.evalAsyncJson(
        '__plugin.getCategory(${jsonEncode({'categoryId': categoryId, 'page': page, 'filters': filters})})',
      ),
    );
  }

  @override
  Future<MetaEiga> getDetails(String eigaId) async {
    return MetaEiga.fromJson(
      await _runtime.evalAsyncJson(
        '__plugin.getDetails(${jsonEncode(eigaId)})',
      ),
    );
  }

  @override
  Future<EigaEpisodes> getEpisodes(String eigaId) async {
    return EigaEpisodes.fromJson(
      await _runtime.evalAsyncJson(
        '__plugin.getEpisodes(${jsonEncode(eigaId)})',
      ),
    );
  }

  @override
  Future<OpeningEnding?> getOpeningEnding(EigaSourceContext context) async {
    final data = await _runtime.evalAsyncJsonOrNull(
      '__plugin.getOpeningEnding(${jsonEncode(context.toJson())})',
    );
    if (data == null) return null;

    return OpeningEnding.fromJson(data);
  }

  @override
  Future<Vtt?> getSeekThumbnail(EigaSourceContext context) async {
    final data = await _runtime.evalAsyncJsonOrNull(
      '__plugin.getSeekThumbnail(${jsonEncode(context.toJson())})',
    );
    if (data == null) return null;

    return Vtt.fromJson(data);
  }

  @override
  Future<List<ServerSource>> getServers({
    required String eigaId,
    required EigaEpisode episode,
  }) async {
    return List.from(
      await _runtime.evalAsyncJson(
        '__plugin.getServers(${jsonEncode({'eigaId': eigaId, 'episode': episode})})',
      ),
    ).map((element) => ServerSource.fromJson(element)).toList();
  }

  @override
  Future<SourceVideo> getSource({
    required String eigaId,
    required EigaEpisode episode,
    ServerSource? server,
  }) async {
    return SourceVideo.fromJson(
      await _runtime.evalAsyncJson(
        '__plugin.getSource(${jsonEncode({'eigaId': eigaId, 'episode': episode, 'server': server})})',
      ),
    );
  }

  @override
  Future<List<Subtitle>> getSubtitles({
    required String eigaId,
    required EigaEpisode episode,
    required SourceVideo source,
  }) async {
    return List.from(
      await _runtime.evalAsyncJson(
        '__plugin.getSubtitles(${jsonEncode({'eigaId': eigaId, 'episode': episode, 'source': source})})',
      ),
    ).map((element) => Subtitle.fromJson(element)).toList();
  }

  @override
  Future<List<Eiga>> getSuggest({
    required MetaEiga metaEiga,
    required String eigaId,
    int? page,
  }) async {
    return List.from(
      await _runtime.evalAsyncJson(
        '__plugin.getSuggest(${jsonEncode({'metaEiga': metaEiga, 'eigaId': eigaId, 'page': page})})',
      ),
    ).map((element) => Eiga.fromJson(element)).toList();
  }

  @override
  Future<String> getURL(String eigaId, {String? episodeId}) async {
    return await _runtime.evalAsyncJson(
      '__plugin.getURL(${jsonEncode(eigaId)}, ${jsonEncode({'episodeId': episodeId})})',
    );
  }

  @override
  Future<EigaHome> home() async {
    return EigaHome.fromJson(
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
  Future<EigaCategory> search({
    required String keyword,
    required int page,
    required Map<String, List<String>?> filters,
    required bool quick,
  }) async {
    return EigaCategory.fromJson(
      await _runtime.evalAsyncJson(
        '__plugin.search(${jsonEncode({'keyword': keyword, 'page': page, 'filters': filters, 'quick': quick})})',
      ),
    );
  }
}
