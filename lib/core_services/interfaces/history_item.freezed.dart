// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'history_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HistoryItem<T> {
  T get item => throw _privateConstructorUsedError;
  DateTime get watchUpdatedAt => throw _privateConstructorUsedError;
  EigaEpisode get lastEpisode => throw _privateConstructorUsedError;
  WatchTime get watchTime => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HistoryItemCopyWith<T, HistoryItem<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoryItemCopyWith<T, $Res> {
  factory $HistoryItemCopyWith(
          HistoryItem<T> value, $Res Function(HistoryItem<T>) then) =
      _$HistoryItemCopyWithImpl<T, $Res, HistoryItem<T>>;
  @useResult
  $Res call(
      {T item,
      DateTime watchUpdatedAt,
      EigaEpisode lastEpisode,
      WatchTime watchTime});

  $EigaEpisodeCopyWith<$Res> get lastEpisode;
  $WatchTimeCopyWith<$Res> get watchTime;
}

/// @nodoc
class _$HistoryItemCopyWithImpl<T, $Res, $Val extends HistoryItem<T>>
    implements $HistoryItemCopyWith<T, $Res> {
  _$HistoryItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = freezed,
    Object? watchUpdatedAt = null,
    Object? lastEpisode = null,
    Object? watchTime = null,
  }) {
    return _then(_value.copyWith(
      item: freezed == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as T,
      watchUpdatedAt: null == watchUpdatedAt
          ? _value.watchUpdatedAt
          : watchUpdatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastEpisode: null == lastEpisode
          ? _value.lastEpisode
          : lastEpisode // ignore: cast_nullable_to_non_nullable
              as EigaEpisode,
      watchTime: null == watchTime
          ? _value.watchTime
          : watchTime // ignore: cast_nullable_to_non_nullable
              as WatchTime,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $EigaEpisodeCopyWith<$Res> get lastEpisode {
    return $EigaEpisodeCopyWith<$Res>(_value.lastEpisode, (value) {
      return _then(_value.copyWith(lastEpisode: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $WatchTimeCopyWith<$Res> get watchTime {
    return $WatchTimeCopyWith<$Res>(_value.watchTime, (value) {
      return _then(_value.copyWith(watchTime: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$HistoryItemImplCopyWith<T, $Res>
    implements $HistoryItemCopyWith<T, $Res> {
  factory _$$HistoryItemImplCopyWith(_$HistoryItemImpl<T> value,
          $Res Function(_$HistoryItemImpl<T>) then) =
      __$$HistoryItemImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call(
      {T item,
      DateTime watchUpdatedAt,
      EigaEpisode lastEpisode,
      WatchTime watchTime});

  @override
  $EigaEpisodeCopyWith<$Res> get lastEpisode;
  @override
  $WatchTimeCopyWith<$Res> get watchTime;
}

/// @nodoc
class __$$HistoryItemImplCopyWithImpl<T, $Res>
    extends _$HistoryItemCopyWithImpl<T, $Res, _$HistoryItemImpl<T>>
    implements _$$HistoryItemImplCopyWith<T, $Res> {
  __$$HistoryItemImplCopyWithImpl(
      _$HistoryItemImpl<T> _value, $Res Function(_$HistoryItemImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = freezed,
    Object? watchUpdatedAt = null,
    Object? lastEpisode = null,
    Object? watchTime = null,
  }) {
    return _then(_$HistoryItemImpl<T>(
      item: freezed == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as T,
      watchUpdatedAt: null == watchUpdatedAt
          ? _value.watchUpdatedAt
          : watchUpdatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastEpisode: null == lastEpisode
          ? _value.lastEpisode
          : lastEpisode // ignore: cast_nullable_to_non_nullable
              as EigaEpisode,
      watchTime: null == watchTime
          ? _value.watchTime
          : watchTime // ignore: cast_nullable_to_non_nullable
              as WatchTime,
    ));
  }
}

/// @nodoc

class _$HistoryItemImpl<T> implements _HistoryItem<T> {
  const _$HistoryItemImpl(
      {required this.item,
      required this.watchUpdatedAt,
      required this.lastEpisode,
      required this.watchTime});

  @override
  final T item;
  @override
  final DateTime watchUpdatedAt;
  @override
  final EigaEpisode lastEpisode;
  @override
  final WatchTime watchTime;

  @override
  String toString() {
    return 'HistoryItem<$T>(item: $item, watchUpdatedAt: $watchUpdatedAt, lastEpisode: $lastEpisode, watchTime: $watchTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HistoryItemImpl<T> &&
            const DeepCollectionEquality().equals(other.item, item) &&
            (identical(other.watchUpdatedAt, watchUpdatedAt) ||
                other.watchUpdatedAt == watchUpdatedAt) &&
            (identical(other.lastEpisode, lastEpisode) ||
                other.lastEpisode == lastEpisode) &&
            (identical(other.watchTime, watchTime) ||
                other.watchTime == watchTime));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(item),
      watchUpdatedAt,
      lastEpisode,
      watchTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HistoryItemImplCopyWith<T, _$HistoryItemImpl<T>> get copyWith =>
      __$$HistoryItemImplCopyWithImpl<T, _$HistoryItemImpl<T>>(
          this, _$identity);
}

abstract class _HistoryItem<T> implements HistoryItem<T> {
  const factory _HistoryItem(
      {required final T item,
      required final DateTime watchUpdatedAt,
      required final EigaEpisode lastEpisode,
      required final WatchTime watchTime}) = _$HistoryItemImpl<T>;

  @override
  T get item;
  @override
  DateTime get watchUpdatedAt;
  @override
  EigaEpisode get lastEpisode;
  @override
  WatchTime get watchTime;
  @override
  @JsonKey(ignore: true)
  _$$HistoryItemImplCopyWith<T, _$HistoryItemImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
