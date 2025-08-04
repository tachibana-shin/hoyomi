// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'eiga_context_with_episodes.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EigaContextWithEpisodes {

 String get eigaId; MetaEiga get metaEiga; Season? get season; List<EigaEpisode> get episodes;
/// Create a copy of EigaContextWithEpisodes
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EigaContextWithEpisodesCopyWith<EigaContextWithEpisodes> get copyWith => _$EigaContextWithEpisodesCopyWithImpl<EigaContextWithEpisodes>(this as EigaContextWithEpisodes, _$identity);

  /// Serializes this EigaContextWithEpisodes to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EigaContextWithEpisodes&&(identical(other.eigaId, eigaId) || other.eigaId == eigaId)&&(identical(other.metaEiga, metaEiga) || other.metaEiga == metaEiga)&&(identical(other.season, season) || other.season == season)&&const DeepCollectionEquality().equals(other.episodes, episodes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,eigaId,metaEiga,season,const DeepCollectionEquality().hash(episodes));

@override
String toString() {
  return 'EigaContextWithEpisodes(eigaId: $eigaId, metaEiga: $metaEiga, season: $season, episodes: $episodes)';
}


}

/// @nodoc
abstract mixin class $EigaContextWithEpisodesCopyWith<$Res>  {
  factory $EigaContextWithEpisodesCopyWith(EigaContextWithEpisodes value, $Res Function(EigaContextWithEpisodes) _then) = _$EigaContextWithEpisodesCopyWithImpl;
@useResult
$Res call({
 String eigaId, MetaEiga metaEiga, Season? season, List<EigaEpisode> episodes
});


$MetaEigaCopyWith<$Res> get metaEiga;$SeasonCopyWith<$Res>? get season;

}
/// @nodoc
class _$EigaContextWithEpisodesCopyWithImpl<$Res>
    implements $EigaContextWithEpisodesCopyWith<$Res> {
  _$EigaContextWithEpisodesCopyWithImpl(this._self, this._then);

  final EigaContextWithEpisodes _self;
  final $Res Function(EigaContextWithEpisodes) _then;

/// Create a copy of EigaContextWithEpisodes
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? eigaId = null,Object? metaEiga = null,Object? season = freezed,Object? episodes = null,}) {
  return _then(_self.copyWith(
eigaId: null == eigaId ? _self.eigaId : eigaId // ignore: cast_nullable_to_non_nullable
as String,metaEiga: null == metaEiga ? _self.metaEiga : metaEiga // ignore: cast_nullable_to_non_nullable
as MetaEiga,season: freezed == season ? _self.season : season // ignore: cast_nullable_to_non_nullable
as Season?,episodes: null == episodes ? _self.episodes : episodes // ignore: cast_nullable_to_non_nullable
as List<EigaEpisode>,
  ));
}
/// Create a copy of EigaContextWithEpisodes
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MetaEigaCopyWith<$Res> get metaEiga {
  
  return $MetaEigaCopyWith<$Res>(_self.metaEiga, (value) {
    return _then(_self.copyWith(metaEiga: value));
  });
}/// Create a copy of EigaContextWithEpisodes
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SeasonCopyWith<$Res>? get season {
    if (_self.season == null) {
    return null;
  }

  return $SeasonCopyWith<$Res>(_self.season!, (value) {
    return _then(_self.copyWith(season: value));
  });
}
}


/// Adds pattern-matching-related methods to [EigaContextWithEpisodes].
extension EigaContextWithEpisodesPatterns on EigaContextWithEpisodes {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EigaContextWithEpisodes value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EigaContextWithEpisodes() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EigaContextWithEpisodes value)  $default,){
final _that = this;
switch (_that) {
case _EigaContextWithEpisodes():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EigaContextWithEpisodes value)?  $default,){
final _that = this;
switch (_that) {
case _EigaContextWithEpisodes() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String eigaId,  MetaEiga metaEiga,  Season? season,  List<EigaEpisode> episodes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EigaContextWithEpisodes() when $default != null:
return $default(_that.eigaId,_that.metaEiga,_that.season,_that.episodes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String eigaId,  MetaEiga metaEiga,  Season? season,  List<EigaEpisode> episodes)  $default,) {final _that = this;
switch (_that) {
case _EigaContextWithEpisodes():
return $default(_that.eigaId,_that.metaEiga,_that.season,_that.episodes);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String eigaId,  MetaEiga metaEiga,  Season? season,  List<EigaEpisode> episodes)?  $default,) {final _that = this;
switch (_that) {
case _EigaContextWithEpisodes() when $default != null:
return $default(_that.eigaId,_that.metaEiga,_that.season,_that.episodes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EigaContextWithEpisodes implements EigaContextWithEpisodes {
  const _EigaContextWithEpisodes({required this.eigaId, required this.metaEiga, this.season, required final  List<EigaEpisode> episodes}): _episodes = episodes;
  factory _EigaContextWithEpisodes.fromJson(Map<String, dynamic> json) => _$EigaContextWithEpisodesFromJson(json);

@override final  String eigaId;
@override final  MetaEiga metaEiga;
@override final  Season? season;
 final  List<EigaEpisode> _episodes;
@override List<EigaEpisode> get episodes {
  if (_episodes is EqualUnmodifiableListView) return _episodes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_episodes);
}


/// Create a copy of EigaContextWithEpisodes
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EigaContextWithEpisodesCopyWith<_EigaContextWithEpisodes> get copyWith => __$EigaContextWithEpisodesCopyWithImpl<_EigaContextWithEpisodes>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EigaContextWithEpisodesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EigaContextWithEpisodes&&(identical(other.eigaId, eigaId) || other.eigaId == eigaId)&&(identical(other.metaEiga, metaEiga) || other.metaEiga == metaEiga)&&(identical(other.season, season) || other.season == season)&&const DeepCollectionEquality().equals(other._episodes, _episodes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,eigaId,metaEiga,season,const DeepCollectionEquality().hash(_episodes));

@override
String toString() {
  return 'EigaContextWithEpisodes(eigaId: $eigaId, metaEiga: $metaEiga, season: $season, episodes: $episodes)';
}


}

/// @nodoc
abstract mixin class _$EigaContextWithEpisodesCopyWith<$Res> implements $EigaContextWithEpisodesCopyWith<$Res> {
  factory _$EigaContextWithEpisodesCopyWith(_EigaContextWithEpisodes value, $Res Function(_EigaContextWithEpisodes) _then) = __$EigaContextWithEpisodesCopyWithImpl;
@override @useResult
$Res call({
 String eigaId, MetaEiga metaEiga, Season? season, List<EigaEpisode> episodes
});


@override $MetaEigaCopyWith<$Res> get metaEiga;@override $SeasonCopyWith<$Res>? get season;

}
/// @nodoc
class __$EigaContextWithEpisodesCopyWithImpl<$Res>
    implements _$EigaContextWithEpisodesCopyWith<$Res> {
  __$EigaContextWithEpisodesCopyWithImpl(this._self, this._then);

  final _EigaContextWithEpisodes _self;
  final $Res Function(_EigaContextWithEpisodes) _then;

/// Create a copy of EigaContextWithEpisodes
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? eigaId = null,Object? metaEiga = null,Object? season = freezed,Object? episodes = null,}) {
  return _then(_EigaContextWithEpisodes(
eigaId: null == eigaId ? _self.eigaId : eigaId // ignore: cast_nullable_to_non_nullable
as String,metaEiga: null == metaEiga ? _self.metaEiga : metaEiga // ignore: cast_nullable_to_non_nullable
as MetaEiga,season: freezed == season ? _self.season : season // ignore: cast_nullable_to_non_nullable
as Season?,episodes: null == episodes ? _self._episodes : episodes // ignore: cast_nullable_to_non_nullable
as List<EigaEpisode>,
  ));
}

/// Create a copy of EigaContextWithEpisodes
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MetaEigaCopyWith<$Res> get metaEiga {
  
  return $MetaEigaCopyWith<$Res>(_self.metaEiga, (value) {
    return _then(_self.copyWith(metaEiga: value));
  });
}/// Create a copy of EigaContextWithEpisodes
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SeasonCopyWith<$Res>? get season {
    if (_self.season == null) {
    return null;
  }

  return $SeasonCopyWith<$Res>(_self.season!, (value) {
    return _then(_self.copyWith(season: value));
  });
}
}

// dart format on
