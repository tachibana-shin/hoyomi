// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'source_video.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SourceVideo _$SourceVideoFromJson(Map<String, dynamic> json) {
  return _SourceVideo.fromJson(json);
}

/// @nodoc
mixin _$SourceVideo {
  String get src => throw _privateConstructorUsedError;
  Uri get url => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  Map<String, String> get headers => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SourceVideoCopyWith<SourceVideo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SourceVideoCopyWith<$Res> {
  factory $SourceVideoCopyWith(
          SourceVideo value, $Res Function(SourceVideo) then) =
      _$SourceVideoCopyWithImpl<$Res, SourceVideo>;
  @useResult
  $Res call({String src, Uri url, String type, Map<String, String> headers});
}

/// @nodoc
class _$SourceVideoCopyWithImpl<$Res, $Val extends SourceVideo>
    implements $SourceVideoCopyWith<$Res> {
  _$SourceVideoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? src = null,
    Object? url = null,
    Object? type = null,
    Object? headers = null,
  }) {
    return _then(_value.copyWith(
      src: null == src
          ? _value.src
          : src // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as Uri,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      headers: null == headers
          ? _value.headers
          : headers // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SourceVideoImplCopyWith<$Res>
    implements $SourceVideoCopyWith<$Res> {
  factory _$$SourceVideoImplCopyWith(
          _$SourceVideoImpl value, $Res Function(_$SourceVideoImpl) then) =
      __$$SourceVideoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String src, Uri url, String type, Map<String, String> headers});
}

/// @nodoc
class __$$SourceVideoImplCopyWithImpl<$Res>
    extends _$SourceVideoCopyWithImpl<$Res, _$SourceVideoImpl>
    implements _$$SourceVideoImplCopyWith<$Res> {
  __$$SourceVideoImplCopyWithImpl(
      _$SourceVideoImpl _value, $Res Function(_$SourceVideoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? src = null,
    Object? url = null,
    Object? type = null,
    Object? headers = null,
  }) {
    return _then(_$SourceVideoImpl(
      src: null == src
          ? _value.src
          : src // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as Uri,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      headers: null == headers
          ? _value._headers
          : headers // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SourceVideoImpl implements _SourceVideo {
  const _$SourceVideoImpl(
      {required this.src,
      required this.url,
      required this.type,
      final Map<String, String> headers = const {}})
      : _headers = headers;

  factory _$SourceVideoImpl.fromJson(Map<String, dynamic> json) =>
      _$$SourceVideoImplFromJson(json);

  @override
  final String src;
  @override
  final Uri url;
  @override
  final String type;
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
    return 'SourceVideo(src: $src, url: $url, type: $type, headers: $headers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SourceVideoImpl &&
            (identical(other.src, src) || other.src == src) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other._headers, _headers));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, src, url, type,
      const DeepCollectionEquality().hash(_headers));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SourceVideoImplCopyWith<_$SourceVideoImpl> get copyWith =>
      __$$SourceVideoImplCopyWithImpl<_$SourceVideoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SourceVideoImplToJson(
      this,
    );
  }
}

abstract class _SourceVideo implements SourceVideo {
  const factory _SourceVideo(
      {required final String src,
      required final Uri url,
      required final String type,
      final Map<String, String> headers}) = _$SourceVideoImpl;

  factory _SourceVideo.fromJson(Map<String, dynamic> json) =
      _$SourceVideoImpl.fromJson;

  @override
  String get src;
  @override
  Uri get url;
  @override
  String get type;
  @override
  Map<String, String> get headers;
  @override
  @JsonKey(ignore: true)
  _$$SourceVideoImplCopyWith<_$SourceVideoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
