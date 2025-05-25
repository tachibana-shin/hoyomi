// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_api_comic_get_list_follow_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GetApiComicGetListFollowResponse {

 List<Items> get items; num get totalItems; num get page; num get totalPages;
/// Create a copy of GetApiComicGetListFollowResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetApiComicGetListFollowResponseCopyWith<GetApiComicGetListFollowResponse> get copyWith => _$GetApiComicGetListFollowResponseCopyWithImpl<GetApiComicGetListFollowResponse>(this as GetApiComicGetListFollowResponse, _$identity);

  /// Serializes this GetApiComicGetListFollowResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetApiComicGetListFollowResponse&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.totalItems, totalItems) || other.totalItems == totalItems)&&(identical(other.page, page) || other.page == page)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),totalItems,page,totalPages);

@override
String toString() {
  return 'GetApiComicGetListFollowResponse(items: $items, totalItems: $totalItems, page: $page, totalPages: $totalPages)';
}


}

/// @nodoc
abstract mixin class $GetApiComicGetListFollowResponseCopyWith<$Res>  {
  factory $GetApiComicGetListFollowResponseCopyWith(GetApiComicGetListFollowResponse value, $Res Function(GetApiComicGetListFollowResponse) _then) = _$GetApiComicGetListFollowResponseCopyWithImpl;
@useResult
$Res call({
 List<Items> items, num totalItems, num page, num totalPages
});




}
/// @nodoc
class _$GetApiComicGetListFollowResponseCopyWithImpl<$Res>
    implements $GetApiComicGetListFollowResponseCopyWith<$Res> {
  _$GetApiComicGetListFollowResponseCopyWithImpl(this._self, this._then);

  final GetApiComicGetListFollowResponse _self;
  final $Res Function(GetApiComicGetListFollowResponse) _then;

/// Create a copy of GetApiComicGetListFollowResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? totalItems = null,Object? page = null,Object? totalPages = null,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<Items>,totalItems: null == totalItems ? _self.totalItems : totalItems // ignore: cast_nullable_to_non_nullable
as num,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as num,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as num,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _GetApiComicGetListFollowResponse implements GetApiComicGetListFollowResponse {
  const _GetApiComicGetListFollowResponse({required final  List<Items> items, required this.totalItems, required this.page, required this.totalPages}): _items = items;
  factory _GetApiComicGetListFollowResponse.fromJson(Map<String, dynamic> json) => _$GetApiComicGetListFollowResponseFromJson(json);

 final  List<Items> _items;
@override List<Items> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  num totalItems;
@override final  num page;
@override final  num totalPages;

/// Create a copy of GetApiComicGetListFollowResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetApiComicGetListFollowResponseCopyWith<_GetApiComicGetListFollowResponse> get copyWith => __$GetApiComicGetListFollowResponseCopyWithImpl<_GetApiComicGetListFollowResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GetApiComicGetListFollowResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetApiComicGetListFollowResponse&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.totalItems, totalItems) || other.totalItems == totalItems)&&(identical(other.page, page) || other.page == page)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),totalItems,page,totalPages);

@override
String toString() {
  return 'GetApiComicGetListFollowResponse(items: $items, totalItems: $totalItems, page: $page, totalPages: $totalPages)';
}


}

/// @nodoc
abstract mixin class _$GetApiComicGetListFollowResponseCopyWith<$Res> implements $GetApiComicGetListFollowResponseCopyWith<$Res> {
  factory _$GetApiComicGetListFollowResponseCopyWith(_GetApiComicGetListFollowResponse value, $Res Function(_GetApiComicGetListFollowResponse) _then) = __$GetApiComicGetListFollowResponseCopyWithImpl;
@override @useResult
$Res call({
 List<Items> items, num totalItems, num page, num totalPages
});




}
/// @nodoc
class __$GetApiComicGetListFollowResponseCopyWithImpl<$Res>
    implements _$GetApiComicGetListFollowResponseCopyWith<$Res> {
  __$GetApiComicGetListFollowResponseCopyWithImpl(this._self, this._then);

  final _GetApiComicGetListFollowResponse _self;
  final $Res Function(_GetApiComicGetListFollowResponse) _then;

/// Create a copy of GetApiComicGetListFollowResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? totalItems = null,Object? page = null,Object? totalPages = null,}) {
  return _then(_GetApiComicGetListFollowResponse(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<Items>,totalItems: null == totalItems ? _self.totalItems : totalItems // ignore: cast_nullable_to_non_nullable
as num,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as num,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as num,
  ));
}


}

// dart format on
