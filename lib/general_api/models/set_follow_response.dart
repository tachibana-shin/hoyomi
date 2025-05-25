// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:freezed_annotation/freezed_annotation.dart';

part 'set_follow_response.freezed.dart';
part 'set_follow_response.g.dart';

/// Indicates if the follow/unfollow operation succeeded.
@Freezed()
abstract class SetFollowResponse with _$SetFollowResponse {
  const factory SetFollowResponse({
    /// Whether the operation was successful.
    required bool ok,
  }) = _SetFollowResponse;
  
  factory SetFollowResponse.fromJson(Map<String, Object?> json) => _$SetFollowResponseFromJson(json);
}
