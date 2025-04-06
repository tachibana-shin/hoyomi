// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_api_eiga_set_watch_time_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PostApiEigaSetWatchTimeResponse _$PostApiEigaSetWatchTimeResponseFromJson(
    Map<String, dynamic> json) {
  return _PostApiEigaSetWatchTimeResponse.fromJson(json);
}

/// @nodoc
mixin _$PostApiEigaSetWatchTimeResponse {
  /// Indicates whether the watch time was successfully set.
  bool get success => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostApiEigaSetWatchTimeResponseCopyWith<PostApiEigaSetWatchTimeResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostApiEigaSetWatchTimeResponseCopyWith<$Res> {
  factory $PostApiEigaSetWatchTimeResponseCopyWith(
          PostApiEigaSetWatchTimeResponse value,
          $Res Function(PostApiEigaSetWatchTimeResponse) then) =
      _$PostApiEigaSetWatchTimeResponseCopyWithImpl<$Res,
          PostApiEigaSetWatchTimeResponse>;
  @useResult
  $Res call({bool success});
}

/// @nodoc
class _$PostApiEigaSetWatchTimeResponseCopyWithImpl<$Res,
        $Val extends PostApiEigaSetWatchTimeResponse>
    implements $PostApiEigaSetWatchTimeResponseCopyWith<$Res> {
  _$PostApiEigaSetWatchTimeResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
  }) {
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PostApiEigaSetWatchTimeResponseImplCopyWith<$Res>
    implements $PostApiEigaSetWatchTimeResponseCopyWith<$Res> {
  factory _$$PostApiEigaSetWatchTimeResponseImplCopyWith(
          _$PostApiEigaSetWatchTimeResponseImpl value,
          $Res Function(_$PostApiEigaSetWatchTimeResponseImpl) then) =
      __$$PostApiEigaSetWatchTimeResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success});
}

/// @nodoc
class __$$PostApiEigaSetWatchTimeResponseImplCopyWithImpl<$Res>
    extends _$PostApiEigaSetWatchTimeResponseCopyWithImpl<$Res,
        _$PostApiEigaSetWatchTimeResponseImpl>
    implements _$$PostApiEigaSetWatchTimeResponseImplCopyWith<$Res> {
  __$$PostApiEigaSetWatchTimeResponseImplCopyWithImpl(
      _$PostApiEigaSetWatchTimeResponseImpl _value,
      $Res Function(_$PostApiEigaSetWatchTimeResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
  }) {
    return _then(_$PostApiEigaSetWatchTimeResponseImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PostApiEigaSetWatchTimeResponseImpl
    implements _PostApiEigaSetWatchTimeResponse {
  const _$PostApiEigaSetWatchTimeResponseImpl({required this.success});

  factory _$PostApiEigaSetWatchTimeResponseImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$PostApiEigaSetWatchTimeResponseImplFromJson(json);

  /// Indicates whether the watch time was successfully set.
  @override
  final bool success;

  @override
  String toString() {
    return 'PostApiEigaSetWatchTimeResponse(success: $success)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostApiEigaSetWatchTimeResponseImpl &&
            (identical(other.success, success) || other.success == success));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, success);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PostApiEigaSetWatchTimeResponseImplCopyWith<
          _$PostApiEigaSetWatchTimeResponseImpl>
      get copyWith => __$$PostApiEigaSetWatchTimeResponseImplCopyWithImpl<
          _$PostApiEigaSetWatchTimeResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PostApiEigaSetWatchTimeResponseImplToJson(
      this,
    );
  }
}

abstract class _PostApiEigaSetWatchTimeResponse
    implements PostApiEigaSetWatchTimeResponse {
  const factory _PostApiEigaSetWatchTimeResponse(
      {required final bool success}) = _$PostApiEigaSetWatchTimeResponseImpl;

  factory _PostApiEigaSetWatchTimeResponse.fromJson(Map<String, dynamic> json) =
      _$PostApiEigaSetWatchTimeResponseImpl.fromJson;

  @override

  /// Indicates whether the watch time was successfully set.
  bool get success;
  @override
  @JsonKey(ignore: true)
  _$$PostApiEigaSetWatchTimeResponseImplCopyWith<
          _$PostApiEigaSetWatchTimeResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
