// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'set_eiga_follow_body_schema.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SetEigaFollowBodySchema {

/// The unique identifier for the source (e.g., the series or season).
 String get sourceId;/// The identifier for the specific eiga text.
@JsonKey(name: 'eiga_text_id') String get eigaTextId;/// Eiga name.
 String get name;/// Eiga raw name.
@JsonKey(name: 'original_name') String get originalName;/// Poster image URL.
 String get poster;/// Season name (optional).
@JsonKey(name: 'season_name') String get seasonName;/// Comic status.
 SetEigaFollowBodySchemaStatus get status;/// Current episode name.
@JsonKey(name: 'current_episode_name') String get currentEpisodeName;/// Current episode id.
@JsonKey(name: 'current_episode_id') String get currentEpisodeId;/// Current episode time (ISO string).
@JsonKey(name: 'current_episode_time') DateTime get currentEpisodeTime;/// Set to true to follow, false to unfollow.
 bool get value;
/// Create a copy of SetEigaFollowBodySchema
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SetEigaFollowBodySchemaCopyWith<SetEigaFollowBodySchema> get copyWith => _$SetEigaFollowBodySchemaCopyWithImpl<SetEigaFollowBodySchema>(this as SetEigaFollowBodySchema, _$identity);

  /// Serializes this SetEigaFollowBodySchema to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SetEigaFollowBodySchema&&(identical(other.sourceId, sourceId) || other.sourceId == sourceId)&&(identical(other.eigaTextId, eigaTextId) || other.eigaTextId == eigaTextId)&&(identical(other.name, name) || other.name == name)&&(identical(other.originalName, originalName) || other.originalName == originalName)&&(identical(other.poster, poster) || other.poster == poster)&&(identical(other.seasonName, seasonName) || other.seasonName == seasonName)&&(identical(other.status, status) || other.status == status)&&(identical(other.currentEpisodeName, currentEpisodeName) || other.currentEpisodeName == currentEpisodeName)&&(identical(other.currentEpisodeId, currentEpisodeId) || other.currentEpisodeId == currentEpisodeId)&&(identical(other.currentEpisodeTime, currentEpisodeTime) || other.currentEpisodeTime == currentEpisodeTime)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sourceId,eigaTextId,name,originalName,poster,seasonName,status,currentEpisodeName,currentEpisodeId,currentEpisodeTime,value);

@override
String toString() {
  return 'SetEigaFollowBodySchema(sourceId: $sourceId, eigaTextId: $eigaTextId, name: $name, originalName: $originalName, poster: $poster, seasonName: $seasonName, status: $status, currentEpisodeName: $currentEpisodeName, currentEpisodeId: $currentEpisodeId, currentEpisodeTime: $currentEpisodeTime, value: $value)';
}


}

/// @nodoc
abstract mixin class $SetEigaFollowBodySchemaCopyWith<$Res>  {
  factory $SetEigaFollowBodySchemaCopyWith(SetEigaFollowBodySchema value, $Res Function(SetEigaFollowBodySchema) _then) = _$SetEigaFollowBodySchemaCopyWithImpl;
@useResult
$Res call({
 String sourceId,@JsonKey(name: 'eiga_text_id') String eigaTextId, String name,@JsonKey(name: 'original_name') String originalName, String poster,@JsonKey(name: 'season_name') String seasonName, SetEigaFollowBodySchemaStatus status,@JsonKey(name: 'current_episode_name') String currentEpisodeName,@JsonKey(name: 'current_episode_id') String currentEpisodeId,@JsonKey(name: 'current_episode_time') DateTime currentEpisodeTime, bool value
});




}
/// @nodoc
class _$SetEigaFollowBodySchemaCopyWithImpl<$Res>
    implements $SetEigaFollowBodySchemaCopyWith<$Res> {
  _$SetEigaFollowBodySchemaCopyWithImpl(this._self, this._then);

  final SetEigaFollowBodySchema _self;
  final $Res Function(SetEigaFollowBodySchema) _then;

/// Create a copy of SetEigaFollowBodySchema
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sourceId = null,Object? eigaTextId = null,Object? name = null,Object? originalName = null,Object? poster = null,Object? seasonName = null,Object? status = null,Object? currentEpisodeName = null,Object? currentEpisodeId = null,Object? currentEpisodeTime = null,Object? value = null,}) {
  return _then(_self.copyWith(
sourceId: null == sourceId ? _self.sourceId : sourceId // ignore: cast_nullable_to_non_nullable
as String,eigaTextId: null == eigaTextId ? _self.eigaTextId : eigaTextId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,originalName: null == originalName ? _self.originalName : originalName // ignore: cast_nullable_to_non_nullable
as String,poster: null == poster ? _self.poster : poster // ignore: cast_nullable_to_non_nullable
as String,seasonName: null == seasonName ? _self.seasonName : seasonName // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SetEigaFollowBodySchemaStatus,currentEpisodeName: null == currentEpisodeName ? _self.currentEpisodeName : currentEpisodeName // ignore: cast_nullable_to_non_nullable
as String,currentEpisodeId: null == currentEpisodeId ? _self.currentEpisodeId : currentEpisodeId // ignore: cast_nullable_to_non_nullable
as String,currentEpisodeTime: null == currentEpisodeTime ? _self.currentEpisodeTime : currentEpisodeTime // ignore: cast_nullable_to_non_nullable
as DateTime,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _SetEigaFollowBodySchema implements SetEigaFollowBodySchema {
  const _SetEigaFollowBodySchema({required this.sourceId, @JsonKey(name: 'eiga_text_id') required this.eigaTextId, required this.name, @JsonKey(name: 'original_name') required this.originalName, required this.poster, @JsonKey(name: 'season_name') required this.seasonName, required this.status, @JsonKey(name: 'current_episode_name') required this.currentEpisodeName, @JsonKey(name: 'current_episode_id') required this.currentEpisodeId, @JsonKey(name: 'current_episode_time') required this.currentEpisodeTime, required this.value});
  factory _SetEigaFollowBodySchema.fromJson(Map<String, dynamic> json) => _$SetEigaFollowBodySchemaFromJson(json);

/// The unique identifier for the source (e.g., the series or season).
@override final  String sourceId;
/// The identifier for the specific eiga text.
@override@JsonKey(name: 'eiga_text_id') final  String eigaTextId;
/// Eiga name.
@override final  String name;
/// Eiga raw name.
@override@JsonKey(name: 'original_name') final  String originalName;
/// Poster image URL.
@override final  String poster;
/// Season name (optional).
@override@JsonKey(name: 'season_name') final  String seasonName;
/// Comic status.
@override final  SetEigaFollowBodySchemaStatus status;
/// Current episode name.
@override@JsonKey(name: 'current_episode_name') final  String currentEpisodeName;
/// Current episode id.
@override@JsonKey(name: 'current_episode_id') final  String currentEpisodeId;
/// Current episode time (ISO string).
@override@JsonKey(name: 'current_episode_time') final  DateTime currentEpisodeTime;
/// Set to true to follow, false to unfollow.
@override final  bool value;

/// Create a copy of SetEigaFollowBodySchema
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetEigaFollowBodySchemaCopyWith<_SetEigaFollowBodySchema> get copyWith => __$SetEigaFollowBodySchemaCopyWithImpl<_SetEigaFollowBodySchema>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SetEigaFollowBodySchemaToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetEigaFollowBodySchema&&(identical(other.sourceId, sourceId) || other.sourceId == sourceId)&&(identical(other.eigaTextId, eigaTextId) || other.eigaTextId == eigaTextId)&&(identical(other.name, name) || other.name == name)&&(identical(other.originalName, originalName) || other.originalName == originalName)&&(identical(other.poster, poster) || other.poster == poster)&&(identical(other.seasonName, seasonName) || other.seasonName == seasonName)&&(identical(other.status, status) || other.status == status)&&(identical(other.currentEpisodeName, currentEpisodeName) || other.currentEpisodeName == currentEpisodeName)&&(identical(other.currentEpisodeId, currentEpisodeId) || other.currentEpisodeId == currentEpisodeId)&&(identical(other.currentEpisodeTime, currentEpisodeTime) || other.currentEpisodeTime == currentEpisodeTime)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sourceId,eigaTextId,name,originalName,poster,seasonName,status,currentEpisodeName,currentEpisodeId,currentEpisodeTime,value);

@override
String toString() {
  return 'SetEigaFollowBodySchema(sourceId: $sourceId, eigaTextId: $eigaTextId, name: $name, originalName: $originalName, poster: $poster, seasonName: $seasonName, status: $status, currentEpisodeName: $currentEpisodeName, currentEpisodeId: $currentEpisodeId, currentEpisodeTime: $currentEpisodeTime, value: $value)';
}


}

/// @nodoc
abstract mixin class _$SetEigaFollowBodySchemaCopyWith<$Res> implements $SetEigaFollowBodySchemaCopyWith<$Res> {
  factory _$SetEigaFollowBodySchemaCopyWith(_SetEigaFollowBodySchema value, $Res Function(_SetEigaFollowBodySchema) _then) = __$SetEigaFollowBodySchemaCopyWithImpl;
@override @useResult
$Res call({
 String sourceId,@JsonKey(name: 'eiga_text_id') String eigaTextId, String name,@JsonKey(name: 'original_name') String originalName, String poster,@JsonKey(name: 'season_name') String seasonName, SetEigaFollowBodySchemaStatus status,@JsonKey(name: 'current_episode_name') String currentEpisodeName,@JsonKey(name: 'current_episode_id') String currentEpisodeId,@JsonKey(name: 'current_episode_time') DateTime currentEpisodeTime, bool value
});




}
/// @nodoc
class __$SetEigaFollowBodySchemaCopyWithImpl<$Res>
    implements _$SetEigaFollowBodySchemaCopyWith<$Res> {
  __$SetEigaFollowBodySchemaCopyWithImpl(this._self, this._then);

  final _SetEigaFollowBodySchema _self;
  final $Res Function(_SetEigaFollowBodySchema) _then;

/// Create a copy of SetEigaFollowBodySchema
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sourceId = null,Object? eigaTextId = null,Object? name = null,Object? originalName = null,Object? poster = null,Object? seasonName = null,Object? status = null,Object? currentEpisodeName = null,Object? currentEpisodeId = null,Object? currentEpisodeTime = null,Object? value = null,}) {
  return _then(_SetEigaFollowBodySchema(
sourceId: null == sourceId ? _self.sourceId : sourceId // ignore: cast_nullable_to_non_nullable
as String,eigaTextId: null == eigaTextId ? _self.eigaTextId : eigaTextId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,originalName: null == originalName ? _self.originalName : originalName // ignore: cast_nullable_to_non_nullable
as String,poster: null == poster ? _self.poster : poster // ignore: cast_nullable_to_non_nullable
as String,seasonName: null == seasonName ? _self.seasonName : seasonName // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SetEigaFollowBodySchemaStatus,currentEpisodeName: null == currentEpisodeName ? _self.currentEpisodeName : currentEpisodeName // ignore: cast_nullable_to_non_nullable
as String,currentEpisodeId: null == currentEpisodeId ? _self.currentEpisodeId : currentEpisodeId // ignore: cast_nullable_to_non_nullable
as String,currentEpisodeTime: null == currentEpisodeTime ? _self.currentEpisodeTime : currentEpisodeTime // ignore: cast_nullable_to_non_nullable
as DateTime,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
