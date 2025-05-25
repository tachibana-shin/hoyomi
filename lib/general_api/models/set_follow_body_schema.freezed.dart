// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'set_follow_body_schema.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SetFollowBodySchema {

/// The unique identifier for the source (e.g., the series or season).
 String get sourceId;/// The identifier for the specific comic text.
@JsonKey(name: 'comic_text_id') String get comicTextId;/// Comic name.
 String get name;/// Comic raw name.
@JsonKey(name: 'original_name') String get originalName;/// Poster image URL.
 String get poster;/// Season name (optional).
@JsonKey(name: 'season_name') String get seasonName;/// Current chapter name.
@JsonKey(name: 'current_chapter_name') String get currentChapterName;/// Current chapter full name.
@JsonKey(name: 'current_chapter_full_name') String get currentChapterFullName;/// Current chapter id.
@JsonKey(name: 'current_chapter_id') String get currentChapterId;/// Current chapter time (ISO string).
@JsonKey(name: 'current_chapter_time') DateTime get currentChapterTime;/// Set to true to follow, false to unfollow.
 bool get value;
/// Create a copy of SetFollowBodySchema
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SetFollowBodySchemaCopyWith<SetFollowBodySchema> get copyWith => _$SetFollowBodySchemaCopyWithImpl<SetFollowBodySchema>(this as SetFollowBodySchema, _$identity);

  /// Serializes this SetFollowBodySchema to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SetFollowBodySchema&&(identical(other.sourceId, sourceId) || other.sourceId == sourceId)&&(identical(other.comicTextId, comicTextId) || other.comicTextId == comicTextId)&&(identical(other.name, name) || other.name == name)&&(identical(other.originalName, originalName) || other.originalName == originalName)&&(identical(other.poster, poster) || other.poster == poster)&&(identical(other.seasonName, seasonName) || other.seasonName == seasonName)&&(identical(other.currentChapterName, currentChapterName) || other.currentChapterName == currentChapterName)&&(identical(other.currentChapterFullName, currentChapterFullName) || other.currentChapterFullName == currentChapterFullName)&&(identical(other.currentChapterId, currentChapterId) || other.currentChapterId == currentChapterId)&&(identical(other.currentChapterTime, currentChapterTime) || other.currentChapterTime == currentChapterTime)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sourceId,comicTextId,name,originalName,poster,seasonName,currentChapterName,currentChapterFullName,currentChapterId,currentChapterTime,value);

@override
String toString() {
  return 'SetFollowBodySchema(sourceId: $sourceId, comicTextId: $comicTextId, name: $name, originalName: $originalName, poster: $poster, seasonName: $seasonName, currentChapterName: $currentChapterName, currentChapterFullName: $currentChapterFullName, currentChapterId: $currentChapterId, currentChapterTime: $currentChapterTime, value: $value)';
}


}

/// @nodoc
abstract mixin class $SetFollowBodySchemaCopyWith<$Res>  {
  factory $SetFollowBodySchemaCopyWith(SetFollowBodySchema value, $Res Function(SetFollowBodySchema) _then) = _$SetFollowBodySchemaCopyWithImpl;
@useResult
$Res call({
 String sourceId,@JsonKey(name: 'comic_text_id') String comicTextId, String name,@JsonKey(name: 'original_name') String originalName, String poster,@JsonKey(name: 'season_name') String seasonName,@JsonKey(name: 'current_chapter_name') String currentChapterName,@JsonKey(name: 'current_chapter_full_name') String currentChapterFullName,@JsonKey(name: 'current_chapter_id') String currentChapterId,@JsonKey(name: 'current_chapter_time') DateTime currentChapterTime, bool value
});




}
/// @nodoc
class _$SetFollowBodySchemaCopyWithImpl<$Res>
    implements $SetFollowBodySchemaCopyWith<$Res> {
  _$SetFollowBodySchemaCopyWithImpl(this._self, this._then);

  final SetFollowBodySchema _self;
  final $Res Function(SetFollowBodySchema) _then;

/// Create a copy of SetFollowBodySchema
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sourceId = null,Object? comicTextId = null,Object? name = null,Object? originalName = null,Object? poster = null,Object? seasonName = null,Object? currentChapterName = null,Object? currentChapterFullName = null,Object? currentChapterId = null,Object? currentChapterTime = null,Object? value = null,}) {
  return _then(_self.copyWith(
sourceId: null == sourceId ? _self.sourceId : sourceId // ignore: cast_nullable_to_non_nullable
as String,comicTextId: null == comicTextId ? _self.comicTextId : comicTextId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,originalName: null == originalName ? _self.originalName : originalName // ignore: cast_nullable_to_non_nullable
as String,poster: null == poster ? _self.poster : poster // ignore: cast_nullable_to_non_nullable
as String,seasonName: null == seasonName ? _self.seasonName : seasonName // ignore: cast_nullable_to_non_nullable
as String,currentChapterName: null == currentChapterName ? _self.currentChapterName : currentChapterName // ignore: cast_nullable_to_non_nullable
as String,currentChapterFullName: null == currentChapterFullName ? _self.currentChapterFullName : currentChapterFullName // ignore: cast_nullable_to_non_nullable
as String,currentChapterId: null == currentChapterId ? _self.currentChapterId : currentChapterId // ignore: cast_nullable_to_non_nullable
as String,currentChapterTime: null == currentChapterTime ? _self.currentChapterTime : currentChapterTime // ignore: cast_nullable_to_non_nullable
as DateTime,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _SetFollowBodySchema implements SetFollowBodySchema {
  const _SetFollowBodySchema({required this.sourceId, @JsonKey(name: 'comic_text_id') required this.comicTextId, required this.name, @JsonKey(name: 'original_name') required this.originalName, required this.poster, @JsonKey(name: 'season_name') required this.seasonName, @JsonKey(name: 'current_chapter_name') required this.currentChapterName, @JsonKey(name: 'current_chapter_full_name') required this.currentChapterFullName, @JsonKey(name: 'current_chapter_id') required this.currentChapterId, @JsonKey(name: 'current_chapter_time') required this.currentChapterTime, required this.value});
  factory _SetFollowBodySchema.fromJson(Map<String, dynamic> json) => _$SetFollowBodySchemaFromJson(json);

/// The unique identifier for the source (e.g., the series or season).
@override final  String sourceId;
/// The identifier for the specific comic text.
@override@JsonKey(name: 'comic_text_id') final  String comicTextId;
/// Comic name.
@override final  String name;
/// Comic raw name.
@override@JsonKey(name: 'original_name') final  String originalName;
/// Poster image URL.
@override final  String poster;
/// Season name (optional).
@override@JsonKey(name: 'season_name') final  String seasonName;
/// Current chapter name.
@override@JsonKey(name: 'current_chapter_name') final  String currentChapterName;
/// Current chapter full name.
@override@JsonKey(name: 'current_chapter_full_name') final  String currentChapterFullName;
/// Current chapter id.
@override@JsonKey(name: 'current_chapter_id') final  String currentChapterId;
/// Current chapter time (ISO string).
@override@JsonKey(name: 'current_chapter_time') final  DateTime currentChapterTime;
/// Set to true to follow, false to unfollow.
@override final  bool value;

/// Create a copy of SetFollowBodySchema
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetFollowBodySchemaCopyWith<_SetFollowBodySchema> get copyWith => __$SetFollowBodySchemaCopyWithImpl<_SetFollowBodySchema>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SetFollowBodySchemaToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetFollowBodySchema&&(identical(other.sourceId, sourceId) || other.sourceId == sourceId)&&(identical(other.comicTextId, comicTextId) || other.comicTextId == comicTextId)&&(identical(other.name, name) || other.name == name)&&(identical(other.originalName, originalName) || other.originalName == originalName)&&(identical(other.poster, poster) || other.poster == poster)&&(identical(other.seasonName, seasonName) || other.seasonName == seasonName)&&(identical(other.currentChapterName, currentChapterName) || other.currentChapterName == currentChapterName)&&(identical(other.currentChapterFullName, currentChapterFullName) || other.currentChapterFullName == currentChapterFullName)&&(identical(other.currentChapterId, currentChapterId) || other.currentChapterId == currentChapterId)&&(identical(other.currentChapterTime, currentChapterTime) || other.currentChapterTime == currentChapterTime)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sourceId,comicTextId,name,originalName,poster,seasonName,currentChapterName,currentChapterFullName,currentChapterId,currentChapterTime,value);

@override
String toString() {
  return 'SetFollowBodySchema(sourceId: $sourceId, comicTextId: $comicTextId, name: $name, originalName: $originalName, poster: $poster, seasonName: $seasonName, currentChapterName: $currentChapterName, currentChapterFullName: $currentChapterFullName, currentChapterId: $currentChapterId, currentChapterTime: $currentChapterTime, value: $value)';
}


}

/// @nodoc
abstract mixin class _$SetFollowBodySchemaCopyWith<$Res> implements $SetFollowBodySchemaCopyWith<$Res> {
  factory _$SetFollowBodySchemaCopyWith(_SetFollowBodySchema value, $Res Function(_SetFollowBodySchema) _then) = __$SetFollowBodySchemaCopyWithImpl;
@override @useResult
$Res call({
 String sourceId,@JsonKey(name: 'comic_text_id') String comicTextId, String name,@JsonKey(name: 'original_name') String originalName, String poster,@JsonKey(name: 'season_name') String seasonName,@JsonKey(name: 'current_chapter_name') String currentChapterName,@JsonKey(name: 'current_chapter_full_name') String currentChapterFullName,@JsonKey(name: 'current_chapter_id') String currentChapterId,@JsonKey(name: 'current_chapter_time') DateTime currentChapterTime, bool value
});




}
/// @nodoc
class __$SetFollowBodySchemaCopyWithImpl<$Res>
    implements _$SetFollowBodySchemaCopyWith<$Res> {
  __$SetFollowBodySchemaCopyWithImpl(this._self, this._then);

  final _SetFollowBodySchema _self;
  final $Res Function(_SetFollowBodySchema) _then;

/// Create a copy of SetFollowBodySchema
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sourceId = null,Object? comicTextId = null,Object? name = null,Object? originalName = null,Object? poster = null,Object? seasonName = null,Object? currentChapterName = null,Object? currentChapterFullName = null,Object? currentChapterId = null,Object? currentChapterTime = null,Object? value = null,}) {
  return _then(_SetFollowBodySchema(
sourceId: null == sourceId ? _self.sourceId : sourceId // ignore: cast_nullable_to_non_nullable
as String,comicTextId: null == comicTextId ? _self.comicTextId : comicTextId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,originalName: null == originalName ? _self.originalName : originalName // ignore: cast_nullable_to_non_nullable
as String,poster: null == poster ? _self.poster : poster // ignore: cast_nullable_to_non_nullable
as String,seasonName: null == seasonName ? _self.seasonName : seasonName // ignore: cast_nullable_to_non_nullable
as String,currentChapterName: null == currentChapterName ? _self.currentChapterName : currentChapterName // ignore: cast_nullable_to_non_nullable
as String,currentChapterFullName: null == currentChapterFullName ? _self.currentChapterFullName : currentChapterFullName // ignore: cast_nullable_to_non_nullable
as String,currentChapterId: null == currentChapterId ? _self.currentChapterId : currentChapterId // ignore: cast_nullable_to_non_nullable
as String,currentChapterTime: null == currentChapterTime ? _self.currentChapterTime : currentChapterTime // ignore: cast_nullable_to_non_nullable
as DateTime,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
