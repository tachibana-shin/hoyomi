// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
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
