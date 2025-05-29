// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/comic_list_watch_history.dart';
import '../models/eiga_list_watch_history.dart';
import '../models/get_api_comic_get_list_follow_response.dart';
import '../models/get_api_eiga_get_list_follow_response.dart';
import '../models/has_eiga_follow_response.dart';
import '../models/has_follow_response.dart';
import '../models/list_watch_page_schema.dart';
import '../models/list_watch_time_schema.dart';
import '../models/post_api_comic_set_watch_page_response.dart';
import '../models/post_api_eiga_set_watch_time_response.dart';
import '../models/set_eiga_follow_body_schema.dart';
import '../models/set_eiga_follow_response.dart';
import '../models/set_follow_body_schema.dart';
import '../models/set_follow_response.dart';
import '../models/set_watch_page_body_schema.dart';
import '../models/set_watch_time_body_schema.dart';
import '../models/status.dart';
import '../models/watch_page_schema.dart';
import '../models/watch_time_schema.dart';

part 'client_client.g.dart';

@RestApi()
abstract class ClientClient {
  factory ClientClient(Dio dio, {String? baseUrl}) = _ClientClient;

  @GET('/api/comic/get-watch-history')
  Future<ComicListWatchHistory> getApiComicGetWatchHistory({
    @Query('sourceId') required String sourceId,
    @Query('page') required num page,
    @Header('Authorization') required String authorization,
  });

  @GET('/api/comic/get-watch-page-episodes')
  Future<ListWatchPageSchema> getApiComicGetWatchPageEpisodes({
    @Query('sourceId') required String sourceId,
    @Query('comic_text_id') required String comicTextId,
    @Header('Authorization') required String authorization,
  });

  @GET('/api/comic/get-watch-page')
  Future<WatchPageSchema> getApiComicGetWatchPage({
    @Query('sourceId') required String sourceId,
    @Query('comic_text_id') required String comicTextId,
    @Query('chap_id') required String chapId,
    @Header('Authorization') required String authorization,
  });

  @POST('/api/comic/set-watch-page')
  Future<PostApiComicSetWatchPageResponse> postApiComicSetWatchPage({
    @Header('Authorization') required String authorization,
    @Body() required SetWatchPageBodySchema body,
  });

  @GET('/api/comic/has-follow')
  Future<HasFollowResponse> getApiComicHasFollow({
    @Query('sourceId') required String sourceId,
    @Query('comic_text_id') required String comicTextId,
    @Header('Authorization') required String authorization,
  });

  @POST('/api/comic/set-follow')
  Future<SetFollowResponse> postApiComicSetFollow({
    @Header('Authorization') required String authorization,
    @Body() SetFollowBodySchema? body,
  });

  @GET('/api/comic/get-list-follow')
  Future<GetApiComicGetListFollowResponse> getApiComicGetListFollow({
    @Header('Authorization') required String authorization,
    @Query('page') int page = 1,
    @Query('limit') int limit = 20,
    @Query('sourceId') String? sourceId,
    @Query('status') Status? status,
  });

  @GET('/api/eiga/get-watch-history')
  Future<EigaListWatchHistory> getApiEigaGetWatchHistory({
    @Query('sourceId') required String sourceId,
    @Query('page') required num page,
    @Header('Authorization') required String authorization,
  });

  @GET('/api/eiga/get-watch-time-episodes')
  Future<ListWatchTimeSchema> getApiEigaGetWatchTimeEpisodes({
    @Query('sourceId') required String sourceId,
    @Query('eiga_text_id') required String eigaTextId,
    @Header('Authorization') required String authorization,
  });

  @GET('/api/eiga/get-watch-time')
  Future<WatchTimeSchema> getApiEigaGetWatchTime({
    @Query('sourceId') required String sourceId,
    @Query('eiga_text_id') required String eigaTextId,
    @Query('chap_id') required String chapId,
    @Header('Authorization') required String authorization,
  });

  @POST('/api/eiga/set-watch-time')
  Future<PostApiEigaSetWatchTimeResponse> postApiEigaSetWatchTime({
    @Header('Authorization') required String authorization,
    @Body() required SetWatchTimeBodySchema body,
  });

  @GET('/api/eiga/has-follow')
  Future<HasEigaFollowResponse> getApiEigaHasFollow({
    @Query('sourceId') required String sourceId,
    @Query('eiga_text_id') required String eigaTextId,
    @Header('Authorization') required String authorization,
  });

  @POST('/api/eiga/set-follow')
  Future<SetEigaFollowResponse> postApiEigaSetFollow({
    @Header('Authorization') required String authorization,
    @Body() SetEigaFollowBodySchema? body,
  });

  @GET('/api/eiga/get-list-follow')
  Future<GetApiEigaGetListFollowResponse> getApiEigaGetListFollow({
    @Header('Authorization') required String authorization,
    @Query('page') int page = 1,
    @Query('limit') int limit = 20,
    @Query('sourceId') String? sourceId,
    @Query('status') Status? status,
  });
}
