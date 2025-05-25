// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_api_comic_get_list_follow_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GetApiComicGetListFollowResponse _$GetApiComicGetListFollowResponseFromJson(
  Map<String, dynamic> json,
) => _GetApiComicGetListFollowResponse(
  items:
      (json['items'] as List<dynamic>)
          .map((e) => Items.fromJson(e as Map<String, dynamic>))
          .toList(),
  totalItems: json['totalItems'] as num,
  page: json['page'] as num,
  totalPages: json['totalPages'] as num,
);

Map<String, dynamic> _$GetApiComicGetListFollowResponseToJson(
  _GetApiComicGetListFollowResponse instance,
) => <String, dynamic>{
  'items': instance.items,
  'totalItems': instance.totalItems,
  'page': instance.page,
  'totalPages': instance.totalPages,
};
