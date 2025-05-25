// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:freezed_annotation/freezed_annotation.dart';

import 'items2.dart';

part 'get_api_eiga_get_list_follow_response.freezed.dart';
part 'get_api_eiga_get_list_follow_response.g.dart';

@Freezed()
abstract class GetApiEigaGetListFollowResponse with _$GetApiEigaGetListFollowResponse {
  const factory GetApiEigaGetListFollowResponse({
    required List<Items2> items,
    required num totalItems,
    required num page,
    required num totalPages,
  }) = _GetApiEigaGetListFollowResponse;
  
  factory GetApiEigaGetListFollowResponse.fromJson(Map<String, Object?> json) => _$GetApiEigaGetListFollowResponseFromJson(json);
}
