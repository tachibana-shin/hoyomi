// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'o_image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OImageImpl _$$OImageImplFromJson(Map<String, dynamic> json) => _$OImageImpl(
      src: json['src'] as String,
      headers: json['headers'] == null
          ? null
          : Headers.fromJson(json['headers'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$OImageImplToJson(_$OImageImpl instance) =>
    <String, dynamic>{
      'src': instance.src,
      'headers': instance.headers,
    };
