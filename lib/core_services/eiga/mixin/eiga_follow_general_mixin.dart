import 'package:dio/dio.dart' hide Headers;
import 'package:hoyomi/core_services/eiga/export.dart';
import 'package:hoyomi/core_services/exception/user_not_found_exception.dart';
import 'package:hoyomi/env.dart';
import 'package:hoyomi/general_api/export.dart';
import 'package:hoyomi/utils/authentication.dart';

mixin EigaFollowGeneralMixin on Service implements EigaFollowMixin {
  static final _baseApiGeneral = Env.baseApiGeneral;
  static GeneralApiClient? _client;

  static GeneralApiClient _getClient() {
    return _client ??= GeneralApiClient(
      Dio(BaseOptions(contentType: 'application/json')),
      baseUrl: _baseApiGeneral,
    );
  }

  /// General watch page support but service not auth
  @override
  bool get $noAuth => !($isAuth ?? false);

  @override
  Future<User> getUser({required String cookie}) {
    throw UnimplementedError();
  }

  @override
  getFollows({required page}) async {
    final user = await Authentication.instance.getUserAsync();
    if (user == null) throw UserNotFoundException();

    final idToken = await user.getIdTokenResult();

    final body = await _getClient().client.getApiEigaGetListFollow(
      sourceId: uid,
      page: page,
      authorization: 'Bearer ${idToken.token}',
    );

    return EigaCategory(
      name: '',
      url: '',
      items:
          body.items
              .map(
                (item) => Eiga(
                  eigaId: item.eigaTextId,
                  name: item.name,
                  originalName: item.originalName,
                  image: OImage.from(item.poster),
                ),
              )
              .toList(),
      page: body.page,
      totalItems: body.totalItems,
      totalPages: body.totalPages,
    );
  }

  @override
  isFollow({required eigaId}) async {
    final user = await Authentication.instance.getUserAsync();
    if (user == null) throw UserNotFoundException();

    final idToken = await user.getIdTokenResult();

    final body = await _getClient().client.getApiEigaHasFollow(
      sourceId: uid,
      eigaTextId: eigaId,
      authorization: 'Bearer ${idToken.token}',
    );

    return body.hasFollow;
  }

  @override
  setFollow({required eigaId, required metaEiga, required value}) async {
    final user = await Authentication.instance.getUserAsync();
    if (user == null) throw UserNotFoundException();

    final idToken = await user.getIdTokenResult();

    await _getClient().client.postApiEigaSetFollow(
      body: SetEigaFollowBodySchema(
        sourceId: uid,
        eigaTextId: eigaId,
        name: metaEiga.name,
        originalName: metaEiga.originalName ?? '',
        poster: metaEiga.image.src,
        seasonName: '',
        currentEpisodeName: metaEiga.episodes.sortAsc.last.name,
        // currentEpisodeFullName: metaEiga.episodes.sortAsc.last.fullName ?? '',
        currentEpisodeId: metaEiga.episodes.sortAsc.last.episodeId,
        currentEpisodeTime:
            metaEiga.episodes.sortAsc.last.time ?? DateTime.now(),
        value: value,
      ),
      authorization: 'Bearer ${idToken.token}',
    );
  }
}
