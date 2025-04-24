// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_api_comic_set_watch_page_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PostApiComicSetWatchPageResponse {

/// Indicates whether the watch page was successfully set.
 bool get success;
/// Create a copy of PostApiComicSetWatchPageResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PostApiComicSetWatchPageResponseCopyWith<PostApiComicSetWatchPageResponse> get copyWith => _$PostApiComicSetWatchPageResponseCopyWithImpl<PostApiComicSetWatchPageResponse>(this as PostApiComicSetWatchPageResponse, _$identity);

  /// Serializes this PostApiComicSetWatchPageResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostApiComicSetWatchPageResponse&&(identical(other.success, success) || other.success == success));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success);

@override
String toString() {
  return 'PostApiComicSetWatchPageResponse(success: $success)';
}


}

/// @nodoc
abstract mixin class $PostApiComicSetWatchPageResponseCopyWith<$Res>  {
  factory $PostApiComicSetWatchPageResponseCopyWith(PostApiComicSetWatchPageResponse value, $Res Function(PostApiComicSetWatchPageResponse) _then) = _$PostApiComicSetWatchPageResponseCopyWithImpl;
@useResult
$Res call({
 bool success
});




}
/// @nodoc
class _$PostApiComicSetWatchPageResponseCopyWithImpl<$Res>
    implements $PostApiComicSetWatchPageResponseCopyWith<$Res> {
  _$PostApiComicSetWatchPageResponseCopyWithImpl(this._self, this._then);

  final PostApiComicSetWatchPageResponse _self;
  final $Res Function(PostApiComicSetWatchPageResponse) _then;

/// Create a copy of PostApiComicSetWatchPageResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _PostApiComicSetWatchPageResponse implements PostApiComicSetWatchPageResponse {
  const _PostApiComicSetWatchPageResponse({required this.success});
  factory _PostApiComicSetWatchPageResponse.fromJson(Map<String, dynamic> json) => _$PostApiComicSetWatchPageResponseFromJson(json);

/// Indicates whether the watch page was successfully set.
@override final  bool success;

/// Create a copy of PostApiComicSetWatchPageResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PostApiComicSetWatchPageResponseCopyWith<_PostApiComicSetWatchPageResponse> get copyWith => __$PostApiComicSetWatchPageResponseCopyWithImpl<_PostApiComicSetWatchPageResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PostApiComicSetWatchPageResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PostApiComicSetWatchPageResponse&&(identical(other.success, success) || other.success == success));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success);

@override
String toString() {
  return 'PostApiComicSetWatchPageResponse(success: $success)';
}


}

/// @nodoc
abstract mixin class _$PostApiComicSetWatchPageResponseCopyWith<$Res> implements $PostApiComicSetWatchPageResponseCopyWith<$Res> {
  factory _$PostApiComicSetWatchPageResponseCopyWith(_PostApiComicSetWatchPageResponse value, $Res Function(_PostApiComicSetWatchPageResponse) _then) = __$PostApiComicSetWatchPageResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success
});




}
/// @nodoc
class __$PostApiComicSetWatchPageResponseCopyWithImpl<$Res>
    implements _$PostApiComicSetWatchPageResponseCopyWith<$Res> {
  __$PostApiComicSetWatchPageResponseCopyWithImpl(this._self, this._then);

  final _PostApiComicSetWatchPageResponse _self;
  final $Res Function(_PostApiComicSetWatchPageResponse) _then;

/// Create a copy of PostApiComicSetWatchPageResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,}) {
  return _then(_PostApiComicSetWatchPageResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
