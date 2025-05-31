// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'data4.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Data4 {

/// The timestamp when the watch history entry was created.
@JsonKey(name: 'created_at') String get createdAt;/// The identifier for the specific episode of the text.
@JsonKey(name: 'eiga_text_id') String get eigaTextId;/// The name of the watch history item (e.g., the episode title).
 String get name;@JsonKey(name: 'original_name') String get originalName;/// The URL for the poster image of the episode.
 String get poster;/// The source ID associated with the episode.
@JsonKey(name: 'source_id') String get sourceId;/// The current watch position in seconds.
@JsonKey(name: 'watch_cur') num get watchCur;/// The total duration of the episode in seconds.
@JsonKey(name: 'watch_dur') num get watchDur;/// The unique identifier for the watch session.
@JsonKey(name: 'watch_id') String get watchId;/// The name associated with the watch session.
@JsonKey(name: 'watch_name') String get watchName;/// The timestamp when the watch history entry was last updated.
@JsonKey(name: 'watch_updated_at') String get watchUpdatedAt;/// The name of the season the episode belongs to.
@JsonKey(name: 'season_name') String get seasonName;
/// Create a copy of Data4
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Data4CopyWith<Data4> get copyWith => _$Data4CopyWithImpl<Data4>(this as Data4, _$identity);

  /// Serializes this Data4 to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Data4&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.eigaTextId, eigaTextId) || other.eigaTextId == eigaTextId)&&(identical(other.name, name) || other.name == name)&&(identical(other.originalName, originalName) || other.originalName == originalName)&&(identical(other.poster, poster) || other.poster == poster)&&(identical(other.sourceId, sourceId) || other.sourceId == sourceId)&&(identical(other.watchCur, watchCur) || other.watchCur == watchCur)&&(identical(other.watchDur, watchDur) || other.watchDur == watchDur)&&(identical(other.watchId, watchId) || other.watchId == watchId)&&(identical(other.watchName, watchName) || other.watchName == watchName)&&(identical(other.watchUpdatedAt, watchUpdatedAt) || other.watchUpdatedAt == watchUpdatedAt)&&(identical(other.seasonName, seasonName) || other.seasonName == seasonName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,createdAt,eigaTextId,name,originalName,poster,sourceId,watchCur,watchDur,watchId,watchName,watchUpdatedAt,seasonName);

@override
String toString() {
  return 'Data4(createdAt: $createdAt, eigaTextId: $eigaTextId, name: $name, originalName: $originalName, poster: $poster, sourceId: $sourceId, watchCur: $watchCur, watchDur: $watchDur, watchId: $watchId, watchName: $watchName, watchUpdatedAt: $watchUpdatedAt, seasonName: $seasonName)';
}


}

/// @nodoc
abstract mixin class $Data4CopyWith<$Res>  {
  factory $Data4CopyWith(Data4 value, $Res Function(Data4) _then) = _$Data4CopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'eiga_text_id') String eigaTextId, String name,@JsonKey(name: 'original_name') String originalName, String poster,@JsonKey(name: 'source_id') String sourceId,@JsonKey(name: 'watch_cur') num watchCur,@JsonKey(name: 'watch_dur') num watchDur,@JsonKey(name: 'watch_id') String watchId,@JsonKey(name: 'watch_name') String watchName,@JsonKey(name: 'watch_updated_at') String watchUpdatedAt,@JsonKey(name: 'season_name') String seasonName
});




}
/// @nodoc
class _$Data4CopyWithImpl<$Res>
    implements $Data4CopyWith<$Res> {
  _$Data4CopyWithImpl(this._self, this._then);

  final Data4 _self;
  final $Res Function(Data4) _then;

/// Create a copy of Data4
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? createdAt = null,Object? eigaTextId = null,Object? name = null,Object? originalName = null,Object? poster = null,Object? sourceId = null,Object? watchCur = null,Object? watchDur = null,Object? watchId = null,Object? watchName = null,Object? watchUpdatedAt = null,Object? seasonName = null,}) {
  return _then(_self.copyWith(
createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,eigaTextId: null == eigaTextId ? _self.eigaTextId : eigaTextId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,originalName: null == originalName ? _self.originalName : originalName // ignore: cast_nullable_to_non_nullable
as String,poster: null == poster ? _self.poster : poster // ignore: cast_nullable_to_non_nullable
as String,sourceId: null == sourceId ? _self.sourceId : sourceId // ignore: cast_nullable_to_non_nullable
as String,watchCur: null == watchCur ? _self.watchCur : watchCur // ignore: cast_nullable_to_non_nullable
as num,watchDur: null == watchDur ? _self.watchDur : watchDur // ignore: cast_nullable_to_non_nullable
as num,watchId: null == watchId ? _self.watchId : watchId // ignore: cast_nullable_to_non_nullable
as String,watchName: null == watchName ? _self.watchName : watchName // ignore: cast_nullable_to_non_nullable
as String,watchUpdatedAt: null == watchUpdatedAt ? _self.watchUpdatedAt : watchUpdatedAt // ignore: cast_nullable_to_non_nullable
as String,seasonName: null == seasonName ? _self.seasonName : seasonName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Data4 implements Data4 {
  const _Data4({@JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'eiga_text_id') required this.eigaTextId, required this.name, @JsonKey(name: 'original_name') required this.originalName, required this.poster, @JsonKey(name: 'source_id') required this.sourceId, @JsonKey(name: 'watch_cur') required this.watchCur, @JsonKey(name: 'watch_dur') required this.watchDur, @JsonKey(name: 'watch_id') required this.watchId, @JsonKey(name: 'watch_name') required this.watchName, @JsonKey(name: 'watch_updated_at') required this.watchUpdatedAt, @JsonKey(name: 'season_name') this.seasonName = ''});
  factory _Data4.fromJson(Map<String, dynamic> json) => _$Data4FromJson(json);

/// The timestamp when the watch history entry was created.
@override@JsonKey(name: 'created_at') final  String createdAt;
/// The identifier for the specific episode of the text.
@override@JsonKey(name: 'eiga_text_id') final  String eigaTextId;
/// The name of the watch history item (e.g., the episode title).
@override final  String name;
@override@JsonKey(name: 'original_name') final  String originalName;
/// The URL for the poster image of the episode.
@override final  String poster;
/// The source ID associated with the episode.
@override@JsonKey(name: 'source_id') final  String sourceId;
/// The current watch position in seconds.
@override@JsonKey(name: 'watch_cur') final  num watchCur;
/// The total duration of the episode in seconds.
@override@JsonKey(name: 'watch_dur') final  num watchDur;
/// The unique identifier for the watch session.
@override@JsonKey(name: 'watch_id') final  String watchId;
/// The name associated with the watch session.
@override@JsonKey(name: 'watch_name') final  String watchName;
/// The timestamp when the watch history entry was last updated.
@override@JsonKey(name: 'watch_updated_at') final  String watchUpdatedAt;
/// The name of the season the episode belongs to.
@override@JsonKey(name: 'season_name') final  String seasonName;

/// Create a copy of Data4
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$Data4CopyWith<_Data4> get copyWith => __$Data4CopyWithImpl<_Data4>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$Data4ToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Data4&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.eigaTextId, eigaTextId) || other.eigaTextId == eigaTextId)&&(identical(other.name, name) || other.name == name)&&(identical(other.originalName, originalName) || other.originalName == originalName)&&(identical(other.poster, poster) || other.poster == poster)&&(identical(other.sourceId, sourceId) || other.sourceId == sourceId)&&(identical(other.watchCur, watchCur) || other.watchCur == watchCur)&&(identical(other.watchDur, watchDur) || other.watchDur == watchDur)&&(identical(other.watchId, watchId) || other.watchId == watchId)&&(identical(other.watchName, watchName) || other.watchName == watchName)&&(identical(other.watchUpdatedAt, watchUpdatedAt) || other.watchUpdatedAt == watchUpdatedAt)&&(identical(other.seasonName, seasonName) || other.seasonName == seasonName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,createdAt,eigaTextId,name,originalName,poster,sourceId,watchCur,watchDur,watchId,watchName,watchUpdatedAt,seasonName);

@override
String toString() {
  return 'Data4(createdAt: $createdAt, eigaTextId: $eigaTextId, name: $name, originalName: $originalName, poster: $poster, sourceId: $sourceId, watchCur: $watchCur, watchDur: $watchDur, watchId: $watchId, watchName: $watchName, watchUpdatedAt: $watchUpdatedAt, seasonName: $seasonName)';
}


}

/// @nodoc
abstract mixin class _$Data4CopyWith<$Res> implements $Data4CopyWith<$Res> {
  factory _$Data4CopyWith(_Data4 value, $Res Function(_Data4) _then) = __$Data4CopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'eiga_text_id') String eigaTextId, String name,@JsonKey(name: 'original_name') String originalName, String poster,@JsonKey(name: 'source_id') String sourceId,@JsonKey(name: 'watch_cur') num watchCur,@JsonKey(name: 'watch_dur') num watchDur,@JsonKey(name: 'watch_id') String watchId,@JsonKey(name: 'watch_name') String watchName,@JsonKey(name: 'watch_updated_at') String watchUpdatedAt,@JsonKey(name: 'season_name') String seasonName
});




}
/// @nodoc
class __$Data4CopyWithImpl<$Res>
    implements _$Data4CopyWith<$Res> {
  __$Data4CopyWithImpl(this._self, this._then);

  final _Data4 _self;
  final $Res Function(_Data4) _then;

/// Create a copy of Data4
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? createdAt = null,Object? eigaTextId = null,Object? name = null,Object? originalName = null,Object? poster = null,Object? sourceId = null,Object? watchCur = null,Object? watchDur = null,Object? watchId = null,Object? watchName = null,Object? watchUpdatedAt = null,Object? seasonName = null,}) {
  return _then(_Data4(
createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,eigaTextId: null == eigaTextId ? _self.eigaTextId : eigaTextId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,originalName: null == originalName ? _self.originalName : originalName // ignore: cast_nullable_to_non_nullable
as String,poster: null == poster ? _self.poster : poster // ignore: cast_nullable_to_non_nullable
as String,sourceId: null == sourceId ? _self.sourceId : sourceId // ignore: cast_nullable_to_non_nullable
as String,watchCur: null == watchCur ? _self.watchCur : watchCur // ignore: cast_nullable_to_non_nullable
as num,watchDur: null == watchDur ? _self.watchDur : watchDur // ignore: cast_nullable_to_non_nullable
as num,watchId: null == watchId ? _self.watchId : watchId // ignore: cast_nullable_to_non_nullable
as String,watchName: null == watchName ? _self.watchName : watchName // ignore: cast_nullable_to_non_nullable
as String,watchUpdatedAt: null == watchUpdatedAt ? _self.watchUpdatedAt : watchUpdatedAt // ignore: cast_nullable_to_non_nullable
as String,seasonName: null == seasonName ? _self.seasonName : seasonName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
