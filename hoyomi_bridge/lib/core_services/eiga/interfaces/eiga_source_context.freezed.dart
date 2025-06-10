// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'eiga_source_context.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EigaSourceContext {
  String get eigaId;
  MetaEiga get metaEiga;
  EigaEpisode get episode;
  SourceVideo get source;

  /// Create a copy of EigaSourceContext
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $EigaSourceContextCopyWith<EigaSourceContext> get copyWith =>
      _$EigaSourceContextCopyWithImpl<EigaSourceContext>(
          this as EigaSourceContext, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is EigaSourceContext &&
            (identical(other.eigaId, eigaId) || other.eigaId == eigaId) &&
            (identical(other.metaEiga, metaEiga) ||
                other.metaEiga == metaEiga) &&
            (identical(other.episode, episode) || other.episode == episode) &&
            (identical(other.source, source) || other.source == source));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, eigaId, metaEiga, episode, source);

  @override
  String toString() {
    return 'EigaSourceContext(eigaId: $eigaId, metaEiga: $metaEiga, episode: $episode, source: $source)';
  }
}

/// @nodoc
abstract mixin class $EigaSourceContextCopyWith<$Res> {
  factory $EigaSourceContextCopyWith(
          EigaSourceContext value, $Res Function(EigaSourceContext) _then) =
      _$EigaSourceContextCopyWithImpl;
  @useResult
  $Res call(
      {String eigaId,
      MetaEiga metaEiga,
      EigaEpisode episode,
      SourceVideo source});

  $MetaEigaCopyWith<$Res> get metaEiga;
  $EigaEpisodeCopyWith<$Res> get episode;
  $SourceVideoCopyWith<$Res> get source;
}

/// @nodoc
class _$EigaSourceContextCopyWithImpl<$Res>
    implements $EigaSourceContextCopyWith<$Res> {
  _$EigaSourceContextCopyWithImpl(this._self, this._then);

  final EigaSourceContext _self;
  final $Res Function(EigaSourceContext) _then;

  /// Create a copy of EigaSourceContext
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eigaId = null,
    Object? metaEiga = null,
    Object? episode = null,
    Object? source = null,
  }) {
    return _then(_self.copyWith(
      eigaId: null == eigaId
          ? _self.eigaId
          : eigaId // ignore: cast_nullable_to_non_nullable
              as String,
      metaEiga: null == metaEiga
          ? _self.metaEiga
          : metaEiga // ignore: cast_nullable_to_non_nullable
              as MetaEiga,
      episode: null == episode
          ? _self.episode
          : episode // ignore: cast_nullable_to_non_nullable
              as EigaEpisode,
      source: null == source
          ? _self.source
          : source // ignore: cast_nullable_to_non_nullable
              as SourceVideo,
    ));
  }

  /// Create a copy of EigaSourceContext
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MetaEigaCopyWith<$Res> get metaEiga {
    return $MetaEigaCopyWith<$Res>(_self.metaEiga, (value) {
      return _then(_self.copyWith(metaEiga: value));
    });
  }

  /// Create a copy of EigaSourceContext
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $EigaEpisodeCopyWith<$Res> get episode {
    return $EigaEpisodeCopyWith<$Res>(_self.episode, (value) {
      return _then(_self.copyWith(episode: value));
    });
  }

  /// Create a copy of EigaSourceContext
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

class _EigaSourceContext implements EigaSourceContext {
  const _EigaSourceContext(
      {required this.eigaId,
      required this.metaEiga,
      required this.episode,
      required this.source});

  @override
  final String eigaId;
  @override
  final MetaEiga metaEiga;
  @override
  final EigaEpisode episode;
  @override
  final SourceVideo source;

  /// Create a copy of EigaSourceContext
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$EigaSourceContextCopyWith<_EigaSourceContext> get copyWith =>
      __$EigaSourceContextCopyWithImpl<_EigaSourceContext>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _EigaSourceContext &&
            (identical(other.eigaId, eigaId) || other.eigaId == eigaId) &&
            (identical(other.metaEiga, metaEiga) ||
                other.metaEiga == metaEiga) &&
            (identical(other.episode, episode) || other.episode == episode) &&
            (identical(other.source, source) || other.source == source));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, eigaId, metaEiga, episode, source);

  @override
  String toString() {
    return 'EigaSourceContext(eigaId: $eigaId, metaEiga: $metaEiga, episode: $episode, source: $source)';
  }
}

/// @nodoc
abstract mixin class _$EigaSourceContextCopyWith<$Res>
    implements $EigaSourceContextCopyWith<$Res> {
  factory _$EigaSourceContextCopyWith(
          _EigaSourceContext value, $Res Function(_EigaSourceContext) _then) =
      __$EigaSourceContextCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String eigaId,
      MetaEiga metaEiga,
      EigaEpisode episode,
      SourceVideo source});

  @override
  $MetaEigaCopyWith<$Res> get metaEiga;
  @override
  $EigaEpisodeCopyWith<$Res> get episode;
  @override
  $SourceVideoCopyWith<$Res> get source;
}

/// @nodoc
class __$EigaSourceContextCopyWithImpl<$Res>
    implements _$EigaSourceContextCopyWith<$Res> {
  __$EigaSourceContextCopyWithImpl(this._self, this._then);

  final _EigaSourceContext _self;
  final $Res Function(_EigaSourceContext) _then;

  /// Create a copy of EigaSourceContext
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? eigaId = null,
    Object? metaEiga = null,
    Object? episode = null,
    Object? source = null,
  }) {
    return _then(_EigaSourceContext(
      eigaId: null == eigaId
          ? _self.eigaId
          : eigaId // ignore: cast_nullable_to_non_nullable
              as String,
      metaEiga: null == metaEiga
          ? _self.metaEiga
          : metaEiga // ignore: cast_nullable_to_non_nullable
              as MetaEiga,
      episode: null == episode
          ? _self.episode
          : episode // ignore: cast_nullable_to_non_nullable
              as EigaEpisode,
      source: null == source
          ? _self.source
          : source // ignore: cast_nullable_to_non_nullable
              as SourceVideo,
    ));
  }

  /// Create a copy of EigaSourceContext
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MetaEigaCopyWith<$Res> get metaEiga {
    return $MetaEigaCopyWith<$Res>(_self.metaEiga, (value) {
      return _then(_self.copyWith(metaEiga: value));
    });
  }

  /// Create a copy of EigaSourceContext
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $EigaEpisodeCopyWith<$Res> get episode {
    return $EigaEpisodeCopyWith<$Res>(_self.episode, (value) {
      return _then(_self.copyWith(episode: value));
    });
  }

  /// Create a copy of EigaSourceContext
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
