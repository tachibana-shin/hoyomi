// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/list_watch_history.dart';
import '../models/list_watch_time_schema.dart';
import '../models/post_api_comic_set_watch_page_response.dart';
import '../models/post_api_eiga_set_watch_time_response.dart';
import '../models/query_schema.dart';
import '../models/watch_time_schema.dart';

part 'client_client.g.dart';

@RestApi()
abstract class ClientClient {
  factory ClientClient(Dio dio, {String? baseUrl}) = _ClientClient;

  @GET('/api/comic/get-watch-history')
  Future<ListWatchHistory> getApiComicGetWatchHistory({
    @Query('sourceId') required String sourceId,
    @Query('page') required num page,
    @Header('Authorization') required String authorization,
  });

  @GET('/api/comic/get-watch-page-episodes')
  Future<ListWatchTimeSchema> getApiComicGetWatchPageEpisodes({
    @Query('sourceId') required String sourceId,
    @Query('comic_text_id') required String comicTextId,
    @Header('Authorization') required String authorization,
  });

  @GET('/api/comic/get-watch-page')
  Future<WatchTimeSchema> getApiComicGetWatchPage({
    @Query('sourceId') required String sourceId,
    @Query('comic_text_id') required String comicTextId,
    @Query('chap_id') required String chapId,
    @Header('Authorization') required String authorization,
  });

  @POST('/api/comic/set-watch-page')
  Future<PostApiComicSetWatchPageResponse> postApiComicSetWatchPage({
    @Header('Authorization') required String authorization,
    @Body() required QuerySchema body,
  });

  @GET('/api/eiga/get-watch-history')
  Future<dynamic> getApiEigaGetWatchHistory({
    @Query('sourceId') required String sourceId,
    @Query('page') required num page,
    @Header('Authorization') required String authorization,
  });

  @GET('/api/eiga/get-watch-time-episodes')
  Future<dynamic> getApiEigaGetWatchTimeEpisodes({
    @Query('sourceId') required String sourceId,
    @Query('eiga_text_id') required String eigaTextId,
    @Header('Authorization') required String authorization,
  });

  @GET('/api/eiga/get-watch-time')
  Future<dynamic> getApiEigaGetWatchTime({
    @Query('sourceId') required String sourceId,
    @Query('eiga_text_id') required String eigaTextId,
    @Query('chap_id') required String chapId,
    @Header('Authorization') required String authorization,
  });

  @POST('/api/eiga/set-watch-time')
  Future<PostApiEigaSetWatchTimeResponse> postApiEigaSetWatchTime({
    @Header('Authorization') required String authorization,
    @Body() required dynamic body,
  });
}
