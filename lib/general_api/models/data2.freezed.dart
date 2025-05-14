// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'data2.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Data2 {

/// The current page in the episode in seconds.
 num get cur;/// The total page of the episode in seconds.
 num get dur;/// The name of the episode.
 String get name;/// Page when the watch page was recorded, in ISO 8601 format.
 String get createdAt;/// Page when the watch page was last updated, in ISO 8601 format.
 String get updatedAt;/// The unique identifier for the chapter within the episode or series.
 String get chapId;
/// Create a copy of Data2
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Data2CopyWith<Data2> get copyWith => _$Data2CopyWithImpl<Data2>(this as Data2, _$identity);

  /// Serializes this Data2 to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Data2&&(identical(other.cur, cur) || other.cur == cur)&&(identical(other.dur, dur) || other.dur == dur)&&(identical(other.name, name) || other.name == name)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.chapId, chapId) || other.chapId == chapId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,cur,dur,name,createdAt,updatedAt,chapId);

@override
String toString() {
  return 'Data2(cur: $cur, dur: $dur, name: $name, createdAt: $createdAt, updatedAt: $updatedAt, chapId: $chapId)';
}


}

/// @nodoc
abstract mixin class $Data2CopyWith<$Res>  {
  factory $Data2CopyWith(Data2 value, $Res Function(Data2) _then) = _$Data2CopyWithImpl;
@useResult
$Res call({
 num cur, num dur, String name, String createdAt, String updatedAt, String chapId
});




}
/// @nodoc
class _$Data2CopyWithImpl<$Res>
    implements $Data2CopyWith<$Res> {
  _$Data2CopyWithImpl(this._self, this._then);

  final Data2 _self;
  final $Res Function(Data2) _then;

/// Create a copy of Data2
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? cur = null,Object? dur = null,Object? name = null,Object? createdAt = null,Object? updatedAt = null,Object? chapId = null,}) {
  return _then(_self.copyWith(
cur: null == cur ? _self.cur : cur // ignore: cast_nullable_to_non_nullable
as num,dur: null == dur ? _self.dur : dur // ignore: cast_nullable_to_non_nullable
as num,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,chapId: null == chapId ? _self.chapId : chapId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Data2 implements Data2 {
  const _Data2({required this.cur, required this.dur, required this.name, required this.createdAt, required this.updatedAt, required this.chapId});
  factory _Data2.fromJson(Map<String, dynamic> json) => _$Data2FromJson(json);

/// The current page in the episode in seconds.
@override final  num cur;
/// The total page of the episode in seconds.
@override final  num dur;
/// The name of the episode.
@override final  String name;
/// Page when the watch page was recorded, in ISO 8601 format.
@override final  String createdAt;
/// Page when the watch page was last updated, in ISO 8601 format.
@override final  String updatedAt;
/// The unique identifier for the chapter within the episode or series.
@override final  String chapId;

/// Create a copy of Data2
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$Data2CopyWith<_Data2> get copyWith => __$Data2CopyWithImpl<_Data2>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$Data2ToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Data2&&(identical(other.cur, cur) || other.cur == cur)&&(identical(other.dur, dur) || other.dur == dur)&&(identical(other.name, name) || other.name == name)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.chapId, chapId) || other.chapId == chapId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,cur,dur,name,createdAt,updatedAt,chapId);

@override
String toString() {
  return 'Data2(cur: $cur, dur: $dur, name: $name, createdAt: $createdAt, updatedAt: $updatedAt, chapId: $chapId)';
}


}

/// @nodoc
abstract mixin class _$Data2CopyWith<$Res> implements $Data2CopyWith<$Res> {
  factory _$Data2CopyWith(_Data2 value, $Res Function(_Data2) _then) = __$Data2CopyWithImpl;
@override @useResult
$Res call({
 num cur, num dur, String name, String createdAt, String updatedAt, String chapId
});




}
/// @nodoc
class __$Data2CopyWithImpl<$Res>
    implements _$Data2CopyWith<$Res> {
  __$Data2CopyWithImpl(this._self, this._then);

  final _Data2 _self;
  final $Res Function(_Data2) _then;

/// Create a copy of Data2
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? cur = null,Object? dur = null,Object? name = null,Object? createdAt = null,Object? updatedAt = null,Object? chapId = null,}) {
  return _then(_Data2(
cur: null == cur ? _self.cur : cur // ignore: cast_nullable_to_non_nullable
as num,dur: null == dur ? _self.dur : dur // ignore: cast_nullable_to_non_nullable
as num,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,chapId: null == chapId ? _self.chapId : chapId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
