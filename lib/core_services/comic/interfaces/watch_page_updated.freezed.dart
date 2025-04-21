// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'watch_page_updated.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WatchPageUpdated _$WatchPageUpdatedFromJson(Map<String, dynamic> json) {
  return _WatchPageUpdated.fromJson(json);
}

/// @nodoc
mixin _$WatchPageUpdated {
  int get currentPage => throw _privateConstructorUsedError;
  int get totalPage => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WatchPageUpdatedCopyWith<WatchPageUpdated> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WatchPageUpdatedCopyWith<$Res> {
  factory $WatchPageUpdatedCopyWith(
          WatchPageUpdated value, $Res Function(WatchPageUpdated) then) =
      _$WatchPageUpdatedCopyWithImpl<$Res, WatchPageUpdated>;
  @useResult
  $Res call({int currentPage, int totalPage, DateTime updatedAt});
}

/// @nodoc
class _$WatchPageUpdatedCopyWithImpl<$Res, $Val extends WatchPageUpdated>
    implements $WatchPageUpdatedCopyWith<$Res> {
  _$WatchPageUpdatedCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = null,
    Object? totalPage = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      totalPage: null == totalPage
          ? _value.totalPage
          : totalPage // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WatchPageUpdatedImplCopyWith<$Res>
    implements $WatchPageUpdatedCopyWith<$Res> {
  factory _$$WatchPageUpdatedImplCopyWith(_$WatchPageUpdatedImpl value,
          $Res Function(_$WatchPageUpdatedImpl) then) =
      __$$WatchPageUpdatedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int currentPage, int totalPage, DateTime updatedAt});
}

/// @nodoc
class __$$WatchPageUpdatedImplCopyWithImpl<$Res>
    extends _$WatchPageUpdatedCopyWithImpl<$Res, _$WatchPageUpdatedImpl>
    implements _$$WatchPageUpdatedImplCopyWith<$Res> {
  __$$WatchPageUpdatedImplCopyWithImpl(_$WatchPageUpdatedImpl _value,
      $Res Function(_$WatchPageUpdatedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = null,
    Object? totalPage = null,
    Object? updatedAt = null,
  }) {
    return _then(_$WatchPageUpdatedImpl(
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      totalPage: null == totalPage
          ? _value.totalPage
          : totalPage // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WatchPageUpdatedImpl implements _WatchPageUpdated {
  _$WatchPageUpdatedImpl(
      {required this.currentPage,
      required this.totalPage,
      required this.updatedAt});

  factory _$WatchPageUpdatedImpl.fromJson(Map<String, dynamic> json) =>
      _$$WatchPageUpdatedImplFromJson(json);

  @override
  final int currentPage;
  @override
  final int totalPage;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'WatchPageUpdated(currentPage: $currentPage, totalPage: $totalPage, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WatchPageUpdatedImpl &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.totalPage, totalPage) ||
                other.totalPage == totalPage) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, currentPage, totalPage, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WatchPageUpdatedImplCopyWith<_$WatchPageUpdatedImpl> get copyWith =>
      __$$WatchPageUpdatedImplCopyWithImpl<_$WatchPageUpdatedImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WatchPageUpdatedImplToJson(
      this,
    );
  }
}

abstract class _WatchPageUpdated implements WatchPageUpdated {
  factory _WatchPageUpdated(
      {required final int currentPage,
      required final int totalPage,
      required final DateTime updatedAt}) = _$WatchPageUpdatedImpl;

  factory _WatchPageUpdated.fromJson(Map<String, dynamic> json) =
      _$WatchPageUpdatedImpl.fromJson;

  @override
  int get currentPage;
  @override
  int get totalPage;
  @override
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$WatchPageUpdatedImplCopyWith<_$WatchPageUpdatedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
