// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_eiga_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

HomeEigaCategory _$HomeEigaCategoryFromJson(Map<String, dynamic> json) {
  return _HomeEigaCategory.fromJson(json);
}

/// @nodoc
mixin _$HomeEigaCategory {
  String get name => throw _privateConstructorUsedError;
  String? get categoryId => throw _privateConstructorUsedError;
  bool? get gridView => throw _privateConstructorUsedError;
  List<Eiga> get items => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HomeEigaCategoryCopyWith<HomeEigaCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeEigaCategoryCopyWith<$Res> {
  factory $HomeEigaCategoryCopyWith(
          HomeEigaCategory value, $Res Function(HomeEigaCategory) then) =
      _$HomeEigaCategoryCopyWithImpl<$Res, HomeEigaCategory>;
  @useResult
  $Res call(
      {String name, String? categoryId, bool? gridView, List<Eiga> items});
}

/// @nodoc
class _$HomeEigaCategoryCopyWithImpl<$Res, $Val extends HomeEigaCategory>
    implements $HomeEigaCategoryCopyWith<$Res> {
  _$HomeEigaCategoryCopyWithImpl(this._value, this._then);

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
              as List<Eiga>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomeEigaCategoryImplCopyWith<$Res>
    implements $HomeEigaCategoryCopyWith<$Res> {
  factory _$$HomeEigaCategoryImplCopyWith(_$HomeEigaCategoryImpl value,
          $Res Function(_$HomeEigaCategoryImpl) then) =
      __$$HomeEigaCategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name, String? categoryId, bool? gridView, List<Eiga> items});
}

/// @nodoc
class __$$HomeEigaCategoryImplCopyWithImpl<$Res>
    extends _$HomeEigaCategoryCopyWithImpl<$Res, _$HomeEigaCategoryImpl>
    implements _$$HomeEigaCategoryImplCopyWith<$Res> {
  __$$HomeEigaCategoryImplCopyWithImpl(_$HomeEigaCategoryImpl _value,
      $Res Function(_$HomeEigaCategoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? categoryId = freezed,
    Object? gridView = freezed,
    Object? items = null,
  }) {
    return _then(_$HomeEigaCategoryImpl(
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
              as List<Eiga>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HomeEigaCategoryImpl implements _HomeEigaCategory {
  const _$HomeEigaCategoryImpl(
      {required this.name,
      this.categoryId,
      this.gridView,
      required final List<Eiga> items})
      : _items = items;

  factory _$HomeEigaCategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$HomeEigaCategoryImplFromJson(json);

  @override
  final String name;
  @override
  final String? categoryId;
  @override
  final bool? gridView;
  final List<Eiga> _items;
  @override
  List<Eiga> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'HomeEigaCategory(name: $name, categoryId: $categoryId, gridView: $gridView, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeEigaCategoryImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.gridView, gridView) ||
                other.gridView == gridView) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, categoryId, gridView,
      const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeEigaCategoryImplCopyWith<_$HomeEigaCategoryImpl> get copyWith =>
      __$$HomeEigaCategoryImplCopyWithImpl<_$HomeEigaCategoryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HomeEigaCategoryImplToJson(
      this,
    );
  }
}

abstract class _HomeEigaCategory implements HomeEigaCategory {
  const factory _HomeEigaCategory(
      {required final String name,
      final String? categoryId,
      final bool? gridView,
      required final List<Eiga> items}) = _$HomeEigaCategoryImpl;

  factory _HomeEigaCategory.fromJson(Map<String, dynamic> json) =
      _$HomeEigaCategoryImpl.fromJson;

  @override
  String get name;
  @override
  String? get categoryId;
  @override
  bool? get gridView;
  @override
  List<Eiga> get items;
  @override
  @JsonKey(ignore: true)
  _$$HomeEigaCategoryImplCopyWith<_$HomeEigaCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
