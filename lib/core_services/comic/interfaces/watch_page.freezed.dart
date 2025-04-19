// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'watch_page.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WatchPage _$WatchPageFromJson(Map<String, dynamic> json) {
  return _WatchPage.fromJson(json);
}

/// @nodoc
mixin _$WatchPage {
  int get currentPage => throw _privateConstructorUsedError;
  int get totalPage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WatchPageCopyWith<WatchPage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WatchPageCopyWith<$Res> {
  factory $WatchPageCopyWith(WatchPage value, $Res Function(WatchPage) then) =
      _$WatchPageCopyWithImpl<$Res, WatchPage>;
  @useResult
  $Res call({int currentPage, int totalPage});
}

/// @nodoc
class _$WatchPageCopyWithImpl<$Res, $Val extends WatchPage>
    implements $WatchPageCopyWith<$Res> {
  _$WatchPageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = null,
    Object? totalPage = null,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WatchPageImplCopyWith<$Res>
    implements $WatchPageCopyWith<$Res> {
  factory _$$WatchPageImplCopyWith(
          _$WatchPageImpl value, $Res Function(_$WatchPageImpl) then) =
      __$$WatchPageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int currentPage, int totalPage});
}

/// @nodoc
class __$$WatchPageImplCopyWithImpl<$Res>
    extends _$WatchPageCopyWithImpl<$Res, _$WatchPageImpl>
    implements _$$WatchPageImplCopyWith<$Res> {
  __$$WatchPageImplCopyWithImpl(
      _$WatchPageImpl _value, $Res Function(_$WatchPageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = null,
    Object? totalPage = null,
  }) {
    return _then(_$WatchPageImpl(
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      totalPage: null == totalPage
          ? _value.totalPage
          : totalPage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WatchPageImpl implements _WatchPage {
  _$WatchPageImpl({required this.currentPage, required this.totalPage});

  factory _$WatchPageImpl.fromJson(Map<String, dynamic> json) =>
      _$$WatchPageImplFromJson(json);

  @override
  final int currentPage;
  @override
  final int totalPage;

  @override
  String toString() {
    return 'WatchPage(currentPage: $currentPage, totalPage: $totalPage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WatchPageImpl &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.totalPage, totalPage) ||
                other.totalPage == totalPage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, currentPage, totalPage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WatchPageImplCopyWith<_$WatchPageImpl> get copyWith =>
      __$$WatchPageImplCopyWithImpl<_$WatchPageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WatchPageImplToJson(
      this,
    );
  }
}

abstract class _WatchPage implements WatchPage {
  factory _WatchPage(
      {required final int currentPage,
      required final int totalPage}) = _$WatchPageImpl;

  factory _WatchPage.fromJson(Map<String, dynamic> json) =
      _$WatchPageImpl.fromJson;

  @override
  int get currentPage;
  @override
  int get totalPage;
  @override
  @JsonKey(ignore: true)
  _$$WatchPageImplCopyWith<_$WatchPageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
