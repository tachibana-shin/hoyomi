// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'set_eiga_follow_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SetEigaFollowResponse {

/// Whether the operation was successful.
 bool get ok;
/// Create a copy of SetEigaFollowResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SetEigaFollowResponseCopyWith<SetEigaFollowResponse> get copyWith => _$SetEigaFollowResponseCopyWithImpl<SetEigaFollowResponse>(this as SetEigaFollowResponse, _$identity);

  /// Serializes this SetEigaFollowResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SetEigaFollowResponse&&(identical(other.ok, ok) || other.ok == ok));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ok);

@override
String toString() {
  return 'SetEigaFollowResponse(ok: $ok)';
}


}

/// @nodoc
abstract mixin class $SetEigaFollowResponseCopyWith<$Res>  {
  factory $SetEigaFollowResponseCopyWith(SetEigaFollowResponse value, $Res Function(SetEigaFollowResponse) _then) = _$SetEigaFollowResponseCopyWithImpl;
@useResult
$Res call({
 bool ok
});




}
/// @nodoc
class _$SetEigaFollowResponseCopyWithImpl<$Res>
    implements $SetEigaFollowResponseCopyWith<$Res> {
  _$SetEigaFollowResponseCopyWithImpl(this._self, this._then);

  final SetEigaFollowResponse _self;
  final $Res Function(SetEigaFollowResponse) _then;

/// Create a copy of SetEigaFollowResponse
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

class _SetEigaFollowResponse implements SetEigaFollowResponse {
  const _SetEigaFollowResponse({required this.ok});
  factory _SetEigaFollowResponse.fromJson(Map<String, dynamic> json) => _$SetEigaFollowResponseFromJson(json);

/// Whether the operation was successful.
@override final  bool ok;

/// Create a copy of SetEigaFollowResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetEigaFollowResponseCopyWith<_SetEigaFollowResponse> get copyWith => __$SetEigaFollowResponseCopyWithImpl<_SetEigaFollowResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SetEigaFollowResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetEigaFollowResponse&&(identical(other.ok, ok) || other.ok == ok));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ok);

@override
String toString() {
  return 'SetEigaFollowResponse(ok: $ok)';
}


}

/// @nodoc
abstract mixin class _$SetEigaFollowResponseCopyWith<$Res> implements $SetEigaFollowResponseCopyWith<$Res> {
  factory _$SetEigaFollowResponseCopyWith(_SetEigaFollowResponse value, $Res Function(_SetEigaFollowResponse) _then) = __$SetEigaFollowResponseCopyWithImpl;
@override @useResult
$Res call({
 bool ok
});




}
/// @nodoc
class __$SetEigaFollowResponseCopyWithImpl<$Res>
    implements _$SetEigaFollowResponseCopyWith<$Res> {
  __$SetEigaFollowResponseCopyWithImpl(this._self, this._then);

  final _SetEigaFollowResponse _self;
  final $Res Function(_SetEigaFollowResponse) _then;

/// Create a copy of SetEigaFollowResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ok = null,}) {
  return _then(_SetEigaFollowResponse(
ok: null == ok ? _self.ok : ok // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
