// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'list_watch_page_schema.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ListWatchPageSchema {

 List<Data2> get data;
/// Create a copy of ListWatchPageSchema
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListWatchPageSchemaCopyWith<ListWatchPageSchema> get copyWith => _$ListWatchPageSchemaCopyWithImpl<ListWatchPageSchema>(this as ListWatchPageSchema, _$identity);

  /// Serializes this ListWatchPageSchema to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListWatchPageSchema&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'ListWatchPageSchema(data: $data)';
}


}

/// @nodoc
abstract mixin class $ListWatchPageSchemaCopyWith<$Res>  {
  factory $ListWatchPageSchemaCopyWith(ListWatchPageSchema value, $Res Function(ListWatchPageSchema) _then) = _$ListWatchPageSchemaCopyWithImpl;
@useResult
$Res call({
 List<Data2> data
});




}
/// @nodoc
class _$ListWatchPageSchemaCopyWithImpl<$Res>
    implements $ListWatchPageSchemaCopyWith<$Res> {
  _$ListWatchPageSchemaCopyWithImpl(this._self, this._then);

  final ListWatchPageSchema _self;
  final $Res Function(ListWatchPageSchema) _then;

/// Create a copy of ListWatchPageSchema
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,}) {
  return _then(_self.copyWith(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<Data2>,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _ListWatchPageSchema implements ListWatchPageSchema {
  const _ListWatchPageSchema({required final  List<Data2> data}): _data = data;
  factory _ListWatchPageSchema.fromJson(Map<String, dynamic> json) => _$ListWatchPageSchemaFromJson(json);

 final  List<Data2> _data;
@override List<Data2> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}


/// Create a copy of ListWatchPageSchema
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListWatchPageSchemaCopyWith<_ListWatchPageSchema> get copyWith => __$ListWatchPageSchemaCopyWithImpl<_ListWatchPageSchema>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ListWatchPageSchemaToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListWatchPageSchema&&const DeepCollectionEquality().equals(other._data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'ListWatchPageSchema(data: $data)';
}


}

/// @nodoc
abstract mixin class _$ListWatchPageSchemaCopyWith<$Res> implements $ListWatchPageSchemaCopyWith<$Res> {
  factory _$ListWatchPageSchemaCopyWith(_ListWatchPageSchema value, $Res Function(_ListWatchPageSchema) _then) = __$ListWatchPageSchemaCopyWithImpl;
@override @useResult
$Res call({
 List<Data2> data
});




}
/// @nodoc
class __$ListWatchPageSchemaCopyWithImpl<$Res>
    implements _$ListWatchPageSchemaCopyWith<$Res> {
  __$ListWatchPageSchemaCopyWithImpl(this._self, this._then);

  final _ListWatchPageSchema _self;
  final $Res Function(_ListWatchPageSchema) _then;

/// Create a copy of ListWatchPageSchema
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(_ListWatchPageSchema(
data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<Data2>,
  ));
}


}

// dart format on
