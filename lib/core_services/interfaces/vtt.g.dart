// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vtt.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VttImpl _$$VttImplFromJson(Map<String, dynamic> json) => _$VttImpl(
      src: json['src'] as String,
      headers: (json['headers'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
    );

Map<String, dynamic> _$$VttImplToJson(_$VttImpl instance) => <String, dynamic>{
      'src': instance.src,
      'headers': instance.headers,
    };
