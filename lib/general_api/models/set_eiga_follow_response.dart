// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:freezed_annotation/freezed_annotation.dart';

part 'set_eiga_follow_response.freezed.dart';
part 'set_eiga_follow_response.g.dart';

/// Indicates if the follow/unfollow operation succeeded.
@Freezed()
abstract class SetEigaFollowResponse with _$SetEigaFollowResponse {
  const factory SetEigaFollowResponse({
    /// Whether the operation was successful.
    required bool ok,
  }) = _SetEigaFollowResponse;
  
  factory SetEigaFollowResponse.fromJson(Map<String, Object?> json) => _$SetEigaFollowResponseFromJson(json);
}
