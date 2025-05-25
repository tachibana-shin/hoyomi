// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_api_eiga_get_list_follow_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GetApiEigaGetListFollowResponse {

 List<Items2> get items; num get totalItems; num get page; num get totalPages;
/// Create a copy of GetApiEigaGetListFollowResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetApiEigaGetListFollowResponseCopyWith<GetApiEigaGetListFollowResponse> get copyWith => _$GetApiEigaGetListFollowResponseCopyWithImpl<GetApiEigaGetListFollowResponse>(this as GetApiEigaGetListFollowResponse, _$identity);

  /// Serializes this GetApiEigaGetListFollowResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetApiEigaGetListFollowResponse&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.totalItems, totalItems) || other.totalItems == totalItems)&&(identical(other.page, page) || other.page == page)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),totalItems,page,totalPages);

@override
String toString() {
  return 'GetApiEigaGetListFollowResponse(items: $items, totalItems: $totalItems, page: $page, totalPages: $totalPages)';
}


}

/// @nodoc
abstract mixin class $GetApiEigaGetListFollowResponseCopyWith<$Res>  {
  factory $GetApiEigaGetListFollowResponseCopyWith(GetApiEigaGetListFollowResponse value, $Res Function(GetApiEigaGetListFollowResponse) _then) = _$GetApiEigaGetListFollowResponseCopyWithImpl;
@useResult
$Res call({
 List<Items2> items, num totalItems, num page, num totalPages
});




}
/// @nodoc
class _$GetApiEigaGetListFollowResponseCopyWithImpl<$Res>
    implements $GetApiEigaGetListFollowResponseCopyWith<$Res> {
  _$GetApiEigaGetListFollowResponseCopyWithImpl(this._self, this._then);

  final GetApiEigaGetListFollowResponse _self;
  final $Res Function(GetApiEigaGetListFollowResponse) _then;

/// Create a copy of GetApiEigaGetListFollowResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? totalItems = null,Object? page = null,Object? totalPages = null,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<Items2>,totalItems: null == totalItems ? _self.totalItems : totalItems // ignore: cast_nullable_to_non_nullable
as num,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as num,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as num,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _GetApiEigaGetListFollowResponse implements GetApiEigaGetListFollowResponse {
  const _GetApiEigaGetListFollowResponse({required final  List<Items2> items, required this.totalItems, required this.page, required this.totalPages}): _items = items;
  factory _GetApiEigaGetListFollowResponse.fromJson(Map<String, dynamic> json) => _$GetApiEigaGetListFollowResponseFromJson(json);

 final  List<Items2> _items;
@override List<Items2> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  num totalItems;
@override final  num page;
@override final  num totalPages;

/// Create a copy of GetApiEigaGetListFollowResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetApiEigaGetListFollowResponseCopyWith<_GetApiEigaGetListFollowResponse> get copyWith => __$GetApiEigaGetListFollowResponseCopyWithImpl<_GetApiEigaGetListFollowResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GetApiEigaGetListFollowResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetApiEigaGetListFollowResponse&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.totalItems, totalItems) || other.totalItems == totalItems)&&(identical(other.page, page) || other.page == page)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),totalItems,page,totalPages);

@override
String toString() {
  return 'GetApiEigaGetListFollowResponse(items: $items, totalItems: $totalItems, page: $page, totalPages: $totalPages)';
}


}

/// @nodoc
abstract mixin class _$GetApiEigaGetListFollowResponseCopyWith<$Res> implements $GetApiEigaGetListFollowResponseCopyWith<$Res> {
  factory _$GetApiEigaGetListFollowResponseCopyWith(_GetApiEigaGetListFollowResponse value, $Res Function(_GetApiEigaGetListFollowResponse) _then) = __$GetApiEigaGetListFollowResponseCopyWithImpl;
@override @useResult
$Res call({
 List<Items2> items, num totalItems, num page, num totalPages
});




}
/// @nodoc
class __$GetApiEigaGetListFollowResponseCopyWithImpl<$Res>
    implements _$GetApiEigaGetListFollowResponseCopyWith<$Res> {
  __$GetApiEigaGetListFollowResponseCopyWithImpl(this._self, this._then);

  final _GetApiEigaGetListFollowResponse _self;
  final $Res Function(_GetApiEigaGetListFollowResponse) _then;

/// Create a copy of GetApiEigaGetListFollowResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? totalItems = null,Object? page = null,Object? totalPages = null,}) {
  return _then(_GetApiEigaGetListFollowResponse(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<Items2>,totalItems: null == totalItems ? _self.totalItems : totalItems // ignore: cast_nullable_to_non_nullable
as num,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as num,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as num,
  ));
}


}

// dart format on
