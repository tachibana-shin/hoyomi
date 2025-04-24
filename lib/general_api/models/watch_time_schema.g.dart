// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'watch_time_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WatchTimeSchema _$WatchTimeSchemaFromJson(Map<String, dynamic> json) =>
    _WatchTimeSchema(
      data: json['data'] == null
          ? null
          : Data3.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WatchTimeSchemaToJson(_WatchTimeSchema instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
