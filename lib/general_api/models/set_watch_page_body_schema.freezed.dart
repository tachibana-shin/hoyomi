// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'set_watch_page_body_schema.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SetWatchPageBodySchema _$SetWatchPageBodySchemaFromJson(
    Map<String, dynamic> json) {
  return _SetWatchPageBodySchema.fromJson(json);
}

/// @nodoc
mixin _$SetWatchPageBodySchema {
  /// The unique identifier for the source (e.g., series or season).
  String get sourceId => throw _privateConstructorUsedError;

  /// The name of the episode.
  String get name => throw _privateConstructorUsedError;

  /// URL to the poster image for the episode.
  String get poster => throw _privateConstructorUsedError;

  /// Unique identifier for the comic (movie/show) text.
  @JsonKey(name: 'comic_text_id')
  String get comicTextId => throw _privateConstructorUsedError;

  /// The name of the season.
  @JsonKey(name: 'season_name')
  dynamic get seasonName => throw _privateConstructorUsedError;

  /// The current watch page in seconds.
  num get cur => throw _privateConstructorUsedError;

  /// The total page of the episode in seconds.
  num get dur => throw _privateConstructorUsedError;

  /// The name of the episode.
  @JsonKey(name: 'episode_name')
  String get episodeName => throw _privateConstructorUsedError;

  /// Unique identifier for the episode.
  @JsonKey(name: 'episode_id')
  String get episodeId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SetWatchPageBodySchemaCopyWith<SetWatchPageBodySchema> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SetWatchPageBodySchemaCopyWith<$Res> {
  factory $SetWatchPageBodySchemaCopyWith(SetWatchPageBodySchema value,
          $Res Function(SetWatchPageBodySchema) then) =
      _$SetWatchPageBodySchemaCopyWithImpl<$Res, SetWatchPageBodySchema>;
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
class _$SetWatchPageBodySchemaCopyWithImpl<$Res,
        $Val extends SetWatchPageBodySchema>
    implements $SetWatchPageBodySchemaCopyWith<$Res> {
  _$SetWatchPageBodySchemaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      sourceId: null == sourceId
          ? _value.sourceId
          : sourceId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      poster: null == poster
          ? _value.poster
          : poster // ignore: cast_nullable_to_non_nullable
              as String,
      comicTextId: null == comicTextId
          ? _value.comicTextId
          : comicTextId // ignore: cast_nullable_to_non_nullable
              as String,
      seasonName: freezed == seasonName
          ? _value.seasonName
          : seasonName // ignore: cast_nullable_to_non_nullable
              as dynamic,
      cur: null == cur
          ? _value.cur
          : cur // ignore: cast_nullable_to_non_nullable
              as num,
      dur: null == dur
          ? _value.dur
          : dur // ignore: cast_nullable_to_non_nullable
              as num,
      episodeName: null == episodeName
          ? _value.episodeName
          : episodeName // ignore: cast_nullable_to_non_nullable
              as String,
      episodeId: null == episodeId
          ? _value.episodeId
          : episodeId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SetWatchPageBodySchemaImplCopyWith<$Res>
    implements $SetWatchPageBodySchemaCopyWith<$Res> {
  factory _$$SetWatchPageBodySchemaImplCopyWith(
          _$SetWatchPageBodySchemaImpl value,
          $Res Function(_$SetWatchPageBodySchemaImpl) then) =
      __$$SetWatchPageBodySchemaImplCopyWithImpl<$Res>;
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
class __$$SetWatchPageBodySchemaImplCopyWithImpl<$Res>
    extends _$SetWatchPageBodySchemaCopyWithImpl<$Res,
        _$SetWatchPageBodySchemaImpl>
    implements _$$SetWatchPageBodySchemaImplCopyWith<$Res> {
  __$$SetWatchPageBodySchemaImplCopyWithImpl(
      _$SetWatchPageBodySchemaImpl _value,
      $Res Function(_$SetWatchPageBodySchemaImpl) _then)
      : super(_value, _then);

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
    return _then(_$SetWatchPageBodySchemaImpl(
      sourceId: null == sourceId
          ? _value.sourceId
          : sourceId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      poster: null == poster
          ? _value.poster
          : poster // ignore: cast_nullable_to_non_nullable
              as String,
      comicTextId: null == comicTextId
          ? _value.comicTextId
          : comicTextId // ignore: cast_nullable_to_non_nullable
              as String,
      seasonName: freezed == seasonName
          ? _value.seasonName
          : seasonName // ignore: cast_nullable_to_non_nullable
              as dynamic,
      cur: null == cur
          ? _value.cur
          : cur // ignore: cast_nullable_to_non_nullable
              as num,
      dur: null == dur
          ? _value.dur
          : dur // ignore: cast_nullable_to_non_nullable
              as num,
      episodeName: null == episodeName
          ? _value.episodeName
          : episodeName // ignore: cast_nullable_to_non_nullable
              as String,
      episodeId: null == episodeId
          ? _value.episodeId
          : episodeId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SetWatchPageBodySchemaImpl implements _SetWatchPageBodySchema {
  const _$SetWatchPageBodySchemaImpl(
      {required this.sourceId,
      required this.name,
      required this.poster,
      @JsonKey(name: 'comic_text_id') required this.comicTextId,
      @JsonKey(name: 'season_name') required this.seasonName,
      required this.cur,
      required this.dur,
      @JsonKey(name: 'episode_name') required this.episodeName,
      @JsonKey(name: 'episode_id') required this.episodeId});

  factory _$SetWatchPageBodySchemaImpl.fromJson(Map<String, dynamic> json) =>
      _$$SetWatchPageBodySchemaImplFromJson(json);

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

  @override
  String toString() {
    return 'SetWatchPageBodySchema(sourceId: $sourceId, name: $name, poster: $poster, comicTextId: $comicTextId, seasonName: $seasonName, cur: $cur, dur: $dur, episodeName: $episodeName, episodeId: $episodeId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetWatchPageBodySchemaImpl &&
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

  @JsonKey(ignore: true)
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

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SetWatchPageBodySchemaImplCopyWith<_$SetWatchPageBodySchemaImpl>
      get copyWith => __$$SetWatchPageBodySchemaImplCopyWithImpl<
          _$SetWatchPageBodySchemaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SetWatchPageBodySchemaImplToJson(
      this,
    );
  }
}

abstract class _SetWatchPageBodySchema implements SetWatchPageBodySchema {
  const factory _SetWatchPageBodySchema(
          {required final String sourceId,
          required final String name,
          required final String poster,
          @JsonKey(name: 'comic_text_id') required final String comicTextId,
          @JsonKey(name: 'season_name') required final dynamic seasonName,
          required final num cur,
          required final num dur,
          @JsonKey(name: 'episode_name') required final String episodeName,
          @JsonKey(name: 'episode_id') required final String episodeId}) =
      _$SetWatchPageBodySchemaImpl;

  factory _SetWatchPageBodySchema.fromJson(Map<String, dynamic> json) =
      _$SetWatchPageBodySchemaImpl.fromJson;

  @override

  /// The unique identifier for the source (e.g., series or season).
  String get sourceId;
  @override

  /// The name of the episode.
  String get name;
  @override

  /// URL to the poster image for the episode.
  String get poster;
  @override

  /// Unique identifier for the comic (movie/show) text.
  @JsonKey(name: 'comic_text_id')
  String get comicTextId;
  @override

  /// The name of the season.
  @JsonKey(name: 'season_name')
  dynamic get seasonName;
  @override

  /// The current watch page in seconds.
  num get cur;
  @override

  /// The total page of the episode in seconds.
  num get dur;
  @override

  /// The name of the episode.
  @JsonKey(name: 'episode_name')
  String get episodeName;
  @override

  /// Unique identifier for the episode.
  @JsonKey(name: 'episode_id')
  String get episodeId;
  @override
  @JsonKey(ignore: true)
  _$$SetWatchPageBodySchemaImplCopyWith<_$SetWatchPageBodySchemaImpl>
      get copyWith => throw _privateConstructorUsedError;
}
