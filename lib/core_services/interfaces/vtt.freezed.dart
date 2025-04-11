// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vtt.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Vtt _$VttFromJson(Map<String, dynamic> json) {
  return _Vtt.fromJson(json);
}

/// @nodoc
mixin _$Vtt {
  String get src => throw _privateConstructorUsedError;
  Headers? get headers => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VttCopyWith<Vtt> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VttCopyWith<$Res> {
  factory $VttCopyWith(Vtt value, $Res Function(Vtt) then) =
      _$VttCopyWithImpl<$Res, Vtt>;
  @useResult
  $Res call({String src, Headers? headers});

  $HeadersCopyWith<$Res>? get headers;
}

/// @nodoc
class _$VttCopyWithImpl<$Res, $Val extends Vtt> implements $VttCopyWith<$Res> {
  _$VttCopyWithImpl(this._value, this._then);

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
abstract class _$$VttImplCopyWith<$Res> implements $VttCopyWith<$Res> {
  factory _$$VttImplCopyWith(_$VttImpl value, $Res Function(_$VttImpl) then) =
      __$$VttImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String src, Headers? headers});

  @override
  $HeadersCopyWith<$Res>? get headers;
}

/// @nodoc
class __$$VttImplCopyWithImpl<$Res> extends _$VttCopyWithImpl<$Res, _$VttImpl>
    implements _$$VttImplCopyWith<$Res> {
  __$$VttImplCopyWithImpl(_$VttImpl _value, $Res Function(_$VttImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? src = null,
    Object? headers = freezed,
  }) {
    return _then(_$VttImpl(
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
class _$VttImpl implements _Vtt {
  const _$VttImpl({required this.src, this.headers});

  factory _$VttImpl.fromJson(Map<String, dynamic> json) =>
      _$$VttImplFromJson(json);

  @override
  final String src;
  @override
  final Headers? headers;

  @override
  String toString() {
    return 'Vtt(src: $src, headers: $headers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VttImpl &&
            (identical(other.src, src) || other.src == src) &&
            (identical(other.headers, headers) || other.headers == headers));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, src, headers);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VttImplCopyWith<_$VttImpl> get copyWith =>
      __$$VttImplCopyWithImpl<_$VttImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VttImplToJson(
      this,
    );
  }
}

abstract class _Vtt implements Vtt {
  const factory _Vtt({required final String src, final Headers? headers}) =
      _$VttImpl;

  factory _Vtt.fromJson(Map<String, dynamic> json) = _$VttImpl.fromJson;

  @override
  String get src;
  @override
  Headers? get headers;
  @override
  @JsonKey(ignore: true)
  _$$VttImplCopyWith<_$VttImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
