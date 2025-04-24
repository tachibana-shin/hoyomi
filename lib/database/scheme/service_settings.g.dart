// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ServiceSettings _$ServiceSettingsFromJson(Map<String, dynamic> json) =>
    _ServiceSettings(
      sourceId: json['sourceId'] as String,
      settings: json['settings'] as Map<String, dynamic>?,
      userDataCache: json['userDataCache'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$ServiceSettingsToJson(_ServiceSettings instance) =>
    <String, dynamic>{
      'sourceId': instance.sourceId,
      'settings': instance.settings,
      'userDataCache': instance.userDataCache,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
