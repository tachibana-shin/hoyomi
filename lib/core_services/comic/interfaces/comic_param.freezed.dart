// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comic_param.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ComicParam _$ComicParamFromJson(Map<String, dynamic> json) {
  return _ComicParam.fromJson(json);
}

/// @nodoc
mixin _$ComicParam {
  String get comicId => throw _privateConstructorUsedError;
  String? get chapterId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ComicParamCopyWith<ComicParam> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ComicParamCopyWith<$Res> {
  factory $ComicParamCopyWith(
          ComicParam value, $Res Function(ComicParam) then) =
      _$ComicParamCopyWithImpl<$Res, ComicParam>;
  @useResult
  $Res call({String comicId, String? chapterId});
}

/// @nodoc
class _$ComicParamCopyWithImpl<$Res, $Val extends ComicParam>
    implements $ComicParamCopyWith<$Res> {
  _$ComicParamCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? comicId = null,
    Object? chapterId = freezed,
  }) {
    return _then(_value.copyWith(
      comicId: null == comicId
          ? _value.comicId
          : comicId // ignore: cast_nullable_to_non_nullable
              as String,
      chapterId: freezed == chapterId
          ? _value.chapterId
          : chapterId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ComicParamImplCopyWith<$Res>
    implements $ComicParamCopyWith<$Res> {
  factory _$$ComicParamImplCopyWith(
          _$ComicParamImpl value, $Res Function(_$ComicParamImpl) then) =
      __$$ComicParamImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String comicId, String? chapterId});
}

/// @nodoc
class __$$ComicParamImplCopyWithImpl<$Res>
    extends _$ComicParamCopyWithImpl<$Res, _$ComicParamImpl>
    implements _$$ComicParamImplCopyWith<$Res> {
  __$$ComicParamImplCopyWithImpl(
      _$ComicParamImpl _value, $Res Function(_$ComicParamImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? comicId = null,
    Object? chapterId = freezed,
  }) {
    return _then(_$ComicParamImpl(
      comicId: null == comicId
          ? _value.comicId
          : comicId // ignore: cast_nullable_to_non_nullable
              as String,
      chapterId: freezed == chapterId
          ? _value.chapterId
          : chapterId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ComicParamImpl implements _ComicParam {
  const _$ComicParamImpl({required this.comicId, this.chapterId});

  factory _$ComicParamImpl.fromJson(Map<String, dynamic> json) =>
      _$$ComicParamImplFromJson(json);

  @override
  final String comicId;
  @override
  final String? chapterId;

  @override
  String toString() {
    return 'ComicParam(comicId: $comicId, chapterId: $chapterId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ComicParamImpl &&
            (identical(other.comicId, comicId) || other.comicId == comicId) &&
            (identical(other.chapterId, chapterId) ||
                other.chapterId == chapterId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, comicId, chapterId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ComicParamImplCopyWith<_$ComicParamImpl> get copyWith =>
      __$$ComicParamImplCopyWithImpl<_$ComicParamImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ComicParamImplToJson(
      this,
    );
  }
}

abstract class _ComicParam implements ComicParam {
  const factory _ComicParam(
      {required final String comicId,
      final String? chapterId}) = _$ComicParamImpl;

  factory _ComicParam.fromJson(Map<String, dynamic> json) =
      _$ComicParamImpl.fromJson;

  @override
  String get comicId;
  @override
  String? get chapterId;
  @override
  @JsonKey(ignore: true)
  _$$ComicParamImplCopyWith<_$ComicParamImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
