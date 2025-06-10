// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'watch_time_updated.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WatchTimeUpdated {
  Duration get position;
  Duration get duration;
  DateTime get updatedAt;

  /// Create a copy of WatchTimeUpdated
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WatchTimeUpdatedCopyWith<WatchTimeUpdated> get copyWith =>
      _$WatchTimeUpdatedCopyWithImpl<WatchTimeUpdated>(
          this as WatchTimeUpdated, _$identity);

  /// Serializes this WatchTimeUpdated to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WatchTimeUpdated &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, position, duration, updatedAt);

  @override
  String toString() {
    return 'WatchTimeUpdated(position: $position, duration: $duration, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class $WatchTimeUpdatedCopyWith<$Res> {
  factory $WatchTimeUpdatedCopyWith(
          WatchTimeUpdated value, $Res Function(WatchTimeUpdated) _then) =
      _$WatchTimeUpdatedCopyWithImpl;
  @useResult
  $Res call({Duration position, Duration duration, DateTime updatedAt});
}

/// @nodoc
class _$WatchTimeUpdatedCopyWithImpl<$Res>
    implements $WatchTimeUpdatedCopyWith<$Res> {
  _$WatchTimeUpdatedCopyWithImpl(this._self, this._then);

  final WatchTimeUpdated _self;
  final $Res Function(WatchTimeUpdated) _then;

  /// Create a copy of WatchTimeUpdated
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? position = null,
    Object? duration = null,
    Object? updatedAt = null,
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
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _WatchTimeUpdated implements WatchTimeUpdated {
  const _WatchTimeUpdated(
      {required this.position,
      required this.duration,
      required this.updatedAt});
  factory _WatchTimeUpdated.fromJson(Map<String, dynamic> json) =>
      _$WatchTimeUpdatedFromJson(json);

  @override
  final Duration position;
  @override
  final Duration duration;
  @override
  final DateTime updatedAt;

  /// Create a copy of WatchTimeUpdated
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$WatchTimeUpdatedCopyWith<_WatchTimeUpdated> get copyWith =>
      __$WatchTimeUpdatedCopyWithImpl<_WatchTimeUpdated>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$WatchTimeUpdatedToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WatchTimeUpdated &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, position, duration, updatedAt);

  @override
  String toString() {
    return 'WatchTimeUpdated(position: $position, duration: $duration, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class _$WatchTimeUpdatedCopyWith<$Res>
    implements $WatchTimeUpdatedCopyWith<$Res> {
  factory _$WatchTimeUpdatedCopyWith(
          _WatchTimeUpdated value, $Res Function(_WatchTimeUpdated) _then) =
      __$WatchTimeUpdatedCopyWithImpl;
  @override
  @useResult
  $Res call({Duration position, Duration duration, DateTime updatedAt});
}

/// @nodoc
class __$WatchTimeUpdatedCopyWithImpl<$Res>
    implements _$WatchTimeUpdatedCopyWith<$Res> {
  __$WatchTimeUpdatedCopyWithImpl(this._self, this._then);

  final _WatchTimeUpdated _self;
  final $Res Function(_WatchTimeUpdated) _then;

  /// Create a copy of WatchTimeUpdated
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? position = null,
    Object? duration = null,
    Object? updatedAt = null,
  }) {
    return _then(_WatchTimeUpdated(
      position: null == position
          ? _self.position
          : position // ignore: cast_nullable_to_non_nullable
              as Duration,
      duration: null == duration
          ? _self.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

// dart format on
