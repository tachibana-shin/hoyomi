// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'set_watch_time_body_schema.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SetWatchTimeBodySchema {

/// The unique identifier for the source (e.g., series or season).
 String get sourceId;/// The name of the episode.
 String get name;/// Eiga raw name.
@JsonKey(name: 'original_name') String get originalName;/// URL to the poster image for the episode.
 String get poster;/// Unique identifier for the eiga (movie/show) text.
@JsonKey(name: 'eiga_text_id') String get eigaTextId;/// The name of the season.
@JsonKey(name: 'season_name') dynamic get seasonName;/// Comic status.
 SetWatchTimeBodySchemaStatus get status;/// The current watch time in seconds.
 num get cur;/// The total duration of the episode in seconds.
 num get dur;/// The name of the episode.
@JsonKey(name: 'episode_name') String get episodeName;/// Unique identifier for the episode.
@JsonKey(name: 'episode_id') String get episodeId;
/// Create a copy of SetWatchTimeBodySchema
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SetWatchTimeBodySchemaCopyWith<SetWatchTimeBodySchema> get copyWith => _$SetWatchTimeBodySchemaCopyWithImpl<SetWatchTimeBodySchema>(this as SetWatchTimeBodySchema, _$identity);

  /// Serializes this SetWatchTimeBodySchema to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SetWatchTimeBodySchema&&(identical(other.sourceId, sourceId) || other.sourceId == sourceId)&&(identical(other.name, name) || other.name == name)&&(identical(other.originalName, originalName) || other.originalName == originalName)&&(identical(other.poster, poster) || other.poster == poster)&&(identical(other.eigaTextId, eigaTextId) || other.eigaTextId == eigaTextId)&&const DeepCollectionEquality().equals(other.seasonName, seasonName)&&(identical(other.status, status) || other.status == status)&&(identical(other.cur, cur) || other.cur == cur)&&(identical(other.dur, dur) || other.dur == dur)&&(identical(other.episodeName, episodeName) || other.episodeName == episodeName)&&(identical(other.episodeId, episodeId) || other.episodeId == episodeId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sourceId,name,originalName,poster,eigaTextId,const DeepCollectionEquality().hash(seasonName),status,cur,dur,episodeName,episodeId);

@override
String toString() {
  return 'SetWatchTimeBodySchema(sourceId: $sourceId, name: $name, originalName: $originalName, poster: $poster, eigaTextId: $eigaTextId, seasonName: $seasonName, status: $status, cur: $cur, dur: $dur, episodeName: $episodeName, episodeId: $episodeId)';
}


}

/// @nodoc
abstract mixin class $SetWatchTimeBodySchemaCopyWith<$Res>  {
  factory $SetWatchTimeBodySchemaCopyWith(SetWatchTimeBodySchema value, $Res Function(SetWatchTimeBodySchema) _then) = _$SetWatchTimeBodySchemaCopyWithImpl;
@useResult
$Res call({
 String sourceId, String name,@JsonKey(name: 'original_name') String originalName, String poster,@JsonKey(name: 'eiga_text_id') String eigaTextId,@JsonKey(name: 'season_name') dynamic seasonName, SetWatchTimeBodySchemaStatus status, num cur, num dur,@JsonKey(name: 'episode_name') String episodeName,@JsonKey(name: 'episode_id') String episodeId
});




}
/// @nodoc
class _$SetWatchTimeBodySchemaCopyWithImpl<$Res>
    implements $SetWatchTimeBodySchemaCopyWith<$Res> {
  _$SetWatchTimeBodySchemaCopyWithImpl(this._self, this._then);

  final SetWatchTimeBodySchema _self;
  final $Res Function(SetWatchTimeBodySchema) _then;

/// Create a copy of SetWatchTimeBodySchema
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sourceId = null,Object? name = null,Object? originalName = null,Object? poster = null,Object? eigaTextId = null,Object? seasonName = freezed,Object? status = null,Object? cur = null,Object? dur = null,Object? episodeName = null,Object? episodeId = null,}) {
  return _then(_self.copyWith(
sourceId: null == sourceId ? _self.sourceId : sourceId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,originalName: null == originalName ? _self.originalName : originalName // ignore: cast_nullable_to_non_nullable
as String,poster: null == poster ? _self.poster : poster // ignore: cast_nullable_to_non_nullable
as String,eigaTextId: null == eigaTextId ? _self.eigaTextId : eigaTextId // ignore: cast_nullable_to_non_nullable
as String,seasonName: freezed == seasonName ? _self.seasonName : seasonName // ignore: cast_nullable_to_non_nullable
as dynamic,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SetWatchTimeBodySchemaStatus,cur: null == cur ? _self.cur : cur // ignore: cast_nullable_to_non_nullable
as num,dur: null == dur ? _self.dur : dur // ignore: cast_nullable_to_non_nullable
as num,episodeName: null == episodeName ? _self.episodeName : episodeName // ignore: cast_nullable_to_non_nullable
as String,episodeId: null == episodeId ? _self.episodeId : episodeId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _SetWatchTimeBodySchema implements SetWatchTimeBodySchema {
  const _SetWatchTimeBodySchema({required this.sourceId, required this.name, @JsonKey(name: 'original_name') required this.originalName, required this.poster, @JsonKey(name: 'eiga_text_id') required this.eigaTextId, @JsonKey(name: 'season_name') required this.seasonName, required this.status, required this.cur, required this.dur, @JsonKey(name: 'episode_name') required this.episodeName, @JsonKey(name: 'episode_id') required this.episodeId});
  factory _SetWatchTimeBodySchema.fromJson(Map<String, dynamic> json) => _$SetWatchTimeBodySchemaFromJson(json);

/// The unique identifier for the source (e.g., series or season).
@override final  String sourceId;
/// The name of the episode.
@override final  String name;
/// Eiga raw name.
@override@JsonKey(name: 'original_name') final  String originalName;
/// URL to the poster image for the episode.
@override final  String poster;
/// Unique identifier for the eiga (movie/show) text.
@override@JsonKey(name: 'eiga_text_id') final  String eigaTextId;
/// The name of the season.
@override@JsonKey(name: 'season_name') final  dynamic seasonName;
/// Comic status.
@override final  SetWatchTimeBodySchemaStatus status;
/// The current watch time in seconds.
@override final  num cur;
/// The total duration of the episode in seconds.
@override final  num dur;
/// The name of the episode.
@override@JsonKey(name: 'episode_name') final  String episodeName;
/// Unique identifier for the episode.
@override@JsonKey(name: 'episode_id') final  String episodeId;

/// Create a copy of SetWatchTimeBodySchema
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetWatchTimeBodySchemaCopyWith<_SetWatchTimeBodySchema> get copyWith => __$SetWatchTimeBodySchemaCopyWithImpl<_SetWatchTimeBodySchema>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SetWatchTimeBodySchemaToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetWatchTimeBodySchema&&(identical(other.sourceId, sourceId) || other.sourceId == sourceId)&&(identical(other.name, name) || other.name == name)&&(identical(other.originalName, originalName) || other.originalName == originalName)&&(identical(other.poster, poster) || other.poster == poster)&&(identical(other.eigaTextId, eigaTextId) || other.eigaTextId == eigaTextId)&&const DeepCollectionEquality().equals(other.seasonName, seasonName)&&(identical(other.status, status) || other.status == status)&&(identical(other.cur, cur) || other.cur == cur)&&(identical(other.dur, dur) || other.dur == dur)&&(identical(other.episodeName, episodeName) || other.episodeName == episodeName)&&(identical(other.episodeId, episodeId) || other.episodeId == episodeId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sourceId,name,originalName,poster,eigaTextId,const DeepCollectionEquality().hash(seasonName),status,cur,dur,episodeName,episodeId);

@override
String toString() {
  return 'SetWatchTimeBodySchema(sourceId: $sourceId, name: $name, originalName: $originalName, poster: $poster, eigaTextId: $eigaTextId, seasonName: $seasonName, status: $status, cur: $cur, dur: $dur, episodeName: $episodeName, episodeId: $episodeId)';
}


}

/// @nodoc
abstract mixin class _$SetWatchTimeBodySchemaCopyWith<$Res> implements $SetWatchTimeBodySchemaCopyWith<$Res> {
  factory _$SetWatchTimeBodySchemaCopyWith(_SetWatchTimeBodySchema value, $Res Function(_SetWatchTimeBodySchema) _then) = __$SetWatchTimeBodySchemaCopyWithImpl;
@override @useResult
$Res call({
 String sourceId, String name,@JsonKey(name: 'original_name') String originalName, String poster,@JsonKey(name: 'eiga_text_id') String eigaTextId,@JsonKey(name: 'season_name') dynamic seasonName, SetWatchTimeBodySchemaStatus status, num cur, num dur,@JsonKey(name: 'episode_name') String episodeName,@JsonKey(name: 'episode_id') String episodeId
});




}
/// @nodoc
class __$SetWatchTimeBodySchemaCopyWithImpl<$Res>
    implements _$SetWatchTimeBodySchemaCopyWith<$Res> {
  __$SetWatchTimeBodySchemaCopyWithImpl(this._self, this._then);

  final _SetWatchTimeBodySchema _self;
  final $Res Function(_SetWatchTimeBodySchema) _then;

/// Create a copy of SetWatchTimeBodySchema
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sourceId = null,Object? name = null,Object? originalName = null,Object? poster = null,Object? eigaTextId = null,Object? seasonName = freezed,Object? status = null,Object? cur = null,Object? dur = null,Object? episodeName = null,Object? episodeId = null,}) {
  return _then(_SetWatchTimeBodySchema(
sourceId: null == sourceId ? _self.sourceId : sourceId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,originalName: null == originalName ? _self.originalName : originalName // ignore: cast_nullable_to_non_nullable
as String,poster: null == poster ? _self.poster : poster // ignore: cast_nullable_to_non_nullable
as String,eigaTextId: null == eigaTextId ? _self.eigaTextId : eigaTextId // ignore: cast_nullable_to_non_nullable
as String,seasonName: freezed == seasonName ? _self.seasonName : seasonName // ignore: cast_nullable_to_non_nullable
as dynamic,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SetWatchTimeBodySchemaStatus,cur: null == cur ? _self.cur : cur // ignore: cast_nullable_to_non_nullable
as num,dur: null == dur ? _self.dur : dur // ignore: cast_nullable_to_non_nullable
as num,episodeName: null == episodeName ? _self.episodeName : episodeName // ignore: cast_nullable_to_non_nullable
as String,episodeId: null == episodeId ? _self.episodeId : episodeId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
