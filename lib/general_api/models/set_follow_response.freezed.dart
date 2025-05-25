// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'set_follow_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SetFollowResponse {

/// Whether the operation was successful.
 bool get ok;
/// Create a copy of SetFollowResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SetFollowResponseCopyWith<SetFollowResponse> get copyWith => _$SetFollowResponseCopyWithImpl<SetFollowResponse>(this as SetFollowResponse, _$identity);

  /// Serializes this SetFollowResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SetFollowResponse&&(identical(other.ok, ok) || other.ok == ok));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ok);

@override
String toString() {
  return 'SetFollowResponse(ok: $ok)';
}


}

/// @nodoc
abstract mixin class $SetFollowResponseCopyWith<$Res>  {
  factory $SetFollowResponseCopyWith(SetFollowResponse value, $Res Function(SetFollowResponse) _then) = _$SetFollowResponseCopyWithImpl;
@useResult
$Res call({
 bool ok
});




}
/// @nodoc
class _$SetFollowResponseCopyWithImpl<$Res>
    implements $SetFollowResponseCopyWith<$Res> {
  _$SetFollowResponseCopyWithImpl(this._self, this._then);

  final SetFollowResponse _self;
  final $Res Function(SetFollowResponse) _then;

/// Create a copy of SetFollowResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ok = null,}) {
  return _then(_self.copyWith(
ok: null == ok ? _self.ok : ok // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _SetFollowResponse implements SetFollowResponse {
  const _SetFollowResponse({required this.ok});
  factory _SetFollowResponse.fromJson(Map<String, dynamic> json) => _$SetFollowResponseFromJson(json);

/// Whether the operation was successful.
@override final  bool ok;

/// Create a copy of SetFollowResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetFollowResponseCopyWith<_SetFollowResponse> get copyWith => __$SetFollowResponseCopyWithImpl<_SetFollowResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SetFollowResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetFollowResponse&&(identical(other.ok, ok) || other.ok == ok));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ok);

@override
String toString() {
  return 'SetFollowResponse(ok: $ok)';
}


}

/// @nodoc
abstract mixin class _$SetFollowResponseCopyWith<$Res> implements $SetFollowResponseCopyWith<$Res> {
  factory _$SetFollowResponseCopyWith(_SetFollowResponse value, $Res Function(_SetFollowResponse) _then) = __$SetFollowResponseCopyWithImpl;
@override @useResult
$Res call({
 bool ok
});




}
/// @nodoc
class __$SetFollowResponseCopyWithImpl<$Res>
    implements _$SetFollowResponseCopyWith<$Res> {
  __$SetFollowResponseCopyWithImpl(this._self, this._then);

  final _SetFollowResponse _self;
  final $Res Function(_SetFollowResponse) _then;

/// Create a copy of SetFollowResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ok = null,}) {
  return _then(_SetFollowResponse(
ok: null == ok ? _self.ok : ok // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
