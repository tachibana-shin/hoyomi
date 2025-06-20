// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service_init.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ServiceInit {

 String get name; String? get uid; OImage get faviconUrl; String get rootUrl; List<SettingField>? get settings; List<WebRule>? get webRules; bool get fetchHeadless; String? get fetchBaseUrl;///
/// {BASE_URL} = baseUrl. Example "{BASE_URL}/captcha" = https://example.com/captcha
///
 String? get captchaUrl;///
/// {OLD_COOKIE} = old cookie
///
 String? get customCookie;
/// Create a copy of ServiceInit
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServiceInitCopyWith<ServiceInit> get copyWith => _$ServiceInitCopyWithImpl<ServiceInit>(this as ServiceInit, _$identity);

  /// Serializes this ServiceInit to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServiceInit&&(identical(other.name, name) || other.name == name)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.faviconUrl, faviconUrl) || other.faviconUrl == faviconUrl)&&(identical(other.rootUrl, rootUrl) || other.rootUrl == rootUrl)&&const DeepCollectionEquality().equals(other.settings, settings)&&const DeepCollectionEquality().equals(other.webRules, webRules)&&(identical(other.fetchHeadless, fetchHeadless) || other.fetchHeadless == fetchHeadless)&&(identical(other.fetchBaseUrl, fetchBaseUrl) || other.fetchBaseUrl == fetchBaseUrl)&&(identical(other.captchaUrl, captchaUrl) || other.captchaUrl == captchaUrl)&&(identical(other.customCookie, customCookie) || other.customCookie == customCookie));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,uid,faviconUrl,rootUrl,const DeepCollectionEquality().hash(settings),const DeepCollectionEquality().hash(webRules),fetchHeadless,fetchBaseUrl,captchaUrl,customCookie);

@override
String toString() {
  return 'ServiceInit(name: $name, uid: $uid, faviconUrl: $faviconUrl, rootUrl: $rootUrl, settings: $settings, webRules: $webRules, fetchHeadless: $fetchHeadless, fetchBaseUrl: $fetchBaseUrl, captchaUrl: $captchaUrl, customCookie: $customCookie)';
}


}

/// @nodoc
abstract mixin class $ServiceInitCopyWith<$Res>  {
  factory $ServiceInitCopyWith(ServiceInit value, $Res Function(ServiceInit) _then) = _$ServiceInitCopyWithImpl;
@useResult
$Res call({
 String name, String? uid, OImage faviconUrl, String rootUrl, List<SettingField>? settings, List<WebRule>? webRules, bool fetchHeadless, String? fetchBaseUrl, String? captchaUrl, String? customCookie
});


$OImageCopyWith<$Res> get faviconUrl;

}
/// @nodoc
class _$ServiceInitCopyWithImpl<$Res>
    implements $ServiceInitCopyWith<$Res> {
  _$ServiceInitCopyWithImpl(this._self, this._then);

  final ServiceInit _self;
  final $Res Function(ServiceInit) _then;

/// Create a copy of ServiceInit
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? uid = freezed,Object? faviconUrl = null,Object? rootUrl = null,Object? settings = freezed,Object? webRules = freezed,Object? fetchHeadless = null,Object? fetchBaseUrl = freezed,Object? captchaUrl = freezed,Object? customCookie = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,uid: freezed == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String?,faviconUrl: null == faviconUrl ? _self.faviconUrl : faviconUrl // ignore: cast_nullable_to_non_nullable
as OImage,rootUrl: null == rootUrl ? _self.rootUrl : rootUrl // ignore: cast_nullable_to_non_nullable
as String,settings: freezed == settings ? _self.settings : settings // ignore: cast_nullable_to_non_nullable
as List<SettingField>?,webRules: freezed == webRules ? _self.webRules : webRules // ignore: cast_nullable_to_non_nullable
as List<WebRule>?,fetchHeadless: null == fetchHeadless ? _self.fetchHeadless : fetchHeadless // ignore: cast_nullable_to_non_nullable
as bool,fetchBaseUrl: freezed == fetchBaseUrl ? _self.fetchBaseUrl : fetchBaseUrl // ignore: cast_nullable_to_non_nullable
as String?,captchaUrl: freezed == captchaUrl ? _self.captchaUrl : captchaUrl // ignore: cast_nullable_to_non_nullable
as String?,customCookie: freezed == customCookie ? _self.customCookie : customCookie // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of ServiceInit
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OImageCopyWith<$Res> get faviconUrl {
  
  return $OImageCopyWith<$Res>(_self.faviconUrl, (value) {
    return _then(_self.copyWith(faviconUrl: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _ServiceInit implements ServiceInit {
  const _ServiceInit({required this.name, this.uid, required this.faviconUrl, required this.rootUrl, final  List<SettingField>? settings, final  List<WebRule>? webRules, this.fetchHeadless = false, this.fetchBaseUrl, this.captchaUrl, this.customCookie}): _settings = settings,_webRules = webRules;
  factory _ServiceInit.fromJson(Map<String, dynamic> json) => _$ServiceInitFromJson(json);

@override final  String name;
@override final  String? uid;
@override final  OImage faviconUrl;
@override final  String rootUrl;
 final  List<SettingField>? _settings;
@override List<SettingField>? get settings {
  final value = _settings;
  if (value == null) return null;
  if (_settings is EqualUnmodifiableListView) return _settings;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<WebRule>? _webRules;
@override List<WebRule>? get webRules {
  final value = _webRules;
  if (value == null) return null;
  if (_webRules is EqualUnmodifiableListView) return _webRules;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey() final  bool fetchHeadless;
@override final  String? fetchBaseUrl;
///
/// {BASE_URL} = baseUrl. Example "{BASE_URL}/captcha" = https://example.com/captcha
///
@override final  String? captchaUrl;
///
/// {OLD_COOKIE} = old cookie
///
@override final  String? customCookie;

/// Create a copy of ServiceInit
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ServiceInitCopyWith<_ServiceInit> get copyWith => __$ServiceInitCopyWithImpl<_ServiceInit>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ServiceInitToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ServiceInit&&(identical(other.name, name) || other.name == name)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.faviconUrl, faviconUrl) || other.faviconUrl == faviconUrl)&&(identical(other.rootUrl, rootUrl) || other.rootUrl == rootUrl)&&const DeepCollectionEquality().equals(other._settings, _settings)&&const DeepCollectionEquality().equals(other._webRules, _webRules)&&(identical(other.fetchHeadless, fetchHeadless) || other.fetchHeadless == fetchHeadless)&&(identical(other.fetchBaseUrl, fetchBaseUrl) || other.fetchBaseUrl == fetchBaseUrl)&&(identical(other.captchaUrl, captchaUrl) || other.captchaUrl == captchaUrl)&&(identical(other.customCookie, customCookie) || other.customCookie == customCookie));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,uid,faviconUrl,rootUrl,const DeepCollectionEquality().hash(_settings),const DeepCollectionEquality().hash(_webRules),fetchHeadless,fetchBaseUrl,captchaUrl,customCookie);

@override
String toString() {
  return 'ServiceInit(name: $name, uid: $uid, faviconUrl: $faviconUrl, rootUrl: $rootUrl, settings: $settings, webRules: $webRules, fetchHeadless: $fetchHeadless, fetchBaseUrl: $fetchBaseUrl, captchaUrl: $captchaUrl, customCookie: $customCookie)';
}


}

/// @nodoc
abstract mixin class _$ServiceInitCopyWith<$Res> implements $ServiceInitCopyWith<$Res> {
  factory _$ServiceInitCopyWith(_ServiceInit value, $Res Function(_ServiceInit) _then) = __$ServiceInitCopyWithImpl;
@override @useResult
$Res call({
 String name, String? uid, OImage faviconUrl, String rootUrl, List<SettingField>? settings, List<WebRule>? webRules, bool fetchHeadless, String? fetchBaseUrl, String? captchaUrl, String? customCookie
});


@override $OImageCopyWith<$Res> get faviconUrl;

}
/// @nodoc
class __$ServiceInitCopyWithImpl<$Res>
    implements _$ServiceInitCopyWith<$Res> {
  __$ServiceInitCopyWithImpl(this._self, this._then);

  final _ServiceInit _self;
  final $Res Function(_ServiceInit) _then;

/// Create a copy of ServiceInit
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? uid = freezed,Object? faviconUrl = null,Object? rootUrl = null,Object? settings = freezed,Object? webRules = freezed,Object? fetchHeadless = null,Object? fetchBaseUrl = freezed,Object? captchaUrl = freezed,Object? customCookie = freezed,}) {
  return _then(_ServiceInit(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,uid: freezed == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String?,faviconUrl: null == faviconUrl ? _self.faviconUrl : faviconUrl // ignore: cast_nullable_to_non_nullable
as OImage,rootUrl: null == rootUrl ? _self.rootUrl : rootUrl // ignore: cast_nullable_to_non_nullable
as String,settings: freezed == settings ? _self._settings : settings // ignore: cast_nullable_to_non_nullable
as List<SettingField>?,webRules: freezed == webRules ? _self._webRules : webRules // ignore: cast_nullable_to_non_nullable
as List<WebRule>?,fetchHeadless: null == fetchHeadless ? _self.fetchHeadless : fetchHeadless // ignore: cast_nullable_to_non_nullable
as bool,fetchBaseUrl: freezed == fetchBaseUrl ? _self.fetchBaseUrl : fetchBaseUrl // ignore: cast_nullable_to_non_nullable
as String?,captchaUrl: freezed == captchaUrl ? _self.captchaUrl : captchaUrl // ignore: cast_nullable_to_non_nullable
as String?,customCookie: freezed == customCookie ? _self.customCookie : customCookie // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of ServiceInit
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OImageCopyWith<$Res> get faviconUrl {
  
  return $OImageCopyWith<$Res>(_self.faviconUrl, (value) {
    return _then(_self.copyWith(faviconUrl: value));
  });
}
}

// dart format on
