import 'package:freezed_annotation/freezed_annotation.dart';

import 'interfaces/export.dart';

part 'service_init.freezed.dart';
part 'service_init.g.dart';

@freezed
sealed class ServiceInit with _$ServiceInit {
  const factory ServiceInit({
    required String name,
    String? uid,
    required OImage faviconUrl,
    required String rootUrl,
    String? version,
    String? description,
    /// Code language support
    String? language,
    List<SettingField>? settings,
    List<WebRule>? webRules,
    @Default(false) bool fetchHeadless,
    String? fetchBaseUrl,

    ///
    /// {BASE_URL} = baseUrl. Example "{BASE_URL}/captcha" = https://example.com/captcha
    ///
    String? captchaUrl,

    ///
    /// {OLD_COOKIE} = old cookie
    ///
    String? customCookie,
  }) = _ServiceInit;

  factory ServiceInit.fromJson(Map<String, dynamic> json) =>
      _$ServiceInitFromJson(json);
}
