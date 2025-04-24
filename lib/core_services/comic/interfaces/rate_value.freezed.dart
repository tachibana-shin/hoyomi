// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rate_value.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RateValue {

 int get best; int get count; double get value;
/// Create a copy of RateValue
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RateValueCopyWith<RateValue> get copyWith => _$RateValueCopyWithImpl<RateValue>(this as RateValue, _$identity);

  /// Serializes this RateValue to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RateValue&&(identical(other.best, best) || other.best == best)&&(identical(other.count, count) || other.count == count)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,best,count,value);

@override
String toString() {
  return 'RateValue(best: $best, count: $count, value: $value)';
}


}

/// @nodoc
abstract mixin class $RateValueCopyWith<$Res>  {
  factory $RateValueCopyWith(RateValue value, $Res Function(RateValue) _then) = _$RateValueCopyWithImpl;
@useResult
$Res call({
 int best, int count, double value
});




}
/// @nodoc
class _$RateValueCopyWithImpl<$Res>
    implements $RateValueCopyWith<$Res> {
  _$RateValueCopyWithImpl(this._self, this._then);

  final RateValue _self;
  final $Res Function(RateValue) _then;

/// Create a copy of RateValue
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? best = null,Object? count = null,Object? value = null,}) {
  return _then(_self.copyWith(
best: null == best ? _self.best : best // ignore: cast_nullable_to_non_nullable
as int,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _RateValue implements RateValue {
  const _RateValue({required this.best, required this.count, required this.value});
  factory _RateValue.fromJson(Map<String, dynamic> json) => _$RateValueFromJson(json);

@override final  int best;
@override final  int count;
@override final  double value;

/// Create a copy of RateValue
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RateValueCopyWith<_RateValue> get copyWith => __$RateValueCopyWithImpl<_RateValue>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RateValueToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RateValue&&(identical(other.best, best) || other.best == best)&&(identical(other.count, count) || other.count == count)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,best,count,value);

@override
String toString() {
  return 'RateValue(best: $best, count: $count, value: $value)';
}


}

/// @nodoc
abstract mixin class _$RateValueCopyWith<$Res> implements $RateValueCopyWith<$Res> {
  factory _$RateValueCopyWith(_RateValue value, $Res Function(_RateValue) _then) = __$RateValueCopyWithImpl;
@override @useResult
$Res call({
 int best, int count, double value
});




}
/// @nodoc
class __$RateValueCopyWithImpl<$Res>
    implements _$RateValueCopyWith<$Res> {
  __$RateValueCopyWithImpl(this._self, this._then);

  final _RateValue _self;
  final $Res Function(_RateValue) _then;

/// Create a copy of RateValue
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? best = null,Object? count = null,Object? value = null,}) {
  return _then(_RateValue(
best: null == best ? _self.best : best // ignore: cast_nullable_to_non_nullable
as int,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
