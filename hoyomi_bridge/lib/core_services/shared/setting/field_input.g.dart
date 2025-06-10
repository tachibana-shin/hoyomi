// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'field_input.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FieldInput _$FieldInputFromJson(Map<String, dynamic> json) => _FieldInput(
      name: json['name'] as String,
      key: json['key'] as String,
      description: json['description'] as String?,
      placeholder: json['placeholder'] as String,
      defaultValue: json['defaultValue'] as String,
      maxLines: (json['maxLines'] as num?)?.toInt() ?? 1,
      appear: json['appear'] as bool? ?? false,
    );

Map<String, dynamic> _$FieldInputToJson(_FieldInput instance) =>
    <String, dynamic>{
      'name': instance.name,
      'key': instance.key,
      'description': instance.description,
      'placeholder': instance.placeholder,
      'defaultValue': instance.defaultValue,
      'maxLines': instance.maxLines,
      'appear': instance.appear,
    };
