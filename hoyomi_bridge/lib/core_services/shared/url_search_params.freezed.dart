// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'url_search_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UrlSearchParams {
  Map<String, List<String>?> get params;

  /// Create a copy of UrlSearchParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UrlSearchParamsCopyWith<UrlSearchParams> get copyWith =>
      _$UrlSearchParamsCopyWithImpl<UrlSearchParams>(
          this as UrlSearchParams, _$identity);

  /// Serializes this UrlSearchParams to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UrlSearchParams &&
            const DeepCollectionEquality().equals(other.params, params));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(params));

  @override
  String toString() {
    return 'UrlSearchParams(params: $params)';
  }
}

/// @nodoc
abstract mixin class $UrlSearchParamsCopyWith<$Res> {
  factory $UrlSearchParamsCopyWith(
          UrlSearchParams value, $Res Function(UrlSearchParams) _then) =
      _$UrlSearchParamsCopyWithImpl;
  @useResult
  $Res call({Map<String, List<String>?> params});
}

/// @nodoc
class _$UrlSearchParamsCopyWithImpl<$Res>
    implements $UrlSearchParamsCopyWith<$Res> {
  _$UrlSearchParamsCopyWithImpl(this._self, this._then);

  final UrlSearchParams _self;
  final $Res Function(UrlSearchParams) _then;

  /// Create a copy of UrlSearchParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? params = null,
  }) {
    return _then(_self.copyWith(
      params: null == params
          ? _self.params
          : params // ignore: cast_nullable_to_non_nullable
              as Map<String, List<String>?>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _UrlSearchParams implements UrlSearchParams {
  const _UrlSearchParams({final Map<String, List<String>?> params = const {}})
      : _params = params;
  factory _UrlSearchParams.fromJson(Map<String, dynamic> json) =>
      _$UrlSearchParamsFromJson(json);

  final Map<String, List<String>?> _params;
  @override
  @JsonKey()
  Map<String, List<String>?> get params {
    if (_params is EqualUnmodifiableMapView) return _params;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_params);
  }

  /// Create a copy of UrlSearchParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UrlSearchParamsCopyWith<_UrlSearchParams> get copyWith =>
      __$UrlSearchParamsCopyWithImpl<_UrlSearchParams>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UrlSearchParamsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UrlSearchParams &&
            const DeepCollectionEquality().equals(other._params, _params));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_params));

  @override
  String toString() {
    return 'UrlSearchParams(params: $params)';
  }
}

/// @nodoc
abstract mixin class _$UrlSearchParamsCopyWith<$Res>
    implements $UrlSearchParamsCopyWith<$Res> {
  factory _$UrlSearchParamsCopyWith(
          _UrlSearchParams value, $Res Function(_UrlSearchParams) _then) =
      __$UrlSearchParamsCopyWithImpl;
  @override
  @useResult
  $Res call({Map<String, List<String>?> params});
}

/// @nodoc
class __$UrlSearchParamsCopyWithImpl<$Res>
    implements _$UrlSearchParamsCopyWith<$Res> {
  __$UrlSearchParamsCopyWithImpl(this._self, this._then);

  final _UrlSearchParams _self;
  final $Res Function(_UrlSearchParams) _then;

  /// Create a copy of UrlSearchParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? params = null,
  }) {
    return _then(_UrlSearchParams(
      params: null == params
          ? _self._params
          : params // ignore: cast_nullable_to_non_nullable
              as Map<String, List<String>?>,
    ));
  }
}

// dart format on
