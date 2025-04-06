// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OptionImpl _$$OptionImplFromJson(Map<String, dynamic> json) => _$OptionImpl(
      name: json['name'] as String,
      value: json['value'] as String,
      selected: json['selected'] as bool? ?? false,
    );

Map<String, dynamic> _$$OptionImplToJson(_$OptionImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'value': instance.value,
      'selected': instance.selected,
    };

_$FilterImpl _$$FilterImplFromJson(Map<String, dynamic> json) => _$FilterImpl(
      name: json['name'] as String,
      key: json['key'] as String,
      multiple: json['multiple'] as bool,
      options: (json['options'] as List<dynamic>)
          .map((e) => Option.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$FilterImplToJson(_$FilterImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'key': instance.key,
      'multiple': instance.multiple,
      'options': instance.options,
    };
