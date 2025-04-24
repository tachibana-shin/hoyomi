// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subtitle_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SubtitleSettings _$SubtitleSettingsFromJson(Map<String, dynamic> json) =>
    _SubtitleSettings(
      fontFamily: json['fontFamily'] as String? ?? 'Normal',
      fontColor: json['fontColor'] as String? ?? 'White',
      fontSize: json['fontSize'] as String? ?? '100%',
      fontOpacity: json['fontOpacity'] as String? ?? '100%',
      bgColor: json['bgColor'] as String? ?? 'Black',
      bgOpacity: json['bgOpacity'] as String? ?? '75%',
      windowColor: json['windowColor'] as String? ?? 'Black',
      windowOpacity: json['windowOpacity'] as String? ?? '0%',
      edgeStyle: json['edgeStyle'] as String? ?? 'None',
    );

Map<String, dynamic> _$SubtitleSettingsToJson(_SubtitleSettings instance) =>
    <String, dynamic>{
      'fontFamily': instance.fontFamily,
      'fontColor': instance.fontColor,
      'fontSize': instance.fontSize,
      'fontOpacity': instance.fontOpacity,
      'bgColor': instance.bgColor,
      'bgOpacity': instance.bgOpacity,
      'windowColor': instance.windowColor,
      'windowOpacity': instance.windowOpacity,
      'edgeStyle': instance.edgeStyle,
    };
