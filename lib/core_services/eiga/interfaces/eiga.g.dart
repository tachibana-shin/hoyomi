// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'eiga.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Eiga _$EigaFromJson(Map<String, dynamic> json) => _Eiga(
      name: json['name'] as String,
      eigaId: json['eigaId'] as String,
      originalName: json['originalName'] as String?,
      image: OImage.fromJson(json['image'] as Map<String, dynamic>),
      lastEpisode: json['lastEpisode'] == null
          ? null
          : EigaEpisode.fromJson(json['lastEpisode'] as Map<String, dynamic>),
      timeAgo: json['timeAgo'] == null
          ? null
          : DateTime.parse(json['timeAgo'] as String),
      notice: json['notice'] as String?,
      countSub: (json['countSub'] as num?)?.toInt(),
      countDub: (json['countDub'] as num?)?.toInt(),
      rate: (json['rate'] as num?)?.toDouble(),
      pending: json['pending'] as bool? ?? false,
      preRelease: json['preRelease'] == null
          ? null
          : DateTime.parse(json['preRelease'] as String),
      description: json['description'] as String?,
    );

Map<String, dynamic> _$EigaToJson(_Eiga instance) => <String, dynamic>{
      'name': instance.name,
      'eigaId': instance.eigaId,
      'originalName': instance.originalName,
      'image': instance.image,
      'lastEpisode': instance.lastEpisode,
      'timeAgo': instance.timeAgo?.toIso8601String(),
      'notice': instance.notice,
      'countSub': instance.countSub,
      'countDub': instance.countDub,
      'rate': instance.rate,
      'pending': instance.pending,
      'preRelease': instance.preRelease?.toIso8601String(),
      'description': instance.description,
    };
