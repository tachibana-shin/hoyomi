// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:freezed_annotation/freezed_annotation.dart';

import 'items.dart';

part 'get_api_comic_get_list_follow_response.freezed.dart';
part 'get_api_comic_get_list_follow_response.g.dart';

@Freezed()
abstract class GetApiComicGetListFollowResponse with _$GetApiComicGetListFollowResponse {
  const factory GetApiComicGetListFollowResponse({
    required List<Items> items,
    required num totalItems,
    required num page,
    required num totalPages,
  }) = _GetApiComicGetListFollowResponse;
  
  factory GetApiComicGetListFollowResponse.fromJson(Map<String, Object?> json) => _$GetApiComicGetListFollowResponseFromJson(json);
}
