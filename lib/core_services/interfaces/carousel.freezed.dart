// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'carousel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Carousel {
  List<CarouselItem> get items;
  double get aspectRatio;
  double get maxHeightBuilder;

  /// Create a copy of Carousel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CarouselCopyWith<Carousel> get copyWith =>
      _$CarouselCopyWithImpl<Carousel>(this as Carousel, _$identity);

  /// Serializes this Carousel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Carousel &&
            const DeepCollectionEquality().equals(other.items, items) &&
            (identical(other.aspectRatio, aspectRatio) ||
                other.aspectRatio == aspectRatio) &&
            (identical(other.maxHeightBuilder, maxHeightBuilder) ||
                other.maxHeightBuilder == maxHeightBuilder));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(items),
      aspectRatio,
      maxHeightBuilder);

  @override
  String toString() {
    return 'Carousel(items: $items, aspectRatio: $aspectRatio, maxHeightBuilder: $maxHeightBuilder)';
  }
}

/// @nodoc
abstract mixin class $CarouselCopyWith<$Res> {
  factory $CarouselCopyWith(Carousel value, $Res Function(Carousel) _then) =
      _$CarouselCopyWithImpl;
  @useResult
  $Res call(
      {List<CarouselItem> items, double aspectRatio, double maxHeightBuilder});
}

/// @nodoc
class _$CarouselCopyWithImpl<$Res> implements $CarouselCopyWith<$Res> {
  _$CarouselCopyWithImpl(this._self, this._then);

  final Carousel _self;
  final $Res Function(Carousel) _then;

  /// Create a copy of Carousel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? aspectRatio = null,
    Object? maxHeightBuilder = null,
  }) {
    return _then(_self.copyWith(
      items: null == items
          ? _self.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CarouselItem>,
      aspectRatio: null == aspectRatio
          ? _self.aspectRatio
          : aspectRatio // ignore: cast_nullable_to_non_nullable
              as double,
      maxHeightBuilder: null == maxHeightBuilder
          ? _self.maxHeightBuilder
          : maxHeightBuilder // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Carousel implements Carousel {
  const _Carousel(
      {required final List<CarouselItem> items,
      required this.aspectRatio,
      required this.maxHeightBuilder})
      : _items = items;
  factory _Carousel.fromJson(Map<String, dynamic> json) =>
      _$CarouselFromJson(json);

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

  /// Create a copy of Carousel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CarouselCopyWith<_Carousel> get copyWith =>
      __$CarouselCopyWithImpl<_Carousel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CarouselToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Carousel &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.aspectRatio, aspectRatio) ||
                other.aspectRatio == aspectRatio) &&
            (identical(other.maxHeightBuilder, maxHeightBuilder) ||
                other.maxHeightBuilder == maxHeightBuilder));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_items),
      aspectRatio,
      maxHeightBuilder);

  @override
  String toString() {
    return 'Carousel(items: $items, aspectRatio: $aspectRatio, maxHeightBuilder: $maxHeightBuilder)';
  }
}

/// @nodoc
abstract mixin class _$CarouselCopyWith<$Res>
    implements $CarouselCopyWith<$Res> {
  factory _$CarouselCopyWith(_Carousel value, $Res Function(_Carousel) _then) =
      __$CarouselCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<CarouselItem> items, double aspectRatio, double maxHeightBuilder});
}

/// @nodoc
class __$CarouselCopyWithImpl<$Res> implements _$CarouselCopyWith<$Res> {
  __$CarouselCopyWithImpl(this._self, this._then);

  final _Carousel _self;
  final $Res Function(_Carousel) _then;

  /// Create a copy of Carousel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? items = null,
    Object? aspectRatio = null,
    Object? maxHeightBuilder = null,
  }) {
    return _then(_Carousel(
      items: null == items
          ? _self._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CarouselItem>,
      aspectRatio: null == aspectRatio
          ? _self.aspectRatio
          : aspectRatio // ignore: cast_nullable_to_non_nullable
              as double,
      maxHeightBuilder: null == maxHeightBuilder
          ? _self.maxHeightBuilder
          : maxHeightBuilder // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

// dart format on
