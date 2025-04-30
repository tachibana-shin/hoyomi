// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'eiga_carousel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EigaCarousel {

 List<EigaCarouselItem> get items; double get aspectRatio; double get maxHeightBuilder;
/// Create a copy of EigaCarousel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EigaCarouselCopyWith<EigaCarousel> get copyWith => _$EigaCarouselCopyWithImpl<EigaCarousel>(this as EigaCarousel, _$identity);

  /// Serializes this EigaCarousel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EigaCarousel&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.aspectRatio, aspectRatio) || other.aspectRatio == aspectRatio)&&(identical(other.maxHeightBuilder, maxHeightBuilder) || other.maxHeightBuilder == maxHeightBuilder));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),aspectRatio,maxHeightBuilder);

@override
String toString() {
  return 'EigaCarousel(items: $items, aspectRatio: $aspectRatio, maxHeightBuilder: $maxHeightBuilder)';
}


}

/// @nodoc
abstract mixin class $EigaCarouselCopyWith<$Res>  {
  factory $EigaCarouselCopyWith(EigaCarousel value, $Res Function(EigaCarousel) _then) = _$EigaCarouselCopyWithImpl;
@useResult
$Res call({
 List<EigaCarouselItem> items, double aspectRatio, double maxHeightBuilder
});




}
/// @nodoc
class _$EigaCarouselCopyWithImpl<$Res>
    implements $EigaCarouselCopyWith<$Res> {
  _$EigaCarouselCopyWithImpl(this._self, this._then);

  final EigaCarousel _self;
  final $Res Function(EigaCarousel) _then;

/// Create a copy of EigaCarousel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? aspectRatio = null,Object? maxHeightBuilder = null,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<EigaCarouselItem>,aspectRatio: null == aspectRatio ? _self.aspectRatio : aspectRatio // ignore: cast_nullable_to_non_nullable
as double,maxHeightBuilder: null == maxHeightBuilder ? _self.maxHeightBuilder : maxHeightBuilder // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _EigaCarousel implements EigaCarousel {
  const _EigaCarousel({required final  List<EigaCarouselItem> items, required this.aspectRatio, required this.maxHeightBuilder}): _items = items;
  factory _EigaCarousel.fromJson(Map<String, dynamic> json) => _$EigaCarouselFromJson(json);

 final  List<EigaCarouselItem> _items;
@override List<EigaCarouselItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  double aspectRatio;
@override final  double maxHeightBuilder;

/// Create a copy of EigaCarousel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EigaCarouselCopyWith<_EigaCarousel> get copyWith => __$EigaCarouselCopyWithImpl<_EigaCarousel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EigaCarouselToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EigaCarousel&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.aspectRatio, aspectRatio) || other.aspectRatio == aspectRatio)&&(identical(other.maxHeightBuilder, maxHeightBuilder) || other.maxHeightBuilder == maxHeightBuilder));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),aspectRatio,maxHeightBuilder);

@override
String toString() {
  return 'EigaCarousel(items: $items, aspectRatio: $aspectRatio, maxHeightBuilder: $maxHeightBuilder)';
}


}

/// @nodoc
abstract mixin class _$EigaCarouselCopyWith<$Res> implements $EigaCarouselCopyWith<$Res> {
  factory _$EigaCarouselCopyWith(_EigaCarousel value, $Res Function(_EigaCarousel) _then) = __$EigaCarouselCopyWithImpl;
@override @useResult
$Res call({
 List<EigaCarouselItem> items, double aspectRatio, double maxHeightBuilder
});




}
/// @nodoc
class __$EigaCarouselCopyWithImpl<$Res>
    implements _$EigaCarouselCopyWith<$Res> {
  __$EigaCarouselCopyWithImpl(this._self, this._then);

  final _EigaCarousel _self;
  final $Res Function(_EigaCarousel) _then;

/// Create a copy of EigaCarousel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? aspectRatio = null,Object? maxHeightBuilder = null,}) {
  return _then(_EigaCarousel(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<EigaCarouselItem>,aspectRatio: null == aspectRatio ? _self.aspectRatio : aspectRatio // ignore: cast_nullable_to_non_nullable
as double,maxHeightBuilder: null == maxHeightBuilder ? _self.maxHeightBuilder : maxHeightBuilder // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
