// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ab_eiga_service.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PropsGetSeekThumbnail {

 String get eigaId; MetaEiga get metaEiga; EigaEpisode get episode; SourceVideo get source;
/// Create a copy of PropsGetSeekThumbnail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PropsGetSeekThumbnailCopyWith<PropsGetSeekThumbnail> get copyWith => _$PropsGetSeekThumbnailCopyWithImpl<PropsGetSeekThumbnail>(this as PropsGetSeekThumbnail, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PropsGetSeekThumbnail&&(identical(other.eigaId, eigaId) || other.eigaId == eigaId)&&(identical(other.metaEiga, metaEiga) || other.metaEiga == metaEiga)&&(identical(other.episode, episode) || other.episode == episode)&&(identical(other.source, source) || other.source == source));
}


@override
int get hashCode => Object.hash(runtimeType,eigaId,metaEiga,episode,source);

@override
String toString() {
  return 'PropsGetSeekThumbnail(eigaId: $eigaId, metaEiga: $metaEiga, episode: $episode, source: $source)';
}


}

/// @nodoc
abstract mixin class $PropsGetSeekThumbnailCopyWith<$Res>  {
  factory $PropsGetSeekThumbnailCopyWith(PropsGetSeekThumbnail value, $Res Function(PropsGetSeekThumbnail) _then) = _$PropsGetSeekThumbnailCopyWithImpl;
@useResult
$Res call({
 String eigaId, MetaEiga metaEiga, EigaEpisode episode, SourceVideo source
});


$MetaEigaCopyWith<$Res> get metaEiga;$EigaEpisodeCopyWith<$Res> get episode;$SourceVideoCopyWith<$Res> get source;

}
/// @nodoc
class _$PropsGetSeekThumbnailCopyWithImpl<$Res>
    implements $PropsGetSeekThumbnailCopyWith<$Res> {
  _$PropsGetSeekThumbnailCopyWithImpl(this._self, this._then);

  final PropsGetSeekThumbnail _self;
  final $Res Function(PropsGetSeekThumbnail) _then;

/// Create a copy of PropsGetSeekThumbnail
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? eigaId = null,Object? metaEiga = null,Object? episode = null,Object? source = null,}) {
  return _then(_self.copyWith(
eigaId: null == eigaId ? _self.eigaId : eigaId // ignore: cast_nullable_to_non_nullable
as String,metaEiga: null == metaEiga ? _self.metaEiga : metaEiga // ignore: cast_nullable_to_non_nullable
as MetaEiga,episode: null == episode ? _self.episode : episode // ignore: cast_nullable_to_non_nullable
as EigaEpisode,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as SourceVideo,
  ));
}
/// Create a copy of PropsGetSeekThumbnail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MetaEigaCopyWith<$Res> get metaEiga {
  
  return $MetaEigaCopyWith<$Res>(_self.metaEiga, (value) {
    return _then(_self.copyWith(metaEiga: value));
  });
}/// Create a copy of PropsGetSeekThumbnail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EigaEpisodeCopyWith<$Res> get episode {
  
  return $EigaEpisodeCopyWith<$Res>(_self.episode, (value) {
    return _then(_self.copyWith(episode: value));
  });
}/// Create a copy of PropsGetSeekThumbnail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SourceVideoCopyWith<$Res> get source {
  
  return $SourceVideoCopyWith<$Res>(_self.source, (value) {
    return _then(_self.copyWith(source: value));
  });
}
}


/// @nodoc


class _PropsGetSeekThumbnail implements PropsGetSeekThumbnail {
  const _PropsGetSeekThumbnail({required this.eigaId, required this.metaEiga, required this.episode, required this.source});
  

@override final  String eigaId;
@override final  MetaEiga metaEiga;
@override final  EigaEpisode episode;
@override final  SourceVideo source;

/// Create a copy of PropsGetSeekThumbnail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PropsGetSeekThumbnailCopyWith<_PropsGetSeekThumbnail> get copyWith => __$PropsGetSeekThumbnailCopyWithImpl<_PropsGetSeekThumbnail>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PropsGetSeekThumbnail&&(identical(other.eigaId, eigaId) || other.eigaId == eigaId)&&(identical(other.metaEiga, metaEiga) || other.metaEiga == metaEiga)&&(identical(other.episode, episode) || other.episode == episode)&&(identical(other.source, source) || other.source == source));
}


@override
int get hashCode => Object.hash(runtimeType,eigaId,metaEiga,episode,source);

@override
String toString() {
  return 'PropsGetSeekThumbnail(eigaId: $eigaId, metaEiga: $metaEiga, episode: $episode, source: $source)';
}


}

/// @nodoc
abstract mixin class _$PropsGetSeekThumbnailCopyWith<$Res> implements $PropsGetSeekThumbnailCopyWith<$Res> {
  factory _$PropsGetSeekThumbnailCopyWith(_PropsGetSeekThumbnail value, $Res Function(_PropsGetSeekThumbnail) _then) = __$PropsGetSeekThumbnailCopyWithImpl;
@override @useResult
$Res call({
 String eigaId, MetaEiga metaEiga, EigaEpisode episode, SourceVideo source
});


@override $MetaEigaCopyWith<$Res> get metaEiga;@override $EigaEpisodeCopyWith<$Res> get episode;@override $SourceVideoCopyWith<$Res> get source;

}
/// @nodoc
class __$PropsGetSeekThumbnailCopyWithImpl<$Res>
    implements _$PropsGetSeekThumbnailCopyWith<$Res> {
  __$PropsGetSeekThumbnailCopyWithImpl(this._self, this._then);

  final _PropsGetSeekThumbnail _self;
  final $Res Function(_PropsGetSeekThumbnail) _then;

/// Create a copy of PropsGetSeekThumbnail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? eigaId = null,Object? metaEiga = null,Object? episode = null,Object? source = null,}) {
  return _then(_PropsGetSeekThumbnail(
eigaId: null == eigaId ? _self.eigaId : eigaId // ignore: cast_nullable_to_non_nullable
as String,metaEiga: null == metaEiga ? _self.metaEiga : metaEiga // ignore: cast_nullable_to_non_nullable
as MetaEiga,episode: null == episode ? _self.episode : episode // ignore: cast_nullable_to_non_nullable
as EigaEpisode,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as SourceVideo,
  ));
}

/// Create a copy of PropsGetSeekThumbnail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MetaEigaCopyWith<$Res> get metaEiga {
  
  return $MetaEigaCopyWith<$Res>(_self.metaEiga, (value) {
    return _then(_self.copyWith(metaEiga: value));
  });
}/// Create a copy of PropsGetSeekThumbnail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EigaEpisodeCopyWith<$Res> get episode {
  
  return $EigaEpisodeCopyWith<$Res>(_self.episode, (value) {
    return _then(_self.copyWith(episode: value));
  });
}/// Create a copy of PropsGetSeekThumbnail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SourceVideoCopyWith<$Res> get source {
  
  return $SourceVideoCopyWith<$Res>(_self.source, (value) {
    return _then(_self.copyWith(source: value));
  });
}
}

/// @nodoc
mixin _$PropsGetOpeningEnding {

 String get eigaId; MetaEiga get metaEiga; EigaEpisode get episode; SourceVideo get source;
/// Create a copy of PropsGetOpeningEnding
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PropsGetOpeningEndingCopyWith<PropsGetOpeningEnding> get copyWith => _$PropsGetOpeningEndingCopyWithImpl<PropsGetOpeningEnding>(this as PropsGetOpeningEnding, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PropsGetOpeningEnding&&(identical(other.eigaId, eigaId) || other.eigaId == eigaId)&&(identical(other.metaEiga, metaEiga) || other.metaEiga == metaEiga)&&(identical(other.episode, episode) || other.episode == episode)&&(identical(other.source, source) || other.source == source));
}


@override
int get hashCode => Object.hash(runtimeType,eigaId,metaEiga,episode,source);

@override
String toString() {
  return 'PropsGetOpeningEnding(eigaId: $eigaId, metaEiga: $metaEiga, episode: $episode, source: $source)';
}


}

/// @nodoc
abstract mixin class $PropsGetOpeningEndingCopyWith<$Res>  {
  factory $PropsGetOpeningEndingCopyWith(PropsGetOpeningEnding value, $Res Function(PropsGetOpeningEnding) _then) = _$PropsGetOpeningEndingCopyWithImpl;
@useResult
$Res call({
 String eigaId, MetaEiga metaEiga, EigaEpisode episode, SourceVideo source
});


$MetaEigaCopyWith<$Res> get metaEiga;$EigaEpisodeCopyWith<$Res> get episode;$SourceVideoCopyWith<$Res> get source;

}
/// @nodoc
class _$PropsGetOpeningEndingCopyWithImpl<$Res>
    implements $PropsGetOpeningEndingCopyWith<$Res> {
  _$PropsGetOpeningEndingCopyWithImpl(this._self, this._then);

  final PropsGetOpeningEnding _self;
  final $Res Function(PropsGetOpeningEnding) _then;

/// Create a copy of PropsGetOpeningEnding
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? eigaId = null,Object? metaEiga = null,Object? episode = null,Object? source = null,}) {
  return _then(_self.copyWith(
eigaId: null == eigaId ? _self.eigaId : eigaId // ignore: cast_nullable_to_non_nullable
as String,metaEiga: null == metaEiga ? _self.metaEiga : metaEiga // ignore: cast_nullable_to_non_nullable
as MetaEiga,episode: null == episode ? _self.episode : episode // ignore: cast_nullable_to_non_nullable
as EigaEpisode,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as SourceVideo,
  ));
}
/// Create a copy of PropsGetOpeningEnding
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MetaEigaCopyWith<$Res> get metaEiga {
  
  return $MetaEigaCopyWith<$Res>(_self.metaEiga, (value) {
    return _then(_self.copyWith(metaEiga: value));
  });
}/// Create a copy of PropsGetOpeningEnding
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EigaEpisodeCopyWith<$Res> get episode {
  
  return $EigaEpisodeCopyWith<$Res>(_self.episode, (value) {
    return _then(_self.copyWith(episode: value));
  });
}/// Create a copy of PropsGetOpeningEnding
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SourceVideoCopyWith<$Res> get source {
  
  return $SourceVideoCopyWith<$Res>(_self.source, (value) {
    return _then(_self.copyWith(source: value));
  });
}
}


/// @nodoc


class _PropsGetOpeningEnding implements PropsGetOpeningEnding {
  const _PropsGetOpeningEnding({required this.eigaId, required this.metaEiga, required this.episode, required this.source});
  

@override final  String eigaId;
@override final  MetaEiga metaEiga;
@override final  EigaEpisode episode;
@override final  SourceVideo source;

/// Create a copy of PropsGetOpeningEnding
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PropsGetOpeningEndingCopyWith<_PropsGetOpeningEnding> get copyWith => __$PropsGetOpeningEndingCopyWithImpl<_PropsGetOpeningEnding>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PropsGetOpeningEnding&&(identical(other.eigaId, eigaId) || other.eigaId == eigaId)&&(identical(other.metaEiga, metaEiga) || other.metaEiga == metaEiga)&&(identical(other.episode, episode) || other.episode == episode)&&(identical(other.source, source) || other.source == source));
}


@override
int get hashCode => Object.hash(runtimeType,eigaId,metaEiga,episode,source);

@override
String toString() {
  return 'PropsGetOpeningEnding(eigaId: $eigaId, metaEiga: $metaEiga, episode: $episode, source: $source)';
}


}

/// @nodoc
abstract mixin class _$PropsGetOpeningEndingCopyWith<$Res> implements $PropsGetOpeningEndingCopyWith<$Res> {
  factory _$PropsGetOpeningEndingCopyWith(_PropsGetOpeningEnding value, $Res Function(_PropsGetOpeningEnding) _then) = __$PropsGetOpeningEndingCopyWithImpl;
@override @useResult
$Res call({
 String eigaId, MetaEiga metaEiga, EigaEpisode episode, SourceVideo source
});


@override $MetaEigaCopyWith<$Res> get metaEiga;@override $EigaEpisodeCopyWith<$Res> get episode;@override $SourceVideoCopyWith<$Res> get source;

}
/// @nodoc
class __$PropsGetOpeningEndingCopyWithImpl<$Res>
    implements _$PropsGetOpeningEndingCopyWith<$Res> {
  __$PropsGetOpeningEndingCopyWithImpl(this._self, this._then);

  final _PropsGetOpeningEnding _self;
  final $Res Function(_PropsGetOpeningEnding) _then;

/// Create a copy of PropsGetOpeningEnding
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? eigaId = null,Object? metaEiga = null,Object? episode = null,Object? source = null,}) {
  return _then(_PropsGetOpeningEnding(
eigaId: null == eigaId ? _self.eigaId : eigaId // ignore: cast_nullable_to_non_nullable
as String,metaEiga: null == metaEiga ? _self.metaEiga : metaEiga // ignore: cast_nullable_to_non_nullable
as MetaEiga,episode: null == episode ? _self.episode : episode // ignore: cast_nullable_to_non_nullable
as EigaEpisode,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as SourceVideo,
  ));
}

/// Create a copy of PropsGetOpeningEnding
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MetaEigaCopyWith<$Res> get metaEiga {
  
  return $MetaEigaCopyWith<$Res>(_self.metaEiga, (value) {
    return _then(_self.copyWith(metaEiga: value));
  });
}/// Create a copy of PropsGetOpeningEnding
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EigaEpisodeCopyWith<$Res> get episode {
  
  return $EigaEpisodeCopyWith<$Res>(_self.episode, (value) {
    return _then(_self.copyWith(episode: value));
  });
}/// Create a copy of PropsGetOpeningEnding
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SourceVideoCopyWith<$Res> get source {
  
  return $SourceVideoCopyWith<$Res>(_self.source, (value) {
    return _then(_self.copyWith(source: value));
  });
}
}

// dart format on
