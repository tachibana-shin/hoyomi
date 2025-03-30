// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ServiceSettings _$ServiceSettingsFromJson(Map<String, dynamic> json) {
  return _ServiceSettings.fromJson(json);
}

/// @nodoc
mixin _$ServiceSettings {
  String get sourceId => throw _privateConstructorUsedError;

  /// This field save all field: cookie, user agent...
  Map<String, dynamic>? get settings => throw _privateConstructorUsedError;

  /// Cache user data
  String? get userDataCache => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ServiceSettingsCopyWith<ServiceSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceSettingsCopyWith<$Res> {
  factory $ServiceSettingsCopyWith(
          ServiceSettings value, $Res Function(ServiceSettings) then) =
      _$ServiceSettingsCopyWithImpl<$Res, ServiceSettings>;
  @useResult
  $Res call(
      {String sourceId,
      Map<String, dynamic>? settings,
      String? userDataCache,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$ServiceSettingsCopyWithImpl<$Res, $Val extends ServiceSettings>
    implements $ServiceSettingsCopyWith<$Res> {
  _$ServiceSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sourceId = null,
    Object? settings = freezed,
    Object? userDataCache = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      sourceId: null == sourceId
          ? _value.sourceId
          : sourceId // ignore: cast_nullable_to_non_nullable
              as String,
      settings: freezed == settings
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      userDataCache: freezed == userDataCache
          ? _value.userDataCache
          : userDataCache // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ServiceSettingsImplCopyWith<$Res>
    implements $ServiceSettingsCopyWith<$Res> {
  factory _$$ServiceSettingsImplCopyWith(_$ServiceSettingsImpl value,
          $Res Function(_$ServiceSettingsImpl) then) =
      __$$ServiceSettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String sourceId,
      Map<String, dynamic>? settings,
      String? userDataCache,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$$ServiceSettingsImplCopyWithImpl<$Res>
    extends _$ServiceSettingsCopyWithImpl<$Res, _$ServiceSettingsImpl>
    implements _$$ServiceSettingsImplCopyWith<$Res> {
  __$$ServiceSettingsImplCopyWithImpl(
      _$ServiceSettingsImpl _value, $Res Function(_$ServiceSettingsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sourceId = null,
    Object? settings = freezed,
    Object? userDataCache = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$ServiceSettingsImpl(
      sourceId: null == sourceId
          ? _value.sourceId
          : sourceId // ignore: cast_nullable_to_non_nullable
              as String,
      settings: freezed == settings
          ? _value._settings
          : settings // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      userDataCache: freezed == userDataCache
          ? _value.userDataCache
          : userDataCache // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ServiceSettingsImpl implements _ServiceSettings {
  const _$ServiceSettingsImpl(
      {required this.sourceId,
      required final Map<String, dynamic>? settings,
      required this.userDataCache,
      required this.createdAt,
      required this.updatedAt})
      : _settings = settings;

  factory _$ServiceSettingsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ServiceSettingsImplFromJson(json);

  @override
  final String sourceId;

  /// This field save all field: cookie, user agent...
  final Map<String, dynamic>? _settings;

  /// This field save all field: cookie, user agent...
  @override
  Map<String, dynamic>? get settings {
    final value = _settings;
    if (value == null) return null;
    if (_settings is EqualUnmodifiableMapView) return _settings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  /// Cache user data
  @override
  final String? userDataCache;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'ServiceSettings(sourceId: $sourceId, settings: $settings, userDataCache: $userDataCache, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceSettingsImpl &&
            (identical(other.sourceId, sourceId) ||
                other.sourceId == sourceId) &&
            const DeepCollectionEquality().equals(other._settings, _settings) &&
            (identical(other.userDataCache, userDataCache) ||
                other.userDataCache == userDataCache) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      sourceId,
      const DeepCollectionEquality().hash(_settings),
      userDataCache,
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServiceSettingsImplCopyWith<_$ServiceSettingsImpl> get copyWith =>
      __$$ServiceSettingsImplCopyWithImpl<_$ServiceSettingsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ServiceSettingsImplToJson(
      this,
    );
  }
}

abstract class _ServiceSettings implements ServiceSettings {
  const factory _ServiceSettings(
      {required final String sourceId,
      required final Map<String, dynamic>? settings,
      required final String? userDataCache,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$ServiceSettingsImpl;

  factory _ServiceSettings.fromJson(Map<String, dynamic> json) =
      _$ServiceSettingsImpl.fromJson;

  @override
  String get sourceId;
  @override

  /// This field save all field: cookie, user agent...
  Map<String, dynamic>? get settings;
  @override

  /// Cache user data
  String? get userDataCache;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$ServiceSettingsImplCopyWith<_$ServiceSettingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
