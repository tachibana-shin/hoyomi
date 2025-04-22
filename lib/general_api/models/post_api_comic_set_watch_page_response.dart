// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_api_comic_set_watch_page_response.freezed.dart';
part 'post_api_comic_set_watch_page_response.g.dart';

@Freezed()
class PostApiComicSetWatchPageResponse with _$PostApiComicSetWatchPageResponse {
  const factory PostApiComicSetWatchPageResponse({
    /// Indicates whether the watch page was successfully set.
    required bool success,
  }) = _PostApiComicSetWatchPageResponse;

  factory PostApiComicSetWatchPageResponse.fromJson(
          Map<String, Object?> json) =>
      _$PostApiComicSetWatchPageResponseFromJson(json);
}
