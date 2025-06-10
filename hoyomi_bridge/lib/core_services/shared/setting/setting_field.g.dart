// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setting_field.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SettingField _$SettingFieldFromJson(Map<String, dynamic> json) =>
    _SettingField(
      name: json['name'] as String,
      key: json['key'] as String,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$SettingFieldToJson(_SettingField instance) =>
    <String, dynamic>{
      'name': instance.name,
      'key': instance.key,
      'description': instance.description,
    };
