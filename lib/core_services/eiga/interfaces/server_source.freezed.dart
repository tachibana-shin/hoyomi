// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'server_source.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ServerSource {

 String get name; String get serverId; String? get extra;
/// Create a copy of ServerSource
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServerSourceCopyWith<ServerSource> get copyWith => _$ServerSourceCopyWithImpl<ServerSource>(this as ServerSource, _$identity);

  /// Serializes this ServerSource to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServerSource&&(identical(other.name, name) || other.name == name)&&(identical(other.serverId, serverId) || other.serverId == serverId)&&(identical(other.extra, extra) || other.extra == extra));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,serverId,extra);

@override
String toString() {
  return 'ServerSource(name: $name, serverId: $serverId, extra: $extra)';
}


}

/// @nodoc
abstract mixin class $ServerSourceCopyWith<$Res>  {
  factory $ServerSourceCopyWith(ServerSource value, $Res Function(ServerSource) _then) = _$ServerSourceCopyWithImpl;
@useResult
$Res call({
 String name, String serverId, String? extra
});




}
/// @nodoc
class _$ServerSourceCopyWithImpl<$Res>
    implements $ServerSourceCopyWith<$Res> {
  _$ServerSourceCopyWithImpl(this._self, this._then);

  final ServerSource _self;
  final $Res Function(ServerSource) _then;

/// Create a copy of ServerSource
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? serverId = null,Object? extra = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,serverId: null == serverId ? _self.serverId : serverId // ignore: cast_nullable_to_non_nullable
as String,extra: freezed == extra ? _self.extra : extra // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _ServerSource implements ServerSource {
   _ServerSource({required this.name, required this.serverId, this.extra});
  factory _ServerSource.fromJson(Map<String, dynamic> json) => _$ServerSourceFromJson(json);

@override final  String name;
@override final  String serverId;
@override final  String? extra;

/// Create a copy of ServerSource
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ServerSourceCopyWith<_ServerSource> get copyWith => __$ServerSourceCopyWithImpl<_ServerSource>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ServerSourceToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ServerSource&&(identical(other.name, name) || other.name == name)&&(identical(other.serverId, serverId) || other.serverId == serverId)&&(identical(other.extra, extra) || other.extra == extra));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,serverId,extra);

@override
String toString() {
  return 'ServerSource(name: $name, serverId: $serverId, extra: $extra)';
}


}

/// @nodoc
abstract mixin class _$ServerSourceCopyWith<$Res> implements $ServerSourceCopyWith<$Res> {
  factory _$ServerSourceCopyWith(_ServerSource value, $Res Function(_ServerSource) _then) = __$ServerSourceCopyWithImpl;
@override @useResult
$Res call({
 String name, String serverId, String? extra
});




}
/// @nodoc
class __$ServerSourceCopyWithImpl<$Res>
    implements _$ServerSourceCopyWith<$Res> {
  __$ServerSourceCopyWithImpl(this._self, this._then);

  final _ServerSource _self;
  final $Res Function(_ServerSource) _then;

/// Create a copy of ServerSource
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? serverId = null,Object? extra = freezed,}) {
  return _then(_ServerSource(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,serverId: null == serverId ? _self.serverId : serverId // ignore: cast_nullable_to_non_nullable
as String,extra: freezed == extra ? _self.extra : extra // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
