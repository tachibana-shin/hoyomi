// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
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

 String get src; String get type; Headers? get headers; String? get extra;
/// Create a copy of SourceVideo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SourceVideoCopyWith<SourceVideo> get copyWith => _$SourceVideoCopyWithImpl<SourceVideo>(this as SourceVideo, _$identity);

  /// Serializes this SourceVideo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SourceVideo&&(identical(other.src, src) || other.src == src)&&(identical(other.type, type) || other.type == type)&&(identical(other.headers, headers) || other.headers == headers)&&(identical(other.extra, extra) || other.extra == extra));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,src,type,headers,extra);

@override
String toString() {
  return 'SourceVideo(src: $src, type: $type, headers: $headers, extra: $extra)';
}


}

/// @nodoc
abstract mixin class $SourceVideoCopyWith<$Res>  {
  factory $SourceVideoCopyWith(SourceVideo value, $Res Function(SourceVideo) _then) = _$SourceVideoCopyWithImpl;
@useResult
$Res call({
 String src, String type, Headers? headers, String? extra
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
@pragma('vm:prefer-inline') @override $Res call({Object? src = null,Object? type = null,Object? headers = freezed,Object? extra = freezed,}) {
  return _then(_self.copyWith(
src: null == src ? _self.src : src // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
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


/// Adds pattern-matching-related methods to [SourceVideo].
extension SourceVideoPatterns on SourceVideo {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SourceVideo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SourceVideo() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SourceVideo value)  $default,){
final _that = this;
switch (_that) {
case _SourceVideo():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SourceVideo value)?  $default,){
final _that = this;
switch (_that) {
case _SourceVideo() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String src,  String type,  Headers? headers,  String? extra)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SourceVideo() when $default != null:
return $default(_that.src,_that.type,_that.headers,_that.extra);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String src,  String type,  Headers? headers,  String? extra)  $default,) {final _that = this;
switch (_that) {
case _SourceVideo():
return $default(_that.src,_that.type,_that.headers,_that.extra);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String src,  String type,  Headers? headers,  String? extra)?  $default,) {final _that = this;
switch (_that) {
case _SourceVideo() when $default != null:
return $default(_that.src,_that.type,_that.headers,_that.extra);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SourceVideo implements SourceVideo {
  const _SourceVideo({required this.src, required this.type, this.headers, this.extra});
  factory _SourceVideo.fromJson(Map<String, dynamic> json) => _$SourceVideoFromJson(json);

@override final  String src;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SourceVideo&&(identical(other.src, src) || other.src == src)&&(identical(other.type, type) || other.type == type)&&(identical(other.headers, headers) || other.headers == headers)&&(identical(other.extra, extra) || other.extra == extra));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,src,type,headers,extra);

@override
String toString() {
  return 'SourceVideo(src: $src, type: $type, headers: $headers, extra: $extra)';
}


}

/// @nodoc
abstract mixin class _$SourceVideoCopyWith<$Res> implements $SourceVideoCopyWith<$Res> {
  factory _$SourceVideoCopyWith(_SourceVideo value, $Res Function(_SourceVideo) _then) = __$SourceVideoCopyWithImpl;
@override @useResult
$Res call({
 String src, String type, Headers? headers, String? extra
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
@override @pragma('vm:prefer-inline') $Res call({Object? src = null,Object? type = null,Object? headers = freezed,Object? extra = freezed,}) {
  return _then(_SourceVideo(
src: null == src ? _self.src : src // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
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
