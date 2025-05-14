// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'list_watch_time_schema.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ListWatchTimeSchema {

 List<Data5> get data;
/// Create a copy of ListWatchTimeSchema
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListWatchTimeSchemaCopyWith<ListWatchTimeSchema> get copyWith => _$ListWatchTimeSchemaCopyWithImpl<ListWatchTimeSchema>(this as ListWatchTimeSchema, _$identity);

  /// Serializes this ListWatchTimeSchema to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListWatchTimeSchema&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'ListWatchTimeSchema(data: $data)';
}


}

/// @nodoc
abstract mixin class $ListWatchTimeSchemaCopyWith<$Res>  {
  factory $ListWatchTimeSchemaCopyWith(ListWatchTimeSchema value, $Res Function(ListWatchTimeSchema) _then) = _$ListWatchTimeSchemaCopyWithImpl;
@useResult
$Res call({
 List<Data5> data
});




}
/// @nodoc
class _$ListWatchTimeSchemaCopyWithImpl<$Res>
    implements $ListWatchTimeSchemaCopyWith<$Res> {
  _$ListWatchTimeSchemaCopyWithImpl(this._self, this._then);

  final ListWatchTimeSchema _self;
  final $Res Function(ListWatchTimeSchema) _then;

/// Create a copy of ListWatchTimeSchema
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,}) {
  return _then(_self.copyWith(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<Data5>,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _ListWatchTimeSchema implements ListWatchTimeSchema {
  const _ListWatchTimeSchema({required final  List<Data5> data}): _data = data;
  factory _ListWatchTimeSchema.fromJson(Map<String, dynamic> json) => _$ListWatchTimeSchemaFromJson(json);

 final  List<Data5> _data;
@override List<Data5> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}


/// Create a copy of ListWatchTimeSchema
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListWatchTimeSchemaCopyWith<_ListWatchTimeSchema> get copyWith => __$ListWatchTimeSchemaCopyWithImpl<_ListWatchTimeSchema>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ListWatchTimeSchemaToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListWatchTimeSchema&&const DeepCollectionEquality().equals(other._data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'ListWatchTimeSchema(data: $data)';
}


}

/// @nodoc
abstract mixin class _$ListWatchTimeSchemaCopyWith<$Res> implements $ListWatchTimeSchemaCopyWith<$Res> {
  factory _$ListWatchTimeSchemaCopyWith(_ListWatchTimeSchema value, $Res Function(_ListWatchTimeSchema) _then) = __$ListWatchTimeSchemaCopyWithImpl;
@override @useResult
$Res call({
 List<Data5> data
});




}
/// @nodoc
class __$ListWatchTimeSchemaCopyWithImpl<$Res>
    implements _$ListWatchTimeSchemaCopyWith<$Res> {
  __$ListWatchTimeSchemaCopyWithImpl(this._self, this._then);

  final _ListWatchTimeSchema _self;
  final $Res Function(_ListWatchTimeSchema) _then;

/// Create a copy of ListWatchTimeSchema
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(_ListWatchTimeSchema(
data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<Data5>,
  ));
}


}

// dart format on
