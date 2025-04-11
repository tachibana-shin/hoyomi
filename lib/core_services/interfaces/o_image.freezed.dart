// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'o_image.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OImage _$OImageFromJson(Map<String, dynamic> json) {
  return _OImage.fromJson(json);
}

/// @nodoc
mixin _$OImage {
  String get src => throw _privateConstructorUsedError;
  Headers? get headers => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OImageCopyWith<OImage> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OImageCopyWith<$Res> {
  factory $OImageCopyWith(OImage value, $Res Function(OImage) then) =
      _$OImageCopyWithImpl<$Res, OImage>;
  @useResult
  $Res call({String src, Headers? headers});

  $HeadersCopyWith<$Res>? get headers;
}

/// @nodoc
class _$OImageCopyWithImpl<$Res, $Val extends OImage>
    implements $OImageCopyWith<$Res> {
  _$OImageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? src = null,
    Object? headers = freezed,
  }) {
    return _then(_value.copyWith(
      src: null == src
          ? _value.src
          : src // ignore: cast_nullable_to_non_nullable
              as String,
      headers: freezed == headers
          ? _value.headers
          : headers // ignore: cast_nullable_to_non_nullable
              as Headers?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $HeadersCopyWith<$Res>? get headers {
    if (_value.headers == null) {
      return null;
    }

    return $HeadersCopyWith<$Res>(_value.headers!, (value) {
      return _then(_value.copyWith(headers: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OImageImplCopyWith<$Res> implements $OImageCopyWith<$Res> {
  factory _$$OImageImplCopyWith(
          _$OImageImpl value, $Res Function(_$OImageImpl) then) =
      __$$OImageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String src, Headers? headers});

  @override
  $HeadersCopyWith<$Res>? get headers;
}

/// @nodoc
class __$$OImageImplCopyWithImpl<$Res>
    extends _$OImageCopyWithImpl<$Res, _$OImageImpl>
    implements _$$OImageImplCopyWith<$Res> {
  __$$OImageImplCopyWithImpl(
      _$OImageImpl _value, $Res Function(_$OImageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? src = null,
    Object? headers = freezed,
  }) {
    return _then(_$OImageImpl(
      src: null == src
          ? _value.src
          : src // ignore: cast_nullable_to_non_nullable
              as String,
      headers: freezed == headers
          ? _value.headers
          : headers // ignore: cast_nullable_to_non_nullable
              as Headers?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OImageImpl implements _OImage {
  const _$OImageImpl({required this.src, this.headers});

  factory _$OImageImpl.fromJson(Map<String, dynamic> json) =>
      _$$OImageImplFromJson(json);

  @override
  final String src;
  @override
  final Headers? headers;

  @override
  String toString() {
    return 'OImage(src: $src, headers: $headers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OImageImpl &&
            (identical(other.src, src) || other.src == src) &&
            (identical(other.headers, headers) || other.headers == headers));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, src, headers);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OImageImplCopyWith<_$OImageImpl> get copyWith =>
      __$$OImageImplCopyWithImpl<_$OImageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OImageImplToJson(
      this,
    );
  }
}

abstract class _OImage implements OImage {
  const factory _OImage({required final String src, final Headers? headers}) =
      _$OImageImpl;

  factory _OImage.fromJson(Map<String, dynamic> json) = _$OImageImpl.fromJson;

  @override
  String get src;
  @override
  Headers? get headers;
  @override
  @JsonKey(ignore: true)
  _$$OImageImplCopyWith<_$OImageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
