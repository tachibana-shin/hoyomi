// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'eiga_param.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EigaParam _$EigaParamFromJson(Map<String, dynamic> json) {
  return _EigaParam.fromJson(json);
}

/// @nodoc
mixin _$EigaParam {
  String get eigaId => throw _privateConstructorUsedError;
  String? get episodeId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EigaParamCopyWith<EigaParam> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EigaParamCopyWith<$Res> {
  factory $EigaParamCopyWith(EigaParam value, $Res Function(EigaParam) then) =
      _$EigaParamCopyWithImpl<$Res, EigaParam>;
  @useResult
  $Res call({String eigaId, String? episodeId});
}

/// @nodoc
class _$EigaParamCopyWithImpl<$Res, $Val extends EigaParam>
    implements $EigaParamCopyWith<$Res> {
  _$EigaParamCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eigaId = null,
    Object? episodeId = freezed,
  }) {
    return _then(_value.copyWith(
      eigaId: null == eigaId
          ? _value.eigaId
          : eigaId // ignore: cast_nullable_to_non_nullable
              as String,
      episodeId: freezed == episodeId
          ? _value.episodeId
          : episodeId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EigaParamImplCopyWith<$Res>
    implements $EigaParamCopyWith<$Res> {
  factory _$$EigaParamImplCopyWith(
          _$EigaParamImpl value, $Res Function(_$EigaParamImpl) then) =
      __$$EigaParamImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String eigaId, String? episodeId});
}

/// @nodoc
class __$$EigaParamImplCopyWithImpl<$Res>
    extends _$EigaParamCopyWithImpl<$Res, _$EigaParamImpl>
    implements _$$EigaParamImplCopyWith<$Res> {
  __$$EigaParamImplCopyWithImpl(
      _$EigaParamImpl _value, $Res Function(_$EigaParamImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eigaId = null,
    Object? episodeId = freezed,
  }) {
    return _then(_$EigaParamImpl(
      eigaId: null == eigaId
          ? _value.eigaId
          : eigaId // ignore: cast_nullable_to_non_nullable
              as String,
      episodeId: freezed == episodeId
          ? _value.episodeId
          : episodeId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EigaParamImpl implements _EigaParam {
  const _$EigaParamImpl({required this.eigaId, this.episodeId});

  factory _$EigaParamImpl.fromJson(Map<String, dynamic> json) =>
      _$$EigaParamImplFromJson(json);

  @override
  final String eigaId;
  @override
  final String? episodeId;

  @override
  String toString() {
    return 'EigaParam(eigaId: $eigaId, episodeId: $episodeId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EigaParamImpl &&
            (identical(other.eigaId, eigaId) || other.eigaId == eigaId) &&
            (identical(other.episodeId, episodeId) ||
                other.episodeId == episodeId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, eigaId, episodeId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EigaParamImplCopyWith<_$EigaParamImpl> get copyWith =>
      __$$EigaParamImplCopyWithImpl<_$EigaParamImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EigaParamImplToJson(
      this,
    );
  }
}

abstract class _EigaParam implements EigaParam {
  const factory _EigaParam(
      {required final String eigaId,
      final String? episodeId}) = _$EigaParamImpl;

  factory _EigaParam.fromJson(Map<String, dynamic> json) =
      _$EigaParamImpl.fromJson;

  @override
  String get eigaId;
  @override
  String? get episodeId;
  @override
  @JsonKey(ignore: true)
  _$$EigaParamImplCopyWith<_$EigaParamImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
