import 'dart:async';
import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hoyomi/controller/service_settings_controller.dart';
import 'package:hoyomi/core_services/exception/user_not_found_exception.dart';
import 'package:hoyomi/core_services/main.dart';
import 'package:hoyomi/core_services/mixin/auth_mixin.dart';
import 'package:hoyomi/database/scheme/service_settings.dart';
import 'package:hoyomi/errors/captcha_required_exception.dart';
import 'package:hoyomi/plugins/create_dio_client.dart';
import 'package:hoyomi/utils/d_query.dart';
import 'package:html/parser.dart';

import 'package:hoyomi/apis/show_snack_bar.dart';
import 'package:hoyomi/router/index.dart';
import 'package:hoyomi/widgets/iconify.dart';
import 'package:iconify_flutter/icons/mdi.dart';

import 'interfaces/main.dart';

Dio? _dio;

class ServiceInit {
  final String name;
  final String? uid;
  final OImage faviconUrl;
  final String rootUrl;
  final String? rss;
  final List<SettingField>? settings;
  final List<WebRule>? webRules;

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
    this.rss,
    this.settings,
    this.onBeforeInsertCookie,
    this.webRules,
  });
}

mixin _SettingsMixin {
  String get uid;
  ServiceInit get init;
  ServiceSettings? _serviceSettings;
  bool _stateReady = false;

  Future<void> initState() async {
    if (_stateReady) return;
    _stateReady = true;

    _serviceSettings = await ServiceSettingsController.instance.get(uid);
    _initSettings();
  }

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
    return _serviceSettings?.settings?[key];
  }

  Future<void> setSetting(String name, String value) async {
    var record =
        _serviceSettings ??
        ServiceSettings(
          sourceId: uid,
          settings: null,
          userDataCache: null,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

    try {
      record = record.copyWith(
        settings: {
          if (record.settings != null) ...record.settings!,
          name: value,
        },
      );
    } catch (err) {
      record = record.copyWith(settings: {name: value});
    }

    _serviceSettings = record;

    await ServiceSettingsController.instance.save(uid, record);
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
      defaultFn:
          (service) =>
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

  final Map<String, ({DateTime? expire, Future<String> response})> _cacheFetch =
      {};

  String get baseUrl {
    return getSetting(key: 'url') ?? init.rootUrl;
  }

  String get name => init.name;
  @override
  String get uid => init.uid ?? name.toLowerCase().replaceAll(r'\s', '-');
  OImage? _faviconUrl;
  OImage get faviconUrl =>
      _faviconUrl ??= OImage(
        src: Uri.parse(baseUrl).resolve(init.faviconUrl.src).toString(),
        headers: init.faviconUrl.headers,
      );
  String? _rss;
  String? get rss =>
      _rss ??=
          init.rss == null
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
    debugPrint('$error');
    if (error is CaptchaRequiredException) {
      return Padding(
        padding:
            isSnackbar
                ? EdgeInsets.zero
                : EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Iconify(
                  Mdi.earth,
                  color:
                      isSnackbar || context == null
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
        padding:
            isSnackbar
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

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        orElse(error),
        // button refresh page
        ElevatedButton(
          child: Text('Refresh'),
          onPressed: () => router.refresh(),
        ),
      ],
    );
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
    Map<String, dynamic>? query,
    Map<String, dynamic>? body,
    Headers? headers,
  }) async {
    final record = await ServiceSettingsController.instance.get(uid);
    String? cookiesText = cookie ?? record?.settings?['cookie'] as String?;

    cookiesText = init.onBeforeInsertCookie?.call(cookiesText) ?? cookiesText;

    var uri = Uri.parse(url);
    if (query != null) {
      uri = uri.replace(queryParameters: {...uri.queryParametersAll, ...query});
    }
    final $headers = Headers({
      'accept':
          'text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7',
      'accept-language': 'vi',
      'cache-control': 'no-cache',
      if (cookiesText != null) 'cookie': cookiesText,
      'pragma': 'no-cache',
      // 'priority': 'u=0, i',
      'host': uri.host,

      // 'upgrade-insecure-requests': '1',
      'user-agent':
          record?.settings?['user_agent'] as String? ??
          'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36',
      if (headers != null) ...headers.toMap(),
    });

    final DateTime? startTime = kDebugMode ? DateTime.now() : null;
    if (kDebugMode) {
      print('🔵 [HTTP] Request Started');
      print('➡️ URL: $uri');
      print('📩 Cookie: ${$headers.get('cookie')}');

      if (body != null) {
        final filteredBody = Map.fromEntries(
          body.entries
              .where((entry) => entry.value != null)
              .map(
                (entry) => MapEntry(
                  entry.key,
                  entry.value is String ? entry.value : entry.value.toString(),
                ),
              ),
        );

        print('📦 Body: $filteredBody');
      }
    }

    late final Response response;
    try {
      response = await (_dio ??= await createDioClient(
            BaseOptions(
              responseType: ResponseType.plain,
              followRedirects: true,
            ),
          ))
          .fetch(
            RequestOptions(
              path: uri.toString(),
              method: body == null ? 'GET' : 'POST',
              data: body,
              headers: $headers.toMap(),
            ),
          );

      if (kDebugMode) {
        if (startTime != null) {
          final DateTime endTime = DateTime.now();
          final Duration duration = endTime.difference(startTime);

          print('✅ [HTTP] Response Received');
          print('📜 Status Code: ${response.statusCode}');
          print('⏳ Duration: ${duration.inMilliseconds} ms');

          print('📥 Response Cookie: ${response.headers['set-cookie']}');
        }
      }
    } on DioException catch (error) {
      if ([429, 503, 403].contains(error.response?.statusCode)) {
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
      rethrow;
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
    //               ?.split(',')
    //               .map((cookie) => cookie.split(';')[0].trim())
    //               .join(';') ??
    //           cookiesText ??
    //           '');
    // }

    if (response.statusCode == 200) {
      return response.data.toString();
    } else {
      debugPrint('Error: ${response.statusMessage}');
      throw response;
    }
  }

  Future<String> fetchWithCache(
    String url, {
    Duration? expires,
    String? cookie,
    Map<String, dynamic>? query,
    Map<String, dynamic>? body,
    Headers? headers,
  }) async {
    final uid =
        sha256
            .convert(
              utf8.encode(
                '$url|$cookie|${jsonEncode(query)}|${body == null ? '' : jsonEncode(body)}|${headers == null ? '' : jsonEncode(headers)}',
              ),
            )
            .toString();

    final inStore = _cacheFetch[uid];
    if (inStore != null &&
        (inStore.expire == null ||
            inStore.expire!.second > DateTime.now().second)) {
      return inStore.response;
    }

    final expiresIn = expires == null ? null : DateTime.now().add(expires);
    final response = fetch(
      url,
      cookie: cookie,
      query: query,
      body: body,
      headers: headers,
    )..catchError((error) {
      _cacheFetch.remove(uid);
      throw error;
    });
    _cacheFetch[uid] = (expire: expiresIn, response: response);

    return response;
  }

  DollarFunction parse$(String html) {
    final document = parse(html);
    return DQuery.fromDocument(document);
  }

  Future<DollarFunction> fetch$(
    String url, {
    String? cookie,
    Map<String, dynamic>? query,
    Map<String, dynamic>? body,
    Headers? headers,
  }) async {
    return parse$(
      await fetch(
        url,
        cookie: cookie,
        query: query,
        body: body,
        headers: headers,
      ),
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
    var currentServiceSettings =
        await ServiceSettingsController.instance.get(uid) ??
        ServiceSettings(
          sourceId: uid,
          settings: null,
          userDataCache: null,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );
    var currentSettings = currentServiceSettings.settings ?? {};

    try {
      final user = await service.getUser(cookie: cookie);
      final jsonNewUserData = jsonEncode(user.toJson());

      if (currentServiceSettings.userDataCache != jsonNewUserData) {
        currentServiceSettings = currentServiceSettings.copyWith(
          userDataCache: jsonNewUserData,
        );
      }

      currentSettings = {...currentSettings, 'cookie': cookie};

      currentServiceSettings = currentServiceSettings.copyWith(
        settings: currentSettings,
        updatedAt: DateTime.now(),
      );

      _userFuture = Future.value(user);

      await ServiceSettingsController.instance.save(
        uid,
        currentServiceSettings,
      );

      return user;
    } on UserNotFoundException catch (_) {
      currentSettings = {...currentSettings, 'cookie': cookie};

      currentServiceSettings = currentServiceSettings.copyWith(
        userDataCache: null,
        settings: currentSettings,
        updatedAt: DateTime.now(),
      );

      await ServiceSettingsController.instance.save(
        uid,
        currentServiceSettings,
      );

      rethrow;
    }
  }

  Future<User> fetchUser({ServiceSettings? row, bool? recordLoaded}) async {
    return _userFuture ??= _fetchUser(
      record: row,
      recordLoaded: recordLoaded,
    ).catchError((error) {
      _userFuture = null;
      throw error;
    });
  }

  Future<User> _fetchUser({ServiceSettings? record, bool? recordLoaded}) async {
    if (this is! AuthMixin) {
      throw Exception('Service must be an instance of AuthMixin');
    }
    final service = this as AuthMixin;

    record =
        recordLoaded == true
            ? record
            : await ServiceSettingsController.instance.get(uid);
    final settings = record?.settings ?? {};
    final cookie = settings['cookie'] as String?;
    var user = record?.userDataCache;

    try {
      if (cookie == null) throw UserNotFoundException();
      // if (user == null) {
      user = jsonEncode((await service.getUser(cookie: cookie)).toJson());

      record ??= ServiceSettings(
        sourceId: uid,
        settings: null,
        userDataCache: null,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      record = record.copyWith(userDataCache: user);

      await ServiceSettingsController.instance.save(uid, record);
      // }

      return User.fromJson(jsonDecode(user));
    } on UserNotFoundException catch (_) {
      if (record != null) {
        var settings = record.settings ?? {};
        settings = {...settings, 'cookie': cookie};

        record = record.copyWith(settings: settings, userDataCache: null);

        await ServiceSettingsController.instance.save(uid, record);
      }

      rethrow;
    }
  }
}
