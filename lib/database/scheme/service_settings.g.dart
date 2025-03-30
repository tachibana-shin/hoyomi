// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ServiceSettingsImpl _$$ServiceSettingsImplFromJson(
        Map<String, dynamic> json) =>
    _$ServiceSettingsImpl(
      sourceId: json['sourceId'] as String,
      settings: json['settings'] as Map<String, dynamic>?,
      userDataCache: json['userDataCache'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$ServiceSettingsImplToJson(
        _$ServiceSettingsImpl instance) =>
    <String, dynamic>{
      'sourceId': instance.sourceId,
      'settings': instance.settings,
      'userDataCache': instance.userDataCache,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
