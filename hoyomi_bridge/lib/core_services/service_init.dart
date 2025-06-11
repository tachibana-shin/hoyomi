import 'package:eval_annotation/eval_annotation.dart';
import 'package:hoyomi_bridge/export.dart';

@Bind()
class ServiceInit {
  final String name;
  final String? uid;
  final OImage faviconUrl;
  final String rootUrl;
  final String Function()? captchaUrl;
  final List<SettingField>? settings;
  final List<WebRule>? webRules;
  final bool fetchHeadless;
  final String? fetchBaseUrl;

  /// Called before inserting the cookie to the insert request. Override this method to modify the cookie
  /// before it is inserted. The default implementation simply returns the original cookie.
  ///
  /// [cookie] The cookie to be inserted.
  ///
  /// Returns the modified cookie.
  final String? Function(String? oldCookie)? onBeforeInsertCookie;
  Future<List<WebRule>> dynamicWebRules() {
    throw UnimplementedError();
  }

  const ServiceInit({
    required this.name,
    this.uid,
    required this.rootUrl,
    required this.faviconUrl,
    this.captchaUrl,
    this.settings,
    this.onBeforeInsertCookie,
    this.webRules,
    this.fetchHeadless = false,
    this.fetchBaseUrl,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'uid': uid,
      'faviconUrl': faviconUrl.toJson(), // assuming OImage has toJson()
      'rootUrl': rootUrl,
      'settings': settings?.map((e) => e.toJson()).toList(),
      'webRules': webRules?.map((e) => e.toJson()).toList(),
      'fetchHeadless': fetchHeadless,
      'fetchBaseUrl': fetchBaseUrl,
      'captchaUrl': captchaUrl?.call(), // export value instead of function
      // 'onBeforeInsertCookie': not serializable
    };
  }
}
