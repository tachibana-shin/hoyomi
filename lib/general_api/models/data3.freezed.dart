// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'data3.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Data3 {
  /// The current page in seconds for the episode.
  num get cur;

  /// The total page of the episode in seconds.
  num get dur;

  /// The name of the episode.
  String get name;

  /// ISO 8601 format pagestamp when the watch page was recorded.
  String get createdAt;

  /// ISO 8601 format pagestamp when the watch page was last updated.
  String get updatedAt;

  /// Create a copy of Data3
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $Data3CopyWith<Data3> get copyWith =>
      _$Data3CopyWithImpl<Data3>(this as Data3, _$identity);

  /// Serializes this Data3 to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Data3 &&
            (identical(other.cur, cur) || other.cur == cur) &&
            (identical(other.dur, dur) || other.dur == dur) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, cur, dur, name, createdAt, updatedAt);

  @override
  String toString() {
    return 'Data3(cur: $cur, dur: $dur, name: $name, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class $Data3CopyWith<$Res> {
  factory $Data3CopyWith(Data3 value, $Res Function(Data3) _then) =
      _$Data3CopyWithImpl;
  @useResult
  $Res call(
      {num cur, num dur, String name, String createdAt, String updatedAt});
}

/// @nodoc
class _$Data3CopyWithImpl<$Res> implements $Data3CopyWith<$Res> {
  _$Data3CopyWithImpl(this._self, this._then);

  final Data3 _self;
  final $Res Function(Data3) _then;

  /// Create a copy of Data3
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cur = null,
    Object? dur = null,
    Object? name = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_self.copyWith(
      cur: null == cur
          ? _self.cur
          : cur // ignore: cast_nullable_to_non_nullable
              as num,
      dur: null == dur
          ? _self.dur
          : dur // ignore: cast_nullable_to_non_nullable
              as num,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Data3 implements Data3 {
  const _Data3(
      {required this.cur,
      required this.dur,
      required this.name,
      required this.createdAt,
      required this.updatedAt});
  factory _Data3.fromJson(Map<String, dynamic> json) => _$Data3FromJson(json);

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

  /// Create a copy of Data3
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$Data3CopyWith<_Data3> get copyWith =>
      __$Data3CopyWithImpl<_Data3>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$Data3ToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Data3 &&
            (identical(other.cur, cur) || other.cur == cur) &&
            (identical(other.dur, dur) || other.dur == dur) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, cur, dur, name, createdAt, updatedAt);

  @override
  String toString() {
    return 'Data3(cur: $cur, dur: $dur, name: $name, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class _$Data3CopyWith<$Res> implements $Data3CopyWith<$Res> {
  factory _$Data3CopyWith(_Data3 value, $Res Function(_Data3) _then) =
      __$Data3CopyWithImpl;
  @override
  @useResult
  $Res call(
      {num cur, num dur, String name, String createdAt, String updatedAt});
}

/// @nodoc
class __$Data3CopyWithImpl<$Res> implements _$Data3CopyWith<$Res> {
  __$Data3CopyWithImpl(this._self, this._then);

  final _Data3 _self;
  final $Res Function(_Data3) _then;

  /// Create a copy of Data3
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? cur = null,
    Object? dur = null,
    Object? name = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_Data3(
      cur: null == cur
          ? _self.cur
          : cur // ignore: cast_nullable_to_non_nullable
              as num,
      dur: null == dur
          ? _self.dur
          : dur // ignore: cast_nullable_to_non_nullable
              as num,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
