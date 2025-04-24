// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comic_history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ComicHistory {
  Comic get item;
  DateTime get watchUpdatedAt;
  ComicChapter get lastEpisode;
  WatchPage get watchPage;

  /// Create a copy of ComicHistory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ComicHistoryCopyWith<ComicHistory> get copyWith =>
      _$ComicHistoryCopyWithImpl<ComicHistory>(
          this as ComicHistory, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ComicHistory &&
            (identical(other.item, item) || other.item == item) &&
            (identical(other.watchUpdatedAt, watchUpdatedAt) ||
                other.watchUpdatedAt == watchUpdatedAt) &&
            (identical(other.lastEpisode, lastEpisode) ||
                other.lastEpisode == lastEpisode) &&
            (identical(other.watchPage, watchPage) ||
                other.watchPage == watchPage));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, item, watchUpdatedAt, lastEpisode, watchPage);

  @override
  String toString() {
    return 'ComicHistory(item: $item, watchUpdatedAt: $watchUpdatedAt, lastEpisode: $lastEpisode, watchPage: $watchPage)';
  }
}

/// @nodoc
abstract mixin class $ComicHistoryCopyWith<$Res> {
  factory $ComicHistoryCopyWith(
          ComicHistory value, $Res Function(ComicHistory) _then) =
      _$ComicHistoryCopyWithImpl;
  @useResult
  $Res call(
      {Comic item,
      DateTime watchUpdatedAt,
      ComicChapter lastEpisode,
      WatchPage watchPage});

  $ComicCopyWith<$Res> get item;
  $WatchPageCopyWith<$Res> get watchPage;
}

/// @nodoc
class _$ComicHistoryCopyWithImpl<$Res> implements $ComicHistoryCopyWith<$Res> {
  _$ComicHistoryCopyWithImpl(this._self, this._then);

  final ComicHistory _self;
  final $Res Function(ComicHistory) _then;

  /// Create a copy of ComicHistory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = null,
    Object? watchUpdatedAt = null,
    Object? lastEpisode = null,
    Object? watchPage = null,
  }) {
    return _then(_self.copyWith(
      item: null == item
          ? _self.item
          : item // ignore: cast_nullable_to_non_nullable
              as Comic,
      watchUpdatedAt: null == watchUpdatedAt
          ? _self.watchUpdatedAt
          : watchUpdatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastEpisode: null == lastEpisode
          ? _self.lastEpisode
          : lastEpisode // ignore: cast_nullable_to_non_nullable
              as ComicChapter,
      watchPage: null == watchPage
          ? _self.watchPage
          : watchPage // ignore: cast_nullable_to_non_nullable
              as WatchPage,
    ));
  }

  /// Create a copy of ComicHistory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ComicCopyWith<$Res> get item {
    return $ComicCopyWith<$Res>(_self.item, (value) {
      return _then(_self.copyWith(item: value));
    });
  }

  /// Create a copy of ComicHistory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WatchPageCopyWith<$Res> get watchPage {
    return $WatchPageCopyWith<$Res>(_self.watchPage, (value) {
      return _then(_self.copyWith(watchPage: value));
    });
  }
}

/// @nodoc

class _ComicHistory implements ComicHistory {
  const _ComicHistory(
      {required this.item,
      required this.watchUpdatedAt,
      required this.lastEpisode,
      required this.watchPage});

  @override
  final Comic item;
  @override
  final DateTime watchUpdatedAt;
  @override
  final ComicChapter lastEpisode;
  @override
  final WatchPage watchPage;

  /// Create a copy of ComicHistory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ComicHistoryCopyWith<_ComicHistory> get copyWith =>
      __$ComicHistoryCopyWithImpl<_ComicHistory>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ComicHistory &&
            (identical(other.item, item) || other.item == item) &&
            (identical(other.watchUpdatedAt, watchUpdatedAt) ||
                other.watchUpdatedAt == watchUpdatedAt) &&
            (identical(other.lastEpisode, lastEpisode) ||
                other.lastEpisode == lastEpisode) &&
            (identical(other.watchPage, watchPage) ||
                other.watchPage == watchPage));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, item, watchUpdatedAt, lastEpisode, watchPage);

  @override
  String toString() {
    return 'ComicHistory(item: $item, watchUpdatedAt: $watchUpdatedAt, lastEpisode: $lastEpisode, watchPage: $watchPage)';
  }
}

/// @nodoc
abstract mixin class _$ComicHistoryCopyWith<$Res>
    implements $ComicHistoryCopyWith<$Res> {
  factory _$ComicHistoryCopyWith(
          _ComicHistory value, $Res Function(_ComicHistory) _then) =
      __$ComicHistoryCopyWithImpl;
  @override
  @useResult
  $Res call(
      {Comic item,
      DateTime watchUpdatedAt,
      ComicChapter lastEpisode,
      WatchPage watchPage});

  @override
  $ComicCopyWith<$Res> get item;
  @override
  $WatchPageCopyWith<$Res> get watchPage;
}

/// @nodoc
class __$ComicHistoryCopyWithImpl<$Res>
    implements _$ComicHistoryCopyWith<$Res> {
  __$ComicHistoryCopyWithImpl(this._self, this._then);

  final _ComicHistory _self;
  final $Res Function(_ComicHistory) _then;

  /// Create a copy of ComicHistory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? item = null,
    Object? watchUpdatedAt = null,
    Object? lastEpisode = null,
    Object? watchPage = null,
  }) {
    return _then(_ComicHistory(
      item: null == item
          ? _self.item
          : item // ignore: cast_nullable_to_non_nullable
              as Comic,
      watchUpdatedAt: null == watchUpdatedAt
          ? _self.watchUpdatedAt
          : watchUpdatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastEpisode: null == lastEpisode
          ? _self.lastEpisode
          : lastEpisode // ignore: cast_nullable_to_non_nullable
              as ComicChapter,
      watchPage: null == watchPage
          ? _self.watchPage
          : watchPage // ignore: cast_nullable_to_non_nullable
              as WatchPage,
    ));
  }

  /// Create a copy of ComicHistory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ComicCopyWith<$Res> get item {
    return $ComicCopyWith<$Res>(_self.item, (value) {
      return _then(_self.copyWith(item: value));
    });
  }

  /// Create a copy of ComicHistory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WatchPageCopyWith<$Res> get watchPage {
    return $WatchPageCopyWith<$Res>(_self.watchPage, (value) {
      return _then(_self.copyWith(watchPage: value));
    });
  }
}

// dart format on
