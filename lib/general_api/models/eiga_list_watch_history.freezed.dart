// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'eiga_list_watch_history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EigaListWatchHistory {

 List<Data4> get data;
/// Create a copy of EigaListWatchHistory
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EigaListWatchHistoryCopyWith<EigaListWatchHistory> get copyWith => _$EigaListWatchHistoryCopyWithImpl<EigaListWatchHistory>(this as EigaListWatchHistory, _$identity);

  /// Serializes this EigaListWatchHistory to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EigaListWatchHistory&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'EigaListWatchHistory(data: $data)';
}


}

/// @nodoc
abstract mixin class $EigaListWatchHistoryCopyWith<$Res>  {
  factory $EigaListWatchHistoryCopyWith(EigaListWatchHistory value, $Res Function(EigaListWatchHistory) _then) = _$EigaListWatchHistoryCopyWithImpl;
@useResult
$Res call({
 List<Data4> data
});




}
/// @nodoc
class _$EigaListWatchHistoryCopyWithImpl<$Res>
    implements $EigaListWatchHistoryCopyWith<$Res> {
  _$EigaListWatchHistoryCopyWithImpl(this._self, this._then);

  final EigaListWatchHistory _self;
  final $Res Function(EigaListWatchHistory) _then;

/// Create a copy of EigaListWatchHistory
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,}) {
  return _then(_self.copyWith(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<Data4>,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _EigaListWatchHistory implements EigaListWatchHistory {
  const _EigaListWatchHistory({required final  List<Data4> data}): _data = data;
  factory _EigaListWatchHistory.fromJson(Map<String, dynamic> json) => _$EigaListWatchHistoryFromJson(json);

 final  List<Data4> _data;
@override List<Data4> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}


/// Create a copy of EigaListWatchHistory
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EigaListWatchHistoryCopyWith<_EigaListWatchHistory> get copyWith => __$EigaListWatchHistoryCopyWithImpl<_EigaListWatchHistory>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EigaListWatchHistoryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EigaListWatchHistory&&const DeepCollectionEquality().equals(other._data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'EigaListWatchHistory(data: $data)';
}


}

/// @nodoc
abstract mixin class _$EigaListWatchHistoryCopyWith<$Res> implements $EigaListWatchHistoryCopyWith<$Res> {
  factory _$EigaListWatchHistoryCopyWith(_EigaListWatchHistory value, $Res Function(_EigaListWatchHistory) _then) = __$EigaListWatchHistoryCopyWithImpl;
@override @useResult
$Res call({
 List<Data4> data
});




}
/// @nodoc
class __$EigaListWatchHistoryCopyWithImpl<$Res>
    implements _$EigaListWatchHistoryCopyWith<$Res> {
  __$EigaListWatchHistoryCopyWithImpl(this._self, this._then);

  final _EigaListWatchHistory _self;
  final $Res Function(_EigaListWatchHistory) _then;

/// Create a copy of EigaListWatchHistory
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(_EigaListWatchHistory(
data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<Data4>,
  ));
}


}

// dart format on
