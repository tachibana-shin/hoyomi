// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_watch_time_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ListWatchTimeSchemaImpl _$$ListWatchTimeSchemaImplFromJson(
        Map<String, dynamic> json) =>
    _$ListWatchTimeSchemaImpl(
      data: (json['data'] as List<dynamic>)
          .map((e) => Data2.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ListWatchTimeSchemaImplToJson(
        _$ListWatchTimeSchemaImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
