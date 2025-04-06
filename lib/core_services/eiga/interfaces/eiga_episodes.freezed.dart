// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'eiga_episodes.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EigaEpisodes _$EigaEpisodesFromJson(Map<String, dynamic> json) {
  return _EigaEpisodes.fromJson(json);
}

/// @nodoc
mixin _$EigaEpisodes {
  List<EigaEpisode> get episodes => throw _privateConstructorUsedError;
  OImage? get image => throw _privateConstructorUsedError;
  OImage? get poster => throw _privateConstructorUsedError;
  TimeAndDay? get schedule => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EigaEpisodesCopyWith<EigaEpisodes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EigaEpisodesCopyWith<$Res> {
  factory $EigaEpisodesCopyWith(
          EigaEpisodes value, $Res Function(EigaEpisodes) then) =
      _$EigaEpisodesCopyWithImpl<$Res, EigaEpisodes>;
  @useResult
  $Res call(
      {List<EigaEpisode> episodes,
      OImage? image,
      OImage? poster,
      TimeAndDay? schedule});

  $OImageCopyWith<$Res>? get image;
  $OImageCopyWith<$Res>? get poster;
  $TimeAndDayCopyWith<$Res>? get schedule;
}

/// @nodoc
class _$EigaEpisodesCopyWithImpl<$Res, $Val extends EigaEpisodes>
    implements $EigaEpisodesCopyWith<$Res> {
  _$EigaEpisodesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? episodes = null,
    Object? image = freezed,
    Object? poster = freezed,
    Object? schedule = freezed,
  }) {
    return _then(_value.copyWith(
      episodes: null == episodes
          ? _value.episodes
          : episodes // ignore: cast_nullable_to_non_nullable
              as List<EigaEpisode>,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as OImage?,
      poster: freezed == poster
          ? _value.poster
          : poster // ignore: cast_nullable_to_non_nullable
              as OImage?,
      schedule: freezed == schedule
          ? _value.schedule
          : schedule // ignore: cast_nullable_to_non_nullable
              as TimeAndDay?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OImageCopyWith<$Res>? get image {
    if (_value.image == null) {
      return null;
    }

    return $OImageCopyWith<$Res>(_value.image!, (value) {
      return _then(_value.copyWith(image: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $OImageCopyWith<$Res>? get poster {
    if (_value.poster == null) {
      return null;
    }

    return $OImageCopyWith<$Res>(_value.poster!, (value) {
      return _then(_value.copyWith(poster: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TimeAndDayCopyWith<$Res>? get schedule {
    if (_value.schedule == null) {
      return null;
    }

    return $TimeAndDayCopyWith<$Res>(_value.schedule!, (value) {
      return _then(_value.copyWith(schedule: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EigaEpisodesImplCopyWith<$Res>
    implements $EigaEpisodesCopyWith<$Res> {
  factory _$$EigaEpisodesImplCopyWith(
          _$EigaEpisodesImpl value, $Res Function(_$EigaEpisodesImpl) then) =
      __$$EigaEpisodesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<EigaEpisode> episodes,
      OImage? image,
      OImage? poster,
      TimeAndDay? schedule});

  @override
  $OImageCopyWith<$Res>? get image;
  @override
  $OImageCopyWith<$Res>? get poster;
  @override
  $TimeAndDayCopyWith<$Res>? get schedule;
}

/// @nodoc
class __$$EigaEpisodesImplCopyWithImpl<$Res>
    extends _$EigaEpisodesCopyWithImpl<$Res, _$EigaEpisodesImpl>
    implements _$$EigaEpisodesImplCopyWith<$Res> {
  __$$EigaEpisodesImplCopyWithImpl(
      _$EigaEpisodesImpl _value, $Res Function(_$EigaEpisodesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? episodes = null,
    Object? image = freezed,
    Object? poster = freezed,
    Object? schedule = freezed,
  }) {
    return _then(_$EigaEpisodesImpl(
      episodes: null == episodes
          ? _value._episodes
          : episodes // ignore: cast_nullable_to_non_nullable
              as List<EigaEpisode>,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as OImage?,
      poster: freezed == poster
          ? _value.poster
          : poster // ignore: cast_nullable_to_non_nullable
              as OImage?,
      schedule: freezed == schedule
          ? _value.schedule
          : schedule // ignore: cast_nullable_to_non_nullable
              as TimeAndDay?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EigaEpisodesImpl implements _EigaEpisodes {
  const _$EigaEpisodesImpl(
      {required final List<EigaEpisode> episodes,
      this.image,
      this.poster,
      this.schedule})
      : _episodes = episodes;

  factory _$EigaEpisodesImpl.fromJson(Map<String, dynamic> json) =>
      _$$EigaEpisodesImplFromJson(json);

  final List<EigaEpisode> _episodes;
  @override
  List<EigaEpisode> get episodes {
    if (_episodes is EqualUnmodifiableListView) return _episodes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_episodes);
  }

  @override
  final OImage? image;
  @override
  final OImage? poster;
  @override
  final TimeAndDay? schedule;

  @override
  String toString() {
    return 'EigaEpisodes(episodes: $episodes, image: $image, poster: $poster, schedule: $schedule)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EigaEpisodesImpl &&
            const DeepCollectionEquality().equals(other._episodes, _episodes) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.poster, poster) || other.poster == poster) &&
            (identical(other.schedule, schedule) ||
                other.schedule == schedule));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_episodes), image, poster, schedule);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EigaEpisodesImplCopyWith<_$EigaEpisodesImpl> get copyWith =>
      __$$EigaEpisodesImplCopyWithImpl<_$EigaEpisodesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EigaEpisodesImplToJson(
      this,
    );
  }
}

abstract class _EigaEpisodes implements EigaEpisodes {
  const factory _EigaEpisodes(
      {required final List<EigaEpisode> episodes,
      final OImage? image,
      final OImage? poster,
      final TimeAndDay? schedule}) = _$EigaEpisodesImpl;

  factory _EigaEpisodes.fromJson(Map<String, dynamic> json) =
      _$EigaEpisodesImpl.fromJson;

  @override
  List<EigaEpisode> get episodes;
  @override
  OImage? get image;
  @override
  OImage? get poster;
  @override
  TimeAndDay? get schedule;
  @override
  @JsonKey(ignore: true)
  _$$EigaEpisodesImplCopyWith<_$EigaEpisodesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TimeAndDay _$TimeAndDayFromJson(Map<String, dynamic> json) {
  return _TimeAndDay.fromJson(json);
}

/// @nodoc
mixin _$TimeAndDay {
  int get day => throw _privateConstructorUsedError;
  int get hour => throw _privateConstructorUsedError;
  int get minute => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TimeAndDayCopyWith<TimeAndDay> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimeAndDayCopyWith<$Res> {
  factory $TimeAndDayCopyWith(
          TimeAndDay value, $Res Function(TimeAndDay) then) =
      _$TimeAndDayCopyWithImpl<$Res, TimeAndDay>;
  @useResult
  $Res call({int day, int hour, int minute});
}

/// @nodoc
class _$TimeAndDayCopyWithImpl<$Res, $Val extends TimeAndDay>
    implements $TimeAndDayCopyWith<$Res> {
  _$TimeAndDayCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? day = null,
    Object? hour = null,
    Object? minute = null,
  }) {
    return _then(_value.copyWith(
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as int,
      hour: null == hour
          ? _value.hour
          : hour // ignore: cast_nullable_to_non_nullable
              as int,
      minute: null == minute
          ? _value.minute
          : minute // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TimeAndDayImplCopyWith<$Res>
    implements $TimeAndDayCopyWith<$Res> {
  factory _$$TimeAndDayImplCopyWith(
          _$TimeAndDayImpl value, $Res Function(_$TimeAndDayImpl) then) =
      __$$TimeAndDayImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int day, int hour, int minute});
}

/// @nodoc
class __$$TimeAndDayImplCopyWithImpl<$Res>
    extends _$TimeAndDayCopyWithImpl<$Res, _$TimeAndDayImpl>
    implements _$$TimeAndDayImplCopyWith<$Res> {
  __$$TimeAndDayImplCopyWithImpl(
      _$TimeAndDayImpl _value, $Res Function(_$TimeAndDayImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? day = null,
    Object? hour = null,
    Object? minute = null,
  }) {
    return _then(_$TimeAndDayImpl(
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as int,
      hour: null == hour
          ? _value.hour
          : hour // ignore: cast_nullable_to_non_nullable
              as int,
      minute: null == minute
          ? _value.minute
          : minute // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TimeAndDayImpl implements _TimeAndDay {
  const _$TimeAndDayImpl(
      {required this.day, required this.hour, required this.minute});

  factory _$TimeAndDayImpl.fromJson(Map<String, dynamic> json) =>
      _$$TimeAndDayImplFromJson(json);

  @override
  final int day;
  @override
  final int hour;
  @override
  final int minute;

  @override
  String toString() {
    return 'TimeAndDay(day: $day, hour: $hour, minute: $minute)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimeAndDayImpl &&
            (identical(other.day, day) || other.day == day) &&
            (identical(other.hour, hour) || other.hour == hour) &&
            (identical(other.minute, minute) || other.minute == minute));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, day, hour, minute);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TimeAndDayImplCopyWith<_$TimeAndDayImpl> get copyWith =>
      __$$TimeAndDayImplCopyWithImpl<_$TimeAndDayImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TimeAndDayImplToJson(
      this,
    );
  }
}

abstract class _TimeAndDay implements TimeAndDay {
  const factory _TimeAndDay(
      {required final int day,
      required final int hour,
      required final int minute}) = _$TimeAndDayImpl;

  factory _TimeAndDay.fromJson(Map<String, dynamic> json) =
      _$TimeAndDayImpl.fromJson;

  @override
  int get day;
  @override
  int get hour;
  @override
  int get minute;
  @override
  @JsonKey(ignore: true)
  _$$TimeAndDayImplCopyWith<_$TimeAndDayImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
