// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'watch_time_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WatchTimeData _$WatchTimeDataFromJson(Map<String, dynamic> json) {
  return _WatchTimeData.fromJson(json);
}

/// @nodoc
mixin _$WatchTimeData {
  String get eigaId => throw _privateConstructorUsedError;
  String get episodeId => throw _privateConstructorUsedError;
  WatchTime? get watchTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WatchTimeDataCopyWith<WatchTimeData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WatchTimeDataCopyWith<$Res> {
  factory $WatchTimeDataCopyWith(
          WatchTimeData value, $Res Function(WatchTimeData) then) =
      _$WatchTimeDataCopyWithImpl<$Res, WatchTimeData>;
  @useResult
  $Res call({String eigaId, String episodeId, WatchTime? watchTime});

  $WatchTimeCopyWith<$Res>? get watchTime;
}

/// @nodoc
class _$WatchTimeDataCopyWithImpl<$Res, $Val extends WatchTimeData>
    implements $WatchTimeDataCopyWith<$Res> {
  _$WatchTimeDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eigaId = null,
    Object? episodeId = null,
    Object? watchTime = freezed,
  }) {
    return _then(_value.copyWith(
      eigaId: null == eigaId
          ? _value.eigaId
          : eigaId // ignore: cast_nullable_to_non_nullable
              as String,
      episodeId: null == episodeId
          ? _value.episodeId
          : episodeId // ignore: cast_nullable_to_non_nullable
              as String,
      watchTime: freezed == watchTime
          ? _value.watchTime
          : watchTime // ignore: cast_nullable_to_non_nullable
              as WatchTime?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $WatchTimeCopyWith<$Res>? get watchTime {
    if (_value.watchTime == null) {
      return null;
    }

    return $WatchTimeCopyWith<$Res>(_value.watchTime!, (value) {
      return _then(_value.copyWith(watchTime: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WatchTimeDataImplCopyWith<$Res>
    implements $WatchTimeDataCopyWith<$Res> {
  factory _$$WatchTimeDataImplCopyWith(
          _$WatchTimeDataImpl value, $Res Function(_$WatchTimeDataImpl) then) =
      __$$WatchTimeDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String eigaId, String episodeId, WatchTime? watchTime});

  @override
  $WatchTimeCopyWith<$Res>? get watchTime;
}

/// @nodoc
class __$$WatchTimeDataImplCopyWithImpl<$Res>
    extends _$WatchTimeDataCopyWithImpl<$Res, _$WatchTimeDataImpl>
    implements _$$WatchTimeDataImplCopyWith<$Res> {
  __$$WatchTimeDataImplCopyWithImpl(
      _$WatchTimeDataImpl _value, $Res Function(_$WatchTimeDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eigaId = null,
    Object? episodeId = null,
    Object? watchTime = freezed,
  }) {
    return _then(_$WatchTimeDataImpl(
      eigaId: null == eigaId
          ? _value.eigaId
          : eigaId // ignore: cast_nullable_to_non_nullable
              as String,
      episodeId: null == episodeId
          ? _value.episodeId
          : episodeId // ignore: cast_nullable_to_non_nullable
              as String,
      watchTime: freezed == watchTime
          ? _value.watchTime
          : watchTime // ignore: cast_nullable_to_non_nullable
              as WatchTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WatchTimeDataImpl implements _WatchTimeData {
  const _$WatchTimeDataImpl(
      {required this.eigaId, required this.episodeId, this.watchTime});

  factory _$WatchTimeDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$WatchTimeDataImplFromJson(json);

  @override
  final String eigaId;
  @override
  final String episodeId;
  @override
  final WatchTime? watchTime;

  @override
  String toString() {
    return 'WatchTimeData(eigaId: $eigaId, episodeId: $episodeId, watchTime: $watchTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WatchTimeDataImpl &&
            (identical(other.eigaId, eigaId) || other.eigaId == eigaId) &&
            (identical(other.episodeId, episodeId) ||
                other.episodeId == episodeId) &&
            (identical(other.watchTime, watchTime) ||
                other.watchTime == watchTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, eigaId, episodeId, watchTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WatchTimeDataImplCopyWith<_$WatchTimeDataImpl> get copyWith =>
      __$$WatchTimeDataImplCopyWithImpl<_$WatchTimeDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WatchTimeDataImplToJson(
      this,
    );
  }
}

abstract class _WatchTimeData implements WatchTimeData {
  const factory _WatchTimeData(
      {required final String eigaId,
      required final String episodeId,
      final WatchTime? watchTime}) = _$WatchTimeDataImpl;

  factory _WatchTimeData.fromJson(Map<String, dynamic> json) =
      _$WatchTimeDataImpl.fromJson;

  @override
  String get eigaId;
  @override
  String get episodeId;
  @override
  WatchTime? get watchTime;
  @override
  @JsonKey(ignore: true)
  _$$WatchTimeDataImplCopyWith<_$WatchTimeDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
