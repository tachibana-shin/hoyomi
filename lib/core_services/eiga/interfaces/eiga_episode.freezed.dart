// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'eiga_episode.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EigaEpisode {

 String get name; String get episodeId; OImage? get image; String? get description; String? get extra; int get order;
/// Create a copy of EigaEpisode
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EigaEpisodeCopyWith<EigaEpisode> get copyWith => _$EigaEpisodeCopyWithImpl<EigaEpisode>(this as EigaEpisode, _$identity);

  /// Serializes this EigaEpisode to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EigaEpisode&&(identical(other.name, name) || other.name == name)&&(identical(other.episodeId, episodeId) || other.episodeId == episodeId)&&(identical(other.image, image) || other.image == image)&&(identical(other.description, description) || other.description == description)&&(identical(other.extra, extra) || other.extra == extra)&&(identical(other.order, order) || other.order == order));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,episodeId,image,description,extra,order);

@override
String toString() {
  return 'EigaEpisode(name: $name, episodeId: $episodeId, image: $image, description: $description, extra: $extra, order: $order)';
}


}

/// @nodoc
abstract mixin class $EigaEpisodeCopyWith<$Res>  {
  factory $EigaEpisodeCopyWith(EigaEpisode value, $Res Function(EigaEpisode) _then) = _$EigaEpisodeCopyWithImpl;
@useResult
$Res call({
 String name, String episodeId, OImage? image, String? description, String? extra, int order
});


$OImageCopyWith<$Res>? get image;

}
/// @nodoc
class _$EigaEpisodeCopyWithImpl<$Res>
    implements $EigaEpisodeCopyWith<$Res> {
  _$EigaEpisodeCopyWithImpl(this._self, this._then);

  final EigaEpisode _self;
  final $Res Function(EigaEpisode) _then;

/// Create a copy of EigaEpisode
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? episodeId = null,Object? image = freezed,Object? description = freezed,Object? extra = freezed,Object? order = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,episodeId: null == episodeId ? _self.episodeId : episodeId // ignore: cast_nullable_to_non_nullable
as String,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as OImage?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,extra: freezed == extra ? _self.extra : extra // ignore: cast_nullable_to_non_nullable
as String?,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of EigaEpisode
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OImageCopyWith<$Res>? get image {
    if (_self.image == null) {
    return null;
  }

  return $OImageCopyWith<$Res>(_self.image!, (value) {
    return _then(_self.copyWith(image: value));
  });
}
}


/// Adds pattern-matching-related methods to [EigaEpisode].
extension EigaEpisodePatterns on EigaEpisode {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EigaEpisode value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EigaEpisode() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EigaEpisode value)  $default,){
final _that = this;
switch (_that) {
case _EigaEpisode():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EigaEpisode value)?  $default,){
final _that = this;
switch (_that) {
case _EigaEpisode() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String episodeId,  OImage? image,  String? description,  String? extra,  int order)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EigaEpisode() when $default != null:
return $default(_that.name,_that.episodeId,_that.image,_that.description,_that.extra,_that.order);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String episodeId,  OImage? image,  String? description,  String? extra,  int order)  $default,) {final _that = this;
switch (_that) {
case _EigaEpisode():
return $default(_that.name,_that.episodeId,_that.image,_that.description,_that.extra,_that.order);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String episodeId,  OImage? image,  String? description,  String? extra,  int order)?  $default,) {final _that = this;
switch (_that) {
case _EigaEpisode() when $default != null:
return $default(_that.name,_that.episodeId,_that.image,_that.description,_that.extra,_that.order);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EigaEpisode implements EigaEpisode {
  const _EigaEpisode({required this.name, required this.episodeId, this.image, this.description, this.extra, this.order = -1});
  factory _EigaEpisode.fromJson(Map<String, dynamic> json) => _$EigaEpisodeFromJson(json);

@override final  String name;
@override final  String episodeId;
@override final  OImage? image;
@override final  String? description;
@override final  String? extra;
@override@JsonKey() final  int order;

/// Create a copy of EigaEpisode
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EigaEpisodeCopyWith<_EigaEpisode> get copyWith => __$EigaEpisodeCopyWithImpl<_EigaEpisode>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EigaEpisodeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EigaEpisode&&(identical(other.name, name) || other.name == name)&&(identical(other.episodeId, episodeId) || other.episodeId == episodeId)&&(identical(other.image, image) || other.image == image)&&(identical(other.description, description) || other.description == description)&&(identical(other.extra, extra) || other.extra == extra)&&(identical(other.order, order) || other.order == order));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,episodeId,image,description,extra,order);

@override
String toString() {
  return 'EigaEpisode(name: $name, episodeId: $episodeId, image: $image, description: $description, extra: $extra, order: $order)';
}


}

/// @nodoc
abstract mixin class _$EigaEpisodeCopyWith<$Res> implements $EigaEpisodeCopyWith<$Res> {
  factory _$EigaEpisodeCopyWith(_EigaEpisode value, $Res Function(_EigaEpisode) _then) = __$EigaEpisodeCopyWithImpl;
@override @useResult
$Res call({
 String name, String episodeId, OImage? image, String? description, String? extra, int order
});


@override $OImageCopyWith<$Res>? get image;

}
/// @nodoc
class __$EigaEpisodeCopyWithImpl<$Res>
    implements _$EigaEpisodeCopyWith<$Res> {
  __$EigaEpisodeCopyWithImpl(this._self, this._then);

  final _EigaEpisode _self;
  final $Res Function(_EigaEpisode) _then;

/// Create a copy of EigaEpisode
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? episodeId = null,Object? image = freezed,Object? description = freezed,Object? extra = freezed,Object? order = null,}) {
  return _then(_EigaEpisode(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,episodeId: null == episodeId ? _self.episodeId : episodeId // ignore: cast_nullable_to_non_nullable
as String,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as OImage?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,extra: freezed == extra ? _self.extra : extra // ignore: cast_nullable_to_non_nullable
as String?,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of EigaEpisode
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OImageCopyWith<$Res>? get image {
    if (_self.image == null) {
    return null;
  }

  return $OImageCopyWith<$Res>(_self.image!, (value) {
    return _then(_self.copyWith(image: value));
  });
}
}

// dart format on
