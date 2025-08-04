// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
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

 String get content; Uri get url; Headers? get headers;
/// Create a copy of SourceContent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SourceContentCopyWith<SourceContent> get copyWith => _$SourceContentCopyWithImpl<SourceContent>(this as SourceContent, _$identity);

  /// Serializes this SourceContent to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SourceContent&&(identical(other.content, content) || other.content == content)&&(identical(other.url, url) || other.url == url)&&(identical(other.headers, headers) || other.headers == headers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,content,url,headers);

@override
String toString() {
  return 'SourceContent(content: $content, url: $url, headers: $headers)';
}


}

/// @nodoc
abstract mixin class $SourceContentCopyWith<$Res>  {
  factory $SourceContentCopyWith(SourceContent value, $Res Function(SourceContent) _then) = _$SourceContentCopyWithImpl;
@useResult
$Res call({
 String content, Uri url, Headers? headers
});


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
@pragma('vm:prefer-inline') @override $Res call({Object? content = null,Object? url = null,Object? headers = freezed,}) {
  return _then(_self.copyWith(
content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as Uri,headers: freezed == headers ? _self.headers : headers // ignore: cast_nullable_to_non_nullable
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


/// Adds pattern-matching-related methods to [SourceContent].
extension SourceContentPatterns on SourceContent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SourceContent value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SourceContent() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SourceContent value)  $default,){
final _that = this;
switch (_that) {
case _SourceContent():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SourceContent value)?  $default,){
final _that = this;
switch (_that) {
case _SourceContent() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String content,  Uri url,  Headers? headers)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SourceContent() when $default != null:
return $default(_that.content,_that.url,_that.headers);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String content,  Uri url,  Headers? headers)  $default,) {final _that = this;
switch (_that) {
case _SourceContent():
return $default(_that.content,_that.url,_that.headers);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String content,  Uri url,  Headers? headers)?  $default,) {final _that = this;
switch (_that) {
case _SourceContent() when $default != null:
return $default(_that.content,_that.url,_that.headers);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SourceContent implements SourceContent {
  const _SourceContent({required this.content, required this.url, this.headers});
  factory _SourceContent.fromJson(Map<String, dynamic> json) => _$SourceContentFromJson(json);

@override final  String content;
@override final  Uri url;
@override final  Headers? headers;

/// Create a copy of SourceContent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SourceContentCopyWith<_SourceContent> get copyWith => __$SourceContentCopyWithImpl<_SourceContent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SourceContentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SourceContent&&(identical(other.content, content) || other.content == content)&&(identical(other.url, url) || other.url == url)&&(identical(other.headers, headers) || other.headers == headers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,content,url,headers);

@override
String toString() {
  return 'SourceContent(content: $content, url: $url, headers: $headers)';
}


}

/// @nodoc
abstract mixin class _$SourceContentCopyWith<$Res> implements $SourceContentCopyWith<$Res> {
  factory _$SourceContentCopyWith(_SourceContent value, $Res Function(_SourceContent) _then) = __$SourceContentCopyWithImpl;
@override @useResult
$Res call({
 String content, Uri url, Headers? headers
});


@override $HeadersCopyWith<$Res>? get headers;

}
/// @nodoc
class __$SourceContentCopyWithImpl<$Res>
    implements _$SourceContentCopyWith<$Res> {
  __$SourceContentCopyWithImpl(this._self, this._then);

  final _SourceContent _self;
  final $Res Function(_SourceContent) _then;

/// Create a copy of SourceContent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? content = null,Object? url = null,Object? headers = freezed,}) {
  return _then(_SourceContent(
content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as Uri,headers: freezed == headers ? _self.headers : headers // ignore: cast_nullable_to_non_nullable
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
