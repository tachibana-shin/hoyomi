// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'items2.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Items2 {

@JsonKey(name: 'created_at') String get createdAt;@JsonKey(name: 'eiga_text_id') String get eigaTextId; String get name; String get poster;@JsonKey(name: 'season_name') String? get seasonName;@JsonKey(name: 'source_id') String get sourceId;@JsonKey(name: 'episode_name') String get episodeName;@JsonKey(name: 'episode_id') String get episodeId;@JsonKey(name: 'episode_time') String? get episodeTime;
/// Create a copy of Items2
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Items2CopyWith<Items2> get copyWith => _$Items2CopyWithImpl<Items2>(this as Items2, _$identity);

  /// Serializes this Items2 to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Items2&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.eigaTextId, eigaTextId) || other.eigaTextId == eigaTextId)&&(identical(other.name, name) || other.name == name)&&(identical(other.poster, poster) || other.poster == poster)&&(identical(other.seasonName, seasonName) || other.seasonName == seasonName)&&(identical(other.sourceId, sourceId) || other.sourceId == sourceId)&&(identical(other.episodeName, episodeName) || other.episodeName == episodeName)&&(identical(other.episodeId, episodeId) || other.episodeId == episodeId)&&(identical(other.episodeTime, episodeTime) || other.episodeTime == episodeTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,createdAt,eigaTextId,name,poster,seasonName,sourceId,episodeName,episodeId,episodeTime);

@override
String toString() {
  return 'Items2(createdAt: $createdAt, eigaTextId: $eigaTextId, name: $name, poster: $poster, seasonName: $seasonName, sourceId: $sourceId, episodeName: $episodeName, episodeId: $episodeId, episodeTime: $episodeTime)';
}


}

/// @nodoc
abstract mixin class $Items2CopyWith<$Res>  {
  factory $Items2CopyWith(Items2 value, $Res Function(Items2) _then) = _$Items2CopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'eiga_text_id') String eigaTextId, String name, String poster,@JsonKey(name: 'season_name') String? seasonName,@JsonKey(name: 'source_id') String sourceId,@JsonKey(name: 'episode_name') String episodeName,@JsonKey(name: 'episode_id') String episodeId,@JsonKey(name: 'episode_time') String? episodeTime
});




}
/// @nodoc
class _$Items2CopyWithImpl<$Res>
    implements $Items2CopyWith<$Res> {
  _$Items2CopyWithImpl(this._self, this._then);

  final Items2 _self;
  final $Res Function(Items2) _then;

/// Create a copy of Items2
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? createdAt = null,Object? eigaTextId = null,Object? name = null,Object? poster = null,Object? seasonName = freezed,Object? sourceId = null,Object? episodeName = null,Object? episodeId = null,Object? episodeTime = freezed,}) {
  return _then(_self.copyWith(
createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,eigaTextId: null == eigaTextId ? _self.eigaTextId : eigaTextId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,poster: null == poster ? _self.poster : poster // ignore: cast_nullable_to_non_nullable
as String,seasonName: freezed == seasonName ? _self.seasonName : seasonName // ignore: cast_nullable_to_non_nullable
as String?,sourceId: null == sourceId ? _self.sourceId : sourceId // ignore: cast_nullable_to_non_nullable
as String,episodeName: null == episodeName ? _self.episodeName : episodeName // ignore: cast_nullable_to_non_nullable
as String,episodeId: null == episodeId ? _self.episodeId : episodeId // ignore: cast_nullable_to_non_nullable
as String,episodeTime: freezed == episodeTime ? _self.episodeTime : episodeTime // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Items2 implements Items2 {
  const _Items2({@JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'eiga_text_id') required this.eigaTextId, required this.name, required this.poster, @JsonKey(name: 'season_name') required this.seasonName, @JsonKey(name: 'source_id') required this.sourceId, @JsonKey(name: 'episode_name') required this.episodeName, @JsonKey(name: 'episode_id') required this.episodeId, @JsonKey(name: 'episode_time') required this.episodeTime});
  factory _Items2.fromJson(Map<String, dynamic> json) => _$Items2FromJson(json);

@override@JsonKey(name: 'created_at') final  String createdAt;
@override@JsonKey(name: 'eiga_text_id') final  String eigaTextId;
@override final  String name;
@override final  String poster;
@override@JsonKey(name: 'season_name') final  String? seasonName;
@override@JsonKey(name: 'source_id') final  String sourceId;
@override@JsonKey(name: 'episode_name') final  String episodeName;
@override@JsonKey(name: 'episode_id') final  String episodeId;
@override@JsonKey(name: 'episode_time') final  String? episodeTime;

/// Create a copy of Items2
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$Items2CopyWith<_Items2> get copyWith => __$Items2CopyWithImpl<_Items2>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$Items2ToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Items2&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.eigaTextId, eigaTextId) || other.eigaTextId == eigaTextId)&&(identical(other.name, name) || other.name == name)&&(identical(other.poster, poster) || other.poster == poster)&&(identical(other.seasonName, seasonName) || other.seasonName == seasonName)&&(identical(other.sourceId, sourceId) || other.sourceId == sourceId)&&(identical(other.episodeName, episodeName) || other.episodeName == episodeName)&&(identical(other.episodeId, episodeId) || other.episodeId == episodeId)&&(identical(other.episodeTime, episodeTime) || other.episodeTime == episodeTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,createdAt,eigaTextId,name,poster,seasonName,sourceId,episodeName,episodeId,episodeTime);

@override
String toString() {
  return 'Items2(createdAt: $createdAt, eigaTextId: $eigaTextId, name: $name, poster: $poster, seasonName: $seasonName, sourceId: $sourceId, episodeName: $episodeName, episodeId: $episodeId, episodeTime: $episodeTime)';
}


}

/// @nodoc
abstract mixin class _$Items2CopyWith<$Res> implements $Items2CopyWith<$Res> {
  factory _$Items2CopyWith(_Items2 value, $Res Function(_Items2) _then) = __$Items2CopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'eiga_text_id') String eigaTextId, String name, String poster,@JsonKey(name: 'season_name') String? seasonName,@JsonKey(name: 'source_id') String sourceId,@JsonKey(name: 'episode_name') String episodeName,@JsonKey(name: 'episode_id') String episodeId,@JsonKey(name: 'episode_time') String? episodeTime
});




}
/// @nodoc
class __$Items2CopyWithImpl<$Res>
    implements _$Items2CopyWith<$Res> {
  __$Items2CopyWithImpl(this._self, this._then);

  final _Items2 _self;
  final $Res Function(_Items2) _then;

/// Create a copy of Items2
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? createdAt = null,Object? eigaTextId = null,Object? name = null,Object? poster = null,Object? seasonName = freezed,Object? sourceId = null,Object? episodeName = null,Object? episodeId = null,Object? episodeTime = freezed,}) {
  return _then(_Items2(
createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,eigaTextId: null == eigaTextId ? _self.eigaTextId : eigaTextId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,poster: null == poster ? _self.poster : poster // ignore: cast_nullable_to_non_nullable
as String,seasonName: freezed == seasonName ? _self.seasonName : seasonName // ignore: cast_nullable_to_non_nullable
as String?,sourceId: null == sourceId ? _self.sourceId : sourceId // ignore: cast_nullable_to_non_nullable
as String,episodeName: null == episodeName ? _self.episodeName : episodeName // ignore: cast_nullable_to_non_nullable
as String,episodeId: null == episodeId ? _self.episodeId : episodeId // ignore: cast_nullable_to_non_nullable
as String,episodeTime: freezed == episodeTime ? _self.episodeTime : episodeTime // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
