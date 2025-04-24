// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_api_eiga_set_watch_time_response.freezed.dart';
part 'post_api_eiga_set_watch_time_response.g.dart';

@Freezed()
abstract class PostApiEigaSetWatchTimeResponse with _$PostApiEigaSetWatchTimeResponse {
  const factory PostApiEigaSetWatchTimeResponse({
    /// Indicates whether the watch time was successfully set.
    required bool success,
  }) = _PostApiEigaSetWatchTimeResponse;
  
  factory PostApiEigaSetWatchTimeResponse.fromJson(Map<String, Object?> json) => _$PostApiEigaSetWatchTimeResponseFromJson(json);
}
