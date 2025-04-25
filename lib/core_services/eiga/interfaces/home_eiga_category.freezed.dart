// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_eiga_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HomeEigaCategory {

 String get name; String? get categoryId; bool get gridView; List<Eiga> get items;
/// Create a copy of HomeEigaCategory
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeEigaCategoryCopyWith<HomeEigaCategory> get copyWith => _$HomeEigaCategoryCopyWithImpl<HomeEigaCategory>(this as HomeEigaCategory, _$identity);

  /// Serializes this HomeEigaCategory to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeEigaCategory&&(identical(other.name, name) || other.name == name)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.gridView, gridView) || other.gridView == gridView)&&const DeepCollectionEquality().equals(other.items, items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,categoryId,gridView,const DeepCollectionEquality().hash(items));

@override
String toString() {
  return 'HomeEigaCategory(name: $name, categoryId: $categoryId, gridView: $gridView, items: $items)';
}


}

/// @nodoc
abstract mixin class $HomeEigaCategoryCopyWith<$Res>  {
  factory $HomeEigaCategoryCopyWith(HomeEigaCategory value, $Res Function(HomeEigaCategory) _then) = _$HomeEigaCategoryCopyWithImpl;
@useResult
$Res call({
 String name, String? categoryId, bool gridView, List<Eiga> items
});




}
/// @nodoc
class _$HomeEigaCategoryCopyWithImpl<$Res>
    implements $HomeEigaCategoryCopyWith<$Res> {
  _$HomeEigaCategoryCopyWithImpl(this._self, this._then);

  final HomeEigaCategory _self;
  final $Res Function(HomeEigaCategory) _then;

/// Create a copy of HomeEigaCategory
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? categoryId = freezed,Object? gridView = null,Object? items = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String?,gridView: null == gridView ? _self.gridView : gridView // ignore: cast_nullable_to_non_nullable
as bool,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<Eiga>,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _HomeEigaCategory implements HomeEigaCategory {
  const _HomeEigaCategory({required this.name, this.categoryId, this.gridView = false, required final  List<Eiga> items}): _items = items;
  factory _HomeEigaCategory.fromJson(Map<String, dynamic> json) => _$HomeEigaCategoryFromJson(json);

@override final  String name;
@override final  String? categoryId;
@override@JsonKey() final  bool gridView;
 final  List<Eiga> _items;
@override List<Eiga> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of HomeEigaCategory
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeEigaCategoryCopyWith<_HomeEigaCategory> get copyWith => __$HomeEigaCategoryCopyWithImpl<_HomeEigaCategory>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HomeEigaCategoryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeEigaCategory&&(identical(other.name, name) || other.name == name)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.gridView, gridView) || other.gridView == gridView)&&const DeepCollectionEquality().equals(other._items, _items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,categoryId,gridView,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'HomeEigaCategory(name: $name, categoryId: $categoryId, gridView: $gridView, items: $items)';
}


}

/// @nodoc
abstract mixin class _$HomeEigaCategoryCopyWith<$Res> implements $HomeEigaCategoryCopyWith<$Res> {
  factory _$HomeEigaCategoryCopyWith(_HomeEigaCategory value, $Res Function(_HomeEigaCategory) _then) = __$HomeEigaCategoryCopyWithImpl;
@override @useResult
$Res call({
 String name, String? categoryId, bool gridView, List<Eiga> items
});




}
/// @nodoc
class __$HomeEigaCategoryCopyWithImpl<$Res>
    implements _$HomeEigaCategoryCopyWith<$Res> {
  __$HomeEigaCategoryCopyWithImpl(this._self, this._then);

  final _HomeEigaCategory _self;
  final $Res Function(_HomeEigaCategory) _then;

/// Create a copy of HomeEigaCategory
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? categoryId = freezed,Object? gridView = null,Object? items = null,}) {
  return _then(_HomeEigaCategory(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String?,gridView: null == gridView ? _self.gridView : gridView // ignore: cast_nullable_to_non_nullable
as bool,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<Eiga>,
  ));
}


}

// dart format on
