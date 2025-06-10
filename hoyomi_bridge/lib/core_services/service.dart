import 'dart:async';

import 'package:eval_annotation/eval_annotation.dart';
import 'package:hoyomi_bridge/export.dart';

import 'bridger.dart';

@Bind()
abstract class ServiceInit {
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
}

@Bind()
abstract class BaseService {
  static final List<FieldInput> settingsDefault = [
    FieldInput(
      name: 'URL',
      key: 'url',
      defaultValue: '{ROOT_URL}',
      placeholder: 'Example https://example.com',
      description: 'The root URL of the service',
    ),
    FieldInput(
      name: 'User Agent',
      key: 'user_agent',
      defaultValue:
          'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36',
      placeholder:
          'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36',
      description: 'The user agent to use when fetching data',
      maxLines: 3,
    ),
    FieldInput(
      name: 'Cookie',
      key: 'cookie',
      defaultValue: '',
      placeholder: 'Example cookie',
      description:
          'The cookie to use when fetching data. This field sync if service auth. It can change on after login with WebView',
      maxLines: 5,
    ),
  ];

  ServiceInit get init;
  String get uid => init.uid ?? name.toLowerCase().replaceAll(r'\s', '-');
  String get name => init.name;
  Bridger? bridger;

  Bridger get _bridger {
    if (bridger == null) throw Exception('Bridger is not initialized');
    return bridger!;
  }

  String get baseUrl => _bridger.baseUrl;

  Future<String> fetch(
    String url, {
    String? cookie,
    UrlSearchParams? query,
    Map<String, dynamic>? body,
    Headers? headers,
    bool notify = true,
    bool headless = false,
    bool cache = true,
  }) async {
    return _bridger.fetch(
      url,
      cookie: cookie,
      query: query,
      body: body,
      headers: headers,
      notify: notify,
      headless: headless,
      cache: cache,
    );
  }

  DQuery parseQ(String html) {
    return DQuery.fromHtml(html);
  }

  Future<DQuery> fetchQ(
    String url, {
    String? cookie,
    UrlSearchParams? query,
    Map<String, dynamic>? body,
    Headers? headers,
    bool headless = false,
    bool cache = true,
  }) async {
    return parseQ(
      await fetch(
        url,
        cookie: cookie,
        query: query,
        body: body,
        headers: headers,
        headless: headless,
        cache: cache,
      ),
    );
  }
}
