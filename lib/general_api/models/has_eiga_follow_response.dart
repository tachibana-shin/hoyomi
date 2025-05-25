// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:freezed_annotation/freezed_annotation.dart';

part 'has_eiga_follow_response.freezed.dart';
part 'has_eiga_follow_response.g.dart';

/// Indicates if the user follows the specified eiga.
@Freezed()
abstract class HasEigaFollowResponse with _$HasEigaFollowResponse {
  const factory HasEigaFollowResponse({
    /// Whether the user is following this eiga.
    @JsonKey(name: 'has_follow')
    required bool hasFollow,
  }) = _HasEigaFollowResponse;
  
  factory HasEigaFollowResponse.fromJson(Map<String, Object?> json) => _$HasEigaFollowResponseFromJson(json);
}
