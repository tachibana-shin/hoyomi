// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'web_rule.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WebRule {
  /// Example: example\\.com
  String? get regexFilter;
  String? get shortRegexFilter;
  String? get urlFilter;

  /// Example: https://example.com
  String get referer;

  /// Create a copy of WebRule
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WebRuleCopyWith<WebRule> get copyWith =>
      _$WebRuleCopyWithImpl<WebRule>(this as WebRule, _$identity);

  /// Serializes this WebRule to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WebRule &&
            (identical(other.regexFilter, regexFilter) ||
                other.regexFilter == regexFilter) &&
            (identical(other.shortRegexFilter, shortRegexFilter) ||
                other.shortRegexFilter == shortRegexFilter) &&
            (identical(other.urlFilter, urlFilter) ||
                other.urlFilter == urlFilter) &&
            (identical(other.referer, referer) || other.referer == referer));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, regexFilter, shortRegexFilter, urlFilter, referer);

  @override
  String toString() {
    return 'WebRule(regexFilter: $regexFilter, shortRegexFilter: $shortRegexFilter, urlFilter: $urlFilter, referer: $referer)';
  }
}

/// @nodoc
abstract mixin class $WebRuleCopyWith<$Res> {
  factory $WebRuleCopyWith(WebRule value, $Res Function(WebRule) _then) =
      _$WebRuleCopyWithImpl;
  @useResult
  $Res call(
      {String? regexFilter,
      String? shortRegexFilter,
      String? urlFilter,
      String referer});
}

/// @nodoc
class _$WebRuleCopyWithImpl<$Res> implements $WebRuleCopyWith<$Res> {
  _$WebRuleCopyWithImpl(this._self, this._then);

  final WebRule _self;
  final $Res Function(WebRule) _then;

  /// Create a copy of WebRule
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? regexFilter = freezed,
    Object? shortRegexFilter = freezed,
    Object? urlFilter = freezed,
    Object? referer = null,
  }) {
    return _then(_self.copyWith(
      regexFilter: freezed == regexFilter
          ? _self.regexFilter
          : regexFilter // ignore: cast_nullable_to_non_nullable
              as String?,
      shortRegexFilter: freezed == shortRegexFilter
          ? _self.shortRegexFilter
          : shortRegexFilter // ignore: cast_nullable_to_non_nullable
              as String?,
      urlFilter: freezed == urlFilter
          ? _self.urlFilter
          : urlFilter // ignore: cast_nullable_to_non_nullable
              as String?,
      referer: null == referer
          ? _self.referer
          : referer // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _WebRule extends WebRule {
  _WebRule(
      {this.regexFilter,
      this.shortRegexFilter,
      this.urlFilter,
      required this.referer})
      : super._();
  factory _WebRule.fromJson(Map<String, dynamic> json) =>
      _$WebRuleFromJson(json);

  /// Example: example\\.com
  @override
  final String? regexFilter;
  @override
  final String? shortRegexFilter;
  @override
  final String? urlFilter;

  /// Example: https://example.com
  @override
  final String referer;

  /// Create a copy of WebRule
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$WebRuleCopyWith<_WebRule> get copyWith =>
      __$WebRuleCopyWithImpl<_WebRule>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$WebRuleToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WebRule &&
            (identical(other.regexFilter, regexFilter) ||
                other.regexFilter == regexFilter) &&
            (identical(other.shortRegexFilter, shortRegexFilter) ||
                other.shortRegexFilter == shortRegexFilter) &&
            (identical(other.urlFilter, urlFilter) ||
                other.urlFilter == urlFilter) &&
            (identical(other.referer, referer) || other.referer == referer));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, regexFilter, shortRegexFilter, urlFilter, referer);

  @override
  String toString() {
    return 'WebRule(regexFilter: $regexFilter, shortRegexFilter: $shortRegexFilter, urlFilter: $urlFilter, referer: $referer)';
  }
}

/// @nodoc
abstract mixin class _$WebRuleCopyWith<$Res> implements $WebRuleCopyWith<$Res> {
  factory _$WebRuleCopyWith(_WebRule value, $Res Function(_WebRule) _then) =
      __$WebRuleCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? regexFilter,
      String? shortRegexFilter,
      String? urlFilter,
      String referer});
}

/// @nodoc
class __$WebRuleCopyWithImpl<$Res> implements _$WebRuleCopyWith<$Res> {
  __$WebRuleCopyWithImpl(this._self, this._then);

  final _WebRule _self;
  final $Res Function(_WebRule) _then;

  /// Create a copy of WebRule
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? regexFilter = freezed,
    Object? shortRegexFilter = freezed,
    Object? urlFilter = freezed,
    Object? referer = null,
  }) {
    return _then(_WebRule(
      regexFilter: freezed == regexFilter
          ? _self.regexFilter
          : regexFilter // ignore: cast_nullable_to_non_nullable
              as String?,
      shortRegexFilter: freezed == shortRegexFilter
          ? _self.shortRegexFilter
          : shortRegexFilter // ignore: cast_nullable_to_non_nullable
              as String?,
      urlFilter: freezed == urlFilter
          ? _self.urlFilter
          : urlFilter // ignore: cast_nullable_to_non_nullable
              as String?,
      referer: null == referer
          ? _self.referer
          : referer // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
