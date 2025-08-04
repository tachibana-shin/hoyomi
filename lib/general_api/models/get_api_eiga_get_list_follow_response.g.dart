// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_api_eiga_get_list_follow_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GetApiEigaGetListFollowResponse _$GetApiEigaGetListFollowResponseFromJson(
  Map<String, dynamic> json,
) => _GetApiEigaGetListFollowResponse(
  items: (json['items'] as List<dynamic>)
      .map((e) => Items2.fromJson(e as Map<String, dynamic>))
      .toList(),
  totalItems: (json['totalItems'] as num).toInt(),
  page: (json['page'] as num).toInt(),
  totalPages: (json['totalPages'] as num).toInt(),
);

Map<String, dynamic> _$GetApiEigaGetListFollowResponseToJson(
  _GetApiEigaGetListFollowResponse instance,
) => <String, dynamic>{
  'items': instance.items,
  'totalItems': instance.totalItems,
  'page': instance.page,
  'totalPages': instance.totalPages,
};
