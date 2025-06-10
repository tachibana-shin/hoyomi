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
  String get sourceId;
  Comic get item;
  DateTime get watchUpdatedAt;
  ComicChapter get lastChapter;
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
            (identical(other.sourceId, sourceId) ||
                other.sourceId == sourceId) &&
            (identical(other.item, item) || other.item == item) &&
            (identical(other.watchUpdatedAt, watchUpdatedAt) ||
                other.watchUpdatedAt == watchUpdatedAt) &&
            (identical(other.lastChapter, lastChapter) ||
                other.lastChapter == lastChapter) &&
            (identical(other.watchPage, watchPage) ||
                other.watchPage == watchPage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, sourceId, item, watchUpdatedAt, lastChapter, watchPage);

  @override
  String toString() {
    return 'ComicHistory(sourceId: $sourceId, item: $item, watchUpdatedAt: $watchUpdatedAt, lastChapter: $lastChapter, watchPage: $watchPage)';
  }
}

/// @nodoc
abstract mixin class $ComicHistoryCopyWith<$Res> {
  factory $ComicHistoryCopyWith(
          ComicHistory value, $Res Function(ComicHistory) _then) =
      _$ComicHistoryCopyWithImpl;
  @useResult
  $Res call(
      {String sourceId,
      Comic item,
      DateTime watchUpdatedAt,
      ComicChapter lastChapter,
      WatchPage watchPage});

  $ComicCopyWith<$Res> get item;
  $ComicChapterCopyWith<$Res> get lastChapter;
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
    Object? sourceId = null,
    Object? item = null,
    Object? watchUpdatedAt = null,
    Object? lastChapter = null,
    Object? watchPage = null,
  }) {
    return _then(_self.copyWith(
      sourceId: null == sourceId
          ? _self.sourceId
          : sourceId // ignore: cast_nullable_to_non_nullable
              as String,
      item: null == item
          ? _self.item
          : item // ignore: cast_nullable_to_non_nullable
              as Comic,
      watchUpdatedAt: null == watchUpdatedAt
          ? _self.watchUpdatedAt
          : watchUpdatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastChapter: null == lastChapter
          ? _self.lastChapter
          : lastChapter // ignore: cast_nullable_to_non_nullable
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
  $ComicChapterCopyWith<$Res> get lastChapter {
    return $ComicChapterCopyWith<$Res>(_self.lastChapter, (value) {
      return _then(_self.copyWith(lastChapter: value));
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
      {required this.sourceId,
      required this.item,
      required this.watchUpdatedAt,
      required this.lastChapter,
      required this.watchPage});

  @override
  final String sourceId;
  @override
  final Comic item;
  @override
  final DateTime watchUpdatedAt;
  @override
  final ComicChapter lastChapter;
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
            (identical(other.sourceId, sourceId) ||
                other.sourceId == sourceId) &&
            (identical(other.item, item) || other.item == item) &&
            (identical(other.watchUpdatedAt, watchUpdatedAt) ||
                other.watchUpdatedAt == watchUpdatedAt) &&
            (identical(other.lastChapter, lastChapter) ||
                other.lastChapter == lastChapter) &&
            (identical(other.watchPage, watchPage) ||
                other.watchPage == watchPage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, sourceId, item, watchUpdatedAt, lastChapter, watchPage);

  @override
  String toString() {
    return 'ComicHistory(sourceId: $sourceId, item: $item, watchUpdatedAt: $watchUpdatedAt, lastChapter: $lastChapter, watchPage: $watchPage)';
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
      {String sourceId,
      Comic item,
      DateTime watchUpdatedAt,
      ComicChapter lastChapter,
      WatchPage watchPage});

  @override
  $ComicCopyWith<$Res> get item;
  @override
  $ComicChapterCopyWith<$Res> get lastChapter;
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
    Object? sourceId = null,
    Object? item = null,
    Object? watchUpdatedAt = null,
    Object? lastChapter = null,
    Object? watchPage = null,
  }) {
    return _then(_ComicHistory(
      sourceId: null == sourceId
          ? _self.sourceId
          : sourceId // ignore: cast_nullable_to_non_nullable
              as String,
      item: null == item
          ? _self.item
          : item // ignore: cast_nullable_to_non_nullable
              as Comic,
      watchUpdatedAt: null == watchUpdatedAt
          ? _self.watchUpdatedAt
          : watchUpdatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastChapter: null == lastChapter
          ? _self.lastChapter
          : lastChapter // ignore: cast_nullable_to_non_nullable
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
  $ComicChapterCopyWith<$Res> get lastChapter {
    return $ComicChapterCopyWith<$Res>(_self.lastChapter, (value) {
      return _then(_self.copyWith(lastChapter: value));
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
