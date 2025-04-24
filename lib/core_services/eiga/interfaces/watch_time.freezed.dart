// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'watch_time.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WatchTime {
  Duration get position;
  Duration get duration;

  /// Create a copy of WatchTime
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WatchTimeCopyWith<WatchTime> get copyWith =>
      _$WatchTimeCopyWithImpl<WatchTime>(this as WatchTime, _$identity);

  /// Serializes this WatchTime to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WatchTime &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.duration, duration) ||
                other.duration == duration));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, position, duration);

  @override
  String toString() {
    return 'WatchTime(position: $position, duration: $duration)';
  }
}

/// @nodoc
abstract mixin class $WatchTimeCopyWith<$Res> {
  factory $WatchTimeCopyWith(WatchTime value, $Res Function(WatchTime) _then) =
      _$WatchTimeCopyWithImpl;
  @useResult
  $Res call({Duration position, Duration duration});
}

/// @nodoc
class _$WatchTimeCopyWithImpl<$Res> implements $WatchTimeCopyWith<$Res> {
  _$WatchTimeCopyWithImpl(this._self, this._then);

  final WatchTime _self;
  final $Res Function(WatchTime) _then;

  /// Create a copy of WatchTime
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? position = null,
    Object? duration = null,
  }) {
    return _then(_self.copyWith(
      position: null == position
          ? _self.position
          : position // ignore: cast_nullable_to_non_nullable
              as Duration,
      duration: null == duration
          ? _self.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _WatchTime implements WatchTime {
  const _WatchTime({required this.position, required this.duration});
  factory _WatchTime.fromJson(Map<String, dynamic> json) =>
      _$WatchTimeFromJson(json);

  @override
  final Duration position;
  @override
  final Duration duration;

  /// Create a copy of WatchTime
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$WatchTimeCopyWith<_WatchTime> get copyWith =>
      __$WatchTimeCopyWithImpl<_WatchTime>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$WatchTimeToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WatchTime &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.duration, duration) ||
                other.duration == duration));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, position, duration);

  @override
  String toString() {
    return 'WatchTime(position: $position, duration: $duration)';
  }
}

/// @nodoc
abstract mixin class _$WatchTimeCopyWith<$Res>
    implements $WatchTimeCopyWith<$Res> {
  factory _$WatchTimeCopyWith(
          _WatchTime value, $Res Function(_WatchTime) _then) =
      __$WatchTimeCopyWithImpl;
  @override
  @useResult
  $Res call({Duration position, Duration duration});
}

/// @nodoc
class __$WatchTimeCopyWithImpl<$Res> implements _$WatchTimeCopyWith<$Res> {
  __$WatchTimeCopyWithImpl(this._self, this._then);

  final _WatchTime _self;
  final $Res Function(_WatchTime) _then;

  /// Create a copy of WatchTime
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? position = null,
    Object? duration = null,
  }) {
    return _then(_WatchTime(
      position: null == position
          ? _self.position
          : position // ignore: cast_nullable_to_non_nullable
              as Duration,
      duration: null == duration
          ? _self.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
    ));
  }
}

// dart format on
