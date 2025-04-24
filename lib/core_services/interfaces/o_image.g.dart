// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'o_image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OImage _$OImageFromJson(Map<String, dynamic> json) => _OImage(
      src: json['src'] as String,
      headers: json['headers'] == null
          ? null
          : Headers.fromJson(json['headers'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OImageToJson(_OImage instance) => <String, dynamic>{
      'src': instance.src,
      'headers': instance.headers,
    };
