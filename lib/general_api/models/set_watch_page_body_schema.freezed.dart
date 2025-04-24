// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'set_watch_page_body_schema.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SetWatchPageBodySchema {
  /// The unique identifier for the source (e.g., series or season).
  String get sourceId;

  /// The name of the episode.
  String get name;

  /// URL to the poster image for the episode.
  String get poster;

  /// Unique identifier for the comic (movie/show) text.
  @JsonKey(name: 'comic_text_id')
  String get comicTextId;

  /// The name of the season.
  @JsonKey(name: 'season_name')
  dynamic get seasonName;

  /// The current watch page in seconds.
  num get cur;

  /// The total page of the episode in seconds.
  num get dur;

  /// The name of the episode.
  @JsonKey(name: 'episode_name')
  String get episodeName;

  /// Unique identifier for the episode.
  @JsonKey(name: 'episode_id')
  String get episodeId;

  /// Create a copy of SetWatchPageBodySchema
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SetWatchPageBodySchemaCopyWith<SetWatchPageBodySchema> get copyWith =>
      _$SetWatchPageBodySchemaCopyWithImpl<SetWatchPageBodySchema>(
          this as SetWatchPageBodySchema, _$identity);

  /// Serializes this SetWatchPageBodySchema to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SetWatchPageBodySchema &&
            (identical(other.sourceId, sourceId) ||
                other.sourceId == sourceId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.poster, poster) || other.poster == poster) &&
            (identical(other.comicTextId, comicTextId) ||
                other.comicTextId == comicTextId) &&
            const DeepCollectionEquality()
                .equals(other.seasonName, seasonName) &&
            (identical(other.cur, cur) || other.cur == cur) &&
            (identical(other.dur, dur) || other.dur == dur) &&
            (identical(other.episodeName, episodeName) ||
                other.episodeName == episodeName) &&
            (identical(other.episodeId, episodeId) ||
                other.episodeId == episodeId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      sourceId,
      name,
      poster,
      comicTextId,
      const DeepCollectionEquality().hash(seasonName),
      cur,
      dur,
      episodeName,
      episodeId);

  @override
  String toString() {
    return 'SetWatchPageBodySchema(sourceId: $sourceId, name: $name, poster: $poster, comicTextId: $comicTextId, seasonName: $seasonName, cur: $cur, dur: $dur, episodeName: $episodeName, episodeId: $episodeId)';
  }
}

/// @nodoc
abstract mixin class $SetWatchPageBodySchemaCopyWith<$Res> {
  factory $SetWatchPageBodySchemaCopyWith(SetWatchPageBodySchema value,
          $Res Function(SetWatchPageBodySchema) _then) =
      _$SetWatchPageBodySchemaCopyWithImpl;
  @useResult
  $Res call(
      {String sourceId,
      String name,
      String poster,
      @JsonKey(name: 'comic_text_id') String comicTextId,
      @JsonKey(name: 'season_name') dynamic seasonName,
      num cur,
      num dur,
      @JsonKey(name: 'episode_name') String episodeName,
      @JsonKey(name: 'episode_id') String episodeId});
}

/// @nodoc
class _$SetWatchPageBodySchemaCopyWithImpl<$Res>
    implements $SetWatchPageBodySchemaCopyWith<$Res> {
  _$SetWatchPageBodySchemaCopyWithImpl(this._self, this._then);

  final SetWatchPageBodySchema _self;
  final $Res Function(SetWatchPageBodySchema) _then;

  /// Create a copy of SetWatchPageBodySchema
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sourceId = null,
    Object? name = null,
    Object? poster = null,
    Object? comicTextId = null,
    Object? seasonName = freezed,
    Object? cur = null,
    Object? dur = null,
    Object? episodeName = null,
    Object? episodeId = null,
  }) {
    return _then(_self.copyWith(
      sourceId: null == sourceId
          ? _self.sourceId
          : sourceId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      poster: null == poster
          ? _self.poster
          : poster // ignore: cast_nullable_to_non_nullable
              as String,
      comicTextId: null == comicTextId
          ? _self.comicTextId
          : comicTextId // ignore: cast_nullable_to_non_nullable
              as String,
      seasonName: freezed == seasonName
          ? _self.seasonName
          : seasonName // ignore: cast_nullable_to_non_nullable
              as dynamic,
      cur: null == cur
          ? _self.cur
          : cur // ignore: cast_nullable_to_non_nullable
              as num,
      dur: null == dur
          ? _self.dur
          : dur // ignore: cast_nullable_to_non_nullable
              as num,
      episodeName: null == episodeName
          ? _self.episodeName
          : episodeName // ignore: cast_nullable_to_non_nullable
              as String,
      episodeId: null == episodeId
          ? _self.episodeId
          : episodeId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _SetWatchPageBodySchema implements SetWatchPageBodySchema {
  const _SetWatchPageBodySchema(
      {required this.sourceId,
      required this.name,
      required this.poster,
      @JsonKey(name: 'comic_text_id') required this.comicTextId,
      @JsonKey(name: 'season_name') required this.seasonName,
      required this.cur,
      required this.dur,
      @JsonKey(name: 'episode_name') required this.episodeName,
      @JsonKey(name: 'episode_id') required this.episodeId});
  factory _SetWatchPageBodySchema.fromJson(Map<String, dynamic> json) =>
      _$SetWatchPageBodySchemaFromJson(json);

  /// The unique identifier for the source (e.g., series or season).
  @override
  final String sourceId;

  /// The name of the episode.
  @override
  final String name;

  /// URL to the poster image for the episode.
  @override
  final String poster;

  /// Unique identifier for the comic (movie/show) text.
  @override
  @JsonKey(name: 'comic_text_id')
  final String comicTextId;

  /// The name of the season.
  @override
  @JsonKey(name: 'season_name')
  final dynamic seasonName;

  /// The current watch page in seconds.
  @override
  final num cur;

  /// The total page of the episode in seconds.
  @override
  final num dur;

  /// The name of the episode.
  @override
  @JsonKey(name: 'episode_name')
  final String episodeName;

  /// Unique identifier for the episode.
  @override
  @JsonKey(name: 'episode_id')
  final String episodeId;

  /// Create a copy of SetWatchPageBodySchema
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SetWatchPageBodySchemaCopyWith<_SetWatchPageBodySchema> get copyWith =>
      __$SetWatchPageBodySchemaCopyWithImpl<_SetWatchPageBodySchema>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SetWatchPageBodySchemaToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SetWatchPageBodySchema &&
            (identical(other.sourceId, sourceId) ||
                other.sourceId == sourceId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.poster, poster) || other.poster == poster) &&
            (identical(other.comicTextId, comicTextId) ||
                other.comicTextId == comicTextId) &&
            const DeepCollectionEquality()
                .equals(other.seasonName, seasonName) &&
            (identical(other.cur, cur) || other.cur == cur) &&
            (identical(other.dur, dur) || other.dur == dur) &&
            (identical(other.episodeName, episodeName) ||
                other.episodeName == episodeName) &&
            (identical(other.episodeId, episodeId) ||
                other.episodeId == episodeId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      sourceId,
      name,
      poster,
      comicTextId,
      const DeepCollectionEquality().hash(seasonName),
      cur,
      dur,
      episodeName,
      episodeId);

  @override
  String toString() {
    return 'SetWatchPageBodySchema(sourceId: $sourceId, name: $name, poster: $poster, comicTextId: $comicTextId, seasonName: $seasonName, cur: $cur, dur: $dur, episodeName: $episodeName, episodeId: $episodeId)';
  }
}

/// @nodoc
abstract mixin class _$SetWatchPageBodySchemaCopyWith<$Res>
    implements $SetWatchPageBodySchemaCopyWith<$Res> {
  factory _$SetWatchPageBodySchemaCopyWith(_SetWatchPageBodySchema value,
          $Res Function(_SetWatchPageBodySchema) _then) =
      __$SetWatchPageBodySchemaCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String sourceId,
      String name,
      String poster,
      @JsonKey(name: 'comic_text_id') String comicTextId,
      @JsonKey(name: 'season_name') dynamic seasonName,
      num cur,
      num dur,
      @JsonKey(name: 'episode_name') String episodeName,
      @JsonKey(name: 'episode_id') String episodeId});
}

/// @nodoc
class __$SetWatchPageBodySchemaCopyWithImpl<$Res>
    implements _$SetWatchPageBodySchemaCopyWith<$Res> {
  __$SetWatchPageBodySchemaCopyWithImpl(this._self, this._then);

  final _SetWatchPageBodySchema _self;
  final $Res Function(_SetWatchPageBodySchema) _then;

  /// Create a copy of SetWatchPageBodySchema
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? sourceId = null,
    Object? name = null,
    Object? poster = null,
    Object? comicTextId = null,
    Object? seasonName = freezed,
    Object? cur = null,
    Object? dur = null,
    Object? episodeName = null,
    Object? episodeId = null,
  }) {
    return _then(_SetWatchPageBodySchema(
      sourceId: null == sourceId
          ? _self.sourceId
          : sourceId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      poster: null == poster
          ? _self.poster
          : poster // ignore: cast_nullable_to_non_nullable
              as String,
      comicTextId: null == comicTextId
          ? _self.comicTextId
          : comicTextId // ignore: cast_nullable_to_non_nullable
              as String,
      seasonName: freezed == seasonName
          ? _self.seasonName
          : seasonName // ignore: cast_nullable_to_non_nullable
              as dynamic,
      cur: null == cur
          ? _self.cur
          : cur // ignore: cast_nullable_to_non_nullable
              as num,
      dur: null == dur
          ? _self.dur
          : dur // ignore: cast_nullable_to_non_nullable
              as num,
      episodeName: null == episodeName
          ? _self.episodeName
          : episodeName // ignore: cast_nullable_to_non_nullable
              as String,
      episodeId: null == episodeId
          ? _self.episodeId
          : episodeId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
