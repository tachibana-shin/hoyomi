// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'source_video.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SourceVideo {

 String get src; Uri get url; String get type; Headers? get headers; String? get extra;
/// Create a copy of SourceVideo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SourceVideoCopyWith<SourceVideo> get copyWith => _$SourceVideoCopyWithImpl<SourceVideo>(this as SourceVideo, _$identity);

  /// Serializes this SourceVideo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SourceVideo&&(identical(other.src, src) || other.src == src)&&(identical(other.url, url) || other.url == url)&&(identical(other.type, type) || other.type == type)&&(identical(other.headers, headers) || other.headers == headers)&&(identical(other.extra, extra) || other.extra == extra));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,src,url,type,headers,extra);

@override
String toString() {
  return 'SourceVideo(src: $src, url: $url, type: $type, headers: $headers, extra: $extra)';
}


}

/// @nodoc
abstract mixin class $SourceVideoCopyWith<$Res>  {
  factory $SourceVideoCopyWith(SourceVideo value, $Res Function(SourceVideo) _then) = _$SourceVideoCopyWithImpl;
@useResult
$Res call({
 String src, Uri url, String type, Headers? headers, String? extra
});


$HeadersCopyWith<$Res>? get headers;

}
/// @nodoc
class _$SourceVideoCopyWithImpl<$Res>
    implements $SourceVideoCopyWith<$Res> {
  _$SourceVideoCopyWithImpl(this._self, this._then);

  final SourceVideo _self;
  final $Res Function(SourceVideo) _then;

/// Create a copy of SourceVideo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? src = null,Object? url = null,Object? type = null,Object? headers = freezed,Object? extra = freezed,}) {
  return _then(_self.copyWith(
src: null == src ? _self.src : src // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as Uri,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,headers: freezed == headers ? _self.headers : headers // ignore: cast_nullable_to_non_nullable
as Headers?,extra: freezed == extra ? _self.extra : extra // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of SourceVideo
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

class _SourceVideo implements SourceVideo {
  const _SourceVideo({required this.src, required this.url, required this.type, this.headers, this.extra});
  factory _SourceVideo.fromJson(Map<String, dynamic> json) => _$SourceVideoFromJson(json);

@override final  String src;
@override final  Uri url;
@override final  String type;
@override final  Headers? headers;
@override final  String? extra;

/// Create a copy of SourceVideo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SourceVideoCopyWith<_SourceVideo> get copyWith => __$SourceVideoCopyWithImpl<_SourceVideo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SourceVideoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SourceVideo&&(identical(other.src, src) || other.src == src)&&(identical(other.url, url) || other.url == url)&&(identical(other.type, type) || other.type == type)&&(identical(other.headers, headers) || other.headers == headers)&&(identical(other.extra, extra) || other.extra == extra));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,src,url,type,headers,extra);

@override
String toString() {
  return 'SourceVideo(src: $src, url: $url, type: $type, headers: $headers, extra: $extra)';
}


}

/// @nodoc
abstract mixin class _$SourceVideoCopyWith<$Res> implements $SourceVideoCopyWith<$Res> {
  factory _$SourceVideoCopyWith(_SourceVideo value, $Res Function(_SourceVideo) _then) = __$SourceVideoCopyWithImpl;
@override @useResult
$Res call({
 String src, Uri url, String type, Headers? headers, String? extra
});


@override $HeadersCopyWith<$Res>? get headers;

}
/// @nodoc
class __$SourceVideoCopyWithImpl<$Res>
    implements _$SourceVideoCopyWith<$Res> {
  __$SourceVideoCopyWithImpl(this._self, this._then);

  final _SourceVideo _self;
  final $Res Function(_SourceVideo) _then;

/// Create a copy of SourceVideo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? src = null,Object? url = null,Object? type = null,Object? headers = freezed,Object? extra = freezed,}) {
  return _then(_SourceVideo(
src: null == src ? _self.src : src // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as Uri,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,headers: freezed == headers ? _self.headers : headers // ignore: cast_nullable_to_non_nullable
as Headers?,extra: freezed == extra ? _self.extra : extra // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of SourceVideo
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
