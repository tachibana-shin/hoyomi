// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'eiga_context.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EigaContext {

 String get eigaId; MetaEiga get metaEiga; EigaEpisode get episode; Season? get season;
/// Create a copy of EigaContext
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EigaContextCopyWith<EigaContext> get copyWith => _$EigaContextCopyWithImpl<EigaContext>(this as EigaContext, _$identity);

  /// Serializes this EigaContext to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EigaContext&&(identical(other.eigaId, eigaId) || other.eigaId == eigaId)&&(identical(other.metaEiga, metaEiga) || other.metaEiga == metaEiga)&&(identical(other.episode, episode) || other.episode == episode)&&(identical(other.season, season) || other.season == season));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,eigaId,metaEiga,episode,season);

@override
String toString() {
  return 'EigaContext(eigaId: $eigaId, metaEiga: $metaEiga, episode: $episode, season: $season)';
}


}

/// @nodoc
abstract mixin class $EigaContextCopyWith<$Res>  {
  factory $EigaContextCopyWith(EigaContext value, $Res Function(EigaContext) _then) = _$EigaContextCopyWithImpl;
@useResult
$Res call({
 String eigaId, MetaEiga metaEiga, EigaEpisode episode, Season? season
});


$MetaEigaCopyWith<$Res> get metaEiga;$EigaEpisodeCopyWith<$Res> get episode;$SeasonCopyWith<$Res>? get season;

}
/// @nodoc
class _$EigaContextCopyWithImpl<$Res>
    implements $EigaContextCopyWith<$Res> {
  _$EigaContextCopyWithImpl(this._self, this._then);

  final EigaContext _self;
  final $Res Function(EigaContext) _then;

/// Create a copy of EigaContext
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? eigaId = null,Object? metaEiga = null,Object? episode = null,Object? season = freezed,}) {
  return _then(_self.copyWith(
eigaId: null == eigaId ? _self.eigaId : eigaId // ignore: cast_nullable_to_non_nullable
as String,metaEiga: null == metaEiga ? _self.metaEiga : metaEiga // ignore: cast_nullable_to_non_nullable
as MetaEiga,episode: null == episode ? _self.episode : episode // ignore: cast_nullable_to_non_nullable
as EigaEpisode,season: freezed == season ? _self.season : season // ignore: cast_nullable_to_non_nullable
as Season?,
  ));
}
/// Create a copy of EigaContext
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MetaEigaCopyWith<$Res> get metaEiga {
  
  return $MetaEigaCopyWith<$Res>(_self.metaEiga, (value) {
    return _then(_self.copyWith(metaEiga: value));
  });
}/// Create a copy of EigaContext
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EigaEpisodeCopyWith<$Res> get episode {
  
  return $EigaEpisodeCopyWith<$Res>(_self.episode, (value) {
    return _then(_self.copyWith(episode: value));
  });
}/// Create a copy of EigaContext
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


/// Adds pattern-matching-related methods to [EigaContext].
extension EigaContextPatterns on EigaContext {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EigaContext value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EigaContext() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EigaContext value)  $default,){
final _that = this;
switch (_that) {
case _EigaContext():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EigaContext value)?  $default,){
final _that = this;
switch (_that) {
case _EigaContext() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String eigaId,  MetaEiga metaEiga,  EigaEpisode episode,  Season? season)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EigaContext() when $default != null:
return $default(_that.eigaId,_that.metaEiga,_that.episode,_that.season);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String eigaId,  MetaEiga metaEiga,  EigaEpisode episode,  Season? season)  $default,) {final _that = this;
switch (_that) {
case _EigaContext():
return $default(_that.eigaId,_that.metaEiga,_that.episode,_that.season);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String eigaId,  MetaEiga metaEiga,  EigaEpisode episode,  Season? season)?  $default,) {final _that = this;
switch (_that) {
case _EigaContext() when $default != null:
return $default(_that.eigaId,_that.metaEiga,_that.episode,_that.season);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EigaContext implements EigaContext {
  const _EigaContext({required this.eigaId, required this.metaEiga, required this.episode, this.season});
  factory _EigaContext.fromJson(Map<String, dynamic> json) => _$EigaContextFromJson(json);

@override final  String eigaId;
@override final  MetaEiga metaEiga;
@override final  EigaEpisode episode;
@override final  Season? season;

/// Create a copy of EigaContext
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EigaContextCopyWith<_EigaContext> get copyWith => __$EigaContextCopyWithImpl<_EigaContext>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EigaContextToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EigaContext&&(identical(other.eigaId, eigaId) || other.eigaId == eigaId)&&(identical(other.metaEiga, metaEiga) || other.metaEiga == metaEiga)&&(identical(other.episode, episode) || other.episode == episode)&&(identical(other.season, season) || other.season == season));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,eigaId,metaEiga,episode,season);

@override
String toString() {
  return 'EigaContext(eigaId: $eigaId, metaEiga: $metaEiga, episode: $episode, season: $season)';
}


}

/// @nodoc
abstract mixin class _$EigaContextCopyWith<$Res> implements $EigaContextCopyWith<$Res> {
  factory _$EigaContextCopyWith(_EigaContext value, $Res Function(_EigaContext) _then) = __$EigaContextCopyWithImpl;
@override @useResult
$Res call({
 String eigaId, MetaEiga metaEiga, EigaEpisode episode, Season? season
});


@override $MetaEigaCopyWith<$Res> get metaEiga;@override $EigaEpisodeCopyWith<$Res> get episode;@override $SeasonCopyWith<$Res>? get season;

}
/// @nodoc
class __$EigaContextCopyWithImpl<$Res>
    implements _$EigaContextCopyWith<$Res> {
  __$EigaContextCopyWithImpl(this._self, this._then);

  final _EigaContext _self;
  final $Res Function(_EigaContext) _then;

/// Create a copy of EigaContext
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? eigaId = null,Object? metaEiga = null,Object? episode = null,Object? season = freezed,}) {
  return _then(_EigaContext(
eigaId: null == eigaId ? _self.eigaId : eigaId // ignore: cast_nullable_to_non_nullable
as String,metaEiga: null == metaEiga ? _self.metaEiga : metaEiga // ignore: cast_nullable_to_non_nullable
as MetaEiga,episode: null == episode ? _self.episode : episode // ignore: cast_nullable_to_non_nullable
as EigaEpisode,season: freezed == season ? _self.season : season // ignore: cast_nullable_to_non_nullable
as Season?,
  ));
}

/// Create a copy of EigaContext
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MetaEigaCopyWith<$Res> get metaEiga {
  
  return $MetaEigaCopyWith<$Res>(_self.metaEiga, (value) {
    return _then(_self.copyWith(metaEiga: value));
  });
}/// Create a copy of EigaContext
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EigaEpisodeCopyWith<$Res> get episode {
  
  return $EigaEpisodeCopyWith<$Res>(_self.episode, (value) {
    return _then(_self.copyWith(episode: value));
  });
}/// Create a copy of EigaContext
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
