// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Data {

/// The timestamp when the watch history entry was created.
@JsonKey(name: 'created_at') String get createdAt;/// The identifier for the specific episode of the text.
@JsonKey(name: 'comic_text_id') String get comicTextId;/// The name of the watch history item (e.g., the episode title).
 String get name;/// The URL for the poster image of the episode.
 String get poster;/// The source ID associated with the episode.
@JsonKey(name: 'source_id') String get sourceId;/// The current watch page in seconds.
@JsonKey(name: 'watch_cur') num get watchCur;/// The total page of the episode in seconds.
@JsonKey(name: 'watch_dur') num get watchDur;/// The unique identifier for the watch session.
@JsonKey(name: 'watch_id') String get watchId;/// The name associated with the watch session.
@JsonKey(name: 'watch_name') String get watchName;/// The timestamp when the watch history entry was last updated.
@JsonKey(name: 'watch_updated_at') String get watchUpdatedAt;/// The name of the season the episode belongs to.
@JsonKey(name: 'season_name') String get seasonName;
/// Create a copy of Data
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DataCopyWith<Data> get copyWith => _$DataCopyWithImpl<Data>(this as Data, _$identity);

  /// Serializes this Data to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Data&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.comicTextId, comicTextId) || other.comicTextId == comicTextId)&&(identical(other.name, name) || other.name == name)&&(identical(other.poster, poster) || other.poster == poster)&&(identical(other.sourceId, sourceId) || other.sourceId == sourceId)&&(identical(other.watchCur, watchCur) || other.watchCur == watchCur)&&(identical(other.watchDur, watchDur) || other.watchDur == watchDur)&&(identical(other.watchId, watchId) || other.watchId == watchId)&&(identical(other.watchName, watchName) || other.watchName == watchName)&&(identical(other.watchUpdatedAt, watchUpdatedAt) || other.watchUpdatedAt == watchUpdatedAt)&&(identical(other.seasonName, seasonName) || other.seasonName == seasonName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,createdAt,comicTextId,name,poster,sourceId,watchCur,watchDur,watchId,watchName,watchUpdatedAt,seasonName);

@override
String toString() {
  return 'Data(createdAt: $createdAt, comicTextId: $comicTextId, name: $name, poster: $poster, sourceId: $sourceId, watchCur: $watchCur, watchDur: $watchDur, watchId: $watchId, watchName: $watchName, watchUpdatedAt: $watchUpdatedAt, seasonName: $seasonName)';
}


}

/// @nodoc
abstract mixin class $DataCopyWith<$Res>  {
  factory $DataCopyWith(Data value, $Res Function(Data) _then) = _$DataCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'comic_text_id') String comicTextId, String name, String poster,@JsonKey(name: 'source_id') String sourceId,@JsonKey(name: 'watch_cur') num watchCur,@JsonKey(name: 'watch_dur') num watchDur,@JsonKey(name: 'watch_id') String watchId,@JsonKey(name: 'watch_name') String watchName,@JsonKey(name: 'watch_updated_at') String watchUpdatedAt,@JsonKey(name: 'season_name') String seasonName
});




}
/// @nodoc
class _$DataCopyWithImpl<$Res>
    implements $DataCopyWith<$Res> {
  _$DataCopyWithImpl(this._self, this._then);

  final Data _self;
  final $Res Function(Data) _then;

/// Create a copy of Data
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? createdAt = null,Object? comicTextId = null,Object? name = null,Object? poster = null,Object? sourceId = null,Object? watchCur = null,Object? watchDur = null,Object? watchId = null,Object? watchName = null,Object? watchUpdatedAt = null,Object? seasonName = null,}) {
  return _then(_self.copyWith(
createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,comicTextId: null == comicTextId ? _self.comicTextId : comicTextId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
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

class _Data implements Data {
  const _Data({@JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'comic_text_id') required this.comicTextId, required this.name, required this.poster, @JsonKey(name: 'source_id') required this.sourceId, @JsonKey(name: 'watch_cur') required this.watchCur, @JsonKey(name: 'watch_dur') required this.watchDur, @JsonKey(name: 'watch_id') required this.watchId, @JsonKey(name: 'watch_name') required this.watchName, @JsonKey(name: 'watch_updated_at') required this.watchUpdatedAt, @JsonKey(name: 'season_name') this.seasonName = ''});
  factory _Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

/// The timestamp when the watch history entry was created.
@override@JsonKey(name: 'created_at') final  String createdAt;
/// The identifier for the specific episode of the text.
@override@JsonKey(name: 'comic_text_id') final  String comicTextId;
/// The name of the watch history item (e.g., the episode title).
@override final  String name;
/// The URL for the poster image of the episode.
@override final  String poster;
/// The source ID associated with the episode.
@override@JsonKey(name: 'source_id') final  String sourceId;
/// The current watch page in seconds.
@override@JsonKey(name: 'watch_cur') final  num watchCur;
/// The total page of the episode in seconds.
@override@JsonKey(name: 'watch_dur') final  num watchDur;
/// The unique identifier for the watch session.
@override@JsonKey(name: 'watch_id') final  String watchId;
/// The name associated with the watch session.
@override@JsonKey(name: 'watch_name') final  String watchName;
/// The timestamp when the watch history entry was last updated.
@override@JsonKey(name: 'watch_updated_at') final  String watchUpdatedAt;
/// The name of the season the episode belongs to.
@override@JsonKey(name: 'season_name') final  String seasonName;

/// Create a copy of Data
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DataCopyWith<_Data> get copyWith => __$DataCopyWithImpl<_Data>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Data&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.comicTextId, comicTextId) || other.comicTextId == comicTextId)&&(identical(other.name, name) || other.name == name)&&(identical(other.poster, poster) || other.poster == poster)&&(identical(other.sourceId, sourceId) || other.sourceId == sourceId)&&(identical(other.watchCur, watchCur) || other.watchCur == watchCur)&&(identical(other.watchDur, watchDur) || other.watchDur == watchDur)&&(identical(other.watchId, watchId) || other.watchId == watchId)&&(identical(other.watchName, watchName) || other.watchName == watchName)&&(identical(other.watchUpdatedAt, watchUpdatedAt) || other.watchUpdatedAt == watchUpdatedAt)&&(identical(other.seasonName, seasonName) || other.seasonName == seasonName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,createdAt,comicTextId,name,poster,sourceId,watchCur,watchDur,watchId,watchName,watchUpdatedAt,seasonName);

@override
String toString() {
  return 'Data(createdAt: $createdAt, comicTextId: $comicTextId, name: $name, poster: $poster, sourceId: $sourceId, watchCur: $watchCur, watchDur: $watchDur, watchId: $watchId, watchName: $watchName, watchUpdatedAt: $watchUpdatedAt, seasonName: $seasonName)';
}


}

/// @nodoc
abstract mixin class _$DataCopyWith<$Res> implements $DataCopyWith<$Res> {
  factory _$DataCopyWith(_Data value, $Res Function(_Data) _then) = __$DataCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'comic_text_id') String comicTextId, String name, String poster,@JsonKey(name: 'source_id') String sourceId,@JsonKey(name: 'watch_cur') num watchCur,@JsonKey(name: 'watch_dur') num watchDur,@JsonKey(name: 'watch_id') String watchId,@JsonKey(name: 'watch_name') String watchName,@JsonKey(name: 'watch_updated_at') String watchUpdatedAt,@JsonKey(name: 'season_name') String seasonName
});




}
/// @nodoc
class __$DataCopyWithImpl<$Res>
    implements _$DataCopyWith<$Res> {
  __$DataCopyWithImpl(this._self, this._then);

  final _Data _self;
  final $Res Function(_Data) _then;

/// Create a copy of Data
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? createdAt = null,Object? comicTextId = null,Object? name = null,Object? poster = null,Object? sourceId = null,Object? watchCur = null,Object? watchDur = null,Object? watchId = null,Object? watchName = null,Object? watchUpdatedAt = null,Object? seasonName = null,}) {
  return _then(_Data(
createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,comicTextId: null == comicTextId ? _self.comicTextId : comicTextId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
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
