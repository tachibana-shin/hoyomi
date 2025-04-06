// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'eiga_episodes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EigaEpisodesImpl _$$EigaEpisodesImplFromJson(Map<String, dynamic> json) =>
    _$EigaEpisodesImpl(
      episodes: (json['episodes'] as List<dynamic>)
          .map((e) => EigaEpisode.fromJson(e as Map<String, dynamic>))
          .toList(),
      image: json['image'] == null
          ? null
          : OImage.fromJson(json['image'] as Map<String, dynamic>),
      poster: json['poster'] == null
          ? null
          : OImage.fromJson(json['poster'] as Map<String, dynamic>),
      schedule: json['schedule'] == null
          ? null
          : TimeAndDay.fromJson(json['schedule'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$EigaEpisodesImplToJson(_$EigaEpisodesImpl instance) =>
    <String, dynamic>{
      'episodes': instance.episodes,
      'image': instance.image,
      'poster': instance.poster,
      'schedule': instance.schedule,
    };

_$TimeAndDayImpl _$$TimeAndDayImplFromJson(Map<String, dynamic> json) =>
    _$TimeAndDayImpl(
      day: (json['day'] as num).toInt(),
      hour: (json['hour'] as num).toInt(),
      minute: (json['minute'] as num).toInt(),
    );

Map<String, dynamic> _$$TimeAndDayImplToJson(_$TimeAndDayImpl instance) =>
    <String, dynamic>{
      'day': instance.day,
      'hour': instance.hour,
      'minute': instance.minute,
    };
