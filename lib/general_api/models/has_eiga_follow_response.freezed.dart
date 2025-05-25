// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'has_eiga_follow_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HasEigaFollowResponse {

/// Whether the user is following this eiga.
@JsonKey(name: 'has_follow') bool get hasFollow;
/// Create a copy of HasEigaFollowResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HasEigaFollowResponseCopyWith<HasEigaFollowResponse> get copyWith => _$HasEigaFollowResponseCopyWithImpl<HasEigaFollowResponse>(this as HasEigaFollowResponse, _$identity);

  /// Serializes this HasEigaFollowResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HasEigaFollowResponse&&(identical(other.hasFollow, hasFollow) || other.hasFollow == hasFollow));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,hasFollow);

@override
String toString() {
  return 'HasEigaFollowResponse(hasFollow: $hasFollow)';
}


}

/// @nodoc
abstract mixin class $HasEigaFollowResponseCopyWith<$Res>  {
  factory $HasEigaFollowResponseCopyWith(HasEigaFollowResponse value, $Res Function(HasEigaFollowResponse) _then) = _$HasEigaFollowResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'has_follow') bool hasFollow
});




}
/// @nodoc
class _$HasEigaFollowResponseCopyWithImpl<$Res>
    implements $HasEigaFollowResponseCopyWith<$Res> {
  _$HasEigaFollowResponseCopyWithImpl(this._self, this._then);

  final HasEigaFollowResponse _self;
  final $Res Function(HasEigaFollowResponse) _then;

/// Create a copy of HasEigaFollowResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? hasFollow = null,}) {
  return _then(_self.copyWith(
hasFollow: null == hasFollow ? _self.hasFollow : hasFollow // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _HasEigaFollowResponse implements HasEigaFollowResponse {
  const _HasEigaFollowResponse({@JsonKey(name: 'has_follow') required this.hasFollow});
  factory _HasEigaFollowResponse.fromJson(Map<String, dynamic> json) => _$HasEigaFollowResponseFromJson(json);

/// Whether the user is following this eiga.
@override@JsonKey(name: 'has_follow') final  bool hasFollow;

/// Create a copy of HasEigaFollowResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HasEigaFollowResponseCopyWith<_HasEigaFollowResponse> get copyWith => __$HasEigaFollowResponseCopyWithImpl<_HasEigaFollowResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HasEigaFollowResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HasEigaFollowResponse&&(identical(other.hasFollow, hasFollow) || other.hasFollow == hasFollow));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,hasFollow);

@override
String toString() {
  return 'HasEigaFollowResponse(hasFollow: $hasFollow)';
}


}

/// @nodoc
abstract mixin class _$HasEigaFollowResponseCopyWith<$Res> implements $HasEigaFollowResponseCopyWith<$Res> {
  factory _$HasEigaFollowResponseCopyWith(_HasEigaFollowResponse value, $Res Function(_HasEigaFollowResponse) _then) = __$HasEigaFollowResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'has_follow') bool hasFollow
});




}
/// @nodoc
class __$HasEigaFollowResponseCopyWithImpl<$Res>
    implements _$HasEigaFollowResponseCopyWith<$Res> {
  __$HasEigaFollowResponseCopyWithImpl(this._self, this._then);

  final _HasEigaFollowResponse _self;
  final $Res Function(_HasEigaFollowResponse) _then;

/// Create a copy of HasEigaFollowResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? hasFollow = null,}) {
  return _then(_HasEigaFollowResponse(
hasFollow: null == hasFollow ? _self.hasFollow : hasFollow // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
