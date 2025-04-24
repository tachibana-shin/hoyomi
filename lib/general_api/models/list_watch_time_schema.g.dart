// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_watch_time_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ListWatchTimeSchema _$ListWatchTimeSchemaFromJson(Map<String, dynamic> json) =>
    _ListWatchTimeSchema(
      data:
          (json['data'] as List<dynamic>)
              .map((e) => Data2.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$ListWatchTimeSchemaToJson(
  _ListWatchTimeSchema instance,
) => <String, dynamic>{'data': instance.data};
