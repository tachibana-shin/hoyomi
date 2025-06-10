// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'source_content.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SourceContent {
  String get content;
  Uri get url;
  Headers? get headers;

  /// Create a copy of SourceContent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SourceContentCopyWith<SourceContent> get copyWith =>
      _$SourceContentCopyWithImpl<SourceContent>(
          this as SourceContent, _$identity);

  /// Serializes this SourceContent to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SourceContent &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.headers, headers) || other.headers == headers));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, content, url, headers);

  @override
  String toString() {
    return 'SourceContent(content: $content, url: $url, headers: $headers)';
  }
}

/// @nodoc
abstract mixin class $SourceContentCopyWith<$Res> {
  factory $SourceContentCopyWith(
          SourceContent value, $Res Function(SourceContent) _then) =
      _$SourceContentCopyWithImpl;
  @useResult
  $Res call({String content, Uri url, Headers? headers});

  $HeadersCopyWith<$Res>? get headers;
}

/// @nodoc
class _$SourceContentCopyWithImpl<$Res>
    implements $SourceContentCopyWith<$Res> {
  _$SourceContentCopyWithImpl(this._self, this._then);

  final SourceContent _self;
  final $Res Function(SourceContent) _then;

  /// Create a copy of SourceContent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? url = null,
    Object? headers = freezed,
  }) {
    return _then(_self.copyWith(
      content: null == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _self.url
          : url // ignore: cast_nullable_to_non_nullable
              as Uri,
      headers: freezed == headers
          ? _self.headers
          : headers // ignore: cast_nullable_to_non_nullable
              as Headers?,
    ));
  }

  /// Create a copy of SourceContent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $HeadersCopyWith<$Res>? get headers {
    if (_self.headers == null) {
      return null;
    }

    return $HeadersCopyWith<$Res>(_self.headers!, (value) {
      return _then(_self.copyWith(headers: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _SourceContent implements SourceContent {
  const _SourceContent(
      {required this.content, required this.url, this.headers});
  factory _SourceContent.fromJson(Map<String, dynamic> json) =>
      _$SourceContentFromJson(json);

  @override
  final String content;
  @override
  final Uri url;
  @override
  final Headers? headers;

  /// Create a copy of SourceContent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SourceContentCopyWith<_SourceContent> get copyWith =>
      __$SourceContentCopyWithImpl<_SourceContent>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SourceContentToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SourceContent &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.headers, headers) || other.headers == headers));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, content, url, headers);

  @override
  String toString() {
    return 'SourceContent(content: $content, url: $url, headers: $headers)';
  }
}

/// @nodoc
abstract mixin class _$SourceContentCopyWith<$Res>
    implements $SourceContentCopyWith<$Res> {
  factory _$SourceContentCopyWith(
          _SourceContent value, $Res Function(_SourceContent) _then) =
      __$SourceContentCopyWithImpl;
  @override
  @useResult
  $Res call({String content, Uri url, Headers? headers});

  @override
  $HeadersCopyWith<$Res>? get headers;
}

/// @nodoc
class __$SourceContentCopyWithImpl<$Res>
    implements _$SourceContentCopyWith<$Res> {
  __$SourceContentCopyWithImpl(this._self, this._then);

  final _SourceContent _self;
  final $Res Function(_SourceContent) _then;

  /// Create a copy of SourceContent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? content = null,
    Object? url = null,
    Object? headers = freezed,
  }) {
    return _then(_SourceContent(
      content: null == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _self.url
          : url // ignore: cast_nullable_to_non_nullable
              as Uri,
      headers: freezed == headers
          ? _self.headers
          : headers // ignore: cast_nullable_to_non_nullable
              as Headers?,
    ));
  }

  /// Create a copy of SourceContent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $HeadersCopyWith<$Res>? get headers {
    if (_self.headers == null) {
      return null;
    }

    return $HeadersCopyWith<$Res>(_self.headers!, (value) {
      return _then(_self.copyWith(headers: value));
    });
  }
}

// dart format on
