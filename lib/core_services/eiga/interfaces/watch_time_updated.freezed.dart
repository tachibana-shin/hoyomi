// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'watch_time_updated.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WatchTimeUpdated _$WatchTimeUpdatedFromJson(Map<String, dynamic> json) {
  return _WatchTimeUpdated.fromJson(json);
}

/// @nodoc
mixin _$WatchTimeUpdated {
  Duration get position => throw _privateConstructorUsedError;
  Duration get duration => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WatchTimeUpdatedCopyWith<WatchTimeUpdated> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WatchTimeUpdatedCopyWith<$Res> {
  factory $WatchTimeUpdatedCopyWith(
          WatchTimeUpdated value, $Res Function(WatchTimeUpdated) then) =
      _$WatchTimeUpdatedCopyWithImpl<$Res, WatchTimeUpdated>;
  @useResult
  $Res call({Duration position, Duration duration, DateTime updatedAt});
}

/// @nodoc
class _$WatchTimeUpdatedCopyWithImpl<$Res, $Val extends WatchTimeUpdated>
    implements $WatchTimeUpdatedCopyWith<$Res> {
  _$WatchTimeUpdatedCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? position = null,
    Object? duration = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as Duration,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WatchTimeUpdatedImplCopyWith<$Res>
    implements $WatchTimeUpdatedCopyWith<$Res> {
  factory _$$WatchTimeUpdatedImplCopyWith(_$WatchTimeUpdatedImpl value,
          $Res Function(_$WatchTimeUpdatedImpl) then) =
      __$$WatchTimeUpdatedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Duration position, Duration duration, DateTime updatedAt});
}

/// @nodoc
class __$$WatchTimeUpdatedImplCopyWithImpl<$Res>
    extends _$WatchTimeUpdatedCopyWithImpl<$Res, _$WatchTimeUpdatedImpl>
    implements _$$WatchTimeUpdatedImplCopyWith<$Res> {
  __$$WatchTimeUpdatedImplCopyWithImpl(_$WatchTimeUpdatedImpl _value,
      $Res Function(_$WatchTimeUpdatedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? position = null,
    Object? duration = null,
    Object? updatedAt = null,
  }) {
    return _then(_$WatchTimeUpdatedImpl(
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as Duration,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WatchTimeUpdatedImpl implements _WatchTimeUpdated {
  const _$WatchTimeUpdatedImpl(
      {required this.position,
      required this.duration,
      required this.updatedAt});

  factory _$WatchTimeUpdatedImpl.fromJson(Map<String, dynamic> json) =>
      _$$WatchTimeUpdatedImplFromJson(json);

  @override
  final Duration position;
  @override
  final Duration duration;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'WatchTimeUpdated(position: $position, duration: $duration, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WatchTimeUpdatedImpl &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, position, duration, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WatchTimeUpdatedImplCopyWith<_$WatchTimeUpdatedImpl> get copyWith =>
      __$$WatchTimeUpdatedImplCopyWithImpl<_$WatchTimeUpdatedImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WatchTimeUpdatedImplToJson(
      this,
    );
  }
}

abstract class _WatchTimeUpdated implements WatchTimeUpdated {
  const factory _WatchTimeUpdated(
      {required final Duration position,
      required final Duration duration,
      required final DateTime updatedAt}) = _$WatchTimeUpdatedImpl;

  factory _WatchTimeUpdated.fromJson(Map<String, dynamic> json) =
      _$WatchTimeUpdatedImpl.fromJson;

  @override
  Duration get position;
  @override
  Duration get duration;
  @override
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$WatchTimeUpdatedImplCopyWith<_$WatchTimeUpdatedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
