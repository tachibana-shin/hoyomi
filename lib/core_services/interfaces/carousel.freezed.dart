// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'carousel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Carousel _$CarouselFromJson(Map<String, dynamic> json) {
  return _Carousel.fromJson(json);
}

/// @nodoc
mixin _$Carousel {
  List<CarouselItem> get items => throw _privateConstructorUsedError;
  double get aspectRatio => throw _privateConstructorUsedError;
  double get maxHeightBuilder => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CarouselCopyWith<Carousel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CarouselCopyWith<$Res> {
  factory $CarouselCopyWith(Carousel value, $Res Function(Carousel) then) =
      _$CarouselCopyWithImpl<$Res, Carousel>;
  @useResult
  $Res call(
      {List<CarouselItem> items, double aspectRatio, double maxHeightBuilder});
}

/// @nodoc
class _$CarouselCopyWithImpl<$Res, $Val extends Carousel>
    implements $CarouselCopyWith<$Res> {
  _$CarouselCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? aspectRatio = null,
    Object? maxHeightBuilder = null,
  }) {
    return _then(_value.copyWith(
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CarouselItem>,
      aspectRatio: null == aspectRatio
          ? _value.aspectRatio
          : aspectRatio // ignore: cast_nullable_to_non_nullable
              as double,
      maxHeightBuilder: null == maxHeightBuilder
          ? _value.maxHeightBuilder
          : maxHeightBuilder // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CarouselImplCopyWith<$Res>
    implements $CarouselCopyWith<$Res> {
  factory _$$CarouselImplCopyWith(
          _$CarouselImpl value, $Res Function(_$CarouselImpl) then) =
      __$$CarouselImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<CarouselItem> items, double aspectRatio, double maxHeightBuilder});
}

/// @nodoc
class __$$CarouselImplCopyWithImpl<$Res>
    extends _$CarouselCopyWithImpl<$Res, _$CarouselImpl>
    implements _$$CarouselImplCopyWith<$Res> {
  __$$CarouselImplCopyWithImpl(
      _$CarouselImpl _value, $Res Function(_$CarouselImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? aspectRatio = null,
    Object? maxHeightBuilder = null,
  }) {
    return _then(_$CarouselImpl(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CarouselItem>,
      aspectRatio: null == aspectRatio
          ? _value.aspectRatio
          : aspectRatio // ignore: cast_nullable_to_non_nullable
              as double,
      maxHeightBuilder: null == maxHeightBuilder
          ? _value.maxHeightBuilder
          : maxHeightBuilder // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CarouselImpl implements _Carousel {
  const _$CarouselImpl(
      {required final List<CarouselItem> items,
      required this.aspectRatio,
      required this.maxHeightBuilder})
      : _items = items;

  factory _$CarouselImpl.fromJson(Map<String, dynamic> json) =>
      _$$CarouselImplFromJson(json);

  final List<CarouselItem> _items;
  @override
  List<CarouselItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final double aspectRatio;
  @override
  final double maxHeightBuilder;

  @override
  String toString() {
    return 'Carousel(items: $items, aspectRatio: $aspectRatio, maxHeightBuilder: $maxHeightBuilder)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CarouselImpl &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.aspectRatio, aspectRatio) ||
                other.aspectRatio == aspectRatio) &&
            (identical(other.maxHeightBuilder, maxHeightBuilder) ||
                other.maxHeightBuilder == maxHeightBuilder));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_items),
      aspectRatio,
      maxHeightBuilder);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CarouselImplCopyWith<_$CarouselImpl> get copyWith =>
      __$$CarouselImplCopyWithImpl<_$CarouselImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CarouselImplToJson(
      this,
    );
  }
}

abstract class _Carousel implements Carousel {
  const factory _Carousel(
      {required final List<CarouselItem> items,
      required final double aspectRatio,
      required final double maxHeightBuilder}) = _$CarouselImpl;

  factory _Carousel.fromJson(Map<String, dynamic> json) =
      _$CarouselImpl.fromJson;

  @override
  List<CarouselItem> get items;
  @override
  double get aspectRatio;
  @override
  double get maxHeightBuilder;
  @override
  @JsonKey(ignore: true)
  _$$CarouselImplCopyWith<_$CarouselImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
