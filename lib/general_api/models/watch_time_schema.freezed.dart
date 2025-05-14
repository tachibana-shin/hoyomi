// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'watch_time_schema.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WatchTimeSchema {

 Data6? get data;
/// Create a copy of WatchTimeSchema
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WatchTimeSchemaCopyWith<WatchTimeSchema> get copyWith => _$WatchTimeSchemaCopyWithImpl<WatchTimeSchema>(this as WatchTimeSchema, _$identity);

  /// Serializes this WatchTimeSchema to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WatchTimeSchema&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'WatchTimeSchema(data: $data)';
}


}

/// @nodoc
abstract mixin class $WatchTimeSchemaCopyWith<$Res>  {
  factory $WatchTimeSchemaCopyWith(WatchTimeSchema value, $Res Function(WatchTimeSchema) _then) = _$WatchTimeSchemaCopyWithImpl;
@useResult
$Res call({
 Data6? data
});


$Data6CopyWith<$Res>? get data;

}
/// @nodoc
class _$WatchTimeSchemaCopyWithImpl<$Res>
    implements $WatchTimeSchemaCopyWith<$Res> {
  _$WatchTimeSchemaCopyWithImpl(this._self, this._then);

  final WatchTimeSchema _self;
  final $Res Function(WatchTimeSchema) _then;

/// Create a copy of WatchTimeSchema
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = freezed,}) {
  return _then(_self.copyWith(
data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as Data6?,
  ));
}
/// Create a copy of WatchTimeSchema
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Data6CopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $Data6CopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _WatchTimeSchema implements WatchTimeSchema {
  const _WatchTimeSchema({required this.data});
  factory _WatchTimeSchema.fromJson(Map<String, dynamic> json) => _$WatchTimeSchemaFromJson(json);

@override final  Data6? data;

/// Create a copy of WatchTimeSchema
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WatchTimeSchemaCopyWith<_WatchTimeSchema> get copyWith => __$WatchTimeSchemaCopyWithImpl<_WatchTimeSchema>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WatchTimeSchemaToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WatchTimeSchema&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'WatchTimeSchema(data: $data)';
}


}

/// @nodoc
abstract mixin class _$WatchTimeSchemaCopyWith<$Res> implements $WatchTimeSchemaCopyWith<$Res> {
  factory _$WatchTimeSchemaCopyWith(_WatchTimeSchema value, $Res Function(_WatchTimeSchema) _then) = __$WatchTimeSchemaCopyWithImpl;
@override @useResult
$Res call({
 Data6? data
});


@override $Data6CopyWith<$Res>? get data;

}
/// @nodoc
class __$WatchTimeSchemaCopyWithImpl<$Res>
    implements _$WatchTimeSchemaCopyWith<$Res> {
  __$WatchTimeSchemaCopyWithImpl(this._self, this._then);

  final _WatchTimeSchema _self;
  final $Res Function(_WatchTimeSchema) _then;

/// Create a copy of WatchTimeSchema
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = freezed,}) {
  return _then(_WatchTimeSchema(
data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as Data6?,
  ));
}

/// Create a copy of WatchTimeSchema
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Data6CopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $Data6CopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}

// dart format on
