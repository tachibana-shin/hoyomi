// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'headers.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Headers _$HeadersFromJson(Map<String, dynamic> json) => _Headers(
  headers:
      (json['headers'] as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry(k, (e as List<dynamic>).map((e) => e as String).toList()),
      ) ??
      const {},
);

Map<String, dynamic> _$HeadersToJson(_Headers instance) => <String, dynamic>{
  'headers': instance.headers,
};
