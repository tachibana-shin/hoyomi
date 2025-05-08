// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'data5.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Data5 {

/// The current time in seconds for the episode.
 num get cur;/// The total duration of the episode in seconds.
 num get dur;/// The name of the episode.
 String get name;/// ISO 8601 format timestamp when the watch time was recorded.
 String get createdAt;/// ISO 8601 format timestamp when the watch time was last updated.
 String get updatedAt;
/// Create a copy of Data5
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Data5CopyWith<Data5> get copyWith => _$Data5CopyWithImpl<Data5>(this as Data5, _$identity);

  /// Serializes this Data5 to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Data5&&(identical(other.cur, cur) || other.cur == cur)&&(identical(other.dur, dur) || other.dur == dur)&&(identical(other.name, name) || other.name == name)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,cur,dur,name,createdAt,updatedAt);

@override
String toString() {
  return 'Data5(cur: $cur, dur: $dur, name: $name, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $Data5CopyWith<$Res>  {
  factory $Data5CopyWith(Data5 value, $Res Function(Data5) _then) = _$Data5CopyWithImpl;
@useResult
$Res call({
 num cur, num dur, String name, String createdAt, String updatedAt
});




}
/// @nodoc
class _$Data5CopyWithImpl<$Res>
    implements $Data5CopyWith<$Res> {
  _$Data5CopyWithImpl(this._self, this._then);

  final Data5 _self;
  final $Res Function(Data5) _then;

/// Create a copy of Data5
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? cur = null,Object? dur = null,Object? name = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
cur: null == cur ? _self.cur : cur // ignore: cast_nullable_to_non_nullable
as num,dur: null == dur ? _self.dur : dur // ignore: cast_nullable_to_non_nullable
as num,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Data5 implements Data5 {
  const _Data5({required this.cur, required this.dur, required this.name, required this.createdAt, required this.updatedAt});
  factory _Data5.fromJson(Map<String, dynamic> json) => _$Data5FromJson(json);

/// The current time in seconds for the episode.
@override final  num cur;
/// The total duration of the episode in seconds.
@override final  num dur;
/// The name of the episode.
@override final  String name;
/// ISO 8601 format timestamp when the watch time was recorded.
@override final  String createdAt;
/// ISO 8601 format timestamp when the watch time was last updated.
@override final  String updatedAt;

/// Create a copy of Data5
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$Data5CopyWith<_Data5> get copyWith => __$Data5CopyWithImpl<_Data5>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$Data5ToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Data5&&(identical(other.cur, cur) || other.cur == cur)&&(identical(other.dur, dur) || other.dur == dur)&&(identical(other.name, name) || other.name == name)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,cur,dur,name,createdAt,updatedAt);

@override
String toString() {
  return 'Data5(cur: $cur, dur: $dur, name: $name, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$Data5CopyWith<$Res> implements $Data5CopyWith<$Res> {
  factory _$Data5CopyWith(_Data5 value, $Res Function(_Data5) _then) = __$Data5CopyWithImpl;
@override @useResult
$Res call({
 num cur, num dur, String name, String createdAt, String updatedAt
});




}
/// @nodoc
class __$Data5CopyWithImpl<$Res>
    implements _$Data5CopyWith<$Res> {
  __$Data5CopyWithImpl(this._self, this._then);

  final _Data5 _self;
  final $Res Function(_Data5) _then;

/// Create a copy of Data5
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? cur = null,Object? dur = null,Object? name = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_Data5(
cur: null == cur ? _self.cur : cur // ignore: cast_nullable_to_non_nullable
as num,dur: null == dur ? _self.dur : dur // ignore: cast_nullable_to_non_nullable
as num,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
