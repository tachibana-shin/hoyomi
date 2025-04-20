// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_api_comic_set_watch_page_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PostApiComicSetWatchPageResponse _$PostApiComicSetWatchPageResponseFromJson(
    Map<String, dynamic> json) {
  return _PostApiComicSetWatchPageResponse.fromJson(json);
}

/// @nodoc
mixin _$PostApiComicSetWatchPageResponse {
  /// Indicates whether the watch page was successfully set.
  bool get success => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostApiComicSetWatchPageResponseCopyWith<PostApiComicSetWatchPageResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostApiComicSetWatchPageResponseCopyWith<$Res> {
  factory $PostApiComicSetWatchPageResponseCopyWith(
          PostApiComicSetWatchPageResponse value,
          $Res Function(PostApiComicSetWatchPageResponse) then) =
      _$PostApiComicSetWatchPageResponseCopyWithImpl<$Res,
          PostApiComicSetWatchPageResponse>;
  @useResult
  $Res call({bool success});
}

/// @nodoc
class _$PostApiComicSetWatchPageResponseCopyWithImpl<$Res,
        $Val extends PostApiComicSetWatchPageResponse>
    implements $PostApiComicSetWatchPageResponseCopyWith<$Res> {
  _$PostApiComicSetWatchPageResponseCopyWithImpl(this._value, this._then);

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
abstract class _$$PostApiComicSetWatchPageResponseImplCopyWith<$Res>
    implements $PostApiComicSetWatchPageResponseCopyWith<$Res> {
  factory _$$PostApiComicSetWatchPageResponseImplCopyWith(
          _$PostApiComicSetWatchPageResponseImpl value,
          $Res Function(_$PostApiComicSetWatchPageResponseImpl) then) =
      __$$PostApiComicSetWatchPageResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success});
}

/// @nodoc
class __$$PostApiComicSetWatchPageResponseImplCopyWithImpl<$Res>
    extends _$PostApiComicSetWatchPageResponseCopyWithImpl<$Res,
        _$PostApiComicSetWatchPageResponseImpl>
    implements _$$PostApiComicSetWatchPageResponseImplCopyWith<$Res> {
  __$$PostApiComicSetWatchPageResponseImplCopyWithImpl(
      _$PostApiComicSetWatchPageResponseImpl _value,
      $Res Function(_$PostApiComicSetWatchPageResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
  }) {
    return _then(_$PostApiComicSetWatchPageResponseImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PostApiComicSetWatchPageResponseImpl
    implements _PostApiComicSetWatchPageResponse {
  const _$PostApiComicSetWatchPageResponseImpl({required this.success});

  factory _$PostApiComicSetWatchPageResponseImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$PostApiComicSetWatchPageResponseImplFromJson(json);

  /// Indicates whether the watch page was successfully set.
  @override
  final bool success;

  @override
  String toString() {
    return 'PostApiComicSetWatchPageResponse(success: $success)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostApiComicSetWatchPageResponseImpl &&
            (identical(other.success, success) || other.success == success));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, success);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PostApiComicSetWatchPageResponseImplCopyWith<
          _$PostApiComicSetWatchPageResponseImpl>
      get copyWith => __$$PostApiComicSetWatchPageResponseImplCopyWithImpl<
          _$PostApiComicSetWatchPageResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PostApiComicSetWatchPageResponseImplToJson(
      this,
    );
  }
}

abstract class _PostApiComicSetWatchPageResponse
    implements PostApiComicSetWatchPageResponse {
  const factory _PostApiComicSetWatchPageResponse(
      {required final bool success}) = _$PostApiComicSetWatchPageResponseImpl;

  factory _PostApiComicSetWatchPageResponse.fromJson(
          Map<String, dynamic> json) =
      _$PostApiComicSetWatchPageResponseImpl.fromJson;

  @override

  /// Indicates whether the watch page was successfully set.
  bool get success;
  @override
  @JsonKey(ignore: true)
  _$$PostApiComicSetWatchPageResponseImplCopyWith<
          _$PostApiComicSetWatchPageResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
