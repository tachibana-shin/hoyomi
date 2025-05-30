import 'package:dio/dio.dart' hide Headers;
import 'package:hoyomi/core_services/exception/user_not_found_exception.dart';
import 'package:hoyomi/env.dart';
import 'package:hoyomi/general_api/export.dart';
import 'package:hoyomi/utils/authentication.dart';

import '../main.dart';

export 'package:hoyomi/general_api/export.dart' show Ignore;

mixin ComicFollowGeneralMixin on Service implements ComicFollowMixin {
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

  static Future<Paginate<ComicFollow>> getAllListFollow({
    required int page,
    StatusEnum? status,
    List<Ignore>? ignore,
  }) async {
    final user = await Authentication.instance.getUserAsync();
    if (user == null) throw UserNotFoundException();

    final idToken = await user.getIdTokenResult();

    final body = await _getClient().client.getApiComicGetListFollow(
      page: page,
      status: status != null ? Status.fromJson(status.name) : null,
      ignore: ignore,
      authorization: 'Bearer ${idToken.token}',
      sourceId: '',
    );

    final items =
        body.items.map((item) {
          return ComicFollow(
            sourceId: item.sourceId,
            item: Comic(
              name: item.name,
              comicId: item.comicTextId,
              originalName: item.originalName,
              image: OImage(src: item.poster),
            ),
            updatedAt: DateTime.parse(item.createdAt),
            lastChapter: ComicChapter(
              name: item.chapterName,
              chapterId: item.chapterId,
              order: -1,
            ),
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

    final body = await _getClient().client.getApiComicGetListFollow(
      sourceId: uid,
      page: page,
      authorization: 'Bearer ${idToken.token}',
    );

    return Paginate(
      items:
          body.items
              .map(
                (item) => ComicFollow(
                  sourceId: item.sourceId,
                  item: Comic(
                    comicId: item.comicTextId,
                    name: item.name,
                    originalName: item.originalName,
                    image: OImage.from(item.poster),
                  ),
                  updatedAt: DateTime.parse(item.createdAt),
                  lastChapter: ComicChapter(
                    name: item.chapterName,
                    chapterId: item.chapterId,
                    order: -1,
                  ),
                ),
              )
              .toList(),
      page: body.page,
      totalItems: body.totalItems,
      totalPages: body.totalPages,
    );
  }

  @override
  isFollow({required comicId}) async {
    final user = await Authentication.instance.getUserAsync();
    if (user == null) throw UserNotFoundException();

    final idToken = await user.getIdTokenResult();

    final body = await _getClient().client.getApiComicHasFollow(
      sourceId: uid,
      comicTextId: comicId,
      authorization: 'Bearer ${idToken.token}',
    );

    return body.hasFollow;
  }

  @override
  setFollow({required comicId, required metaComic, required value}) async {
    final user = await Authentication.instance.getUserAsync();
    if (user == null) throw UserNotFoundException();

    final idToken = await user.getIdTokenResult();

    await _getClient().client.postApiComicSetFollow(
      body: SetFollowBodySchema(
        sourceId: uid,
        comicTextId: comicId,
        name: metaComic.name,
        originalName: metaComic.originalName ?? '',
        poster: metaComic.image.src,
        seasonName: '',
        status: SetFollowBodySchemaStatus.fromJson(metaComic.status.name),
        currentChapterName: metaComic.chapters.sortAsc.last.name,
        currentChapterFullName: metaComic.chapters.sortAsc.last.fullName ?? '',
        currentChapterId: metaComic.chapters.sortAsc.last.chapterId,
        currentChapterTime:
            metaComic.chapters.sortAsc.last.time ?? DateTime.now(),
        value: value,
      ),
      authorization: 'Bearer ${idToken.token}',
    );
  }
}
