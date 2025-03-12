import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hoyomi/controller/service_setting.dart';
import 'package:hoyomi/core_services/exception/user_not_found_exception.dart';
import 'package:hoyomi/core_services/interfaces/o_image.dart';
import 'package:hoyomi/core_services/interfaces/setting/field_input.dart';
import 'package:hoyomi/core_services/interfaces/setting/setting_field.dart';
import 'package:hoyomi/core_services/interfaces/user.dart';
import 'package:hoyomi/core_services/main.dart';
import 'package:hoyomi/core_services/mixin/auth_mixin.dart';
import 'package:hoyomi/database/scheme/service_setting.dart';
import 'package:hoyomi/errors/captcha_required_exception.dart';
import 'package:html/dom.dart' as d;
import 'package:html/parser.dart';
import 'package:http/http.dart';

import 'package:hoyomi/apis/show_snack_bar.dart';
import 'package:hoyomi/router/index.dart';

class ServiceInit {
  final String name;
  final String? uid;
  final OImage faviconUrl;
  final String rootUrl;
  final String? rss;
  final List<SettingField>? settings;

  /// Called before inserting the cookie to the insert request. Override this method to modify the cookie
  /// before it is inserted. The default implementation simply returns the original cookie.
  ///
  /// [cookie] The cookie to be inserted.
  ///
  /// Returns the modified cookie.
  final String? Function(String? oldCookie)? onBeforeInsertCookie;

  const ServiceInit({
    required this.name,
    this.uid,
    required this.rootUrl,
    required this.faviconUrl,
    this.rss,
    this.settings,
    this.onBeforeInsertCookie,
  });
}

mixin _SettingsMixin {
  String get uid;
  ServiceInit get init;

  void _initSettings() {
    // init settings appear
    if (init.settings != null) {
      for (final field in init.settings!) {
        if (field is FieldInput && field.appear) {
          if (getSetting(key: field.key) == null) {
            setSetting(field.key, field.defaultFn(this as Service));
          }
        }
      }
    }
  }

  String? getSetting({required String key}) {
    final settings = ServiceSettingController.getSettings(sourceId: uid);
    return settings?[key];
  }

  Future<String?> getSettingAsync({required String key}) async {
    final settings =
        await ServiceSettingController.getSettingsAsync(sourceId: uid);
    return settings?[key];
  }

  Future<void> setSetting(String name, String value) async {
    final record = ServiceSettingController.get(sourceId: uid) ??
        ServiceSetting(
          sourceId: uid,
          settings: null,
          userDataCache: null,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

    try {
      record.settings = jsonEncode({
        if (record.settings != null) ...jsonDecode(record.settings!),
        name: value,
      });
    } catch (err) {
      record.settings = jsonEncode({name: value});
    }

    await ServiceSettingController.save(record);
  }
}

abstract class Service with _SettingsMixin {
  static final List<SettingField> settingsDefault = [
    FieldInput(
      name: 'URL',
      key: 'url',
      defaultFn: (service) => service.init.rootUrl,
      placeholder: 'Example https://example.com',
      description: 'The root URL of the service',
    ),
    FieldInput(
      name: 'RSS',
      key: 'rss',
      defaultFn: (service) => service.init.rss ?? '',
      placeholder: 'Example https://example.com/rss',
      description: 'The RSS feed of the service',
    ),
    FieldInput(
      name: 'User Agent',
      key: 'user_agent',
      defaultFn: (service) =>
          'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36',
      placeholder:
          'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36',
      description: 'The user agent to use when fetching data',
      maxLines: 3,
    ),
    FieldInput(
      name: 'Cookie',
      key: 'cookie',
      defaultFn: (service) => '',
      placeholder: 'Example cookie',
      description:
          'The cookie to use when fetching data. This field sync if service auth. It can change on after login with WebView',
      maxLines: 5,
    ),
  ];
  Service() {
    // init settings appear
    _initSettings();
  }

  String get baseUrl {
    return getSetting(key: 'url') ?? init.rootUrl;
  }

  String get name => init.name;
  @override
  String get uid => init.uid ?? name.toLowerCase().replaceAll(r"\s", "-");
  OImage? _faviconUrl;
  OImage get faviconUrl => _faviconUrl ??= OImage(
      src: Uri.parse(baseUrl).resolve(init.faviconUrl.src).toString(),
      headers: init.faviconUrl.headers);
  String? _rss;
  String? get rss => _rss ??= init.rss == null
      ? null
      : Uri.parse(baseUrl).resolve(init.rss!).toString();

  Future<User>? _userFuture;

  static void showCaptchaResolve(
    BuildContext? context, {
    String? url,
    required CaptchaRequiredException error,
  }) {
    showSnackBar(
      errorWidgetBuilder(
        context,
        isSnackbar: true,
        url: url,
        error: error,
        service: null,
        orElse: (error) => Text('An error occurred: $error'),
      ),
    );
  }

  static Widget errorWidgetBuilder(
    BuildContext? context, {
    bool isSnackbar = false,
    String? url,
    required Object? error,
    required Service? service,
    required Widget Function(Object? error) orElse,
  }) {
    if (error is CaptchaRequiredException) {
      return Padding(
        padding: isSnackbar
            ? EdgeInsets.zero
            : EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Icon(
                  MaterialCommunityIcons.earth,
                  color: isSnackbar || context == null
                      ? Colors.black
                      : Theme.of(context).colorScheme.onSurface,
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Please resolve Captcha to continue.'),
                      if (url != null)
                        Text(
                          url,
                          style: TextStyle(fontSize: 14.0),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.0),
            ElevatedButton(
              child: Text('Go to Captcha'),
              onPressed: () async {
                await router.push('/webview/${error.service.uid}');
                router.refresh();
              },
            ),
          ],
        ),
      );
    }

    if (error is UserNotFoundException) {
      return Padding(
        padding: isSnackbar
            ? EdgeInsets.zero
            : EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('User not found'),
            SizedBox(height: 8.0),
            ElevatedButton(
              child: Text('Sign in'),
              onPressed: () async {
                await router.push('/webview/${service!.uid}');
                router.refresh();
              },
            ),
          ],
        ),
      );
    }

    return Column(children: [
      orElse(error),
      // button refresh page
      ElevatedButton(
        child: Text('Refresh'),
        onPressed: () => router.refresh(),
      ),
    ]);
  }

  /// Fetches data from the provided URL, handling cookies and retries.
  ///
  /// [url] The URL of the data to fetch.
  ///
  /// [cookie] The cookie to include in the request. Defaults to null.
  ///
  /// Returns a string containing the fetched data, or throws an exception if the request fails.
  Future<String> fetch(
    String url, {
    String? cookie,
    Map<String, dynamic>? body,
    Map<String, String>? headers,
  }) async {
    final record =
        await ServiceSettingController.getSettingsAsync(sourceId: uid);
    String? cookiesText = cookie ?? record?['cookie'] as String?;

    cookiesText = init.onBeforeInsertCookie?.call(cookiesText) ?? cookiesText;

    final uri = Uri.parse(url);
    final $headers = {
      'accept':
          'text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7',
      'accept-language': 'vi',
      'cache-control': 'no-cache',
      if (cookiesText != null) 'cookie': cookiesText,
      'pragma': 'no-cache',
      'priority': 'u=0, i',
      'sec-ch-ua':
          '"Google Chrome";v="131", "Chromium";v="131", "Not_A Brand";v="24"',
      'sec-ch-ua-arch': '"x86"',
      'sec-ch-ua-bitness': '"64"',
      'sec-ch-ua-full-version': '"131.0.6778.265"',
      'sec-ch-ua-full-version-list':
          '"Google Chrome";v="131.0.6778.265", "Chromium";v="131.0.6778.265", "Not_A Brand";v="24.0.0.0"',
      'sec-ch-ua-mobile': '?0',
      'sec-ch-ua-model': '""',
      'sec-ch-ua-platform': '"Windows"',
      'sec-ch-ua-platform-version': '"19.0.0"',
      'sec-fetch-dest': 'document',
      'sec-fetch-mode': 'navigate',
      'sec-fetch-site': 'same-origin',
      'sec-fetch-user': '?1',
      'upgrade-insecure-requests': '1',
      'user-agent': record?['user_agent'] as String? ??
          'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36',
    };

    final DateTime? startTime = kDebugMode ? DateTime.now() : null;
    if (kDebugMode) {
      print('🔵 [HTTP] Request Started');
      print('➡️ URL: $uri');
      print('📩 Headers: $headers');

      if (body != null) {
        final filteredBody = Map.fromEntries(
          body.entries.where((entry) => entry.value != null).map(
                (entry) => MapEntry(
                    entry.key,
                    entry.value is String
                        ? entry.value
                        : entry.value.toString()),
              ),
        );

        print('📦 Body: $filteredBody');
      }
    }

    late final Response response;
    try {
      response = body == null
          ? await get(uri, headers: $headers)
          : await post(
              uri,
              headers: $headers,
              body: Map.fromEntries(
                body.entries.where((entry) => entry.value != null).toList().map(
                  (entry) {
                    if (entry.value is String) {
                      return entry;
                    } else {
                      return MapEntry(entry.key, entry.value.toString());
                    }
                  },
                ),
              ),
            );

      if (kDebugMode) {
        if (startTime != null) {
          final DateTime endTime = DateTime.now();
          final Duration duration = endTime.difference(startTime);

          print('✅ [HTTP] Response Received');
          print('📜 Status Code: ${response.statusCode}');
          print('⏳ Duration: ${duration.inMilliseconds} ms');
          print('📥 Response Body: ${response.body}');
        }
      }
    } catch (error) {
      if (kDebugMode) {
        print('❌ [HTTP] Request Failed');
        print('⚠️ Error: $error');
      }

      rethrow;
    }
    // if (useCookie == true) {
    //   // update cookie
    //   await setCookie(
    //       uid,
    //       response.headers['set-cookie']
    //               ?.split(",")
    //               .map((cookie) => cookie.split(';')[0].trim())
    //               .join(';') ??
    //           cookiesText ??
    //           '');
    // }

    if ([429, 503, 403].contains(response.statusCode)) {
      // return Future.error(response);
      final error = CaptchaRequiredException(getService(uid));

      // // required captcha resolve
      showCaptchaResolve(null, url: url, error: error);
      // try {
      //   final start = DateTime.now();
      //   final data = await createWebView(uri)
      //       .fetch(url: url, headers: headers, body: body);

      //   debugPrint(
      //       'Future completed in ${DateTime.now().difference(start).inMilliseconds} milliseconds');
      //   return data;
      // } catch (err) {
      //   debugPrint('Error: $err');
      return Future.error(error);
      // }
    }

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to load data');
    }
  }

  /// Parses the provided HTML string into a [Document] object.
  ///
  /// [html] The HTML string to parse.
  ///
  /// Returns a parsed [Document] object.
  d.Document parseDocument(String html) {
    return parse(html);
  }

  /// Fetches a document from the provided URL.
  ///
  /// [url] The URL of the document to fetch.
  ///
  /// [cookie] The cookie to include in the request. Defaults to null.
  ///
  /// Returns a parsed [Document] object.
  Future<d.Document> fetchDocument(
    String url, {
    String? cookie,
    Map<String, dynamic>? body,
    Map<String, String>? headers,
  }) async {
    return parseDocument(
      await fetch(url, cookie: cookie, body: body, headers: headers),
    );
  }

  /// Builds a new URI with updated query parameters based on the provided filters.
  ///
  /// [baseUrl] The base URL to which the query parameters should be added.
  ///
  /// [filters] A map where keys are parameter names and values are lists of parameter values.
  ///
  /// Returns a new [Uri] with the query parameters from [filters] applied.
  Uri buildQueryUri(String baseUrl, {Map<String, List<String>?>? filters}) {
    final uri = Uri.parse(baseUrl);

    final existingParameters = Map<String, List<String>>.from(
      uri.queryParametersAll,
    );

    filters?.forEach((key, value) {
      if (value != null && value.isNotEmpty) {
        existingParameters[key] = value;
      }
    });

    final newUri = uri.replace(
      queryParameters: existingParameters.map(
        (k, v) => MapEntry(k, v.join(',')),
      ),
    );

    return newUri;
  }

  /// After a successful sign in, this function is called to update the cookie and other relevant information in the cache.
  ///
  /// This function is called by [AuthMixin] after a successful sign in.
  ///
  /// [cookie] The cookie to save to the cache. Must not be null.
  ///
  /// Returns the [User] object of the user who has just signed in.
  Future<User> onAfterSignIn({required String cookie}) async {
    if (this is! AuthMixin) {
      throw Exception('Service must be an instance of auth service');
    }

    final service = this as AuthMixin;
    // save to cache
    final ServiceSetting oldData =
        await ServiceSettingController.getAsync(sourceId: uid) ??
            ServiceSetting(
              sourceId: uid,
              settings: null,
              userDataCache: null,
              createdAt: DateTime.now(),
              updatedAt: DateTime.now(),
            );
    try {
      final user = await service.getUser(cookie: cookie);
      final jsonNewUserData = jsonEncode(user.toJson());

      if (oldData.userDataCache != jsonNewUserData) {
        oldData.userDataCache = jsonNewUserData;
      }

      final currentSettings =
          await ServiceSettingController.getSettingsAsync(sourceId: uid) ?? {};

      currentSettings['cookie'] = cookie;

      oldData.settings = jsonEncode(currentSettings);
      oldData.updatedAt = DateTime.now();

      _userFuture = Future.value(user);

      await ServiceSettingController.save(oldData);

      return user;
    } on UserNotFoundException catch (_) {
      final currentSettings =
          await ServiceSettingController.getSettingsAsync(sourceId: uid) ?? {};

      currentSettings['cookie'] = cookie;
      oldData.userDataCache = null;
      oldData.settings = jsonEncode(currentSettings);
      oldData.updatedAt = DateTime.now();

      await ServiceSettingController.save(oldData);

      rethrow;
    }
  }

  Future<User> fetchUser({ServiceSetting? row, bool? recordLoaded}) async {
    return _userFuture ??= _fetchUser(record: row, recordLoaded: recordLoaded);
  }

  Future<User> _fetchUser({ServiceSetting? record, bool? recordLoaded}) async {
    if (this is! AuthMixin) {
      throw Exception('Service must be an instance of AuthMixin');
    }
    final service = this as AuthMixin;

    record = recordLoaded == true
        ? record
        : await ServiceSettingController.getAsync(sourceId: uid);
    final settings = jsonDecode(record?.settings ?? '{}');
    final cookie = settings is Map ? settings['cookie'] : null;
    var user = record?.userDataCache;

    try {
      if (cookie == null) throw UserNotFoundException();
      // if (user == null) {
      user = jsonEncode((await service.getUser(cookie: cookie)).toJson());

      record ??= ServiceSetting(
        sourceId: uid,
        settings: null,
        userDataCache: null,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      record.userDataCache = user;

      await ServiceSettingController.save(record);
      // }

      return User.fromJson(jsonDecode(user));
    } on UserNotFoundException catch (_) {
      if (record != null) {
        Map settings;
        try {
          settings = jsonDecode(record.settings ?? '{}');
        } catch (err) {
          settings = {};
        }

        settings['cookie'] = cookie;

        record.userDataCache = null;

        await ServiceSettingController.save(record);
      }

      rethrow;
    }
  }
}
