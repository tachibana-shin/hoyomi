// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'web_rule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WebRule _$WebRuleFromJson(Map<String, dynamic> json) => _WebRule(
  regexFilter: json['regexFilter'] as String?,
  shortRegexFilter: json['shortRegexFilter'] as String?,
  urlFilter: json['urlFilter'] as String?,
  referer: json['referer'] as String,
);

Map<String, dynamic> _$WebRuleToJson(_WebRule instance) => <String, dynamic>{
  'regexFilter': instance.regexFilter,
  'shortRegexFilter': instance.shortRegexFilter,
  'urlFilter': instance.urlFilter,
  'referer': instance.referer,
};
