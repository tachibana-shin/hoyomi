// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'watch_page.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WatchPage {
  int get currentPage;
  int get totalPage;

  /// Create a copy of WatchPage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WatchPageCopyWith<WatchPage> get copyWith =>
      _$WatchPageCopyWithImpl<WatchPage>(this as WatchPage, _$identity);

  /// Serializes this WatchPage to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WatchPage &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.totalPage, totalPage) ||
                other.totalPage == totalPage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, currentPage, totalPage);

  @override
  String toString() {
    return 'WatchPage(currentPage: $currentPage, totalPage: $totalPage)';
  }
}

/// @nodoc
abstract mixin class $WatchPageCopyWith<$Res> {
  factory $WatchPageCopyWith(WatchPage value, $Res Function(WatchPage) _then) =
      _$WatchPageCopyWithImpl;
  @useResult
  $Res call({int currentPage, int totalPage});
}

/// @nodoc
class _$WatchPageCopyWithImpl<$Res> implements $WatchPageCopyWith<$Res> {
  _$WatchPageCopyWithImpl(this._self, this._then);

  final WatchPage _self;
  final $Res Function(WatchPage) _then;

  /// Create a copy of WatchPage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = null,
    Object? totalPage = null,
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _WatchPage implements WatchPage {
  _WatchPage({required this.currentPage, required this.totalPage});
  factory _WatchPage.fromJson(Map<String, dynamic> json) =>
      _$WatchPageFromJson(json);

  @override
  final int currentPage;
  @override
  final int totalPage;

  /// Create a copy of WatchPage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$WatchPageCopyWith<_WatchPage> get copyWith =>
      __$WatchPageCopyWithImpl<_WatchPage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$WatchPageToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WatchPage &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.totalPage, totalPage) ||
                other.totalPage == totalPage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, currentPage, totalPage);

  @override
  String toString() {
    return 'WatchPage(currentPage: $currentPage, totalPage: $totalPage)';
  }
}

/// @nodoc
abstract mixin class _$WatchPageCopyWith<$Res>
    implements $WatchPageCopyWith<$Res> {
  factory _$WatchPageCopyWith(
          _WatchPage value, $Res Function(_WatchPage) _then) =
      __$WatchPageCopyWithImpl;
  @override
  @useResult
  $Res call({int currentPage, int totalPage});
}

/// @nodoc
class __$WatchPageCopyWithImpl<$Res> implements _$WatchPageCopyWith<$Res> {
  __$WatchPageCopyWithImpl(this._self, this._then);

  final _WatchPage _self;
  final $Res Function(_WatchPage) _then;

  /// Create a copy of WatchPage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? currentPage = null,
    Object? totalPage = null,
  }) {
    return _then(_WatchPage(
      currentPage: null == currentPage
          ? _self.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      totalPage: null == totalPage
          ? _self.totalPage
          : totalPage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
