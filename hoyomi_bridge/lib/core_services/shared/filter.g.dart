// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Filter _$FilterFromJson(Map<String, dynamic> json) => _Filter(
      name: json['name'] as String,
      key: json['key'] as String,
      multiple: json['multiple'] as bool,
      options: (json['options'] as List<dynamic>)
          .map((e) => Option.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FilterToJson(_Filter instance) => <String, dynamic>{
      'name': instance.name,
      'key': instance.key,
      'multiple': instance.multiple,
      'options': instance.options,
    };
