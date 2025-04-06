// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'watch_time.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WatchTime _$WatchTimeFromJson(Map<String, dynamic> json) {
  return _WatchTime.fromJson(json);
}

/// @nodoc
mixin _$WatchTime {
  Duration get position => throw _privateConstructorUsedError;
  Duration get duration => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WatchTimeCopyWith<WatchTime> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WatchTimeCopyWith<$Res> {
  factory $WatchTimeCopyWith(WatchTime value, $Res Function(WatchTime) then) =
      _$WatchTimeCopyWithImpl<$Res, WatchTime>;
  @useResult
  $Res call({Duration position, Duration duration});
}

/// @nodoc
class _$WatchTimeCopyWithImpl<$Res, $Val extends WatchTime>
    implements $WatchTimeCopyWith<$Res> {
  _$WatchTimeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? position = null,
    Object? duration = null,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WatchTimeImplCopyWith<$Res>
    implements $WatchTimeCopyWith<$Res> {
  factory _$$WatchTimeImplCopyWith(
          _$WatchTimeImpl value, $Res Function(_$WatchTimeImpl) then) =
      __$$WatchTimeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Duration position, Duration duration});
}

/// @nodoc
class __$$WatchTimeImplCopyWithImpl<$Res>
    extends _$WatchTimeCopyWithImpl<$Res, _$WatchTimeImpl>
    implements _$$WatchTimeImplCopyWith<$Res> {
  __$$WatchTimeImplCopyWithImpl(
      _$WatchTimeImpl _value, $Res Function(_$WatchTimeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? position = null,
    Object? duration = null,
  }) {
    return _then(_$WatchTimeImpl(
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as Duration,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WatchTimeImpl implements _WatchTime {
  const _$WatchTimeImpl({required this.position, required this.duration});

  factory _$WatchTimeImpl.fromJson(Map<String, dynamic> json) =>
      _$$WatchTimeImplFromJson(json);

  @override
  final Duration position;
  @override
  final Duration duration;

  @override
  String toString() {
    return 'WatchTime(position: $position, duration: $duration)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WatchTimeImpl &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.duration, duration) ||
                other.duration == duration));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, position, duration);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WatchTimeImplCopyWith<_$WatchTimeImpl> get copyWith =>
      __$$WatchTimeImplCopyWithImpl<_$WatchTimeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WatchTimeImplToJson(
      this,
    );
  }
}

abstract class _WatchTime implements WatchTime {
  const factory _WatchTime(
      {required final Duration position,
      required final Duration duration}) = _$WatchTimeImpl;

  factory _WatchTime.fromJson(Map<String, dynamic> json) =
      _$WatchTimeImpl.fromJson;

  @override
  Duration get position;
  @override
  Duration get duration;
  @override
  @JsonKey(ignore: true)
  _$$WatchTimeImplCopyWith<_$WatchTimeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
