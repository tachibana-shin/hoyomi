// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'watch_time_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WatchTimeData {
  String get eigaId;
  String get episodeId;
  WatchTime? get watchTime;

  /// Create a copy of WatchTimeData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WatchTimeDataCopyWith<WatchTimeData> get copyWith =>
      _$WatchTimeDataCopyWithImpl<WatchTimeData>(
          this as WatchTimeData, _$identity);

  /// Serializes this WatchTimeData to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WatchTimeData &&
            (identical(other.eigaId, eigaId) || other.eigaId == eigaId) &&
            (identical(other.episodeId, episodeId) ||
                other.episodeId == episodeId) &&
            (identical(other.watchTime, watchTime) ||
                other.watchTime == watchTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, eigaId, episodeId, watchTime);

  @override
  String toString() {
    return 'WatchTimeData(eigaId: $eigaId, episodeId: $episodeId, watchTime: $watchTime)';
  }
}

/// @nodoc
abstract mixin class $WatchTimeDataCopyWith<$Res> {
  factory $WatchTimeDataCopyWith(
          WatchTimeData value, $Res Function(WatchTimeData) _then) =
      _$WatchTimeDataCopyWithImpl;
  @useResult
  $Res call({String eigaId, String episodeId, WatchTime? watchTime});

  $WatchTimeCopyWith<$Res>? get watchTime;
}

/// @nodoc
class _$WatchTimeDataCopyWithImpl<$Res>
    implements $WatchTimeDataCopyWith<$Res> {
  _$WatchTimeDataCopyWithImpl(this._self, this._then);

  final WatchTimeData _self;
  final $Res Function(WatchTimeData) _then;

  /// Create a copy of WatchTimeData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eigaId = null,
    Object? episodeId = null,
    Object? watchTime = freezed,
  }) {
    return _then(_self.copyWith(
      eigaId: null == eigaId
          ? _self.eigaId
          : eigaId // ignore: cast_nullable_to_non_nullable
              as String,
      episodeId: null == episodeId
          ? _self.episodeId
          : episodeId // ignore: cast_nullable_to_non_nullable
              as String,
      watchTime: freezed == watchTime
          ? _self.watchTime
          : watchTime // ignore: cast_nullable_to_non_nullable
              as WatchTime?,
    ));
  }

  /// Create a copy of WatchTimeData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WatchTimeCopyWith<$Res>? get watchTime {
    if (_self.watchTime == null) {
      return null;
    }

    return $WatchTimeCopyWith<$Res>(_self.watchTime!, (value) {
      return _then(_self.copyWith(watchTime: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _WatchTimeData implements WatchTimeData {
  const _WatchTimeData(
      {required this.eigaId, required this.episodeId, this.watchTime});
  factory _WatchTimeData.fromJson(Map<String, dynamic> json) =>
      _$WatchTimeDataFromJson(json);

  @override
  final String eigaId;
  @override
  final String episodeId;
  @override
  final WatchTime? watchTime;

  /// Create a copy of WatchTimeData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$WatchTimeDataCopyWith<_WatchTimeData> get copyWith =>
      __$WatchTimeDataCopyWithImpl<_WatchTimeData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$WatchTimeDataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WatchTimeData &&
            (identical(other.eigaId, eigaId) || other.eigaId == eigaId) &&
            (identical(other.episodeId, episodeId) ||
                other.episodeId == episodeId) &&
            (identical(other.watchTime, watchTime) ||
                other.watchTime == watchTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, eigaId, episodeId, watchTime);

  @override
  String toString() {
    return 'WatchTimeData(eigaId: $eigaId, episodeId: $episodeId, watchTime: $watchTime)';
  }
}

/// @nodoc
abstract mixin class _$WatchTimeDataCopyWith<$Res>
    implements $WatchTimeDataCopyWith<$Res> {
  factory _$WatchTimeDataCopyWith(
          _WatchTimeData value, $Res Function(_WatchTimeData) _then) =
      __$WatchTimeDataCopyWithImpl;
  @override
  @useResult
  $Res call({String eigaId, String episodeId, WatchTime? watchTime});

  @override
  $WatchTimeCopyWith<$Res>? get watchTime;
}

/// @nodoc
class __$WatchTimeDataCopyWithImpl<$Res>
    implements _$WatchTimeDataCopyWith<$Res> {
  __$WatchTimeDataCopyWithImpl(this._self, this._then);

  final _WatchTimeData _self;
  final $Res Function(_WatchTimeData) _then;

  /// Create a copy of WatchTimeData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? eigaId = null,
    Object? episodeId = null,
    Object? watchTime = freezed,
  }) {
    return _then(_WatchTimeData(
      eigaId: null == eigaId
          ? _self.eigaId
          : eigaId // ignore: cast_nullable_to_non_nullable
              as String,
      episodeId: null == episodeId
          ? _self.episodeId
          : episodeId // ignore: cast_nullable_to_non_nullable
              as String,
      watchTime: freezed == watchTime
          ? _self.watchTime
          : watchTime // ignore: cast_nullable_to_non_nullable
              as WatchTime?,
    ));
  }

  /// Create a copy of WatchTimeData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WatchTimeCopyWith<$Res>? get watchTime {
    if (_self.watchTime == null) {
      return null;
    }

    return $WatchTimeCopyWith<$Res>(_self.watchTime!, (value) {
      return _then(_self.copyWith(watchTime: value));
    });
  }
}

// dart format on
