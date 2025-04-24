// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comic_list_watch_history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ComicListWatchHistory {

 List<Data> get data;
/// Create a copy of ComicListWatchHistory
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ComicListWatchHistoryCopyWith<ComicListWatchHistory> get copyWith => _$ComicListWatchHistoryCopyWithImpl<ComicListWatchHistory>(this as ComicListWatchHistory, _$identity);

  /// Serializes this ComicListWatchHistory to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ComicListWatchHistory&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'ComicListWatchHistory(data: $data)';
}


}

/// @nodoc
abstract mixin class $ComicListWatchHistoryCopyWith<$Res>  {
  factory $ComicListWatchHistoryCopyWith(ComicListWatchHistory value, $Res Function(ComicListWatchHistory) _then) = _$ComicListWatchHistoryCopyWithImpl;
@useResult
$Res call({
 List<Data> data
});




}
/// @nodoc
class _$ComicListWatchHistoryCopyWithImpl<$Res>
    implements $ComicListWatchHistoryCopyWith<$Res> {
  _$ComicListWatchHistoryCopyWithImpl(this._self, this._then);

  final ComicListWatchHistory _self;
  final $Res Function(ComicListWatchHistory) _then;

/// Create a copy of ComicListWatchHistory
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,}) {
  return _then(_self.copyWith(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<Data>,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _ComicListWatchHistory implements ComicListWatchHistory {
  const _ComicListWatchHistory({required final  List<Data> data}): _data = data;
  factory _ComicListWatchHistory.fromJson(Map<String, dynamic> json) => _$ComicListWatchHistoryFromJson(json);

 final  List<Data> _data;
@override List<Data> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}


/// Create a copy of ComicListWatchHistory
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ComicListWatchHistoryCopyWith<_ComicListWatchHistory> get copyWith => __$ComicListWatchHistoryCopyWithImpl<_ComicListWatchHistory>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ComicListWatchHistoryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ComicListWatchHistory&&const DeepCollectionEquality().equals(other._data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'ComicListWatchHistory(data: $data)';
}


}

/// @nodoc
abstract mixin class _$ComicListWatchHistoryCopyWith<$Res> implements $ComicListWatchHistoryCopyWith<$Res> {
  factory _$ComicListWatchHistoryCopyWith(_ComicListWatchHistory value, $Res Function(_ComicListWatchHistory) _then) = __$ComicListWatchHistoryCopyWithImpl;
@override @useResult
$Res call({
 List<Data> data
});




}
/// @nodoc
class __$ComicListWatchHistoryCopyWithImpl<$Res>
    implements _$ComicListWatchHistoryCopyWith<$Res> {
  __$ComicListWatchHistoryCopyWithImpl(this._self, this._then);

  final _ComicListWatchHistory _self;
  final $Res Function(_ComicListWatchHistory) _then;

/// Create a copy of ComicListWatchHistory
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(_ComicListWatchHistory(
data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<Data>,
  ));
}


}

// dart format on
