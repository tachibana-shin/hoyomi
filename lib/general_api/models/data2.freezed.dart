// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'data2.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Data2 _$Data2FromJson(Map<String, dynamic> json) {
  return _Data2.fromJson(json);
}

/// @nodoc
mixin _$Data2 {
  /// The current position in the episode in seconds.
  num get cur => throw _privateConstructorUsedError;

  /// The total duration of the episode in seconds.
  num get dur => throw _privateConstructorUsedError;

  /// The name of the episode.
  String get name => throw _privateConstructorUsedError;

  /// Timestamp when the watch time was recorded, in ISO 8601 format.
  String get createdAt => throw _privateConstructorUsedError;

  /// Timestamp when the watch time was last updated, in ISO 8601 format.
  String get updatedAt => throw _privateConstructorUsedError;

  /// The unique identifier for the chapter within the episode or series.
  String get chapId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $Data2CopyWith<Data2> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $Data2CopyWith<$Res> {
  factory $Data2CopyWith(Data2 value, $Res Function(Data2) then) =
      _$Data2CopyWithImpl<$Res, Data2>;
  @useResult
  $Res call(
      {num cur,
      num dur,
      String name,
      String createdAt,
      String updatedAt,
      String chapId});
}

/// @nodoc
class _$Data2CopyWithImpl<$Res, $Val extends Data2>
    implements $Data2CopyWith<$Res> {
  _$Data2CopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cur = null,
    Object? dur = null,
    Object? name = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? chapId = null,
  }) {
    return _then(_value.copyWith(
      cur: null == cur
          ? _value.cur
          : cur // ignore: cast_nullable_to_non_nullable
              as num,
      dur: null == dur
          ? _value.dur
          : dur // ignore: cast_nullable_to_non_nullable
              as num,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      chapId: null == chapId
          ? _value.chapId
          : chapId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$Data2ImplCopyWith<$Res> implements $Data2CopyWith<$Res> {
  factory _$$Data2ImplCopyWith(
          _$Data2Impl value, $Res Function(_$Data2Impl) then) =
      __$$Data2ImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {num cur,
      num dur,
      String name,
      String createdAt,
      String updatedAt,
      String chapId});
}

/// @nodoc
class __$$Data2ImplCopyWithImpl<$Res>
    extends _$Data2CopyWithImpl<$Res, _$Data2Impl>
    implements _$$Data2ImplCopyWith<$Res> {
  __$$Data2ImplCopyWithImpl(
      _$Data2Impl _value, $Res Function(_$Data2Impl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cur = null,
    Object? dur = null,
    Object? name = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? chapId = null,
  }) {
    return _then(_$Data2Impl(
      cur: null == cur
          ? _value.cur
          : cur // ignore: cast_nullable_to_non_nullable
              as num,
      dur: null == dur
          ? _value.dur
          : dur // ignore: cast_nullable_to_non_nullable
              as num,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      chapId: null == chapId
          ? _value.chapId
          : chapId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$Data2Impl implements _Data2 {
  const _$Data2Impl(
      {required this.cur,
      required this.dur,
      required this.name,
      required this.createdAt,
      required this.updatedAt,
      required this.chapId});

  factory _$Data2Impl.fromJson(Map<String, dynamic> json) =>
      _$$Data2ImplFromJson(json);

  /// The current position in the episode in seconds.
  @override
  final num cur;

  /// The total duration of the episode in seconds.
  @override
  final num dur;

  /// The name of the episode.
  @override
  final String name;

  /// Timestamp when the watch time was recorded, in ISO 8601 format.
  @override
  final String createdAt;

  /// Timestamp when the watch time was last updated, in ISO 8601 format.
  @override
  final String updatedAt;

  /// The unique identifier for the chapter within the episode or series.
  @override
  final String chapId;

  @override
  String toString() {
    return 'Data2(cur: $cur, dur: $dur, name: $name, createdAt: $createdAt, updatedAt: $updatedAt, chapId: $chapId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Data2Impl &&
            (identical(other.cur, cur) || other.cur == cur) &&
            (identical(other.dur, dur) || other.dur == dur) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.chapId, chapId) || other.chapId == chapId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, cur, dur, name, createdAt, updatedAt, chapId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$Data2ImplCopyWith<_$Data2Impl> get copyWith =>
      __$$Data2ImplCopyWithImpl<_$Data2Impl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$Data2ImplToJson(
      this,
    );
  }
}

abstract class _Data2 implements Data2 {
  const factory _Data2(
      {required final num cur,
      required final num dur,
      required final String name,
      required final String createdAt,
      required final String updatedAt,
      required final String chapId}) = _$Data2Impl;

  factory _Data2.fromJson(Map<String, dynamic> json) = _$Data2Impl.fromJson;

  @override

  /// The current position in the episode in seconds.
  num get cur;
  @override

  /// The total duration of the episode in seconds.
  num get dur;
  @override

  /// The name of the episode.
  String get name;
  @override

  /// Timestamp when the watch time was recorded, in ISO 8601 format.
  String get createdAt;
  @override

  /// Timestamp when the watch time was last updated, in ISO 8601 format.
  String get updatedAt;
  @override

  /// The unique identifier for the chapter within the episode or series.
  String get chapId;
  @override
  @JsonKey(ignore: true)
  _$$Data2ImplCopyWith<_$Data2Impl> get copyWith =>
      throw _privateConstructorUsedError;
}
