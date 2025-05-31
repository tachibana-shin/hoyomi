// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
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



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EigaContextWithEpisodes&&(identical(other.eigaId, eigaId) || other.eigaId == eigaId)&&(identical(other.metaEiga, metaEiga) || other.metaEiga == metaEiga)&&(identical(other.season, season) || other.season == season)&&const DeepCollectionEquality().equals(other.episodes, episodes));
}


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


/// @nodoc


class _EigaContextWithEpisodes implements EigaContextWithEpisodes {
  const _EigaContextWithEpisodes({required this.eigaId, required this.metaEiga, this.season, required final  List<EigaEpisode> episodes}): _episodes = episodes;
  

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
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EigaContextWithEpisodes&&(identical(other.eigaId, eigaId) || other.eigaId == eigaId)&&(identical(other.metaEiga, metaEiga) || other.metaEiga == metaEiga)&&(identical(other.season, season) || other.season == season)&&const DeepCollectionEquality().equals(other._episodes, _episodes));
}


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
