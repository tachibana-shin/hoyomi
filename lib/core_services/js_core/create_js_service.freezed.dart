// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_js_service.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$JsServiceMeta {

 String get type; ServiceInit get init;@JsonKey(name: '\$isAuth') bool get isAuth; String? get writeWith;
/// Create a copy of JsServiceMeta
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JsServiceMetaCopyWith<JsServiceMeta> get copyWith => _$JsServiceMetaCopyWithImpl<JsServiceMeta>(this as JsServiceMeta, _$identity);

  /// Serializes this JsServiceMeta to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JsServiceMeta&&(identical(other.type, type) || other.type == type)&&(identical(other.init, init) || other.init == init)&&(identical(other.isAuth, isAuth) || other.isAuth == isAuth)&&(identical(other.writeWith, writeWith) || other.writeWith == writeWith));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,init,isAuth,writeWith);

@override
String toString() {
  return 'JsServiceMeta(type: $type, init: $init, isAuth: $isAuth, writeWith: $writeWith)';
}


}

/// @nodoc
abstract mixin class $JsServiceMetaCopyWith<$Res>  {
  factory $JsServiceMetaCopyWith(JsServiceMeta value, $Res Function(JsServiceMeta) _then) = _$JsServiceMetaCopyWithImpl;
@useResult
$Res call({
 String type, ServiceInit init,@JsonKey(name: '\$isAuth') bool isAuth, String? writeWith
});


$ServiceInitCopyWith<$Res> get init;

}
/// @nodoc
class _$JsServiceMetaCopyWithImpl<$Res>
    implements $JsServiceMetaCopyWith<$Res> {
  _$JsServiceMetaCopyWithImpl(this._self, this._then);

  final JsServiceMeta _self;
  final $Res Function(JsServiceMeta) _then;

/// Create a copy of JsServiceMeta
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? init = null,Object? isAuth = null,Object? writeWith = freezed,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,init: null == init ? _self.init : init // ignore: cast_nullable_to_non_nullable
as ServiceInit,isAuth: null == isAuth ? _self.isAuth : isAuth // ignore: cast_nullable_to_non_nullable
as bool,writeWith: freezed == writeWith ? _self.writeWith : writeWith // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of JsServiceMeta
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ServiceInitCopyWith<$Res> get init {
  
  return $ServiceInitCopyWith<$Res>(_self.init, (value) {
    return _then(_self.copyWith(init: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _JsServiceMeta implements JsServiceMeta {
  const _JsServiceMeta({required this.type, required this.init, @JsonKey(name: '\$isAuth') required this.isAuth, this.writeWith});
  factory _JsServiceMeta.fromJson(Map<String, dynamic> json) => _$JsServiceMetaFromJson(json);

@override final  String type;
@override final  ServiceInit init;
@override@JsonKey(name: '\$isAuth') final  bool isAuth;
@override final  String? writeWith;

/// Create a copy of JsServiceMeta
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$JsServiceMetaCopyWith<_JsServiceMeta> get copyWith => __$JsServiceMetaCopyWithImpl<_JsServiceMeta>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$JsServiceMetaToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _JsServiceMeta&&(identical(other.type, type) || other.type == type)&&(identical(other.init, init) || other.init == init)&&(identical(other.isAuth, isAuth) || other.isAuth == isAuth)&&(identical(other.writeWith, writeWith) || other.writeWith == writeWith));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,init,isAuth,writeWith);

@override
String toString() {
  return 'JsServiceMeta(type: $type, init: $init, isAuth: $isAuth, writeWith: $writeWith)';
}


}

/// @nodoc
abstract mixin class _$JsServiceMetaCopyWith<$Res> implements $JsServiceMetaCopyWith<$Res> {
  factory _$JsServiceMetaCopyWith(_JsServiceMeta value, $Res Function(_JsServiceMeta) _then) = __$JsServiceMetaCopyWithImpl;
@override @useResult
$Res call({
 String type, ServiceInit init,@JsonKey(name: '\$isAuth') bool isAuth, String? writeWith
});


@override $ServiceInitCopyWith<$Res> get init;

}
/// @nodoc
class __$JsServiceMetaCopyWithImpl<$Res>
    implements _$JsServiceMetaCopyWith<$Res> {
  __$JsServiceMetaCopyWithImpl(this._self, this._then);

  final _JsServiceMeta _self;
  final $Res Function(_JsServiceMeta) _then;

/// Create a copy of JsServiceMeta
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? init = null,Object? isAuth = null,Object? writeWith = freezed,}) {
  return _then(_JsServiceMeta(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,init: null == init ? _self.init : init // ignore: cast_nullable_to_non_nullable
as ServiceInit,isAuth: null == isAuth ? _self.isAuth : isAuth // ignore: cast_nullable_to_non_nullable
as bool,writeWith: freezed == writeWith ? _self.writeWith : writeWith // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of JsServiceMeta
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ServiceInitCopyWith<$Res> get init {
  
  return $ServiceInitCopyWith<$Res>(_self.init, (value) {
    return _then(_self.copyWith(init: value));
  });
}
}

// dart format on
