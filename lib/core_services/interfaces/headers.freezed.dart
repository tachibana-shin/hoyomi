// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'headers.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Headers _$HeadersFromJson(Map<String, dynamic> json) {
  return _Headers.fromJson(json);
}

/// @nodoc
mixin _$Headers {
  @JsonKey()
  Map<String, List<String>> get headers => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HeadersCopyWith<Headers> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HeadersCopyWith<$Res> {
  factory $HeadersCopyWith(Headers value, $Res Function(Headers) then) =
      _$HeadersCopyWithImpl<$Res, Headers>;
  @useResult
  $Res call({@JsonKey() Map<String, List<String>> headers});
}

/// @nodoc
class _$HeadersCopyWithImpl<$Res, $Val extends Headers>
    implements $HeadersCopyWith<$Res> {
  _$HeadersCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? headers = null,
  }) {
    return _then(_value.copyWith(
      headers: null == headers
          ? _value.headers
          : headers // ignore: cast_nullable_to_non_nullable
              as Map<String, List<String>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HeadersImplCopyWith<$Res> implements $HeadersCopyWith<$Res> {
  factory _$$HeadersImplCopyWith(
          _$HeadersImpl value, $Res Function(_$HeadersImpl) then) =
      __$$HeadersImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey() Map<String, List<String>> headers});
}

/// @nodoc
class __$$HeadersImplCopyWithImpl<$Res>
    extends _$HeadersCopyWithImpl<$Res, _$HeadersImpl>
    implements _$$HeadersImplCopyWith<$Res> {
  __$$HeadersImplCopyWithImpl(
      _$HeadersImpl _value, $Res Function(_$HeadersImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? headers = null,
  }) {
    return _then(_$HeadersImpl(
      headers: null == headers
          ? _value._headers
          : headers // ignore: cast_nullable_to_non_nullable
              as Map<String, List<String>>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HeadersImpl implements _Headers {
  const _$HeadersImpl(
      {@JsonKey() final Map<String, List<String>> headers = const {}})
      : _headers = headers;

  factory _$HeadersImpl.fromJson(Map<String, dynamic> json) =>
      _$$HeadersImplFromJson(json);

  final Map<String, List<String>> _headers;
  @override
  @JsonKey()
  Map<String, List<String>> get headers {
    if (_headers is EqualUnmodifiableMapView) return _headers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_headers);
  }

  @override
  String toString() {
    return 'Headers._(headers: $headers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HeadersImpl &&
            const DeepCollectionEquality().equals(other._headers, _headers));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_headers));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HeadersImplCopyWith<_$HeadersImpl> get copyWith =>
      __$$HeadersImplCopyWithImpl<_$HeadersImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HeadersImplToJson(
      this,
    );
  }
}

abstract class _Headers implements Headers {
  const factory _Headers({@JsonKey() final Map<String, List<String>> headers}) =
      _$HeadersImpl;

  factory _Headers.fromJson(Map<String, dynamic> json) = _$HeadersImpl.fromJson;

  @override
  @JsonKey()
  Map<String, List<String>> get headers;
  @override
  @JsonKey(ignore: true)
  _$$HeadersImplCopyWith<_$HeadersImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
