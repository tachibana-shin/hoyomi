// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'data6.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Data6 {

/// The current time in seconds for the episode.
 num get cur;/// The total duration of the episode in seconds.
 num get dur;/// The name of the episode.
 String get name;/// ISO 8601 format timestamp when the watch time was recorded.
 String get createdAt;/// ISO 8601 format timestamp when the watch time was last updated.
 String get updatedAt;
/// Create a copy of Data6
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Data6CopyWith<Data6> get copyWith => _$Data6CopyWithImpl<Data6>(this as Data6, _$identity);

  /// Serializes this Data6 to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Data6&&(identical(other.cur, cur) || other.cur == cur)&&(identical(other.dur, dur) || other.dur == dur)&&(identical(other.name, name) || other.name == name)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,cur,dur,name,createdAt,updatedAt);

@override
String toString() {
  return 'Data6(cur: $cur, dur: $dur, name: $name, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $Data6CopyWith<$Res>  {
  factory $Data6CopyWith(Data6 value, $Res Function(Data6) _then) = _$Data6CopyWithImpl;
@useResult
$Res call({
 num cur, num dur, String name, String createdAt, String updatedAt
});




}
/// @nodoc
class _$Data6CopyWithImpl<$Res>
    implements $Data6CopyWith<$Res> {
  _$Data6CopyWithImpl(this._self, this._then);

  final Data6 _self;
  final $Res Function(Data6) _then;

/// Create a copy of Data6
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

class _Data6 implements Data6 {
  const _Data6({required this.cur, required this.dur, required this.name, required this.createdAt, required this.updatedAt});
  factory _Data6.fromJson(Map<String, dynamic> json) => _$Data6FromJson(json);

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

/// Create a copy of Data6
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$Data6CopyWith<_Data6> get copyWith => __$Data6CopyWithImpl<_Data6>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$Data6ToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Data6&&(identical(other.cur, cur) || other.cur == cur)&&(identical(other.dur, dur) || other.dur == dur)&&(identical(other.name, name) || other.name == name)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,cur,dur,name,createdAt,updatedAt);

@override
String toString() {
  return 'Data6(cur: $cur, dur: $dur, name: $name, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$Data6CopyWith<$Res> implements $Data6CopyWith<$Res> {
  factory _$Data6CopyWith(_Data6 value, $Res Function(_Data6) _then) = __$Data6CopyWithImpl;
@override @useResult
$Res call({
 num cur, num dur, String name, String createdAt, String updatedAt
});




}
/// @nodoc
class __$Data6CopyWithImpl<$Res>
    implements _$Data6CopyWith<$Res> {
  __$Data6CopyWithImpl(this._self, this._then);

  final _Data6 _self;
  final $Res Function(_Data6) _then;

/// Create a copy of Data6
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? cur = null,Object? dur = null,Object? name = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_Data6(
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
