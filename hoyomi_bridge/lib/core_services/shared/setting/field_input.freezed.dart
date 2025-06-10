// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'field_input.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FieldInput {
  String get name;
  String get key;
  String? get description;
  String get placeholder;
  String get defaultValue;
  int get maxLines;
  bool get appear;

  /// Create a copy of FieldInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FieldInputCopyWith<FieldInput> get copyWith =>
      _$FieldInputCopyWithImpl<FieldInput>(this as FieldInput, _$identity);

  /// Serializes this FieldInput to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FieldInput &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.placeholder, placeholder) ||
                other.placeholder == placeholder) &&
            (identical(other.defaultValue, defaultValue) ||
                other.defaultValue == defaultValue) &&
            (identical(other.maxLines, maxLines) ||
                other.maxLines == maxLines) &&
            (identical(other.appear, appear) || other.appear == appear));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, key, description,
      placeholder, defaultValue, maxLines, appear);

  @override
  String toString() {
    return 'FieldInput(name: $name, key: $key, description: $description, placeholder: $placeholder, defaultValue: $defaultValue, maxLines: $maxLines, appear: $appear)';
  }
}

/// @nodoc
abstract mixin class $FieldInputCopyWith<$Res> {
  factory $FieldInputCopyWith(
          FieldInput value, $Res Function(FieldInput) _then) =
      _$FieldInputCopyWithImpl;
  @useResult
  $Res call(
      {String name,
      String key,
      String? description,
      String placeholder,
      String defaultValue,
      int maxLines,
      bool appear});
}

/// @nodoc
class _$FieldInputCopyWithImpl<$Res> implements $FieldInputCopyWith<$Res> {
  _$FieldInputCopyWithImpl(this._self, this._then);

  final FieldInput _self;
  final $Res Function(FieldInput) _then;

  /// Create a copy of FieldInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? key = null,
    Object? description = freezed,
    Object? placeholder = null,
    Object? defaultValue = null,
    Object? maxLines = null,
    Object? appear = null,
  }) {
    return _then(_self.copyWith(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      key: null == key
          ? _self.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      placeholder: null == placeholder
          ? _self.placeholder
          : placeholder // ignore: cast_nullable_to_non_nullable
              as String,
      defaultValue: null == defaultValue
          ? _self.defaultValue
          : defaultValue // ignore: cast_nullable_to_non_nullable
              as String,
      maxLines: null == maxLines
          ? _self.maxLines
          : maxLines // ignore: cast_nullable_to_non_nullable
              as int,
      appear: null == appear
          ? _self.appear
          : appear // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _FieldInput implements FieldInput {
  const _FieldInput(
      {required this.name,
      required this.key,
      this.description,
      required this.placeholder,
      required this.defaultValue,
      this.maxLines = 1,
      this.appear = false});
  factory _FieldInput.fromJson(Map<String, dynamic> json) =>
      _$FieldInputFromJson(json);

  @override
  final String name;
  @override
  final String key;
  @override
  final String? description;
  @override
  final String placeholder;
  @override
  final String defaultValue;
  @override
  @JsonKey()
  final int maxLines;
  @override
  @JsonKey()
  final bool appear;

  /// Create a copy of FieldInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FieldInputCopyWith<_FieldInput> get copyWith =>
      __$FieldInputCopyWithImpl<_FieldInput>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$FieldInputToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FieldInput &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.placeholder, placeholder) ||
                other.placeholder == placeholder) &&
            (identical(other.defaultValue, defaultValue) ||
                other.defaultValue == defaultValue) &&
            (identical(other.maxLines, maxLines) ||
                other.maxLines == maxLines) &&
            (identical(other.appear, appear) || other.appear == appear));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, key, description,
      placeholder, defaultValue, maxLines, appear);

  @override
  String toString() {
    return 'FieldInput(name: $name, key: $key, description: $description, placeholder: $placeholder, defaultValue: $defaultValue, maxLines: $maxLines, appear: $appear)';
  }
}

/// @nodoc
abstract mixin class _$FieldInputCopyWith<$Res>
    implements $FieldInputCopyWith<$Res> {
  factory _$FieldInputCopyWith(
          _FieldInput value, $Res Function(_FieldInput) _then) =
      __$FieldInputCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String name,
      String key,
      String? description,
      String placeholder,
      String defaultValue,
      int maxLines,
      bool appear});
}

/// @nodoc
class __$FieldInputCopyWithImpl<$Res> implements _$FieldInputCopyWith<$Res> {
  __$FieldInputCopyWithImpl(this._self, this._then);

  final _FieldInput _self;
  final $Res Function(_FieldInput) _then;

  /// Create a copy of FieldInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? key = null,
    Object? description = freezed,
    Object? placeholder = null,
    Object? defaultValue = null,
    Object? maxLines = null,
    Object? appear = null,
  }) {
    return _then(_FieldInput(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      key: null == key
          ? _self.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      placeholder: null == placeholder
          ? _self.placeholder
          : placeholder // ignore: cast_nullable_to_non_nullable
              as String,
      defaultValue: null == defaultValue
          ? _self.defaultValue
          : defaultValue // ignore: cast_nullable_to_non_nullable
              as String,
      maxLines: null == maxLines
          ? _self.maxLines
          : maxLines // ignore: cast_nullable_to_non_nullable
              as int,
      appear: null == appear
          ? _self.appear
          : appear // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
