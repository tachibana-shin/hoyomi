// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_comic_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HomeComicCategory {
  String get name;
  String? get categoryId;
  bool? get gridView;
  List<Comic> get items;

  /// Create a copy of HomeComicCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $HomeComicCategoryCopyWith<HomeComicCategory> get copyWith =>
      _$HomeComicCategoryCopyWithImpl<HomeComicCategory>(
          this as HomeComicCategory, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HomeComicCategory &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.gridView, gridView) ||
                other.gridView == gridView) &&
            const DeepCollectionEquality().equals(other.items, items));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, categoryId, gridView,
      const DeepCollectionEquality().hash(items));

  @override
  String toString() {
    return 'HomeComicCategory(name: $name, categoryId: $categoryId, gridView: $gridView, items: $items)';
  }
}

/// @nodoc
abstract mixin class $HomeComicCategoryCopyWith<$Res> {
  factory $HomeComicCategoryCopyWith(
          HomeComicCategory value, $Res Function(HomeComicCategory) _then) =
      _$HomeComicCategoryCopyWithImpl;
  @useResult
  $Res call(
      {String name, String? categoryId, bool? gridView, List<Comic> items});
}

/// @nodoc
class _$HomeComicCategoryCopyWithImpl<$Res>
    implements $HomeComicCategoryCopyWith<$Res> {
  _$HomeComicCategoryCopyWithImpl(this._self, this._then);

  final HomeComicCategory _self;
  final $Res Function(HomeComicCategory) _then;

  /// Create a copy of HomeComicCategory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? categoryId = freezed,
    Object? gridView = freezed,
    Object? items = null,
  }) {
    return _then(_self.copyWith(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: freezed == categoryId
          ? _self.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String?,
      gridView: freezed == gridView
          ? _self.gridView
          : gridView // ignore: cast_nullable_to_non_nullable
              as bool?,
      items: null == items
          ? _self.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Comic>,
    ));
  }
}

/// @nodoc

class _HomeComicCategory implements HomeComicCategory {
  const _HomeComicCategory(
      {required this.name,
      this.categoryId,
      this.gridView,
      required final List<Comic> items})
      : _items = items;

  @override
  final String name;
  @override
  final String? categoryId;
  @override
  final bool? gridView;
  final List<Comic> _items;
  @override
  List<Comic> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  /// Create a copy of HomeComicCategory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$HomeComicCategoryCopyWith<_HomeComicCategory> get copyWith =>
      __$HomeComicCategoryCopyWithImpl<_HomeComicCategory>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HomeComicCategory &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.gridView, gridView) ||
                other.gridView == gridView) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, categoryId, gridView,
      const DeepCollectionEquality().hash(_items));

  @override
  String toString() {
    return 'HomeComicCategory(name: $name, categoryId: $categoryId, gridView: $gridView, items: $items)';
  }
}

/// @nodoc
abstract mixin class _$HomeComicCategoryCopyWith<$Res>
    implements $HomeComicCategoryCopyWith<$Res> {
  factory _$HomeComicCategoryCopyWith(
          _HomeComicCategory value, $Res Function(_HomeComicCategory) _then) =
      __$HomeComicCategoryCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String name, String? categoryId, bool? gridView, List<Comic> items});
}

/// @nodoc
class __$HomeComicCategoryCopyWithImpl<$Res>
    implements _$HomeComicCategoryCopyWith<$Res> {
  __$HomeComicCategoryCopyWithImpl(this._self, this._then);

  final _HomeComicCategory _self;
  final $Res Function(_HomeComicCategory) _then;

  /// Create a copy of HomeComicCategory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? categoryId = freezed,
    Object? gridView = freezed,
    Object? items = null,
  }) {
    return _then(_HomeComicCategory(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: freezed == categoryId
          ? _self.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String?,
      gridView: freezed == gridView
          ? _self.gridView
          : gridView // ignore: cast_nullable_to_non_nullable
              as bool?,
      items: null == items
          ? _self._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Comic>,
    ));
  }
}

// dart format on
