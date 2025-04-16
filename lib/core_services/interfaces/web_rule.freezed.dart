// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'web_rule.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WebRule _$WebRuleFromJson(Map<String, dynamic> json) {
  return _WebRule.fromJson(json);
}

/// @nodoc
mixin _$WebRule {
  /// Example: example\\.com
  String get regexFilter => throw _privateConstructorUsedError;
  bool get shortRegex => throw _privateConstructorUsedError;

  /// Example: https://example.com
  String get referer => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WebRuleCopyWith<WebRule> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WebRuleCopyWith<$Res> {
  factory $WebRuleCopyWith(WebRule value, $Res Function(WebRule) then) =
      _$WebRuleCopyWithImpl<$Res, WebRule>;
  @useResult
  $Res call({String regexFilter, bool shortRegex, String referer});
}

/// @nodoc
class _$WebRuleCopyWithImpl<$Res, $Val extends WebRule>
    implements $WebRuleCopyWith<$Res> {
  _$WebRuleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? regexFilter = null,
    Object? shortRegex = null,
    Object? referer = null,
  }) {
    return _then(_value.copyWith(
      regexFilter: null == regexFilter
          ? _value.regexFilter
          : regexFilter // ignore: cast_nullable_to_non_nullable
              as String,
      shortRegex: null == shortRegex
          ? _value.shortRegex
          : shortRegex // ignore: cast_nullable_to_non_nullable
              as bool,
      referer: null == referer
          ? _value.referer
          : referer // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WebRuleImplCopyWith<$Res> implements $WebRuleCopyWith<$Res> {
  factory _$$WebRuleImplCopyWith(
          _$WebRuleImpl value, $Res Function(_$WebRuleImpl) then) =
      __$$WebRuleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String regexFilter, bool shortRegex, String referer});
}

/// @nodoc
class __$$WebRuleImplCopyWithImpl<$Res>
    extends _$WebRuleCopyWithImpl<$Res, _$WebRuleImpl>
    implements _$$WebRuleImplCopyWith<$Res> {
  __$$WebRuleImplCopyWithImpl(
      _$WebRuleImpl _value, $Res Function(_$WebRuleImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? regexFilter = null,
    Object? shortRegex = null,
    Object? referer = null,
  }) {
    return _then(_$WebRuleImpl(
      regexFilter: null == regexFilter
          ? _value.regexFilter
          : regexFilter // ignore: cast_nullable_to_non_nullable
              as String,
      shortRegex: null == shortRegex
          ? _value.shortRegex
          : shortRegex // ignore: cast_nullable_to_non_nullable
              as bool,
      referer: null == referer
          ? _value.referer
          : referer // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WebRuleImpl implements _WebRule {
  const _$WebRuleImpl(
      {required this.regexFilter,
      this.shortRegex = true,
      required this.referer});

  factory _$WebRuleImpl.fromJson(Map<String, dynamic> json) =>
      _$$WebRuleImplFromJson(json);

  /// Example: example\\.com
  @override
  final String regexFilter;
  @override
  @JsonKey()
  final bool shortRegex;

  /// Example: https://example.com
  @override
  final String referer;

  @override
  String toString() {
    return 'WebRule(regexFilter: $regexFilter, shortRegex: $shortRegex, referer: $referer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WebRuleImpl &&
            (identical(other.regexFilter, regexFilter) ||
                other.regexFilter == regexFilter) &&
            (identical(other.shortRegex, shortRegex) ||
                other.shortRegex == shortRegex) &&
            (identical(other.referer, referer) || other.referer == referer));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, regexFilter, shortRegex, referer);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WebRuleImplCopyWith<_$WebRuleImpl> get copyWith =>
      __$$WebRuleImplCopyWithImpl<_$WebRuleImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WebRuleImplToJson(
      this,
    );
  }
}

abstract class _WebRule implements WebRule {
  const factory _WebRule(
      {required final String regexFilter,
      final bool shortRegex,
      required final String referer}) = _$WebRuleImpl;

  factory _WebRule.fromJson(Map<String, dynamic> json) = _$WebRuleImpl.fromJson;

  @override

  /// Example: example\\.com
  String get regexFilter;
  @override
  bool get shortRegex;
  @override

  /// Example: https://example.com
  String get referer;
  @override
  @JsonKey(ignore: true)
  _$$WebRuleImplCopyWith<_$WebRuleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
