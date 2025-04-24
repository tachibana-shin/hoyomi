// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ServiceSettings {
  String get sourceId;

  /// This field save all field: cookie, user agent...
  Map<String, dynamic>? get settings;

  /// Cache user data
  String? get userDataCache;
  DateTime get createdAt;
  DateTime get updatedAt;

  /// Create a copy of ServiceSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ServiceSettingsCopyWith<ServiceSettings> get copyWith =>
      _$ServiceSettingsCopyWithImpl<ServiceSettings>(
          this as ServiceSettings, _$identity);

  /// Serializes this ServiceSettings to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ServiceSettings &&
            (identical(other.sourceId, sourceId) ||
                other.sourceId == sourceId) &&
            const DeepCollectionEquality().equals(other.settings, settings) &&
            (identical(other.userDataCache, userDataCache) ||
                other.userDataCache == userDataCache) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      sourceId,
      const DeepCollectionEquality().hash(settings),
      userDataCache,
      createdAt,
      updatedAt);

  @override
  String toString() {
    return 'ServiceSettings(sourceId: $sourceId, settings: $settings, userDataCache: $userDataCache, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class $ServiceSettingsCopyWith<$Res> {
  factory $ServiceSettingsCopyWith(
          ServiceSettings value, $Res Function(ServiceSettings) _then) =
      _$ServiceSettingsCopyWithImpl;
  @useResult
  $Res call(
      {String sourceId,
      Map<String, dynamic>? settings,
      String? userDataCache,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$ServiceSettingsCopyWithImpl<$Res>
    implements $ServiceSettingsCopyWith<$Res> {
  _$ServiceSettingsCopyWithImpl(this._self, this._then);

  final ServiceSettings _self;
  final $Res Function(ServiceSettings) _then;

  /// Create a copy of ServiceSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sourceId = null,
    Object? settings = freezed,
    Object? userDataCache = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_self.copyWith(
      sourceId: null == sourceId
          ? _self.sourceId
          : sourceId // ignore: cast_nullable_to_non_nullable
              as String,
      settings: freezed == settings
          ? _self.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      userDataCache: freezed == userDataCache
          ? _self.userDataCache
          : userDataCache // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _ServiceSettings implements ServiceSettings {
  const _ServiceSettings(
      {required this.sourceId,
      required final Map<String, dynamic>? settings,
      required this.userDataCache,
      required this.createdAt,
      required this.updatedAt})
      : _settings = settings;
  factory _ServiceSettings.fromJson(Map<String, dynamic> json) =>
      _$ServiceSettingsFromJson(json);

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

  /// Create a copy of ServiceSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ServiceSettingsCopyWith<_ServiceSettings> get copyWith =>
      __$ServiceSettingsCopyWithImpl<_ServiceSettings>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ServiceSettingsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ServiceSettings &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      sourceId,
      const DeepCollectionEquality().hash(_settings),
      userDataCache,
      createdAt,
      updatedAt);

  @override
  String toString() {
    return 'ServiceSettings(sourceId: $sourceId, settings: $settings, userDataCache: $userDataCache, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class _$ServiceSettingsCopyWith<$Res>
    implements $ServiceSettingsCopyWith<$Res> {
  factory _$ServiceSettingsCopyWith(
          _ServiceSettings value, $Res Function(_ServiceSettings) _then) =
      __$ServiceSettingsCopyWithImpl;
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
class __$ServiceSettingsCopyWithImpl<$Res>
    implements _$ServiceSettingsCopyWith<$Res> {
  __$ServiceSettingsCopyWithImpl(this._self, this._then);

  final _ServiceSettings _self;
  final $Res Function(_ServiceSettings) _then;

  /// Create a copy of ServiceSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? sourceId = null,
    Object? settings = freezed,
    Object? userDataCache = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_ServiceSettings(
      sourceId: null == sourceId
          ? _self.sourceId
          : sourceId // ignore: cast_nullable_to_non_nullable
              as String,
      settings: freezed == settings
          ? _self._settings
          : settings // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      userDataCache: freezed == userDataCache
          ? _self.userDataCache
          : userDataCache // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

// dart format on
