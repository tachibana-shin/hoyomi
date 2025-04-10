// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'headers.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HeadersImpl _$$HeadersImplFromJson(Map<String, dynamic> json) =>
    _$HeadersImpl(
      headers: (json['headers'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(
                k, (e as List<dynamic>).map((e) => e as String).toList()),
          ) ??
          const {},
    );

Map<String, dynamic> _$$HeadersImplToJson(_$HeadersImpl instance) =>
    <String, dynamic>{
      'headers': instance.headers,
    };
