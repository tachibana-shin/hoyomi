// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'opening_ending.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DurationRange _$DurationRangeFromJson(Map<String, dynamic> json) {
  return _DurationRange.fromJson(json);
}

/// @nodoc
mixin _$DurationRange {
  Duration get start => throw _privateConstructorUsedError;
  Duration get end => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DurationRangeCopyWith<DurationRange> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DurationRangeCopyWith<$Res> {
  factory $DurationRangeCopyWith(
          DurationRange value, $Res Function(DurationRange) then) =
      _$DurationRangeCopyWithImpl<$Res, DurationRange>;
  @useResult
  $Res call({Duration start, Duration end});
}

/// @nodoc
class _$DurationRangeCopyWithImpl<$Res, $Val extends DurationRange>
    implements $DurationRangeCopyWith<$Res> {
  _$DurationRangeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? start = null,
    Object? end = null,
  }) {
    return _then(_value.copyWith(
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as Duration,
      end: null == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as Duration,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DurationRangeImplCopyWith<$Res>
    implements $DurationRangeCopyWith<$Res> {
  factory _$$DurationRangeImplCopyWith(
          _$DurationRangeImpl value, $Res Function(_$DurationRangeImpl) then) =
      __$$DurationRangeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Duration start, Duration end});
}

/// @nodoc
class __$$DurationRangeImplCopyWithImpl<$Res>
    extends _$DurationRangeCopyWithImpl<$Res, _$DurationRangeImpl>
    implements _$$DurationRangeImplCopyWith<$Res> {
  __$$DurationRangeImplCopyWithImpl(
      _$DurationRangeImpl _value, $Res Function(_$DurationRangeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? start = null,
    Object? end = null,
  }) {
    return _then(_$DurationRangeImpl(
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as Duration,
      end: null == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as Duration,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DurationRangeImpl implements _DurationRange {
  const _$DurationRangeImpl({required this.start, required this.end});

  factory _$DurationRangeImpl.fromJson(Map<String, dynamic> json) =>
      _$$DurationRangeImplFromJson(json);

  @override
  final Duration start;
  @override
  final Duration end;

  @override
  String toString() {
    return 'DurationRange(start: $start, end: $end)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DurationRangeImpl &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.end, end) || other.end == end));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, start, end);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DurationRangeImplCopyWith<_$DurationRangeImpl> get copyWith =>
      __$$DurationRangeImplCopyWithImpl<_$DurationRangeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DurationRangeImplToJson(
      this,
    );
  }
}

abstract class _DurationRange implements DurationRange {
  const factory _DurationRange(
      {required final Duration start,
      required final Duration end}) = _$DurationRangeImpl;

  factory _DurationRange.fromJson(Map<String, dynamic> json) =
      _$DurationRangeImpl.fromJson;

  @override
  Duration get start;
  @override
  Duration get end;
  @override
  @JsonKey(ignore: true)
  _$$DurationRangeImplCopyWith<_$DurationRangeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OpeningEnding _$OpeningEndingFromJson(Map<String, dynamic> json) {
  return _OpeningEnding.fromJson(json);
}

/// @nodoc
mixin _$OpeningEnding {
  DurationRange? get opening => throw _privateConstructorUsedError;
  DurationRange? get ending => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OpeningEndingCopyWith<OpeningEnding> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OpeningEndingCopyWith<$Res> {
  factory $OpeningEndingCopyWith(
          OpeningEnding value, $Res Function(OpeningEnding) then) =
      _$OpeningEndingCopyWithImpl<$Res, OpeningEnding>;
  @useResult
  $Res call({DurationRange? opening, DurationRange? ending});

  $DurationRangeCopyWith<$Res>? get opening;
  $DurationRangeCopyWith<$Res>? get ending;
}

/// @nodoc
class _$OpeningEndingCopyWithImpl<$Res, $Val extends OpeningEnding>
    implements $OpeningEndingCopyWith<$Res> {
  _$OpeningEndingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? opening = freezed,
    Object? ending = freezed,
  }) {
    return _then(_value.copyWith(
      opening: freezed == opening
          ? _value.opening
          : opening // ignore: cast_nullable_to_non_nullable
              as DurationRange?,
      ending: freezed == ending
          ? _value.ending
          : ending // ignore: cast_nullable_to_non_nullable
              as DurationRange?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DurationRangeCopyWith<$Res>? get opening {
    if (_value.opening == null) {
      return null;
    }

    return $DurationRangeCopyWith<$Res>(_value.opening!, (value) {
      return _then(_value.copyWith(opening: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $DurationRangeCopyWith<$Res>? get ending {
    if (_value.ending == null) {
      return null;
    }

    return $DurationRangeCopyWith<$Res>(_value.ending!, (value) {
      return _then(_value.copyWith(ending: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OpeningEndingImplCopyWith<$Res>
    implements $OpeningEndingCopyWith<$Res> {
  factory _$$OpeningEndingImplCopyWith(
          _$OpeningEndingImpl value, $Res Function(_$OpeningEndingImpl) then) =
      __$$OpeningEndingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DurationRange? opening, DurationRange? ending});

  @override
  $DurationRangeCopyWith<$Res>? get opening;
  @override
  $DurationRangeCopyWith<$Res>? get ending;
}

/// @nodoc
class __$$OpeningEndingImplCopyWithImpl<$Res>
    extends _$OpeningEndingCopyWithImpl<$Res, _$OpeningEndingImpl>
    implements _$$OpeningEndingImplCopyWith<$Res> {
  __$$OpeningEndingImplCopyWithImpl(
      _$OpeningEndingImpl _value, $Res Function(_$OpeningEndingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? opening = freezed,
    Object? ending = freezed,
  }) {
    return _then(_$OpeningEndingImpl(
      opening: freezed == opening
          ? _value.opening
          : opening // ignore: cast_nullable_to_non_nullable
              as DurationRange?,
      ending: freezed == ending
          ? _value.ending
          : ending // ignore: cast_nullable_to_non_nullable
              as DurationRange?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OpeningEndingImpl implements _OpeningEnding {
  const _$OpeningEndingImpl({this.opening, this.ending});

  factory _$OpeningEndingImpl.fromJson(Map<String, dynamic> json) =>
      _$$OpeningEndingImplFromJson(json);

  @override
  final DurationRange? opening;
  @override
  final DurationRange? ending;

  @override
  String toString() {
    return 'OpeningEnding(opening: $opening, ending: $ending)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OpeningEndingImpl &&
            (identical(other.opening, opening) || other.opening == opening) &&
            (identical(other.ending, ending) || other.ending == ending));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, opening, ending);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OpeningEndingImplCopyWith<_$OpeningEndingImpl> get copyWith =>
      __$$OpeningEndingImplCopyWithImpl<_$OpeningEndingImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OpeningEndingImplToJson(
      this,
    );
  }
}

abstract class _OpeningEnding implements OpeningEnding {
  const factory _OpeningEnding(
      {final DurationRange? opening,
      final DurationRange? ending}) = _$OpeningEndingImpl;

  factory _OpeningEnding.fromJson(Map<String, dynamic> json) =
      _$OpeningEndingImpl.fromJson;

  @override
  DurationRange? get opening;
  @override
  DurationRange? get ending;
  @override
  @JsonKey(ignore: true)
  _$$OpeningEndingImplCopyWith<_$OpeningEndingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
