// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'source_content.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SourceContent _$SourceContentFromJson(Map<String, dynamic> json) {
  return _SourceContent.fromJson(json);
}

/// @nodoc
mixin _$SourceContent {
  String get content => throw _privateConstructorUsedError;
  Uri get url => throw _privateConstructorUsedError;
  Map<String, String> get headers => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SourceContentCopyWith<SourceContent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SourceContentCopyWith<$Res> {
  factory $SourceContentCopyWith(
          SourceContent value, $Res Function(SourceContent) then) =
      _$SourceContentCopyWithImpl<$Res, SourceContent>;
  @useResult
  $Res call({String content, Uri url, Map<String, String> headers});
}

/// @nodoc
class _$SourceContentCopyWithImpl<$Res, $Val extends SourceContent>
    implements $SourceContentCopyWith<$Res> {
  _$SourceContentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? url = null,
    Object? headers = null,
  }) {
    return _then(_value.copyWith(
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as Uri,
      headers: null == headers
          ? _value.headers
          : headers // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SourceContentImplCopyWith<$Res>
    implements $SourceContentCopyWith<$Res> {
  factory _$$SourceContentImplCopyWith(
          _$SourceContentImpl value, $Res Function(_$SourceContentImpl) then) =
      __$$SourceContentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String content, Uri url, Map<String, String> headers});
}

/// @nodoc
class __$$SourceContentImplCopyWithImpl<$Res>
    extends _$SourceContentCopyWithImpl<$Res, _$SourceContentImpl>
    implements _$$SourceContentImplCopyWith<$Res> {
  __$$SourceContentImplCopyWithImpl(
      _$SourceContentImpl _value, $Res Function(_$SourceContentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? url = null,
    Object? headers = null,
  }) {
    return _then(_$SourceContentImpl(
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as Uri,
      headers: null == headers
          ? _value._headers
          : headers // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SourceContentImpl implements _SourceContent {
  const _$SourceContentImpl(
      {required this.content,
      required this.url,
      final Map<String, String> headers = const {}})
      : _headers = headers;

  factory _$SourceContentImpl.fromJson(Map<String, dynamic> json) =>
      _$$SourceContentImplFromJson(json);

  @override
  final String content;
  @override
  final Uri url;
  final Map<String, String> _headers;
  @override
  @JsonKey()
  Map<String, String> get headers {
    if (_headers is EqualUnmodifiableMapView) return _headers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_headers);
  }

  @override
  String toString() {
    return 'SourceContent(content: $content, url: $url, headers: $headers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SourceContentImpl &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.url, url) || other.url == url) &&
            const DeepCollectionEquality().equals(other._headers, _headers));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, content, url, const DeepCollectionEquality().hash(_headers));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SourceContentImplCopyWith<_$SourceContentImpl> get copyWith =>
      __$$SourceContentImplCopyWithImpl<_$SourceContentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SourceContentImplToJson(
      this,
    );
  }
}

abstract class _SourceContent implements SourceContent {
  const factory _SourceContent(
      {required final String content,
      required final Uri url,
      final Map<String, String> headers}) = _$SourceContentImpl;

  factory _SourceContent.fromJson(Map<String, dynamic> json) =
      _$SourceContentImpl.fromJson;

  @override
  String get content;
  @override
  Uri get url;
  @override
  Map<String, String> get headers;
  @override
  @JsonKey(ignore: true)
  _$$SourceContentImplCopyWith<_$SourceContentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
