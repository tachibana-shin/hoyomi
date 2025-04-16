// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'web_rule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WebRuleImpl _$$WebRuleImplFromJson(Map<String, dynamic> json) =>
    _$WebRuleImpl(
      regexFilter: json['regexFilter'] as String?,
      shortRegexFilter: json['shortRegexFilter'] as String?,
      urlFilter: json['urlFilter'] as String?,
      referer: json['referer'] as String,
    );

Map<String, dynamic> _$$WebRuleImplToJson(_$WebRuleImpl instance) =>
    <String, dynamic>{
      'regexFilter': instance.regexFilter,
      'shortRegexFilter': instance.shortRegexFilter,
      'urlFilter': instance.urlFilter,
      'referer': instance.referer,
    };
