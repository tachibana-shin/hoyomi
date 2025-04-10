// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subtitle.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Subtitle _$SubtitleFromJson(Map<String, dynamic> json) {
  return _Subtitle.fromJson(json);
}

/// @nodoc
mixin _$Subtitle {
  String get language => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  SubtitleType get type => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  Headers? get headers => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SubtitleCopyWith<Subtitle> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubtitleCopyWith<$Res> {
  factory $SubtitleCopyWith(Subtitle value, $Res Function(Subtitle) then) =
      _$SubtitleCopyWithImpl<$Res, Subtitle>;
  @useResult
  $Res call(
      {String language,
      String code,
      SubtitleType type,
      String url,
      Headers? headers});

  $HeadersCopyWith<$Res>? get headers;
}

/// @nodoc
class _$SubtitleCopyWithImpl<$Res, $Val extends Subtitle>
    implements $SubtitleCopyWith<$Res> {
  _$SubtitleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? language = null,
    Object? code = null,
    Object? type = null,
    Object? url = null,
    Object? headers = freezed,
  }) {
    return _then(_value.copyWith(
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as SubtitleType,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
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
abstract class _$$SubtitleImplCopyWith<$Res>
    implements $SubtitleCopyWith<$Res> {
  factory _$$SubtitleImplCopyWith(
          _$SubtitleImpl value, $Res Function(_$SubtitleImpl) then) =
      __$$SubtitleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String language,
      String code,
      SubtitleType type,
      String url,
      Headers? headers});

  @override
  $HeadersCopyWith<$Res>? get headers;
}

/// @nodoc
class __$$SubtitleImplCopyWithImpl<$Res>
    extends _$SubtitleCopyWithImpl<$Res, _$SubtitleImpl>
    implements _$$SubtitleImplCopyWith<$Res> {
  __$$SubtitleImplCopyWithImpl(
      _$SubtitleImpl _value, $Res Function(_$SubtitleImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? language = null,
    Object? code = null,
    Object? type = null,
    Object? url = null,
    Object? headers = freezed,
  }) {
    return _then(_$SubtitleImpl(
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as SubtitleType,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
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
class _$SubtitleImpl implements _Subtitle {
  const _$SubtitleImpl(
      {required this.language,
      required this.code,
      required this.type,
      required this.url,
      this.headers});

  factory _$SubtitleImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubtitleImplFromJson(json);

  @override
  final String language;
  @override
  final String code;
  @override
  final SubtitleType type;
  @override
  final String url;
  @override
  final Headers? headers;

  @override
  String toString() {
    return 'Subtitle(language: $language, code: $code, type: $type, url: $url, headers: $headers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubtitleImpl &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.headers, headers) || other.headers == headers));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, language, code, type, url, headers);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SubtitleImplCopyWith<_$SubtitleImpl> get copyWith =>
      __$$SubtitleImplCopyWithImpl<_$SubtitleImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SubtitleImplToJson(
      this,
    );
  }
}

abstract class _Subtitle implements Subtitle {
  const factory _Subtitle(
      {required final String language,
      required final String code,
      required final SubtitleType type,
      required final String url,
      final Headers? headers}) = _$SubtitleImpl;

  factory _Subtitle.fromJson(Map<String, dynamic> json) =
      _$SubtitleImpl.fromJson;

  @override
  String get language;
  @override
  String get code;
  @override
  SubtitleType get type;
  @override
  String get url;
  @override
  Headers? get headers;
  @override
  @JsonKey(ignore: true)
  _$$SubtitleImplCopyWith<_$SubtitleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
