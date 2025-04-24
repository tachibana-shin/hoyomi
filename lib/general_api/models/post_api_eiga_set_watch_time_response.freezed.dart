// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_api_eiga_set_watch_time_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PostApiEigaSetWatchTimeResponse {
  /// Indicates whether the watch time was successfully set.
  bool get success;

  /// Create a copy of PostApiEigaSetWatchTimeResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PostApiEigaSetWatchTimeResponseCopyWith<PostApiEigaSetWatchTimeResponse>
      get copyWith => _$PostApiEigaSetWatchTimeResponseCopyWithImpl<
              PostApiEigaSetWatchTimeResponse>(
          this as PostApiEigaSetWatchTimeResponse, _$identity);

  /// Serializes this PostApiEigaSetWatchTimeResponse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PostApiEigaSetWatchTimeResponse &&
            (identical(other.success, success) || other.success == success));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success);

  @override
  String toString() {
    return 'PostApiEigaSetWatchTimeResponse(success: $success)';
  }
}

/// @nodoc
abstract mixin class $PostApiEigaSetWatchTimeResponseCopyWith<$Res> {
  factory $PostApiEigaSetWatchTimeResponseCopyWith(
          PostApiEigaSetWatchTimeResponse value,
          $Res Function(PostApiEigaSetWatchTimeResponse) _then) =
      _$PostApiEigaSetWatchTimeResponseCopyWithImpl;
  @useResult
  $Res call({bool success});
}

/// @nodoc
class _$PostApiEigaSetWatchTimeResponseCopyWithImpl<$Res>
    implements $PostApiEigaSetWatchTimeResponseCopyWith<$Res> {
  _$PostApiEigaSetWatchTimeResponseCopyWithImpl(this._self, this._then);

  final PostApiEigaSetWatchTimeResponse _self;
  final $Res Function(PostApiEigaSetWatchTimeResponse) _then;

  /// Create a copy of PostApiEigaSetWatchTimeResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
  }) {
    return _then(_self.copyWith(
      success: null == success
          ? _self.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _PostApiEigaSetWatchTimeResponse
    implements PostApiEigaSetWatchTimeResponse {
  const _PostApiEigaSetWatchTimeResponse({required this.success});
  factory _PostApiEigaSetWatchTimeResponse.fromJson(
          Map<String, dynamic> json) =>
      _$PostApiEigaSetWatchTimeResponseFromJson(json);

  /// Indicates whether the watch time was successfully set.
  @override
  final bool success;

  /// Create a copy of PostApiEigaSetWatchTimeResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PostApiEigaSetWatchTimeResponseCopyWith<_PostApiEigaSetWatchTimeResponse>
      get copyWith => __$PostApiEigaSetWatchTimeResponseCopyWithImpl<
          _PostApiEigaSetWatchTimeResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PostApiEigaSetWatchTimeResponseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PostApiEigaSetWatchTimeResponse &&
            (identical(other.success, success) || other.success == success));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success);

  @override
  String toString() {
    return 'PostApiEigaSetWatchTimeResponse(success: $success)';
  }
}

/// @nodoc
abstract mixin class _$PostApiEigaSetWatchTimeResponseCopyWith<$Res>
    implements $PostApiEigaSetWatchTimeResponseCopyWith<$Res> {
  factory _$PostApiEigaSetWatchTimeResponseCopyWith(
          _PostApiEigaSetWatchTimeResponse value,
          $Res Function(_PostApiEigaSetWatchTimeResponse) _then) =
      __$PostApiEigaSetWatchTimeResponseCopyWithImpl;
  @override
  @useResult
  $Res call({bool success});
}

/// @nodoc
class __$PostApiEigaSetWatchTimeResponseCopyWithImpl<$Res>
    implements _$PostApiEigaSetWatchTimeResponseCopyWith<$Res> {
  __$PostApiEigaSetWatchTimeResponseCopyWithImpl(this._self, this._then);

  final _PostApiEigaSetWatchTimeResponse _self;
  final $Res Function(_PostApiEigaSetWatchTimeResponse) _then;

  /// Create a copy of PostApiEigaSetWatchTimeResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? success = null,
  }) {
    return _then(_PostApiEigaSetWatchTimeResponse(
      success: null == success
          ? _self.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
