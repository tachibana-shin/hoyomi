// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'watch_page_schema.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WatchPageSchema {

 Data3? get data;
/// Create a copy of WatchPageSchema
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WatchPageSchemaCopyWith<WatchPageSchema> get copyWith => _$WatchPageSchemaCopyWithImpl<WatchPageSchema>(this as WatchPageSchema, _$identity);

  /// Serializes this WatchPageSchema to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WatchPageSchema&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'WatchPageSchema(data: $data)';
}


}

/// @nodoc
abstract mixin class $WatchPageSchemaCopyWith<$Res>  {
  factory $WatchPageSchemaCopyWith(WatchPageSchema value, $Res Function(WatchPageSchema) _then) = _$WatchPageSchemaCopyWithImpl;
@useResult
$Res call({
 Data3? data
});


$Data3CopyWith<$Res>? get data;

}
/// @nodoc
class _$WatchPageSchemaCopyWithImpl<$Res>
    implements $WatchPageSchemaCopyWith<$Res> {
  _$WatchPageSchemaCopyWithImpl(this._self, this._then);

  final WatchPageSchema _self;
  final $Res Function(WatchPageSchema) _then;

/// Create a copy of WatchPageSchema
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = freezed,}) {
  return _then(_self.copyWith(
data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as Data3?,
  ));
}
/// Create a copy of WatchPageSchema
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Data3CopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $Data3CopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _WatchPageSchema implements WatchPageSchema {
  const _WatchPageSchema({required this.data});
  factory _WatchPageSchema.fromJson(Map<String, dynamic> json) => _$WatchPageSchemaFromJson(json);

@override final  Data3? data;

/// Create a copy of WatchPageSchema
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WatchPageSchemaCopyWith<_WatchPageSchema> get copyWith => __$WatchPageSchemaCopyWithImpl<_WatchPageSchema>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WatchPageSchemaToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WatchPageSchema&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'WatchPageSchema(data: $data)';
}


}

/// @nodoc
abstract mixin class _$WatchPageSchemaCopyWith<$Res> implements $WatchPageSchemaCopyWith<$Res> {
  factory _$WatchPageSchemaCopyWith(_WatchPageSchema value, $Res Function(_WatchPageSchema) _then) = __$WatchPageSchemaCopyWithImpl;
@override @useResult
$Res call({
 Data3? data
});


@override $Data3CopyWith<$Res>? get data;

}
/// @nodoc
class __$WatchPageSchemaCopyWithImpl<$Res>
    implements _$WatchPageSchemaCopyWith<$Res> {
  __$WatchPageSchemaCopyWithImpl(this._self, this._then);

  final _WatchPageSchema _self;
  final $Res Function(_WatchPageSchema) _then;

/// Create a copy of WatchPageSchema
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = freezed,}) {
  return _then(_WatchPageSchema(
data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as Data3?,
  ));
}

/// Create a copy of WatchPageSchema
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Data3CopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $Data3CopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}

// dart format on
