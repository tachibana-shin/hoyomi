// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'general_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GeneralSettings _$GeneralSettingsFromJson(Map<String, dynamic> json) =>
    _GeneralSettings(
      mangaReadLazyPage: json['mangaReadLazyPage'] as bool? ?? false,
      lastCheckUpdateApp: json['lastCheckUpdateApp'] == null
          ? null
          : DateTime.parse(json['lastCheckUpdateApp'] as String),
      brightnessApp: (json['brightnessApp'] as num?)?.toDouble() ?? null,
      pollingIntervalComic:
          (json['pollingIntervalComic'] as num?)?.toInt() ?? 60 * 60 * 3,
      showListEpisodeWithGrid:
          json['showListEpisodeWithGrid'] as bool? ?? false,
      sortComicService: (json['sortComicService'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          null,
      sortEigaService: (json['sortEigaService'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          null,
    );

Map<String, dynamic> _$GeneralSettingsToJson(_GeneralSettings instance) =>
    <String, dynamic>{
      'mangaReadLazyPage': instance.mangaReadLazyPage,
      'lastCheckUpdateApp': instance.lastCheckUpdateApp?.toIso8601String(),
      'brightnessApp': instance.brightnessApp,
      'pollingIntervalComic': instance.pollingIntervalComic,
      'showListEpisodeWithGrid': instance.showListEpisodeWithGrid,
      'sortComicService': instance.sortComicService,
      'sortEigaService': instance.sortEigaService,
    };
