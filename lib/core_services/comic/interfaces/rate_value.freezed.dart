// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rate_value.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RateValue _$RateValueFromJson(Map<String, dynamic> json) {
  return _RateValue.fromJson(json);
}

/// @nodoc
mixin _$RateValue {
  int get best => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;
  double get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RateValueCopyWith<RateValue> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RateValueCopyWith<$Res> {
  factory $RateValueCopyWith(RateValue value, $Res Function(RateValue) then) =
      _$RateValueCopyWithImpl<$Res, RateValue>;
  @useResult
  $Res call({int best, int count, double value});
}

/// @nodoc
class _$RateValueCopyWithImpl<$Res, $Val extends RateValue>
    implements $RateValueCopyWith<$Res> {
  _$RateValueCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? best = null,
    Object? count = null,
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      best: null == best
          ? _value.best
          : best // ignore: cast_nullable_to_non_nullable
              as int,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RateValueImplCopyWith<$Res>
    implements $RateValueCopyWith<$Res> {
  factory _$$RateValueImplCopyWith(
          _$RateValueImpl value, $Res Function(_$RateValueImpl) then) =
      __$$RateValueImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int best, int count, double value});
}

/// @nodoc
class __$$RateValueImplCopyWithImpl<$Res>
    extends _$RateValueCopyWithImpl<$Res, _$RateValueImpl>
    implements _$$RateValueImplCopyWith<$Res> {
  __$$RateValueImplCopyWithImpl(
      _$RateValueImpl _value, $Res Function(_$RateValueImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? best = null,
    Object? count = null,
    Object? value = null,
  }) {
    return _then(_$RateValueImpl(
      best: null == best
          ? _value.best
          : best // ignore: cast_nullable_to_non_nullable
              as int,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RateValueImpl implements _RateValue {
  const _$RateValueImpl(
      {required this.best, required this.count, required this.value});

  factory _$RateValueImpl.fromJson(Map<String, dynamic> json) =>
      _$$RateValueImplFromJson(json);

  @override
  final int best;
  @override
  final int count;
  @override
  final double value;

  @override
  String toString() {
    return 'RateValue(best: $best, count: $count, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RateValueImpl &&
            (identical(other.best, best) || other.best == best) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, best, count, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RateValueImplCopyWith<_$RateValueImpl> get copyWith =>
      __$$RateValueImplCopyWithImpl<_$RateValueImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RateValueImplToJson(
      this,
    );
  }
}

abstract class _RateValue implements RateValue {
  const factory _RateValue(
      {required final int best,
      required final int count,
      required final double value}) = _$RateValueImpl;

  factory _RateValue.fromJson(Map<String, dynamic> json) =
      _$RateValueImpl.fromJson;

  @override
  int get best;
  @override
  int get count;
  @override
  double get value;
  @override
  @JsonKey(ignore: true)
  _$$RateValueImplCopyWith<_$RateValueImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
