// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_init.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ServiceInit _$ServiceInitFromJson(Map<String, dynamic> json) => _ServiceInit(
  name: json['name'] as String,
  uid: json['uid'] as String?,
  faviconUrl: OImage.fromJson(json['faviconUrl'] as Map<String, dynamic>),
  rootUrl: json['rootUrl'] as String,
  version: json['version'] as String?,
  description: json['description'] as String?,
  language: json['language'] as String?,
  settings:
      (json['settings'] as List<dynamic>?)
          ?.map((e) => SettingField.fromJson(e as Map<String, dynamic>))
          .toList(),
  webRules:
      (json['webRules'] as List<dynamic>?)
          ?.map((e) => WebRule.fromJson(e as Map<String, dynamic>))
          .toList(),
  fetchHeadless: json['fetchHeadless'] as bool? ?? false,
  fetchBaseUrl: json['fetchBaseUrl'] as String?,
  captchaUrl: json['captchaUrl'] as String?,
  customCookie: json['customCookie'] as String?,
);

Map<String, dynamic> _$ServiceInitToJson(_ServiceInit instance) =>
    <String, dynamic>{
      'name': instance.name,
      'uid': instance.uid,
      'faviconUrl': instance.faviconUrl,
      'rootUrl': instance.rootUrl,
      'version': instance.version,
      'description': instance.description,
      'language': instance.language,
      'settings': instance.settings,
      'webRules': instance.webRules,
      'fetchHeadless': instance.fetchHeadless,
      'fetchBaseUrl': instance.fetchBaseUrl,
      'captchaUrl': instance.captchaUrl,
      'customCookie': instance.customCookie,
    };
