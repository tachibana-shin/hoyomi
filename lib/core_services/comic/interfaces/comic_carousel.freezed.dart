// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comic_carousel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ComicCarousel {

 List<ComicCarouselItem> get items; double get aspectRatio; double get maxHeightBuilder;
/// Create a copy of ComicCarousel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ComicCarouselCopyWith<ComicCarousel> get copyWith => _$ComicCarouselCopyWithImpl<ComicCarousel>(this as ComicCarousel, _$identity);

  /// Serializes this ComicCarousel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ComicCarousel&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.aspectRatio, aspectRatio) || other.aspectRatio == aspectRatio)&&(identical(other.maxHeightBuilder, maxHeightBuilder) || other.maxHeightBuilder == maxHeightBuilder));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),aspectRatio,maxHeightBuilder);

@override
String toString() {
  return 'ComicCarousel(items: $items, aspectRatio: $aspectRatio, maxHeightBuilder: $maxHeightBuilder)';
}


}

/// @nodoc
abstract mixin class $ComicCarouselCopyWith<$Res>  {
  factory $ComicCarouselCopyWith(ComicCarousel value, $Res Function(ComicCarousel) _then) = _$ComicCarouselCopyWithImpl;
@useResult
$Res call({
 List<ComicCarouselItem> items, double aspectRatio, double maxHeightBuilder
});




}
/// @nodoc
class _$ComicCarouselCopyWithImpl<$Res>
    implements $ComicCarouselCopyWith<$Res> {
  _$ComicCarouselCopyWithImpl(this._self, this._then);

  final ComicCarousel _self;
  final $Res Function(ComicCarousel) _then;

/// Create a copy of ComicCarousel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? aspectRatio = null,Object? maxHeightBuilder = null,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<ComicCarouselItem>,aspectRatio: null == aspectRatio ? _self.aspectRatio : aspectRatio // ignore: cast_nullable_to_non_nullable
as double,maxHeightBuilder: null == maxHeightBuilder ? _self.maxHeightBuilder : maxHeightBuilder // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [ComicCarousel].
extension ComicCarouselPatterns on ComicCarousel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ComicCarousel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ComicCarousel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ComicCarousel value)  $default,){
final _that = this;
switch (_that) {
case _ComicCarousel():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ComicCarousel value)?  $default,){
final _that = this;
switch (_that) {
case _ComicCarousel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ComicCarouselItem> items,  double aspectRatio,  double maxHeightBuilder)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ComicCarousel() when $default != null:
return $default(_that.items,_that.aspectRatio,_that.maxHeightBuilder);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ComicCarouselItem> items,  double aspectRatio,  double maxHeightBuilder)  $default,) {final _that = this;
switch (_that) {
case _ComicCarousel():
return $default(_that.items,_that.aspectRatio,_that.maxHeightBuilder);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ComicCarouselItem> items,  double aspectRatio,  double maxHeightBuilder)?  $default,) {final _that = this;
switch (_that) {
case _ComicCarousel() when $default != null:
return $default(_that.items,_that.aspectRatio,_that.maxHeightBuilder);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ComicCarousel implements ComicCarousel {
  const _ComicCarousel({required final  List<ComicCarouselItem> items, required this.aspectRatio, required this.maxHeightBuilder}): _items = items;
  factory _ComicCarousel.fromJson(Map<String, dynamic> json) => _$ComicCarouselFromJson(json);

 final  List<ComicCarouselItem> _items;
@override List<ComicCarouselItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  double aspectRatio;
@override final  double maxHeightBuilder;

/// Create a copy of ComicCarousel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ComicCarouselCopyWith<_ComicCarousel> get copyWith => __$ComicCarouselCopyWithImpl<_ComicCarousel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ComicCarouselToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ComicCarousel&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.aspectRatio, aspectRatio) || other.aspectRatio == aspectRatio)&&(identical(other.maxHeightBuilder, maxHeightBuilder) || other.maxHeightBuilder == maxHeightBuilder));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),aspectRatio,maxHeightBuilder);

@override
String toString() {
  return 'ComicCarousel(items: $items, aspectRatio: $aspectRatio, maxHeightBuilder: $maxHeightBuilder)';
}


}

/// @nodoc
abstract mixin class _$ComicCarouselCopyWith<$Res> implements $ComicCarouselCopyWith<$Res> {
  factory _$ComicCarouselCopyWith(_ComicCarousel value, $Res Function(_ComicCarousel) _then) = __$ComicCarouselCopyWithImpl;
@override @useResult
$Res call({
 List<ComicCarouselItem> items, double aspectRatio, double maxHeightBuilder
});




}
/// @nodoc
class __$ComicCarouselCopyWithImpl<$Res>
    implements _$ComicCarouselCopyWith<$Res> {
  __$ComicCarouselCopyWithImpl(this._self, this._then);

  final _ComicCarousel _self;
  final $Res Function(_ComicCarousel) _then;

/// Create a copy of ComicCarousel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? aspectRatio = null,Object? maxHeightBuilder = null,}) {
  return _then(_ComicCarousel(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<ComicCarouselItem>,aspectRatio: null == aspectRatio ? _self.aspectRatio : aspectRatio // ignore: cast_nullable_to_non_nullable
as double,maxHeightBuilder: null == maxHeightBuilder ? _self.maxHeightBuilder : maxHeightBuilder // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
