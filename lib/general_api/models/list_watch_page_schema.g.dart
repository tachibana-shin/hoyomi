// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_watch_page_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ListWatchPageSchema _$ListWatchPageSchemaFromJson(Map<String, dynamic> json) =>
    _ListWatchPageSchema(
      data: (json['data'] as List<dynamic>)
          .map((e) => Data2.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListWatchPageSchemaToJson(
  _ListWatchPageSchema instance,
) => <String, dynamic>{'data': instance.data};
