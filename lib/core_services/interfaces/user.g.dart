// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_User _$UserFromJson(Map<String, dynamic> json) => _User(
  user: json['user'] as String,
  email: json['email'] as String?,
  photoUrl: json['photoUrl'] as String,
  fullName: json['fullName'] as String,
  sex: $enumDecodeNullable(_$SexEnumMap, json['sex']) ?? Sex.other,
);

Map<String, dynamic> _$UserToJson(_User instance) => <String, dynamic>{
  'user': instance.user,
  'email': instance.email,
  'photoUrl': instance.photoUrl,
  'fullName': instance.fullName,
  'sex': _$SexEnumMap[instance.sex]!,
};

const _$SexEnumMap = {
  Sex.male: 'male',
  Sex.female: 'female',
  Sex.other: 'other',
};
