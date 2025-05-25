// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'has_follow_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HasFollowResponse {

/// Whether the user is following this comic.
@JsonKey(name: 'has_follow') bool get hasFollow;
/// Create a copy of HasFollowResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HasFollowResponseCopyWith<HasFollowResponse> get copyWith => _$HasFollowResponseCopyWithImpl<HasFollowResponse>(this as HasFollowResponse, _$identity);

  /// Serializes this HasFollowResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HasFollowResponse&&(identical(other.hasFollow, hasFollow) || other.hasFollow == hasFollow));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,hasFollow);

@override
String toString() {
  return 'HasFollowResponse(hasFollow: $hasFollow)';
}


}

/// @nodoc
abstract mixin class $HasFollowResponseCopyWith<$Res>  {
  factory $HasFollowResponseCopyWith(HasFollowResponse value, $Res Function(HasFollowResponse) _then) = _$HasFollowResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'has_follow') bool hasFollow
});




}
/// @nodoc
class _$HasFollowResponseCopyWithImpl<$Res>
    implements $HasFollowResponseCopyWith<$Res> {
  _$HasFollowResponseCopyWithImpl(this._self, this._then);

  final HasFollowResponse _self;
  final $Res Function(HasFollowResponse) _then;

/// Create a copy of HasFollowResponse
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

class _HasFollowResponse implements HasFollowResponse {
  const _HasFollowResponse({@JsonKey(name: 'has_follow') required this.hasFollow});
  factory _HasFollowResponse.fromJson(Map<String, dynamic> json) => _$HasFollowResponseFromJson(json);

/// Whether the user is following this comic.
@override@JsonKey(name: 'has_follow') final  bool hasFollow;

/// Create a copy of HasFollowResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HasFollowResponseCopyWith<_HasFollowResponse> get copyWith => __$HasFollowResponseCopyWithImpl<_HasFollowResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HasFollowResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HasFollowResponse&&(identical(other.hasFollow, hasFollow) || other.hasFollow == hasFollow));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,hasFollow);

@override
String toString() {
  return 'HasFollowResponse(hasFollow: $hasFollow)';
}


}

/// @nodoc
abstract mixin class _$HasFollowResponseCopyWith<$Res> implements $HasFollowResponseCopyWith<$Res> {
  factory _$HasFollowResponseCopyWith(_HasFollowResponse value, $Res Function(_HasFollowResponse) _then) = __$HasFollowResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'has_follow') bool hasFollow
});




}
/// @nodoc
class __$HasFollowResponseCopyWithImpl<$Res>
    implements _$HasFollowResponseCopyWith<$Res> {
  __$HasFollowResponseCopyWithImpl(this._self, this._then);

  final _HasFollowResponse _self;
  final $Res Function(_HasFollowResponse) _then;

/// Create a copy of HasFollowResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? hasFollow = null,}) {
  return _then(_HasFollowResponse(
hasFollow: null == hasFollow ? _self.hasFollow : hasFollow // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
