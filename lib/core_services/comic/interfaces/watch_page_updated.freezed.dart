// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'watch_page_updated.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WatchPageUpdated {
  int get currentPage;
  int get totalPage;
  DateTime get updatedAt;

  /// Create a copy of WatchPageUpdated
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WatchPageUpdatedCopyWith<WatchPageUpdated> get copyWith =>
      _$WatchPageUpdatedCopyWithImpl<WatchPageUpdated>(
          this as WatchPageUpdated, _$identity);

  /// Serializes this WatchPageUpdated to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WatchPageUpdated &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.totalPage, totalPage) ||
                other.totalPage == totalPage) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, currentPage, totalPage, updatedAt);

  @override
  String toString() {
    return 'WatchPageUpdated(currentPage: $currentPage, totalPage: $totalPage, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class $WatchPageUpdatedCopyWith<$Res> {
  factory $WatchPageUpdatedCopyWith(
          WatchPageUpdated value, $Res Function(WatchPageUpdated) _then) =
      _$WatchPageUpdatedCopyWithImpl;
  @useResult
  $Res call({int currentPage, int totalPage, DateTime updatedAt});
}

/// @nodoc
class _$WatchPageUpdatedCopyWithImpl<$Res>
    implements $WatchPageUpdatedCopyWith<$Res> {
  _$WatchPageUpdatedCopyWithImpl(this._self, this._then);

  final WatchPageUpdated _self;
  final $Res Function(WatchPageUpdated) _then;

  /// Create a copy of WatchPageUpdated
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = null,
    Object? totalPage = null,
    Object? updatedAt = null,
  }) {
    return _then(_self.copyWith(
      currentPage: null == currentPage
          ? _self.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      totalPage: null == totalPage
          ? _self.totalPage
          : totalPage // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _WatchPageUpdated implements WatchPageUpdated {
  _WatchPageUpdated(
      {required this.currentPage,
      required this.totalPage,
      required this.updatedAt});
  factory _WatchPageUpdated.fromJson(Map<String, dynamic> json) =>
      _$WatchPageUpdatedFromJson(json);

  @override
  final int currentPage;
  @override
  final int totalPage;
  @override
  final DateTime updatedAt;

  /// Create a copy of WatchPageUpdated
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$WatchPageUpdatedCopyWith<_WatchPageUpdated> get copyWith =>
      __$WatchPageUpdatedCopyWithImpl<_WatchPageUpdated>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$WatchPageUpdatedToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WatchPageUpdated &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.totalPage, totalPage) ||
                other.totalPage == totalPage) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, currentPage, totalPage, updatedAt);

  @override
  String toString() {
    return 'WatchPageUpdated(currentPage: $currentPage, totalPage: $totalPage, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class _$WatchPageUpdatedCopyWith<$Res>
    implements $WatchPageUpdatedCopyWith<$Res> {
  factory _$WatchPageUpdatedCopyWith(
          _WatchPageUpdated value, $Res Function(_WatchPageUpdated) _then) =
      __$WatchPageUpdatedCopyWithImpl;
  @override
  @useResult
  $Res call({int currentPage, int totalPage, DateTime updatedAt});
}

/// @nodoc
class __$WatchPageUpdatedCopyWithImpl<$Res>
    implements _$WatchPageUpdatedCopyWith<$Res> {
  __$WatchPageUpdatedCopyWithImpl(this._self, this._then);

  final _WatchPageUpdated _self;
  final $Res Function(_WatchPageUpdated) _then;

  /// Create a copy of WatchPageUpdated
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? currentPage = null,
    Object? totalPage = null,
    Object? updatedAt = null,
  }) {
    return _then(_WatchPageUpdated(
      currentPage: null == currentPage
          ? _self.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      totalPage: null == totalPage
          ? _self.totalPage
          : totalPage // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

// dart format on
