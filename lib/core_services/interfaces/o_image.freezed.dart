// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'o_image.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OImage implements DiagnosticableTreeMixin {

 String get src; Headers? get headers; String? get extra;
/// Create a copy of OImage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OImageCopyWith<OImage> get copyWith => _$OImageCopyWithImpl<OImage>(this as OImage, _$identity);

  /// Serializes this OImage to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'OImage'))
    ..add(DiagnosticsProperty('src', src))..add(DiagnosticsProperty('headers', headers))..add(DiagnosticsProperty('extra', extra));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OImage&&(identical(other.src, src) || other.src == src)&&(identical(other.headers, headers) || other.headers == headers)&&(identical(other.extra, extra) || other.extra == extra));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,src,headers,extra);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'OImage(src: $src, headers: $headers, extra: $extra)';
}


}

/// @nodoc
abstract mixin class $OImageCopyWith<$Res>  {
  factory $OImageCopyWith(OImage value, $Res Function(OImage) _then) = _$OImageCopyWithImpl;
@useResult
$Res call({
 String src, Headers? headers, String? extra
});


$HeadersCopyWith<$Res>? get headers;

}
/// @nodoc
class _$OImageCopyWithImpl<$Res>
    implements $OImageCopyWith<$Res> {
  _$OImageCopyWithImpl(this._self, this._then);

  final OImage _self;
  final $Res Function(OImage) _then;

/// Create a copy of OImage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? src = null,Object? headers = freezed,Object? extra = freezed,}) {
  return _then(_self.copyWith(
src: null == src ? _self.src : src // ignore: cast_nullable_to_non_nullable
as String,headers: freezed == headers ? _self.headers : headers // ignore: cast_nullable_to_non_nullable
as Headers?,extra: freezed == extra ? _self.extra : extra // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of OImage
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

class _OImage with DiagnosticableTreeMixin implements OImage {
  const _OImage({required this.src, this.headers, this.extra});
  factory _OImage.fromJson(Map<String, dynamic> json) => _$OImageFromJson(json);

@override final  String src;
@override final  Headers? headers;
@override final  String? extra;

/// Create a copy of OImage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OImageCopyWith<_OImage> get copyWith => __$OImageCopyWithImpl<_OImage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OImageToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'OImage'))
    ..add(DiagnosticsProperty('src', src))..add(DiagnosticsProperty('headers', headers))..add(DiagnosticsProperty('extra', extra));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OImage&&(identical(other.src, src) || other.src == src)&&(identical(other.headers, headers) || other.headers == headers)&&(identical(other.extra, extra) || other.extra == extra));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,src,headers,extra);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'OImage(src: $src, headers: $headers, extra: $extra)';
}


}

/// @nodoc
abstract mixin class _$OImageCopyWith<$Res> implements $OImageCopyWith<$Res> {
  factory _$OImageCopyWith(_OImage value, $Res Function(_OImage) _then) = __$OImageCopyWithImpl;
@override @useResult
$Res call({
 String src, Headers? headers, String? extra
});


@override $HeadersCopyWith<$Res>? get headers;

}
/// @nodoc
class __$OImageCopyWithImpl<$Res>
    implements _$OImageCopyWith<$Res> {
  __$OImageCopyWithImpl(this._self, this._then);

  final _OImage _self;
  final $Res Function(_OImage) _then;

/// Create a copy of OImage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? src = null,Object? headers = freezed,Object? extra = freezed,}) {
  return _then(_OImage(
src: null == src ? _self.src : src // ignore: cast_nullable_to_non_nullable
as String,headers: freezed == headers ? _self.headers : headers // ignore: cast_nullable_to_non_nullable
as Headers?,extra: freezed == extra ? _self.extra : extra // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of OImage
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
