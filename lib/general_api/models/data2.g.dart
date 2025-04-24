// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data2.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Data2 _$Data2FromJson(Map<String, dynamic> json) => _Data2(
  cur: json['cur'] as num,
  dur: json['dur'] as num,
  name: json['name'] as String,
  createdAt: json['createdAt'] as String,
  updatedAt: json['updatedAt'] as String,
  chapId: json['chapId'] as String,
);

Map<String, dynamic> _$Data2ToJson(_Data2 instance) => <String, dynamic>{
  'cur': instance.cur,
  'dur': instance.dur,
  'name': instance.name,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
  'chapId': instance.chapId,
};
