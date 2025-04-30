// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_comic_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HomeComicCategory _$HomeComicCategoryFromJson(Map<String, dynamic> json) =>
    _HomeComicCategory(
      name: json['name'] as String,
      categoryId: json['categoryId'] as String?,
      gridView: json['gridView'] as bool?,
      items:
          (json['items'] as List<dynamic>)
              .map((e) => Comic.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$HomeComicCategoryToJson(_HomeComicCategory instance) =>
    <String, dynamic>{
      'name': instance.name,
      'categoryId': instance.categoryId,
      'gridView': instance.gridView,
      'items': instance.items,
    };
