// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_eiga_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HomeEigaCategory _$HomeEigaCategoryFromJson(Map<String, dynamic> json) =>
    _HomeEigaCategory(
      name: json['name'] as String,
      categoryId: json['categoryId'] as String?,
      gridView: json['gridView'] as bool? ?? false,
      items:
          (json['items'] as List<dynamic>)
              .map((e) => Eiga.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$HomeEigaCategoryToJson(_HomeEigaCategory instance) =>
    <String, dynamic>{
      'name': instance.name,
      'categoryId': instance.categoryId,
      'gridView': instance.gridView,
      'items': instance.items,
    };
