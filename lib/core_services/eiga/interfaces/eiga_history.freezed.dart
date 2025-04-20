// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'eiga_history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EigaHistory {
  Eiga get item => throw _privateConstructorUsedError;
  DateTime get watchUpdatedAt => throw _privateConstructorUsedError;
  EigaEpisode get lastEpisode => throw _privateConstructorUsedError;
  WatchTime get watchTime => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EigaHistoryCopyWith<EigaHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EigaHistoryCopyWith<$Res> {
  factory $EigaHistoryCopyWith(
          EigaHistory value, $Res Function(EigaHistory) then) =
      _$EigaHistoryCopyWithImpl<$Res, EigaHistory>;
  @useResult
  $Res call(
      {Eiga item,
      DateTime watchUpdatedAt,
      EigaEpisode lastEpisode,
      WatchTime watchTime});

  $EigaCopyWith<$Res> get item;
  $EigaEpisodeCopyWith<$Res> get lastEpisode;
  $WatchTimeCopyWith<$Res> get watchTime;
}

/// @nodoc
class _$EigaHistoryCopyWithImpl<$Res, $Val extends EigaHistory>
    implements $EigaHistoryCopyWith<$Res> {
  _$EigaHistoryCopyWithImpl(this._value, this._then);

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
    Object? watchTime = null,
  }) {
    return _then(_value.copyWith(
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as Eiga,
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
  $EigaCopyWith<$Res> get item {
    return $EigaCopyWith<$Res>(_value.item, (value) {
      return _then(_value.copyWith(item: value) as $Val);
    });
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
abstract class _$$EigaHistoryImplCopyWith<$Res>
    implements $EigaHistoryCopyWith<$Res> {
  factory _$$EigaHistoryImplCopyWith(
          _$EigaHistoryImpl value, $Res Function(_$EigaHistoryImpl) then) =
      __$$EigaHistoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Eiga item,
      DateTime watchUpdatedAt,
      EigaEpisode lastEpisode,
      WatchTime watchTime});

  @override
  $EigaCopyWith<$Res> get item;
  @override
  $EigaEpisodeCopyWith<$Res> get lastEpisode;
  @override
  $WatchTimeCopyWith<$Res> get watchTime;
}

/// @nodoc
class __$$EigaHistoryImplCopyWithImpl<$Res>
    extends _$EigaHistoryCopyWithImpl<$Res, _$EigaHistoryImpl>
    implements _$$EigaHistoryImplCopyWith<$Res> {
  __$$EigaHistoryImplCopyWithImpl(
      _$EigaHistoryImpl _value, $Res Function(_$EigaHistoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = null,
    Object? watchUpdatedAt = null,
    Object? lastEpisode = null,
    Object? watchTime = null,
  }) {
    return _then(_$EigaHistoryImpl(
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as Eiga,
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

class _$EigaHistoryImpl implements _EigaHistory {
  const _$EigaHistoryImpl(
      {required this.item,
      required this.watchUpdatedAt,
      required this.lastEpisode,
      required this.watchTime});

  @override
  final Eiga item;
  @override
  final DateTime watchUpdatedAt;
  @override
  final EigaEpisode lastEpisode;
  @override
  final WatchTime watchTime;

  @override
  String toString() {
    return 'EigaHistory(item: $item, watchUpdatedAt: $watchUpdatedAt, lastEpisode: $lastEpisode, watchTime: $watchTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EigaHistoryImpl &&
            (identical(other.item, item) || other.item == item) &&
            (identical(other.watchUpdatedAt, watchUpdatedAt) ||
                other.watchUpdatedAt == watchUpdatedAt) &&
            (identical(other.lastEpisode, lastEpisode) ||
                other.lastEpisode == lastEpisode) &&
            (identical(other.watchTime, watchTime) ||
                other.watchTime == watchTime));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, item, watchUpdatedAt, lastEpisode, watchTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EigaHistoryImplCopyWith<_$EigaHistoryImpl> get copyWith =>
      __$$EigaHistoryImplCopyWithImpl<_$EigaHistoryImpl>(this, _$identity);
}

abstract class _EigaHistory implements EigaHistory {
  const factory _EigaHistory(
      {required final Eiga item,
      required final DateTime watchUpdatedAt,
      required final EigaEpisode lastEpisode,
      required final WatchTime watchTime}) = _$EigaHistoryImpl;

  @override
  Eiga get item;
  @override
  DateTime get watchUpdatedAt;
  @override
  EigaEpisode get lastEpisode;
  @override
  WatchTime get watchTime;
  @override
  @JsonKey(ignore: true)
  _$$EigaHistoryImplCopyWith<_$EigaHistoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
