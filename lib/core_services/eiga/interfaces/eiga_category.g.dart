// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'eiga_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EigaCategory _$EigaCategoryFromJson(Map<String, dynamic> json) => EigaCategory(
  name: json['name'] as String,
  url: json['url'] as String,
  description: json['description'] as String?,
  items:
      (json['items'] as List<dynamic>)
          .map((e) => Eiga.fromJson(e as Map<String, dynamic>))
          .toList(),
  page: (json['page'] as num).toInt(),
  totalItems: (json['totalItems'] as num).toInt(),
  totalPages: (json['totalPages'] as num).toInt(),
  filters:
      (json['filters'] as List<dynamic>?)
          ?.map((e) => Filter.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$EigaCategoryToJson(EigaCategory instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
      'description': instance.description,
      'filters': instance.filters,
      'items': instance.items,
      'page': instance.page,
      'totalItems': instance.totalItems,
      'totalPages': instance.totalPages,
    };
