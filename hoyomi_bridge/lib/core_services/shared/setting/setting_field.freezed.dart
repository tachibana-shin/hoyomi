// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'setting_field.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SettingField {
  String get name;
  String get key;
  String? get description;

  /// Create a copy of SettingField
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SettingFieldCopyWith<SettingField> get copyWith =>
      _$SettingFieldCopyWithImpl<SettingField>(
          this as SettingField, _$identity);

  /// Serializes this SettingField to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SettingField &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, key, description);

  @override
  String toString() {
    return 'SettingField(name: $name, key: $key, description: $description)';
  }
}

/// @nodoc
abstract mixin class $SettingFieldCopyWith<$Res> {
  factory $SettingFieldCopyWith(
          SettingField value, $Res Function(SettingField) _then) =
      _$SettingFieldCopyWithImpl;
  @useResult
  $Res call({String name, String key, String? description});
}

/// @nodoc
class _$SettingFieldCopyWithImpl<$Res> implements $SettingFieldCopyWith<$Res> {
  _$SettingFieldCopyWithImpl(this._self, this._then);

  final SettingField _self;
  final $Res Function(SettingField) _then;

  /// Create a copy of SettingField
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? key = null,
    Object? description = freezed,
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _SettingField implements SettingField {
  const _SettingField(
      {required this.name, required this.key, this.description});
  factory _SettingField.fromJson(Map<String, dynamic> json) =>
      _$SettingFieldFromJson(json);

  @override
  final String name;
  @override
  final String key;
  @override
  final String? description;

  /// Create a copy of SettingField
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SettingFieldCopyWith<_SettingField> get copyWith =>
      __$SettingFieldCopyWithImpl<_SettingField>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SettingFieldToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SettingField &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, key, description);

  @override
  String toString() {
    return 'SettingField(name: $name, key: $key, description: $description)';
  }
}

/// @nodoc
abstract mixin class _$SettingFieldCopyWith<$Res>
    implements $SettingFieldCopyWith<$Res> {
  factory _$SettingFieldCopyWith(
          _SettingField value, $Res Function(_SettingField) _then) =
      __$SettingFieldCopyWithImpl;
  @override
  @useResult
  $Res call({String name, String key, String? description});
}

/// @nodoc
class __$SettingFieldCopyWithImpl<$Res>
    implements _$SettingFieldCopyWith<$Res> {
  __$SettingFieldCopyWithImpl(this._self, this._then);

  final _SettingField _self;
  final $Res Function(_SettingField) _then;

  /// Create a copy of SettingField
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? key = null,
    Object? description = freezed,
  }) {
    return _then(_SettingField(
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
    ));
  }
}

// dart format on
