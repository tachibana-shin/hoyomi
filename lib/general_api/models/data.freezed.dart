// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Data _$DataFromJson(Map<String, dynamic> json) {
  return _Data.fromJson(json);
}

/// @nodoc
mixin _$Data {
  /// The timestamp when the watch history entry was created.
  @JsonKey(name: 'created_at')
  String get createdAt => throw _privateConstructorUsedError;

  /// The identifier for the specific episode of the text.
  @JsonKey(name: 'eiga_text_id')
  String get eigaTextId => throw _privateConstructorUsedError;

  /// The name of the watch history item (e.g., the episode title).
  String get name => throw _privateConstructorUsedError;

  /// The URL for the poster image of the episode.
  String get poster => throw _privateConstructorUsedError;

  /// The name of the season the episode belongs to.
  @JsonKey(name: 'season_name')
  String get seasonName => throw _privateConstructorUsedError;

  /// The source ID associated with the episode.
  @JsonKey(name: 'source_id')
  String get sourceId => throw _privateConstructorUsedError;

  /// The current watch position in seconds.
  @JsonKey(name: 'watch_cur')
  num get watchCur => throw _privateConstructorUsedError;

  /// The total duration of the episode in seconds.
  @JsonKey(name: 'watch_dur')
  num get watchDur => throw _privateConstructorUsedError;

  /// The unique identifier for the watch session.
  @JsonKey(name: 'watch_id')
  String get watchId => throw _privateConstructorUsedError;

  /// The name associated with the watch session.
  @JsonKey(name: 'watch_name')
  String get watchName => throw _privateConstructorUsedError;

  /// The timestamp when the watch history entry was last updated.
  @JsonKey(name: 'watch_updated_at')
  String get watchUpdatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DataCopyWith<Data> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataCopyWith<$Res> {
  factory $DataCopyWith(Data value, $Res Function(Data) then) =
      _$DataCopyWithImpl<$Res, Data>;
  @useResult
  $Res call(
      {@JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'eiga_text_id') String eigaTextId,
      String name,
      String poster,
      @JsonKey(name: 'season_name') String seasonName,
      @JsonKey(name: 'source_id') String sourceId,
      @JsonKey(name: 'watch_cur') num watchCur,
      @JsonKey(name: 'watch_dur') num watchDur,
      @JsonKey(name: 'watch_id') String watchId,
      @JsonKey(name: 'watch_name') String watchName,
      @JsonKey(name: 'watch_updated_at') String watchUpdatedAt});
}

/// @nodoc
class _$DataCopyWithImpl<$Res, $Val extends Data>
    implements $DataCopyWith<$Res> {
  _$DataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? eigaTextId = null,
    Object? name = null,
    Object? poster = null,
    Object? seasonName = null,
    Object? sourceId = null,
    Object? watchCur = null,
    Object? watchDur = null,
    Object? watchId = null,
    Object? watchName = null,
    Object? watchUpdatedAt = null,
  }) {
    return _then(_value.copyWith(
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      eigaTextId: null == eigaTextId
          ? _value.eigaTextId
          : eigaTextId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      poster: null == poster
          ? _value.poster
          : poster // ignore: cast_nullable_to_non_nullable
              as String,
      seasonName: null == seasonName
          ? _value.seasonName
          : seasonName // ignore: cast_nullable_to_non_nullable
              as String,
      sourceId: null == sourceId
          ? _value.sourceId
          : sourceId // ignore: cast_nullable_to_non_nullable
              as String,
      watchCur: null == watchCur
          ? _value.watchCur
          : watchCur // ignore: cast_nullable_to_non_nullable
              as num,
      watchDur: null == watchDur
          ? _value.watchDur
          : watchDur // ignore: cast_nullable_to_non_nullable
              as num,
      watchId: null == watchId
          ? _value.watchId
          : watchId // ignore: cast_nullable_to_non_nullable
              as String,
      watchName: null == watchName
          ? _value.watchName
          : watchName // ignore: cast_nullable_to_non_nullable
              as String,
      watchUpdatedAt: null == watchUpdatedAt
          ? _value.watchUpdatedAt
          : watchUpdatedAt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DataImplCopyWith<$Res> implements $DataCopyWith<$Res> {
  factory _$$DataImplCopyWith(
          _$DataImpl value, $Res Function(_$DataImpl) then) =
      __$$DataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'eiga_text_id') String eigaTextId,
      String name,
      String poster,
      @JsonKey(name: 'season_name') String seasonName,
      @JsonKey(name: 'source_id') String sourceId,
      @JsonKey(name: 'watch_cur') num watchCur,
      @JsonKey(name: 'watch_dur') num watchDur,
      @JsonKey(name: 'watch_id') String watchId,
      @JsonKey(name: 'watch_name') String watchName,
      @JsonKey(name: 'watch_updated_at') String watchUpdatedAt});
}

/// @nodoc
class __$$DataImplCopyWithImpl<$Res>
    extends _$DataCopyWithImpl<$Res, _$DataImpl>
    implements _$$DataImplCopyWith<$Res> {
  __$$DataImplCopyWithImpl(_$DataImpl _value, $Res Function(_$DataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? eigaTextId = null,
    Object? name = null,
    Object? poster = null,
    Object? seasonName = null,
    Object? sourceId = null,
    Object? watchCur = null,
    Object? watchDur = null,
    Object? watchId = null,
    Object? watchName = null,
    Object? watchUpdatedAt = null,
  }) {
    return _then(_$DataImpl(
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      eigaTextId: null == eigaTextId
          ? _value.eigaTextId
          : eigaTextId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      poster: null == poster
          ? _value.poster
          : poster // ignore: cast_nullable_to_non_nullable
              as String,
      seasonName: null == seasonName
          ? _value.seasonName
          : seasonName // ignore: cast_nullable_to_non_nullable
              as String,
      sourceId: null == sourceId
          ? _value.sourceId
          : sourceId // ignore: cast_nullable_to_non_nullable
              as String,
      watchCur: null == watchCur
          ? _value.watchCur
          : watchCur // ignore: cast_nullable_to_non_nullable
              as num,
      watchDur: null == watchDur
          ? _value.watchDur
          : watchDur // ignore: cast_nullable_to_non_nullable
              as num,
      watchId: null == watchId
          ? _value.watchId
          : watchId // ignore: cast_nullable_to_non_nullable
              as String,
      watchName: null == watchName
          ? _value.watchName
          : watchName // ignore: cast_nullable_to_non_nullable
              as String,
      watchUpdatedAt: null == watchUpdatedAt
          ? _value.watchUpdatedAt
          : watchUpdatedAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DataImpl implements _Data {
  const _$DataImpl(
      {@JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'eiga_text_id') required this.eigaTextId,
      required this.name,
      required this.poster,
      @JsonKey(name: 'season_name') required this.seasonName,
      @JsonKey(name: 'source_id') required this.sourceId,
      @JsonKey(name: 'watch_cur') required this.watchCur,
      @JsonKey(name: 'watch_dur') required this.watchDur,
      @JsonKey(name: 'watch_id') required this.watchId,
      @JsonKey(name: 'watch_name') required this.watchName,
      @JsonKey(name: 'watch_updated_at') required this.watchUpdatedAt});

  factory _$DataImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataImplFromJson(json);

  /// The timestamp when the watch history entry was created.
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;

  /// The identifier for the specific episode of the text.
  @override
  @JsonKey(name: 'eiga_text_id')
  final String eigaTextId;

  /// The name of the watch history item (e.g., the episode title).
  @override
  final String name;

  /// The URL for the poster image of the episode.
  @override
  final String poster;

  /// The name of the season the episode belongs to.
  @override
  @JsonKey(name: 'season_name')
  final String seasonName;

  /// The source ID associated with the episode.
  @override
  @JsonKey(name: 'source_id')
  final String sourceId;

  /// The current watch position in seconds.
  @override
  @JsonKey(name: 'watch_cur')
  final num watchCur;

  /// The total duration of the episode in seconds.
  @override
  @JsonKey(name: 'watch_dur')
  final num watchDur;

  /// The unique identifier for the watch session.
  @override
  @JsonKey(name: 'watch_id')
  final String watchId;

  /// The name associated with the watch session.
  @override
  @JsonKey(name: 'watch_name')
  final String watchName;

  /// The timestamp when the watch history entry was last updated.
  @override
  @JsonKey(name: 'watch_updated_at')
  final String watchUpdatedAt;

  @override
  String toString() {
    return 'Data(createdAt: $createdAt, eigaTextId: $eigaTextId, name: $name, poster: $poster, seasonName: $seasonName, sourceId: $sourceId, watchCur: $watchCur, watchDur: $watchDur, watchId: $watchId, watchName: $watchName, watchUpdatedAt: $watchUpdatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataImpl &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.eigaTextId, eigaTextId) ||
                other.eigaTextId == eigaTextId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.poster, poster) || other.poster == poster) &&
            (identical(other.seasonName, seasonName) ||
                other.seasonName == seasonName) &&
            (identical(other.sourceId, sourceId) ||
                other.sourceId == sourceId) &&
            (identical(other.watchCur, watchCur) ||
                other.watchCur == watchCur) &&
            (identical(other.watchDur, watchDur) ||
                other.watchDur == watchDur) &&
            (identical(other.watchId, watchId) || other.watchId == watchId) &&
            (identical(other.watchName, watchName) ||
                other.watchName == watchName) &&
            (identical(other.watchUpdatedAt, watchUpdatedAt) ||
                other.watchUpdatedAt == watchUpdatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      createdAt,
      eigaTextId,
      name,
      poster,
      seasonName,
      sourceId,
      watchCur,
      watchDur,
      watchId,
      watchName,
      watchUpdatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DataImplCopyWith<_$DataImpl> get copyWith =>
      __$$DataImplCopyWithImpl<_$DataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DataImplToJson(
      this,
    );
  }
}

abstract class _Data implements Data {
  const factory _Data(
      {@JsonKey(name: 'created_at') required final String createdAt,
      @JsonKey(name: 'eiga_text_id') required final String eigaTextId,
      required final String name,
      required final String poster,
      @JsonKey(name: 'season_name') required final String seasonName,
      @JsonKey(name: 'source_id') required final String sourceId,
      @JsonKey(name: 'watch_cur') required final num watchCur,
      @JsonKey(name: 'watch_dur') required final num watchDur,
      @JsonKey(name: 'watch_id') required final String watchId,
      @JsonKey(name: 'watch_name') required final String watchName,
      @JsonKey(name: 'watch_updated_at')
      required final String watchUpdatedAt}) = _$DataImpl;

  factory _Data.fromJson(Map<String, dynamic> json) = _$DataImpl.fromJson;

  @override

  /// The timestamp when the watch history entry was created.
  @JsonKey(name: 'created_at')
  String get createdAt;
  @override

  /// The identifier for the specific episode of the text.
  @JsonKey(name: 'eiga_text_id')
  String get eigaTextId;
  @override

  /// The name of the watch history item (e.g., the episode title).
  String get name;
  @override

  /// The URL for the poster image of the episode.
  String get poster;
  @override

  /// The name of the season the episode belongs to.
  @JsonKey(name: 'season_name')
  String get seasonName;
  @override

  /// The source ID associated with the episode.
  @JsonKey(name: 'source_id')
  String get sourceId;
  @override

  /// The current watch position in seconds.
  @JsonKey(name: 'watch_cur')
  num get watchCur;
  @override

  /// The total duration of the episode in seconds.
  @JsonKey(name: 'watch_dur')
  num get watchDur;
  @override

  /// The unique identifier for the watch session.
  @JsonKey(name: 'watch_id')
  String get watchId;
  @override

  /// The name associated with the watch session.
  @JsonKey(name: 'watch_name')
  String get watchName;
  @override

  /// The timestamp when the watch history entry was last updated.
  @JsonKey(name: 'watch_updated_at')
  String get watchUpdatedAt;
  @override
  @JsonKey(ignore: true)
  _$$DataImplCopyWith<_$DataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
