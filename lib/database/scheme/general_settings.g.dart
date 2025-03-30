// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'general_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GeneralSettingsImpl _$$GeneralSettingsImplFromJson(
        Map<String, dynamic> json) =>
    _$GeneralSettingsImpl(
      mangaReadLazyPage: json['mangaReadLazyPage'] as bool? ?? false,
      lastCheckUpdateApp: json['lastCheckUpdateApp'] == null
          ? null
          : DateTime.parse(json['lastCheckUpdateApp'] as String),
      brightnessApp: (json['brightnessApp'] as num?)?.toDouble() ?? null,
      pollingIntervalComic:
          (json['pollingIntervalComic'] as num?)?.toInt() ?? 60 * 60 * 3,
    );

Map<String, dynamic> _$$GeneralSettingsImplToJson(
        _$GeneralSettingsImpl instance) =>
    <String, dynamic>{
      'mangaReadLazyPage': instance.mangaReadLazyPage,
      'lastCheckUpdateApp': instance.lastCheckUpdateApp?.toIso8601String(),
      'brightnessApp': instance.brightnessApp,
      'pollingIntervalComic': instance.pollingIntervalComic,
    };
