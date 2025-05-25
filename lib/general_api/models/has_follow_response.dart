// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:freezed_annotation/freezed_annotation.dart';

part 'has_follow_response.freezed.dart';
part 'has_follow_response.g.dart';

/// Indicates if the user follows the specified comic.
@Freezed()
abstract class HasFollowResponse with _$HasFollowResponse {
  const factory HasFollowResponse({
    /// Whether the user is following this comic.
    @JsonKey(name: 'has_follow')
    required bool hasFollow,
  }) = _HasFollowResponse;
  
  factory HasFollowResponse.fromJson(Map<String, Object?> json) => _$HasFollowResponseFromJson(json);
}
