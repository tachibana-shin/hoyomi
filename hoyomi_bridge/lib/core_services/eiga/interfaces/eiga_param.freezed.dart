// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'eiga_param.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EigaParam {
  String get eigaId;
  String? get episodeId;

  /// Create a copy of EigaParam
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $EigaParamCopyWith<EigaParam> get copyWith =>
      _$EigaParamCopyWithImpl<EigaParam>(this as EigaParam, _$identity);

  /// Serializes this EigaParam to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is EigaParam &&
            (identical(other.eigaId, eigaId) || other.eigaId == eigaId) &&
            (identical(other.episodeId, episodeId) ||
                other.episodeId == episodeId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, eigaId, episodeId);

  @override
  String toString() {
    return 'EigaParam(eigaId: $eigaId, episodeId: $episodeId)';
  }
}

/// @nodoc
abstract mixin class $EigaParamCopyWith<$Res> {
  factory $EigaParamCopyWith(EigaParam value, $Res Function(EigaParam) _then) =
      _$EigaParamCopyWithImpl;
  @useResult
  $Res call({String eigaId, String? episodeId});
}

/// @nodoc
class _$EigaParamCopyWithImpl<$Res> implements $EigaParamCopyWith<$Res> {
  _$EigaParamCopyWithImpl(this._self, this._then);

  final EigaParam _self;
  final $Res Function(EigaParam) _then;

  /// Create a copy of EigaParam
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eigaId = null,
    Object? episodeId = freezed,
  }) {
    return _then(_self.copyWith(
      eigaId: null == eigaId
          ? _self.eigaId
          : eigaId // ignore: cast_nullable_to_non_nullable
              as String,
      episodeId: freezed == episodeId
          ? _self.episodeId
          : episodeId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _EigaParam implements EigaParam {
  const _EigaParam({required this.eigaId, this.episodeId});
  factory _EigaParam.fromJson(Map<String, dynamic> json) =>
      _$EigaParamFromJson(json);

  @override
  final String eigaId;
  @override
  final String? episodeId;

  /// Create a copy of EigaParam
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$EigaParamCopyWith<_EigaParam> get copyWith =>
      __$EigaParamCopyWithImpl<_EigaParam>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$EigaParamToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _EigaParam &&
            (identical(other.eigaId, eigaId) || other.eigaId == eigaId) &&
            (identical(other.episodeId, episodeId) ||
                other.episodeId == episodeId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, eigaId, episodeId);

  @override
  String toString() {
    return 'EigaParam(eigaId: $eigaId, episodeId: $episodeId)';
  }
}

/// @nodoc
abstract mixin class _$EigaParamCopyWith<$Res>
    implements $EigaParamCopyWith<$Res> {
  factory _$EigaParamCopyWith(
          _EigaParam value, $Res Function(_EigaParam) _then) =
      __$EigaParamCopyWithImpl;
  @override
  @useResult
  $Res call({String eigaId, String? episodeId});
}

/// @nodoc
class __$EigaParamCopyWithImpl<$Res> implements _$EigaParamCopyWith<$Res> {
  __$EigaParamCopyWithImpl(this._self, this._then);

  final _EigaParam _self;
  final $Res Function(_EigaParam) _then;

  /// Create a copy of EigaParam
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? eigaId = null,
    Object? episodeId = freezed,
  }) {
    return _then(_EigaParam(
      eigaId: null == eigaId
          ? _self.eigaId
          : eigaId // ignore: cast_nullable_to_non_nullable
              as String,
      episodeId: freezed == episodeId
          ? _self.episodeId
          : episodeId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
