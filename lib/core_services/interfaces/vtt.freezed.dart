// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vtt.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Vtt {

 String get src; Headers? get headers;
/// Create a copy of Vtt
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VttCopyWith<Vtt> get copyWith => _$VttCopyWithImpl<Vtt>(this as Vtt, _$identity);

  /// Serializes this Vtt to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Vtt&&(identical(other.src, src) || other.src == src)&&(identical(other.headers, headers) || other.headers == headers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,src,headers);

@override
String toString() {
  return 'Vtt(src: $src, headers: $headers)';
}


}

/// @nodoc
abstract mixin class $VttCopyWith<$Res>  {
  factory $VttCopyWith(Vtt value, $Res Function(Vtt) _then) = _$VttCopyWithImpl;
@useResult
$Res call({
 String src, Headers? headers
});


$HeadersCopyWith<$Res>? get headers;

}
/// @nodoc
class _$VttCopyWithImpl<$Res>
    implements $VttCopyWith<$Res> {
  _$VttCopyWithImpl(this._self, this._then);

  final Vtt _self;
  final $Res Function(Vtt) _then;

/// Create a copy of Vtt
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? src = null,Object? headers = freezed,}) {
  return _then(_self.copyWith(
src: null == src ? _self.src : src // ignore: cast_nullable_to_non_nullable
as String,headers: freezed == headers ? _self.headers : headers // ignore: cast_nullable_to_non_nullable
as Headers?,
  ));
}
/// Create a copy of Vtt
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


/// Adds pattern-matching-related methods to [Vtt].
extension VttPatterns on Vtt {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Vtt value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Vtt() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Vtt value)  $default,){
final _that = this;
switch (_that) {
case _Vtt():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Vtt value)?  $default,){
final _that = this;
switch (_that) {
case _Vtt() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String src,  Headers? headers)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Vtt() when $default != null:
return $default(_that.src,_that.headers);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String src,  Headers? headers)  $default,) {final _that = this;
switch (_that) {
case _Vtt():
return $default(_that.src,_that.headers);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String src,  Headers? headers)?  $default,) {final _that = this;
switch (_that) {
case _Vtt() when $default != null:
return $default(_that.src,_that.headers);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Vtt implements Vtt {
  const _Vtt({required this.src, this.headers});
  factory _Vtt.fromJson(Map<String, dynamic> json) => _$VttFromJson(json);

@override final  String src;
@override final  Headers? headers;

/// Create a copy of Vtt
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VttCopyWith<_Vtt> get copyWith => __$VttCopyWithImpl<_Vtt>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VttToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Vtt&&(identical(other.src, src) || other.src == src)&&(identical(other.headers, headers) || other.headers == headers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,src,headers);

@override
String toString() {
  return 'Vtt(src: $src, headers: $headers)';
}


}

/// @nodoc
abstract mixin class _$VttCopyWith<$Res> implements $VttCopyWith<$Res> {
  factory _$VttCopyWith(_Vtt value, $Res Function(_Vtt) _then) = __$VttCopyWithImpl;
@override @useResult
$Res call({
 String src, Headers? headers
});


@override $HeadersCopyWith<$Res>? get headers;

}
/// @nodoc
class __$VttCopyWithImpl<$Res>
    implements _$VttCopyWith<$Res> {
  __$VttCopyWithImpl(this._self, this._then);

  final _Vtt _self;
  final $Res Function(_Vtt) _then;

/// Create a copy of Vtt
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? src = null,Object? headers = freezed,}) {
  return _then(_Vtt(
src: null == src ? _self.src : src // ignore: cast_nullable_to_non_nullable
as String,headers: freezed == headers ? _self.headers : headers // ignore: cast_nullable_to_non_nullable
as Headers?,
  ));
}

/// Create a copy of Vtt
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
