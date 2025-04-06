// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_comic_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomeComicCategory {
  String get name => throw _privateConstructorUsedError;
  String? get categoryId => throw _privateConstructorUsedError;
  bool? get gridView => throw _privateConstructorUsedError;
  List<Comic> get items => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeComicCategoryCopyWith<HomeComicCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeComicCategoryCopyWith<$Res> {
  factory $HomeComicCategoryCopyWith(
          HomeComicCategory value, $Res Function(HomeComicCategory) then) =
      _$HomeComicCategoryCopyWithImpl<$Res, HomeComicCategory>;
  @useResult
  $Res call(
      {String name, String? categoryId, bool? gridView, List<Comic> items});
}

/// @nodoc
class _$HomeComicCategoryCopyWithImpl<$Res, $Val extends HomeComicCategory>
    implements $HomeComicCategoryCopyWith<$Res> {
  _$HomeComicCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? categoryId = freezed,
    Object? gridView = freezed,
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String?,
      gridView: freezed == gridView
          ? _value.gridView
          : gridView // ignore: cast_nullable_to_non_nullable
              as bool?,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Comic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomeComicCategoryImplCopyWith<$Res>
    implements $HomeComicCategoryCopyWith<$Res> {
  factory _$$HomeComicCategoryImplCopyWith(_$HomeComicCategoryImpl value,
          $Res Function(_$HomeComicCategoryImpl) then) =
      __$$HomeComicCategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name, String? categoryId, bool? gridView, List<Comic> items});
}

/// @nodoc
class __$$HomeComicCategoryImplCopyWithImpl<$Res>
    extends _$HomeComicCategoryCopyWithImpl<$Res, _$HomeComicCategoryImpl>
    implements _$$HomeComicCategoryImplCopyWith<$Res> {
  __$$HomeComicCategoryImplCopyWithImpl(_$HomeComicCategoryImpl _value,
      $Res Function(_$HomeComicCategoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? categoryId = freezed,
    Object? gridView = freezed,
    Object? items = null,
  }) {
    return _then(_$HomeComicCategoryImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String?,
      gridView: freezed == gridView
          ? _value.gridView
          : gridView // ignore: cast_nullable_to_non_nullable
              as bool?,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Comic>,
    ));
  }
}

/// @nodoc

class _$HomeComicCategoryImpl implements _HomeComicCategory {
  const _$HomeComicCategoryImpl(
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

  @override
  String toString() {
    return 'HomeComicCategory(name: $name, categoryId: $categoryId, gridView: $gridView, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeComicCategoryImpl &&
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

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeComicCategoryImplCopyWith<_$HomeComicCategoryImpl> get copyWith =>
      __$$HomeComicCategoryImplCopyWithImpl<_$HomeComicCategoryImpl>(
          this, _$identity);
}

abstract class _HomeComicCategory implements HomeComicCategory {
  const factory _HomeComicCategory(
      {required final String name,
      final String? categoryId,
      final bool? gridView,
      required final List<Comic> items}) = _$HomeComicCategoryImpl;

  @override
  String get name;
  @override
  String? get categoryId;
  @override
  bool? get gridView;
  @override
  List<Comic> get items;
  @override
  @JsonKey(ignore: true)
  _$$HomeComicCategoryImplCopyWith<_$HomeComicCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
