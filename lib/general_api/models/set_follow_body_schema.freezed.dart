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
 String get name;/// Poster image URL.
 String get poster;/// Season name (optional).
@JsonKey(name: 'season_name') String get seasonName;/// Current chapter id.
@JsonKey(name: 'chapter_Id') String get chapterId;/// Array of chapter meta info.
@JsonKey(name: 'current_chapters') List<CurrentChapters> get currentChapters;/// Set to true to follow, false to unfollow.
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SetFollowBodySchema&&(identical(other.sourceId, sourceId) || other.sourceId == sourceId)&&(identical(other.comicTextId, comicTextId) || other.comicTextId == comicTextId)&&(identical(other.name, name) || other.name == name)&&(identical(other.poster, poster) || other.poster == poster)&&(identical(other.seasonName, seasonName) || other.seasonName == seasonName)&&(identical(other.chapterId, chapterId) || other.chapterId == chapterId)&&const DeepCollectionEquality().equals(other.currentChapters, currentChapters)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sourceId,comicTextId,name,poster,seasonName,chapterId,const DeepCollectionEquality().hash(currentChapters),value);

@override
String toString() {
  return 'SetFollowBodySchema(sourceId: $sourceId, comicTextId: $comicTextId, name: $name, poster: $poster, seasonName: $seasonName, chapterId: $chapterId, currentChapters: $currentChapters, value: $value)';
}


}

/// @nodoc
abstract mixin class $SetFollowBodySchemaCopyWith<$Res>  {
  factory $SetFollowBodySchemaCopyWith(SetFollowBodySchema value, $Res Function(SetFollowBodySchema) _then) = _$SetFollowBodySchemaCopyWithImpl;
@useResult
$Res call({
 String sourceId,@JsonKey(name: 'comic_text_id') String comicTextId, String name, String poster,@JsonKey(name: 'season_name') String seasonName,@JsonKey(name: 'chapter_Id') String chapterId,@JsonKey(name: 'current_chapters') List<CurrentChapters> currentChapters, bool value
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
@pragma('vm:prefer-inline') @override $Res call({Object? sourceId = null,Object? comicTextId = null,Object? name = null,Object? poster = null,Object? seasonName = null,Object? chapterId = null,Object? currentChapters = null,Object? value = null,}) {
  return _then(_self.copyWith(
sourceId: null == sourceId ? _self.sourceId : sourceId // ignore: cast_nullable_to_non_nullable
as String,comicTextId: null == comicTextId ? _self.comicTextId : comicTextId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,poster: null == poster ? _self.poster : poster // ignore: cast_nullable_to_non_nullable
as String,seasonName: null == seasonName ? _self.seasonName : seasonName // ignore: cast_nullable_to_non_nullable
as String,chapterId: null == chapterId ? _self.chapterId : chapterId // ignore: cast_nullable_to_non_nullable
as String,currentChapters: null == currentChapters ? _self.currentChapters : currentChapters // ignore: cast_nullable_to_non_nullable
as List<CurrentChapters>,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _SetFollowBodySchema implements SetFollowBodySchema {
  const _SetFollowBodySchema({required this.sourceId, @JsonKey(name: 'comic_text_id') required this.comicTextId, required this.name, required this.poster, @JsonKey(name: 'season_name') required this.seasonName, @JsonKey(name: 'chapter_Id') required this.chapterId, @JsonKey(name: 'current_chapters') required final  List<CurrentChapters> currentChapters, required this.value}): _currentChapters = currentChapters;
  factory _SetFollowBodySchema.fromJson(Map<String, dynamic> json) => _$SetFollowBodySchemaFromJson(json);

/// The unique identifier for the source (e.g., the series or season).
@override final  String sourceId;
/// The identifier for the specific comic text.
@override@JsonKey(name: 'comic_text_id') final  String comicTextId;
/// Comic name.
@override final  String name;
/// Poster image URL.
@override final  String poster;
/// Season name (optional).
@override@JsonKey(name: 'season_name') final  String seasonName;
/// Current chapter id.
@override@JsonKey(name: 'chapter_Id') final  String chapterId;
/// Array of chapter meta info.
 final  List<CurrentChapters> _currentChapters;
/// Array of chapter meta info.
@override@JsonKey(name: 'current_chapters') List<CurrentChapters> get currentChapters {
  if (_currentChapters is EqualUnmodifiableListView) return _currentChapters;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_currentChapters);
}

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetFollowBodySchema&&(identical(other.sourceId, sourceId) || other.sourceId == sourceId)&&(identical(other.comicTextId, comicTextId) || other.comicTextId == comicTextId)&&(identical(other.name, name) || other.name == name)&&(identical(other.poster, poster) || other.poster == poster)&&(identical(other.seasonName, seasonName) || other.seasonName == seasonName)&&(identical(other.chapterId, chapterId) || other.chapterId == chapterId)&&const DeepCollectionEquality().equals(other._currentChapters, _currentChapters)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sourceId,comicTextId,name,poster,seasonName,chapterId,const DeepCollectionEquality().hash(_currentChapters),value);

@override
String toString() {
  return 'SetFollowBodySchema(sourceId: $sourceId, comicTextId: $comicTextId, name: $name, poster: $poster, seasonName: $seasonName, chapterId: $chapterId, currentChapters: $currentChapters, value: $value)';
}


}

/// @nodoc
abstract mixin class _$SetFollowBodySchemaCopyWith<$Res> implements $SetFollowBodySchemaCopyWith<$Res> {
  factory _$SetFollowBodySchemaCopyWith(_SetFollowBodySchema value, $Res Function(_SetFollowBodySchema) _then) = __$SetFollowBodySchemaCopyWithImpl;
@override @useResult
$Res call({
 String sourceId,@JsonKey(name: 'comic_text_id') String comicTextId, String name, String poster,@JsonKey(name: 'season_name') String seasonName,@JsonKey(name: 'chapter_Id') String chapterId,@JsonKey(name: 'current_chapters') List<CurrentChapters> currentChapters, bool value
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
@override @pragma('vm:prefer-inline') $Res call({Object? sourceId = null,Object? comicTextId = null,Object? name = null,Object? poster = null,Object? seasonName = null,Object? chapterId = null,Object? currentChapters = null,Object? value = null,}) {
  return _then(_SetFollowBodySchema(
sourceId: null == sourceId ? _self.sourceId : sourceId // ignore: cast_nullable_to_non_nullable
as String,comicTextId: null == comicTextId ? _self.comicTextId : comicTextId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,poster: null == poster ? _self.poster : poster // ignore: cast_nullable_to_non_nullable
as String,seasonName: null == seasonName ? _self.seasonName : seasonName // ignore: cast_nullable_to_non_nullable
as String,chapterId: null == chapterId ? _self.chapterId : chapterId // ignore: cast_nullable_to_non_nullable
as String,currentChapters: null == currentChapters ? _self._currentChapters : currentChapters // ignore: cast_nullable_to_non_nullable
as List<CurrentChapters>,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
