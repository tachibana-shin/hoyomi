// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_eiga_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HomeEigaCategoryImpl _$$HomeEigaCategoryImplFromJson(
        Map<String, dynamic> json) =>
    _$HomeEigaCategoryImpl(
      name: json['name'] as String,
      categoryId: json['categoryId'] as String?,
      gridView: json['gridView'] as bool?,
      items: (json['items'] as List<dynamic>)
          .map((e) => Eiga.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$HomeEigaCategoryImplToJson(
        _$HomeEigaCategoryImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'categoryId': instance.categoryId,
      'gridView': instance.gridView,
      'items': instance.items,
    };
