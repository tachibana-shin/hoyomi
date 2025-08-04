// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'eiga_episodes.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EigaEpisodes {

 List<EigaEpisode> get episodes; OImage? get image; OImage? get poster; DateTime? get schedule;
/// Create a copy of EigaEpisodes
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EigaEpisodesCopyWith<EigaEpisodes> get copyWith => _$EigaEpisodesCopyWithImpl<EigaEpisodes>(this as EigaEpisodes, _$identity);

  /// Serializes this EigaEpisodes to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EigaEpisodes&&const DeepCollectionEquality().equals(other.episodes, episodes)&&(identical(other.image, image) || other.image == image)&&(identical(other.poster, poster) || other.poster == poster)&&(identical(other.schedule, schedule) || other.schedule == schedule));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(episodes),image,poster,schedule);

@override
String toString() {
  return 'EigaEpisodes(episodes: $episodes, image: $image, poster: $poster, schedule: $schedule)';
}


}

/// @nodoc
abstract mixin class $EigaEpisodesCopyWith<$Res>  {
  factory $EigaEpisodesCopyWith(EigaEpisodes value, $Res Function(EigaEpisodes) _then) = _$EigaEpisodesCopyWithImpl;
@useResult
$Res call({
 List<EigaEpisode> episodes, OImage? image, OImage? poster, DateTime? schedule
});


$OImageCopyWith<$Res>? get image;$OImageCopyWith<$Res>? get poster;

}
/// @nodoc
class _$EigaEpisodesCopyWithImpl<$Res>
    implements $EigaEpisodesCopyWith<$Res> {
  _$EigaEpisodesCopyWithImpl(this._self, this._then);

  final EigaEpisodes _self;
  final $Res Function(EigaEpisodes) _then;

/// Create a copy of EigaEpisodes
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? episodes = null,Object? image = freezed,Object? poster = freezed,Object? schedule = freezed,}) {
  return _then(_self.copyWith(
episodes: null == episodes ? _self.episodes : episodes // ignore: cast_nullable_to_non_nullable
as List<EigaEpisode>,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as OImage?,poster: freezed == poster ? _self.poster : poster // ignore: cast_nullable_to_non_nullable
as OImage?,schedule: freezed == schedule ? _self.schedule : schedule // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of EigaEpisodes
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
}/// Create a copy of EigaEpisodes
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OImageCopyWith<$Res>? get poster {
    if (_self.poster == null) {
    return null;
  }

  return $OImageCopyWith<$Res>(_self.poster!, (value) {
    return _then(_self.copyWith(poster: value));
  });
}
}


/// Adds pattern-matching-related methods to [EigaEpisodes].
extension EigaEpisodesPatterns on EigaEpisodes {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EigaEpisodes value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EigaEpisodes() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EigaEpisodes value)  $default,){
final _that = this;
switch (_that) {
case _EigaEpisodes():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EigaEpisodes value)?  $default,){
final _that = this;
switch (_that) {
case _EigaEpisodes() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<EigaEpisode> episodes,  OImage? image,  OImage? poster,  DateTime? schedule)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EigaEpisodes() when $default != null:
return $default(_that.episodes,_that.image,_that.poster,_that.schedule);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<EigaEpisode> episodes,  OImage? image,  OImage? poster,  DateTime? schedule)  $default,) {final _that = this;
switch (_that) {
case _EigaEpisodes():
return $default(_that.episodes,_that.image,_that.poster,_that.schedule);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<EigaEpisode> episodes,  OImage? image,  OImage? poster,  DateTime? schedule)?  $default,) {final _that = this;
switch (_that) {
case _EigaEpisodes() when $default != null:
return $default(_that.episodes,_that.image,_that.poster,_that.schedule);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EigaEpisodes implements EigaEpisodes {
  const _EigaEpisodes({required final  List<EigaEpisode> episodes, this.image, this.poster, this.schedule}): _episodes = episodes;
  factory _EigaEpisodes.fromJson(Map<String, dynamic> json) => _$EigaEpisodesFromJson(json);

 final  List<EigaEpisode> _episodes;
@override List<EigaEpisode> get episodes {
  if (_episodes is EqualUnmodifiableListView) return _episodes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_episodes);
}

@override final  OImage? image;
@override final  OImage? poster;
@override final  DateTime? schedule;

/// Create a copy of EigaEpisodes
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EigaEpisodesCopyWith<_EigaEpisodes> get copyWith => __$EigaEpisodesCopyWithImpl<_EigaEpisodes>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EigaEpisodesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EigaEpisodes&&const DeepCollectionEquality().equals(other._episodes, _episodes)&&(identical(other.image, image) || other.image == image)&&(identical(other.poster, poster) || other.poster == poster)&&(identical(other.schedule, schedule) || other.schedule == schedule));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_episodes),image,poster,schedule);

@override
String toString() {
  return 'EigaEpisodes(episodes: $episodes, image: $image, poster: $poster, schedule: $schedule)';
}


}

/// @nodoc
abstract mixin class _$EigaEpisodesCopyWith<$Res> implements $EigaEpisodesCopyWith<$Res> {
  factory _$EigaEpisodesCopyWith(_EigaEpisodes value, $Res Function(_EigaEpisodes) _then) = __$EigaEpisodesCopyWithImpl;
@override @useResult
$Res call({
 List<EigaEpisode> episodes, OImage? image, OImage? poster, DateTime? schedule
});


@override $OImageCopyWith<$Res>? get image;@override $OImageCopyWith<$Res>? get poster;

}
/// @nodoc
class __$EigaEpisodesCopyWithImpl<$Res>
    implements _$EigaEpisodesCopyWith<$Res> {
  __$EigaEpisodesCopyWithImpl(this._self, this._then);

  final _EigaEpisodes _self;
  final $Res Function(_EigaEpisodes) _then;

/// Create a copy of EigaEpisodes
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? episodes = null,Object? image = freezed,Object? poster = freezed,Object? schedule = freezed,}) {
  return _then(_EigaEpisodes(
episodes: null == episodes ? _self._episodes : episodes // ignore: cast_nullable_to_non_nullable
as List<EigaEpisode>,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as OImage?,poster: freezed == poster ? _self.poster : poster // ignore: cast_nullable_to_non_nullable
as OImage?,schedule: freezed == schedule ? _self.schedule : schedule // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of EigaEpisodes
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
}/// Create a copy of EigaEpisodes
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OImageCopyWith<$Res>? get poster {
    if (_self.poster == null) {
    return null;
  }

  return $OImageCopyWith<$Res>(_self.poster!, (value) {
    return _then(_self.copyWith(poster: value));
  });
}
}

// dart format on
