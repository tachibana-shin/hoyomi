// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'current_chapters.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CurrentChapters {

 String get name; String get fullName; num get order; String get chapterId; DateTime get time;
/// Create a copy of CurrentChapters
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CurrentChaptersCopyWith<CurrentChapters> get copyWith => _$CurrentChaptersCopyWithImpl<CurrentChapters>(this as CurrentChapters, _$identity);

  /// Serializes this CurrentChapters to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CurrentChapters&&(identical(other.name, name) || other.name == name)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.order, order) || other.order == order)&&(identical(other.chapterId, chapterId) || other.chapterId == chapterId)&&(identical(other.time, time) || other.time == time));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,fullName,order,chapterId,time);

@override
String toString() {
  return 'CurrentChapters(name: $name, fullName: $fullName, order: $order, chapterId: $chapterId, time: $time)';
}


}

/// @nodoc
abstract mixin class $CurrentChaptersCopyWith<$Res>  {
  factory $CurrentChaptersCopyWith(CurrentChapters value, $Res Function(CurrentChapters) _then) = _$CurrentChaptersCopyWithImpl;
@useResult
$Res call({
 String name, String fullName, num order, String chapterId, DateTime time
});




}
/// @nodoc
class _$CurrentChaptersCopyWithImpl<$Res>
    implements $CurrentChaptersCopyWith<$Res> {
  _$CurrentChaptersCopyWithImpl(this._self, this._then);

  final CurrentChapters _self;
  final $Res Function(CurrentChapters) _then;

/// Create a copy of CurrentChapters
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? fullName = null,Object? order = null,Object? chapterId = null,Object? time = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as num,chapterId: null == chapterId ? _self.chapterId : chapterId // ignore: cast_nullable_to_non_nullable
as String,time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _CurrentChapters implements CurrentChapters {
  const _CurrentChapters({required this.name, required this.fullName, required this.order, required this.chapterId, required this.time});
  factory _CurrentChapters.fromJson(Map<String, dynamic> json) => _$CurrentChaptersFromJson(json);

@override final  String name;
@override final  String fullName;
@override final  num order;
@override final  String chapterId;
@override final  DateTime time;

/// Create a copy of CurrentChapters
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CurrentChaptersCopyWith<_CurrentChapters> get copyWith => __$CurrentChaptersCopyWithImpl<_CurrentChapters>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CurrentChaptersToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CurrentChapters&&(identical(other.name, name) || other.name == name)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.order, order) || other.order == order)&&(identical(other.chapterId, chapterId) || other.chapterId == chapterId)&&(identical(other.time, time) || other.time == time));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,fullName,order,chapterId,time);

@override
String toString() {
  return 'CurrentChapters(name: $name, fullName: $fullName, order: $order, chapterId: $chapterId, time: $time)';
}


}

/// @nodoc
abstract mixin class _$CurrentChaptersCopyWith<$Res> implements $CurrentChaptersCopyWith<$Res> {
  factory _$CurrentChaptersCopyWith(_CurrentChapters value, $Res Function(_CurrentChapters) _then) = __$CurrentChaptersCopyWithImpl;
@override @useResult
$Res call({
 String name, String fullName, num order, String chapterId, DateTime time
});




}
/// @nodoc
class __$CurrentChaptersCopyWithImpl<$Res>
    implements _$CurrentChaptersCopyWith<$Res> {
  __$CurrentChaptersCopyWithImpl(this._self, this._then);

  final _CurrentChapters _self;
  final $Res Function(_CurrentChapters) _then;

/// Create a copy of CurrentChapters
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? fullName = null,Object? order = null,Object? chapterId = null,Object? time = null,}) {
  return _then(_CurrentChapters(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as num,chapterId: null == chapterId ? _self.chapterId : chapterId // ignore: cast_nullable_to_non_nullable
as String,time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
