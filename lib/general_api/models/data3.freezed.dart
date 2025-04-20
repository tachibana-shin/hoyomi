// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'data3.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Data3 _$Data3FromJson(Map<String, dynamic> json) {
  return _Data3.fromJson(json);
}

/// @nodoc
mixin _$Data3 {
  /// The current page in seconds for the episode.
  num get cur => throw _privateConstructorUsedError;

  /// The total page of the episode in seconds.
  num get dur => throw _privateConstructorUsedError;

  /// The name of the episode.
  String get name => throw _privateConstructorUsedError;

  /// ISO 8601 format pagestamp when the watch page was recorded.
  String get createdAt => throw _privateConstructorUsedError;

  /// ISO 8601 format pagestamp when the watch page was last updated.
  String get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $Data3CopyWith<Data3> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $Data3CopyWith<$Res> {
  factory $Data3CopyWith(Data3 value, $Res Function(Data3) then) =
      _$Data3CopyWithImpl<$Res, Data3>;
  @useResult
  $Res call(
      {num cur, num dur, String name, String createdAt, String updatedAt});
}

/// @nodoc
class _$Data3CopyWithImpl<$Res, $Val extends Data3>
    implements $Data3CopyWith<$Res> {
  _$Data3CopyWithImpl(this._value, this._then);

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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$Data3ImplCopyWith<$Res> implements $Data3CopyWith<$Res> {
  factory _$$Data3ImplCopyWith(
          _$Data3Impl value, $Res Function(_$Data3Impl) then) =
      __$$Data3ImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {num cur, num dur, String name, String createdAt, String updatedAt});
}

/// @nodoc
class __$$Data3ImplCopyWithImpl<$Res>
    extends _$Data3CopyWithImpl<$Res, _$Data3Impl>
    implements _$$Data3ImplCopyWith<$Res> {
  __$$Data3ImplCopyWithImpl(
      _$Data3Impl _value, $Res Function(_$Data3Impl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cur = null,
    Object? dur = null,
    Object? name = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$Data3Impl(
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$Data3Impl implements _Data3 {
  const _$Data3Impl(
      {required this.cur,
      required this.dur,
      required this.name,
      required this.createdAt,
      required this.updatedAt});

  factory _$Data3Impl.fromJson(Map<String, dynamic> json) =>
      _$$Data3ImplFromJson(json);

  /// The current page in seconds for the episode.
  @override
  final num cur;

  /// The total page of the episode in seconds.
  @override
  final num dur;

  /// The name of the episode.
  @override
  final String name;

  /// ISO 8601 format pagestamp when the watch page was recorded.
  @override
  final String createdAt;

  /// ISO 8601 format pagestamp when the watch page was last updated.
  @override
  final String updatedAt;

  @override
  String toString() {
    return 'Data3(cur: $cur, dur: $dur, name: $name, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Data3Impl &&
            (identical(other.cur, cur) || other.cur == cur) &&
            (identical(other.dur, dur) || other.dur == dur) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, cur, dur, name, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$Data3ImplCopyWith<_$Data3Impl> get copyWith =>
      __$$Data3ImplCopyWithImpl<_$Data3Impl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$Data3ImplToJson(
      this,
    );
  }
}

abstract class _Data3 implements Data3 {
  const factory _Data3(
      {required final num cur,
      required final num dur,
      required final String name,
      required final String createdAt,
      required final String updatedAt}) = _$Data3Impl;

  factory _Data3.fromJson(Map<String, dynamic> json) = _$Data3Impl.fromJson;

  @override

  /// The current page in seconds for the episode.
  num get cur;
  @override

  /// The total page of the episode in seconds.
  num get dur;
  @override

  /// The name of the episode.
  String get name;
  @override

  /// ISO 8601 format pagestamp when the watch page was recorded.
  String get createdAt;
  @override

  /// ISO 8601 format pagestamp when the watch page was last updated.
  String get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$Data3ImplCopyWith<_$Data3Impl> get copyWith =>
      throw _privateConstructorUsedError;
}
