// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'eiga_watch_time_mixin.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EigaWatchContext {

 String get eigaId; EigaEpisode get episode; MetaEiga get metaEiga; Season? get season;
/// Create a copy of EigaWatchContext
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EigaWatchContextCopyWith<EigaWatchContext> get copyWith => _$EigaWatchContextCopyWithImpl<EigaWatchContext>(this as EigaWatchContext, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EigaWatchContext&&(identical(other.eigaId, eigaId) || other.eigaId == eigaId)&&(identical(other.episode, episode) || other.episode == episode)&&(identical(other.metaEiga, metaEiga) || other.metaEiga == metaEiga)&&(identical(other.season, season) || other.season == season));
}


@override
int get hashCode => Object.hash(runtimeType,eigaId,episode,metaEiga,season);

@override
String toString() {
  return 'EigaWatchContext(eigaId: $eigaId, episode: $episode, metaEiga: $metaEiga, season: $season)';
}


}

/// @nodoc
abstract mixin class $EigaWatchContextCopyWith<$Res>  {
  factory $EigaWatchContextCopyWith(EigaWatchContext value, $Res Function(EigaWatchContext) _then) = _$EigaWatchContextCopyWithImpl;
@useResult
$Res call({
 String eigaId, EigaEpisode episode, MetaEiga metaEiga, Season? season
});


$EigaEpisodeCopyWith<$Res> get episode;$MetaEigaCopyWith<$Res> get metaEiga;$SeasonCopyWith<$Res>? get season;

}
/// @nodoc
class _$EigaWatchContextCopyWithImpl<$Res>
    implements $EigaWatchContextCopyWith<$Res> {
  _$EigaWatchContextCopyWithImpl(this._self, this._then);

  final EigaWatchContext _self;
  final $Res Function(EigaWatchContext) _then;

/// Create a copy of EigaWatchContext
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? eigaId = null,Object? episode = null,Object? metaEiga = null,Object? season = freezed,}) {
  return _then(_self.copyWith(
eigaId: null == eigaId ? _self.eigaId : eigaId // ignore: cast_nullable_to_non_nullable
as String,episode: null == episode ? _self.episode : episode // ignore: cast_nullable_to_non_nullable
as EigaEpisode,metaEiga: null == metaEiga ? _self.metaEiga : metaEiga // ignore: cast_nullable_to_non_nullable
as MetaEiga,season: freezed == season ? _self.season : season // ignore: cast_nullable_to_non_nullable
as Season?,
  ));
}
/// Create a copy of EigaWatchContext
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EigaEpisodeCopyWith<$Res> get episode {
  
  return $EigaEpisodeCopyWith<$Res>(_self.episode, (value) {
    return _then(_self.copyWith(episode: value));
  });
}/// Create a copy of EigaWatchContext
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MetaEigaCopyWith<$Res> get metaEiga {
  
  return $MetaEigaCopyWith<$Res>(_self.metaEiga, (value) {
    return _then(_self.copyWith(metaEiga: value));
  });
}/// Create a copy of EigaWatchContext
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


/// @nodoc


class _EigaWatchContext implements EigaWatchContext {
  const _EigaWatchContext({required this.eigaId, required this.episode, required this.metaEiga, this.season});
  

@override final  String eigaId;
@override final  EigaEpisode episode;
@override final  MetaEiga metaEiga;
@override final  Season? season;

/// Create a copy of EigaWatchContext
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EigaWatchContextCopyWith<_EigaWatchContext> get copyWith => __$EigaWatchContextCopyWithImpl<_EigaWatchContext>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EigaWatchContext&&(identical(other.eigaId, eigaId) || other.eigaId == eigaId)&&(identical(other.episode, episode) || other.episode == episode)&&(identical(other.metaEiga, metaEiga) || other.metaEiga == metaEiga)&&(identical(other.season, season) || other.season == season));
}


@override
int get hashCode => Object.hash(runtimeType,eigaId,episode,metaEiga,season);

@override
String toString() {
  return 'EigaWatchContext(eigaId: $eigaId, episode: $episode, metaEiga: $metaEiga, season: $season)';
}


}

/// @nodoc
abstract mixin class _$EigaWatchContextCopyWith<$Res> implements $EigaWatchContextCopyWith<$Res> {
  factory _$EigaWatchContextCopyWith(_EigaWatchContext value, $Res Function(_EigaWatchContext) _then) = __$EigaWatchContextCopyWithImpl;
@override @useResult
$Res call({
 String eigaId, EigaEpisode episode, MetaEiga metaEiga, Season? season
});


@override $EigaEpisodeCopyWith<$Res> get episode;@override $MetaEigaCopyWith<$Res> get metaEiga;@override $SeasonCopyWith<$Res>? get season;

}
/// @nodoc
class __$EigaWatchContextCopyWithImpl<$Res>
    implements _$EigaWatchContextCopyWith<$Res> {
  __$EigaWatchContextCopyWithImpl(this._self, this._then);

  final _EigaWatchContext _self;
  final $Res Function(_EigaWatchContext) _then;

/// Create a copy of EigaWatchContext
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? eigaId = null,Object? episode = null,Object? metaEiga = null,Object? season = freezed,}) {
  return _then(_EigaWatchContext(
eigaId: null == eigaId ? _self.eigaId : eigaId // ignore: cast_nullable_to_non_nullable
as String,episode: null == episode ? _self.episode : episode // ignore: cast_nullable_to_non_nullable
as EigaEpisode,metaEiga: null == metaEiga ? _self.metaEiga : metaEiga // ignore: cast_nullable_to_non_nullable
as MetaEiga,season: freezed == season ? _self.season : season // ignore: cast_nullable_to_non_nullable
as Season?,
  ));
}

/// Create a copy of EigaWatchContext
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EigaEpisodeCopyWith<$Res> get episode {
  
  return $EigaEpisodeCopyWith<$Res>(_self.episode, (value) {
    return _then(_self.copyWith(episode: value));
  });
}/// Create a copy of EigaWatchContext
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MetaEigaCopyWith<$Res> get metaEiga {
  
  return $MetaEigaCopyWith<$Res>(_self.metaEiga, (value) {
    return _then(_self.copyWith(metaEiga: value));
  });
}/// Create a copy of EigaWatchContext
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
