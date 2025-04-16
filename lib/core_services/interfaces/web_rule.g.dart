// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'web_rule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WebRuleImpl _$$WebRuleImplFromJson(Map<String, dynamic> json) =>
    _$WebRuleImpl(
      regexFilter: json['regexFilter'] as String,
      shortRegex: json['shortRegex'] as bool? ?? true,
      referer: json['referer'] as String,
    );

Map<String, dynamic> _$$WebRuleImplToJson(_$WebRuleImpl instance) =>
    <String, dynamic>{
      'regexFilter': instance.regexFilter,
      'shortRegex': instance.shortRegex,
      'referer': instance.referer,
    };
