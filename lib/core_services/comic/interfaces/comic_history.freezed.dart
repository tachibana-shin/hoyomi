// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comic_history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ComicHistory {
  Comic get item => throw _privateConstructorUsedError;
  DateTime get watchUpdatedAt => throw _privateConstructorUsedError;
  ComicChapter get lastEpisode => throw _privateConstructorUsedError;
  WatchPage get watchPage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ComicHistoryCopyWith<ComicHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ComicHistoryCopyWith<$Res> {
  factory $ComicHistoryCopyWith(
          ComicHistory value, $Res Function(ComicHistory) then) =
      _$ComicHistoryCopyWithImpl<$Res, ComicHistory>;
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
class _$ComicHistoryCopyWithImpl<$Res, $Val extends ComicHistory>
    implements $ComicHistoryCopyWith<$Res> {
  _$ComicHistoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = null,
    Object? watchUpdatedAt = null,
    Object? lastEpisode = null,
    Object? watchPage = null,
  }) {
    return _then(_value.copyWith(
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as Comic,
      watchUpdatedAt: null == watchUpdatedAt
          ? _value.watchUpdatedAt
          : watchUpdatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastEpisode: null == lastEpisode
          ? _value.lastEpisode
          : lastEpisode // ignore: cast_nullable_to_non_nullable
              as ComicChapter,
      watchPage: null == watchPage
          ? _value.watchPage
          : watchPage // ignore: cast_nullable_to_non_nullable
              as WatchPage,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ComicCopyWith<$Res> get item {
    return $ComicCopyWith<$Res>(_value.item, (value) {
      return _then(_value.copyWith(item: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $WatchPageCopyWith<$Res> get watchPage {
    return $WatchPageCopyWith<$Res>(_value.watchPage, (value) {
      return _then(_value.copyWith(watchPage: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ComicHistoryImplCopyWith<$Res>
    implements $ComicHistoryCopyWith<$Res> {
  factory _$$ComicHistoryImplCopyWith(
          _$ComicHistoryImpl value, $Res Function(_$ComicHistoryImpl) then) =
      __$$ComicHistoryImplCopyWithImpl<$Res>;
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
class __$$ComicHistoryImplCopyWithImpl<$Res>
    extends _$ComicHistoryCopyWithImpl<$Res, _$ComicHistoryImpl>
    implements _$$ComicHistoryImplCopyWith<$Res> {
  __$$ComicHistoryImplCopyWithImpl(
      _$ComicHistoryImpl _value, $Res Function(_$ComicHistoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = null,
    Object? watchUpdatedAt = null,
    Object? lastEpisode = null,
    Object? watchPage = null,
  }) {
    return _then(_$ComicHistoryImpl(
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as Comic,
      watchUpdatedAt: null == watchUpdatedAt
          ? _value.watchUpdatedAt
          : watchUpdatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastEpisode: null == lastEpisode
          ? _value.lastEpisode
          : lastEpisode // ignore: cast_nullable_to_non_nullable
              as ComicChapter,
      watchPage: null == watchPage
          ? _value.watchPage
          : watchPage // ignore: cast_nullable_to_non_nullable
              as WatchPage,
    ));
  }
}

/// @nodoc

class _$ComicHistoryImpl implements _ComicHistory {
  const _$ComicHistoryImpl(
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

  @override
  String toString() {
    return 'ComicHistory(item: $item, watchUpdatedAt: $watchUpdatedAt, lastEpisode: $lastEpisode, watchPage: $watchPage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ComicHistoryImpl &&
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

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ComicHistoryImplCopyWith<_$ComicHistoryImpl> get copyWith =>
      __$$ComicHistoryImplCopyWithImpl<_$ComicHistoryImpl>(this, _$identity);
}

abstract class _ComicHistory implements ComicHistory {
  const factory _ComicHistory(
      {required final Comic item,
      required final DateTime watchUpdatedAt,
      required final ComicChapter lastEpisode,
      required final WatchPage watchPage}) = _$ComicHistoryImpl;

  @override
  Comic get item;
  @override
  DateTime get watchUpdatedAt;
  @override
  ComicChapter get lastEpisode;
  @override
  WatchPage get watchPage;
  @override
  @JsonKey(ignore: true)
  _$$ComicHistoryImplCopyWith<_$ComicHistoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
