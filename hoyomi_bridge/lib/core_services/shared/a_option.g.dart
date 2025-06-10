// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'a_option.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Option _$OptionFromJson(Map<String, dynamic> json) => _Option(
      name: json['name'] as String,
      value: json['value'] as String,
      selected: json['selected'] as bool? ?? false,
    );

Map<String, dynamic> _$OptionToJson(_Option instance) => <String, dynamic>{
      'name': instance.name,
      'value': instance.value,
      'selected': instance.selected,
    };
