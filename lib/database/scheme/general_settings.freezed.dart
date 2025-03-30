// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'general_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GeneralSettings _$GeneralSettingsFromJson(Map<String, dynamic> json) {
  return _GeneralSettings.fromJson(json);
}

/// @nodoc
mixin _$GeneralSettings {
  bool get mangaReadLazyPage => throw _privateConstructorUsedError;
  DateTime? get lastCheckUpdateApp => throw _privateConstructorUsedError;
  double? get brightnessApp => throw _privateConstructorUsedError;
  int get pollingIntervalComic => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GeneralSettingsCopyWith<GeneralSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeneralSettingsCopyWith<$Res> {
  factory $GeneralSettingsCopyWith(
          GeneralSettings value, $Res Function(GeneralSettings) then) =
      _$GeneralSettingsCopyWithImpl<$Res, GeneralSettings>;
  @useResult
  $Res call(
      {bool mangaReadLazyPage,
      DateTime? lastCheckUpdateApp,
      double? brightnessApp,
      int pollingIntervalComic});
}

/// @nodoc
class _$GeneralSettingsCopyWithImpl<$Res, $Val extends GeneralSettings>
    implements $GeneralSettingsCopyWith<$Res> {
  _$GeneralSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mangaReadLazyPage = null,
    Object? lastCheckUpdateApp = freezed,
    Object? brightnessApp = freezed,
    Object? pollingIntervalComic = null,
  }) {
    return _then(_value.copyWith(
      mangaReadLazyPage: null == mangaReadLazyPage
          ? _value.mangaReadLazyPage
          : mangaReadLazyPage // ignore: cast_nullable_to_non_nullable
              as bool,
      lastCheckUpdateApp: freezed == lastCheckUpdateApp
          ? _value.lastCheckUpdateApp
          : lastCheckUpdateApp // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      brightnessApp: freezed == brightnessApp
          ? _value.brightnessApp
          : brightnessApp // ignore: cast_nullable_to_non_nullable
              as double?,
      pollingIntervalComic: null == pollingIntervalComic
          ? _value.pollingIntervalComic
          : pollingIntervalComic // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GeneralSettingsImplCopyWith<$Res>
    implements $GeneralSettingsCopyWith<$Res> {
  factory _$$GeneralSettingsImplCopyWith(_$GeneralSettingsImpl value,
          $Res Function(_$GeneralSettingsImpl) then) =
      __$$GeneralSettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool mangaReadLazyPage,
      DateTime? lastCheckUpdateApp,
      double? brightnessApp,
      int pollingIntervalComic});
}

/// @nodoc
class __$$GeneralSettingsImplCopyWithImpl<$Res>
    extends _$GeneralSettingsCopyWithImpl<$Res, _$GeneralSettingsImpl>
    implements _$$GeneralSettingsImplCopyWith<$Res> {
  __$$GeneralSettingsImplCopyWithImpl(
      _$GeneralSettingsImpl _value, $Res Function(_$GeneralSettingsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mangaReadLazyPage = null,
    Object? lastCheckUpdateApp = freezed,
    Object? brightnessApp = freezed,
    Object? pollingIntervalComic = null,
  }) {
    return _then(_$GeneralSettingsImpl(
      mangaReadLazyPage: null == mangaReadLazyPage
          ? _value.mangaReadLazyPage
          : mangaReadLazyPage // ignore: cast_nullable_to_non_nullable
              as bool,
      lastCheckUpdateApp: freezed == lastCheckUpdateApp
          ? _value.lastCheckUpdateApp
          : lastCheckUpdateApp // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      brightnessApp: freezed == brightnessApp
          ? _value.brightnessApp
          : brightnessApp // ignore: cast_nullable_to_non_nullable
              as double?,
      pollingIntervalComic: null == pollingIntervalComic
          ? _value.pollingIntervalComic
          : pollingIntervalComic // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GeneralSettingsImpl implements _GeneralSettings {
  const _$GeneralSettingsImpl(
      {this.mangaReadLazyPage = false,
      this.lastCheckUpdateApp = null,
      this.brightnessApp = null,
      this.pollingIntervalComic = 60 * 60 * 3});

  factory _$GeneralSettingsImpl.fromJson(Map<String, dynamic> json) =>
      _$$GeneralSettingsImplFromJson(json);

  @override
  @JsonKey()
  final bool mangaReadLazyPage;
  @override
  @JsonKey()
  final DateTime? lastCheckUpdateApp;
  @override
  @JsonKey()
  final double? brightnessApp;
  @override
  @JsonKey()
  final int pollingIntervalComic;

  @override
  String toString() {
    return 'GeneralSettings(mangaReadLazyPage: $mangaReadLazyPage, lastCheckUpdateApp: $lastCheckUpdateApp, brightnessApp: $brightnessApp, pollingIntervalComic: $pollingIntervalComic)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GeneralSettingsImpl &&
            (identical(other.mangaReadLazyPage, mangaReadLazyPage) ||
                other.mangaReadLazyPage == mangaReadLazyPage) &&
            (identical(other.lastCheckUpdateApp, lastCheckUpdateApp) ||
                other.lastCheckUpdateApp == lastCheckUpdateApp) &&
            (identical(other.brightnessApp, brightnessApp) ||
                other.brightnessApp == brightnessApp) &&
            (identical(other.pollingIntervalComic, pollingIntervalComic) ||
                other.pollingIntervalComic == pollingIntervalComic));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, mangaReadLazyPage,
      lastCheckUpdateApp, brightnessApp, pollingIntervalComic);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GeneralSettingsImplCopyWith<_$GeneralSettingsImpl> get copyWith =>
      __$$GeneralSettingsImplCopyWithImpl<_$GeneralSettingsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GeneralSettingsImplToJson(
      this,
    );
  }
}

abstract class _GeneralSettings implements GeneralSettings {
  const factory _GeneralSettings(
      {final bool mangaReadLazyPage,
      final DateTime? lastCheckUpdateApp,
      final double? brightnessApp,
      final int pollingIntervalComic}) = _$GeneralSettingsImpl;

  factory _GeneralSettings.fromJson(Map<String, dynamic> json) =
      _$GeneralSettingsImpl.fromJson;

  @override
  bool get mangaReadLazyPage;
  @override
  DateTime? get lastCheckUpdateApp;
  @override
  double? get brightnessApp;
  @override
  int get pollingIntervalComic;
  @override
  @JsonKey(ignore: true)
  _$$GeneralSettingsImplCopyWith<_$GeneralSettingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
