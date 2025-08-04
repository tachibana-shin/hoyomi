// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comic_home.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ComicHome {

 ComicCarousel? get carousel; List<HomeComicCategory> get categories;
/// Create a copy of ComicHome
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ComicHomeCopyWith<ComicHome> get copyWith => _$ComicHomeCopyWithImpl<ComicHome>(this as ComicHome, _$identity);

  /// Serializes this ComicHome to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ComicHome&&(identical(other.carousel, carousel) || other.carousel == carousel)&&const DeepCollectionEquality().equals(other.categories, categories));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,carousel,const DeepCollectionEquality().hash(categories));

@override
String toString() {
  return 'ComicHome(carousel: $carousel, categories: $categories)';
}


}

/// @nodoc
abstract mixin class $ComicHomeCopyWith<$Res>  {
  factory $ComicHomeCopyWith(ComicHome value, $Res Function(ComicHome) _then) = _$ComicHomeCopyWithImpl;
@useResult
$Res call({
 ComicCarousel? carousel, List<HomeComicCategory> categories
});


$ComicCarouselCopyWith<$Res>? get carousel;

}
/// @nodoc
class _$ComicHomeCopyWithImpl<$Res>
    implements $ComicHomeCopyWith<$Res> {
  _$ComicHomeCopyWithImpl(this._self, this._then);

  final ComicHome _self;
  final $Res Function(ComicHome) _then;

/// Create a copy of ComicHome
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? carousel = freezed,Object? categories = null,}) {
  return _then(_self.copyWith(
carousel: freezed == carousel ? _self.carousel : carousel // ignore: cast_nullable_to_non_nullable
as ComicCarousel?,categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<HomeComicCategory>,
  ));
}
/// Create a copy of ComicHome
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ComicCarouselCopyWith<$Res>? get carousel {
    if (_self.carousel == null) {
    return null;
  }

  return $ComicCarouselCopyWith<$Res>(_self.carousel!, (value) {
    return _then(_self.copyWith(carousel: value));
  });
}
}


/// Adds pattern-matching-related methods to [ComicHome].
extension ComicHomePatterns on ComicHome {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ComicHome value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ComicHome() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ComicHome value)  $default,){
final _that = this;
switch (_that) {
case _ComicHome():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ComicHome value)?  $default,){
final _that = this;
switch (_that) {
case _ComicHome() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ComicCarousel? carousel,  List<HomeComicCategory> categories)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ComicHome() when $default != null:
return $default(_that.carousel,_that.categories);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ComicCarousel? carousel,  List<HomeComicCategory> categories)  $default,) {final _that = this;
switch (_that) {
case _ComicHome():
return $default(_that.carousel,_that.categories);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ComicCarousel? carousel,  List<HomeComicCategory> categories)?  $default,) {final _that = this;
switch (_that) {
case _ComicHome() when $default != null:
return $default(_that.carousel,_that.categories);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ComicHome implements ComicHome {
  const _ComicHome({this.carousel, required final  List<HomeComicCategory> categories}): _categories = categories;
  factory _ComicHome.fromJson(Map<String, dynamic> json) => _$ComicHomeFromJson(json);

@override final  ComicCarousel? carousel;
 final  List<HomeComicCategory> _categories;
@override List<HomeComicCategory> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}


/// Create a copy of ComicHome
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ComicHomeCopyWith<_ComicHome> get copyWith => __$ComicHomeCopyWithImpl<_ComicHome>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ComicHomeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ComicHome&&(identical(other.carousel, carousel) || other.carousel == carousel)&&const DeepCollectionEquality().equals(other._categories, _categories));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,carousel,const DeepCollectionEquality().hash(_categories));

@override
String toString() {
  return 'ComicHome(carousel: $carousel, categories: $categories)';
}


}

/// @nodoc
abstract mixin class _$ComicHomeCopyWith<$Res> implements $ComicHomeCopyWith<$Res> {
  factory _$ComicHomeCopyWith(_ComicHome value, $Res Function(_ComicHome) _then) = __$ComicHomeCopyWithImpl;
@override @useResult
$Res call({
 ComicCarousel? carousel, List<HomeComicCategory> categories
});


@override $ComicCarouselCopyWith<$Res>? get carousel;

}
/// @nodoc
class __$ComicHomeCopyWithImpl<$Res>
    implements _$ComicHomeCopyWith<$Res> {
  __$ComicHomeCopyWithImpl(this._self, this._then);

  final _ComicHome _self;
  final $Res Function(_ComicHome) _then;

/// Create a copy of ComicHome
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? carousel = freezed,Object? categories = null,}) {
  return _then(_ComicHome(
carousel: freezed == carousel ? _self.carousel : carousel // ignore: cast_nullable_to_non_nullable
as ComicCarousel?,categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<HomeComicCategory>,
  ));
}

/// Create a copy of ComicHome
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ComicCarouselCopyWith<$Res>? get carousel {
    if (_self.carousel == null) {
    return null;
  }

  return $ComicCarouselCopyWith<$Res>(_self.carousel!, (value) {
    return _then(_self.copyWith(carousel: value));
  });
}
}

// dart format on
