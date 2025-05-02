// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comic_chapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ComicChapter {

 String get name; String? get fullName; String get chapterId; DateTime? get time;
/// Create a copy of ComicChapter
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ComicChapterCopyWith<ComicChapter> get copyWith => _$ComicChapterCopyWithImpl<ComicChapter>(this as ComicChapter, _$identity);

  /// Serializes this ComicChapter to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ComicChapter&&(identical(other.name, name) || other.name == name)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.chapterId, chapterId) || other.chapterId == chapterId)&&(identical(other.time, time) || other.time == time));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,fullName,chapterId,time);

@override
String toString() {
  return 'ComicChapter(name: $name, fullName: $fullName, chapterId: $chapterId, time: $time)';
}


}

/// @nodoc
abstract mixin class $ComicChapterCopyWith<$Res>  {
  factory $ComicChapterCopyWith(ComicChapter value, $Res Function(ComicChapter) _then) = _$ComicChapterCopyWithImpl;
@useResult
$Res call({
 String name, String? fullName, String chapterId, DateTime? time
});




}
/// @nodoc
class _$ComicChapterCopyWithImpl<$Res>
    implements $ComicChapterCopyWith<$Res> {
  _$ComicChapterCopyWithImpl(this._self, this._then);

  final ComicChapter _self;
  final $Res Function(ComicChapter) _then;

/// Create a copy of ComicChapter
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? fullName = freezed,Object? chapterId = null,Object? time = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,chapterId: null == chapterId ? _self.chapterId : chapterId // ignore: cast_nullable_to_non_nullable
as String,time: freezed == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _ComicChapter implements ComicChapter {
  const _ComicChapter({required this.name, this.fullName, required this.chapterId, this.time});
  factory _ComicChapter.fromJson(Map<String, dynamic> json) => _$ComicChapterFromJson(json);

@override final  String name;
@override final  String? fullName;
@override final  String chapterId;
@override final  DateTime? time;

/// Create a copy of ComicChapter
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ComicChapterCopyWith<_ComicChapter> get copyWith => __$ComicChapterCopyWithImpl<_ComicChapter>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ComicChapterToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ComicChapter&&(identical(other.name, name) || other.name == name)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.chapterId, chapterId) || other.chapterId == chapterId)&&(identical(other.time, time) || other.time == time));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,fullName,chapterId,time);

@override
String toString() {
  return 'ComicChapter(name: $name, fullName: $fullName, chapterId: $chapterId, time: $time)';
}


}

/// @nodoc
abstract mixin class _$ComicChapterCopyWith<$Res> implements $ComicChapterCopyWith<$Res> {
  factory _$ComicChapterCopyWith(_ComicChapter value, $Res Function(_ComicChapter) _then) = __$ComicChapterCopyWithImpl;
@override @useResult
$Res call({
 String name, String? fullName, String chapterId, DateTime? time
});




}
/// @nodoc
class __$ComicChapterCopyWithImpl<$Res>
    implements _$ComicChapterCopyWith<$Res> {
  __$ComicChapterCopyWithImpl(this._self, this._then);

  final _ComicChapter _self;
  final $Res Function(_ComicChapter) _then;

/// Create a copy of ComicChapter
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? fullName = freezed,Object? chapterId = null,Object? time = freezed,}) {
  return _then(_ComicChapter(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,chapterId: null == chapterId ? _self.chapterId : chapterId // ignore: cast_nullable_to_non_nullable
as String,time: freezed == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
