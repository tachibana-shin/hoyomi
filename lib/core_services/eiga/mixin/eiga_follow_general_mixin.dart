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

  static Future<Paginate<EigaFollow>> getAllListFollow({
    required int page,
    StatusEnum? status,
  }) async {
    final user = await Authentication.instance.getUserAsync();
    if (user == null) throw UserNotFoundException();

    final idToken = await user.getIdTokenResult();

    final body = await _getClient().client.getApiEigaGetListFollow(
      page: page,
      status: status != null ? Status.fromJson(status.name) : null,
      authorization: 'Bearer ${idToken.token}',
      sourceId: '',
    );

    final items =
        body.items.map((item) {
          return EigaFollow(
            sourceId: item.sourceId,
            item: Eiga(
              name: item.name,
              eigaId: item.eigaTextId,
              originalName: item.originalName,
              image: OImage(src: item.poster),
            ),
            lastEpisode: EigaEpisode(
              name: item.episodeName,
              episodeId: item.episodeId,
              order: -1,
            ),
            updatedAt: DateTime.parse(item.createdAt),
          );
        }).toList();

    return Paginate(
      items: items,
      page: page,
      totalItems: body.totalItems,
      totalPages: body.totalPages,
    );
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

    return Paginate(
      items:
          body.items
              .map(
                (item) => EigaFollow(
                  sourceId: item.sourceId,
                  item: Eiga(
                    eigaId: item.eigaTextId,
                    name: item.name,
                    originalName: item.originalName,
                    image: OImage.from(item.poster),
                  ),
                  lastEpisode: EigaEpisode(
                    name: item.episodeName,
                    episodeId: item.episodeId,
                    order: -1,
                  ),
                  updatedAt: DateTime.parse(item.createdAt),
                ),
              )
              .toList(),
      page: body.page,
      totalItems: body.totalItems,
      totalPages: body.totalPages,
    );
  }

  @override
  getFollowsCount(_, _) {
    throw UnimplementedError();
  }

  @override
  isFollow(eigaId) async {
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
  setFollow(context, value) async {
    final user = await Authentication.instance.getUserAsync();
    if (user == null) throw UserNotFoundException();

    final idToken = await user.getIdTokenResult();

    await _getClient().client.postApiEigaSetFollow(
      body: SetEigaFollowBodySchema(
        sourceId: uid,
        eigaTextId: context.eigaId,
        name: context.metaEiga.name,
        originalName: context.metaEiga.originalName ?? '',
        status: SetEigaFollowBodySchemaStatus.fromJson(
          context.metaEiga.status.name,
        ),
        poster: context.metaEiga.image.src,
        seasonName: context.season?.name ?? '',
        currentEpisodeName: context.episodes.sortAsc.last.name,
        // currentEpisodeFullName: metaEiga.episodes.sortAsc.last.fullName ?? '',
        currentEpisodeId: context.episodes.sortAsc.last.episodeId,
        currentEpisodeTime:
            // context.episodes.sortAsc.last. ??
            DateTime.now(),
        value: value,
      ),
      authorization: 'Bearer ${idToken.token}',
    );
  }
}
