import 'dart:async';
import 'dart:convert';

import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hoyomi/controller/service_settings_controller.dart';
import 'package:hoyomi/core_services/exception/user_not_found_exception.dart';
import 'package:hoyomi/core_services/main.dart';
import 'package:hoyomi/core_services/mixin/export.dart';
import 'package:hoyomi/database/scheme/service_settings.dart';
import 'package:hoyomi/core_services/exception/captcha_required_exception.dart';
import 'package:hoyomi/plugins/create_dio_client.dart';
import 'package:hoyomi/utils/d_query.dart';
import 'package:html/parser.dart';

import 'package:hoyomi/constraints/x_platform.dart';
import 'package:hoyomi/router/index.dart';
import 'package:http_cache_file_store/http_cache_file_store.dart';
import 'package:kaeru/kaeru.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import 'interfaces/export.dart';

Dio? _dioCache;
Future<Dio> _createDioClientCache() async {
  if (_dioCache != null) return _dioCache!;

  final options = CacheOptions(
    // A default store is required for interceptor.
    store:
        kIsWeb
            ? MemCacheStore()
            : FileCacheStore(
              join((await getTemporaryDirectory()).path, 'dio_cache_service'),
            ),

    // All subsequent fields are optional to get a standard behaviour.

    // Default.
    // policy: CachePolicy.forceCache,
    // Returns a cached response on error for given status codes.
    // Defaults to `[]`.
    hitCacheOnErrorCodes: const [500],
    // Allows to return a cached response on network errors (e.g. offline usage).
    // Defaults to `false`.
    hitCacheOnNetworkFailure: true,
    // Overrides any HTTP directive to delete entry past this duration.
    // Useful only when origin server has no cache config or custom behaviour is desired.
    // Defaults to `null`.
    maxStale: const Duration(hours: 5),
    // Default. Allows 3 cache sets and ease cleanup.
    priority: CachePriority.normal,
    // Default. Body and headers encryption with your own algorithm.
    cipher: null,
    // Default. Key builder to retrieve requests.
    keyBuilder: CacheOptions.defaultCacheKeyBuilder,
    // Default. Allows to cache POST requests.
    // Assigning a [keyBuilder] is strongly recommended when `true`.
    allowPostMethod: false,
  );

  _dioCache = await createDioClient(
      BaseOptions(responseType: ResponseType.plain, followRedirects: true), // only followRedirects for web
      followRedirects: false, // this skip followRedirects in io
    )
    ..interceptors.add(DioCacheInterceptor(options: options));

  return _dioCache!;
}

Dio? _dio;
Future<Dio> _createDioClient() async {
  if (_dio != null) return _dio!;

  _dio = await createDioClient(
    BaseOptions(responseType: ResponseType.plain, followRedirects: true),
  );

  return _dio!;
}

class ServiceInit {
  final String name;
  final String? uid;
  final OImage faviconUrl;
  final String rootUrl;
  final String Function()? captchaUrl;
  final String? rss;
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
    this.rss,
    this.settings,
    this.onBeforeInsertCookie,
    this.webRules,
    this.fetchHeadless = false,
    this.fetchBaseUrl,
  });
}

abstract class BaseService {
  final kIsWeb = XPlatform.isWeb;

  ServiceInit get init;
  String get uid => init.uid ?? name.toLowerCase().replaceAll(r'\s', '-');
  String get name => init.name;
  String get baseUrl;
}

abstract class Service extends BaseService
    with SettingsMixin, HeadlessMixin, CaptchaResolverMixin {
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

  final _user = Ref<User?>(null);
  final _error = Ref<String?>(null);
  final _fetching = Ref<bool>(true);

  bool _initUserData = false;

  @override
  String get baseUrl {
    return (getSetting(key: 'url') ?? init.rootUrl).replaceFirst(
      RegExp(r'/$'),
      '',
    );
  }

  OImage? _faviconUrl;
  OImage get faviconUrl =>
      _faviconUrl ??= OImage(
        src: Uri.parse(baseUrl).resolve(init.faviconUrl.src).toString(),
        headers: Headers({
          'referer': baseUrl,
        }).merge(init.faviconUrl.headers ?? Headers({})),
      );
  String? _rss;
  String? get rss =>
      _rss ??=
          init.rss == null
              ? null
              : Uri.parse(baseUrl).resolve(init.rss!).toString();

  String? _$fetchBaseUrl;
  String? get _fetchBaseUrl {
    if (init.fetchBaseUrl == null) return null;

    return _$fetchBaseUrl ??= init.fetchBaseUrl!.replaceFirst(
      '{BASE_URL}',
      baseUrl,
    );
  }

  final Map<String, ({DateTime? expire, Future<String> response})> _cacheFetch =
      {};
  late final Dio dioCache;
  late final Dio dio;

  bool _initialize = false;
  bool _tempHeadless = false;

  @override
  Future<void> initState() async {
    if (_initialize) return;
    _initialize = true;

    dioCache = await _createDioClientCache();
    dio = await _createDioClient();

    await super.initState();
  }

  Future<User>? _userFuture;
  static Widget errorWidgetBuilder(
    BuildContext? context, {
    bool isSnackbar = false,
    String? url,
    required Object? error,
    required StackTrace? trace,
    required Service? service,
    required Widget Function(Object? error) orElse,
  }) {
    if (kDebugMode) {
      print(error);
      print(trace);
    }

    if (error is CaptchaRequiredException) {
      return CaptchaResolverMixin.buildWidget(context, error: error, url: url);
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
                if (service is AuthMixin && !service.$noAuth) {
                  await router.push('/webview/${service.uid}');
                } else {
                  await router.pushNamed('sign_in_main');
                }
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
        // ElevatedButton(
        //   child: Text('Refresh'),
        //   onPressed: () => router.refresh(),
        // ),
        Opacity(opacity: 0.8, child: Text('Pull to refresh').fontSize(14)),
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
  Future<String> fetchRust(
    String url, {
    Map<String, dynamic>? body,
    required Headers headers,
    bool notify = true,
    bool cache = true,
  }) async {
    final DateTime? startTime = kDebugMode ? DateTime.now() : null;
    if (kDebugMode) {
      print('🔵 [HTTP] Request Started');
      print('➡️ URL: $url');
      print('📩 Cookie: ${headers.get('cookie')}');

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
      response = await (cache ? dioCache : dio).fetch(
        RequestOptions(
          path: url,
          method: body == null ? 'GET' : 'POST',
          data: body == null ? null : FormData.fromMap(body),
          responseType: ResponseType.plain,
          headers: headers.toMap(),
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
    } on DioException catch (error, trace) {
      if (error.response != null &&
          CaptchaResolverMixin.responseIsCaptchaResolve(error.response!)) {
        // return Future.error(response);
        _tempHeadless = true;
        final error = CaptchaRequiredException(getService(uid));

        // // required captcha resolve
        if (notify) {
          CaptchaResolverMixin.showSnackCaptcha(
            null,
            url: url,
            error: error,
            trace: trace,
          );
        }
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
    if (init.fetchHeadless || _tempHeadless) headless = init.fetchHeadless;

    final record = await ServiceSettingsController.instance.get(uid);
    String? cookiesText = cookie ?? record?.settings?['cookie'] as String?;

    cookiesText = init.onBeforeInsertCookie?.call(cookiesText) ?? cookiesText;

    var uri =
        _fetchBaseUrl == null
            ? Uri.parse(url)
            : Uri.parse(_fetchBaseUrl!).resolve(url);
    if (query != null) uri = query.joinTo(uri);

    final $headers = Headers({
      'accept':
          'text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7',
      // 'accept-language': 'vi',
      'cache-control': 'max-age=0',
      if (cookiesText != null) 'cookie': cookiesText,
      // 'pragma': 'no-cache',
      // 'priority': 'u=0, i',
      'host': uri.host,

      // 'upgrade-insecure-requests': '1',
      'user-agent':
          record?.settings?['user_agent'] as String? ??
          'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36',
      if (headers != null) ...headers.toMap(),
    });

    if (headless && !kIsWeb) {
      return fetchHeadless(
        uri.toString(),
        body: body,
        headers: $headers,
        notify: notify,
      );
    }

    return fetchRust(
      uri.toString(),
      body: body,
      headers: $headers,
      notify: notify,
      cache: cache,
    );
  }

  Future<String> fetchWithCache(
    String url, {
    Duration? expires,
    String? cookie,
    UrlSearchParams? query,
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
    UrlSearchParams? query,
    Map<String, dynamic>? body,
    Headers? headers,
    bool headless = false,
    bool cache = true,
  }) async {
    return parse$(
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
      _user.value = user;
      _error.value = null;
      _fetching.value = false;

      await ServiceSettingsController.instance.save(
        uid,
        currentServiceSettings,
      );

      return user;
    } on UserNotFoundException catch (err) {
      currentSettings = {...currentSettings, 'cookie': cookie};

      currentServiceSettings = currentServiceSettings.copyWith(
        userDataCache: null,
        settings: currentSettings,
        updatedAt: DateTime.now(),
      );

      _userFuture = Future.error(err);
      _user.value = null;
      _error.value = null;
      _fetching.value = false;

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

  /// auth utils
  ///
  Future<void> refreshUser() async {
    _initUserData = true;

    _fetching.value = true;
    _error.value = null;

    try {
      _user.value = await fetchUser();
    } on UserNotFoundException {
      _user.value = null;
    } catch (err) {
      _error.value = '$err';
      debugPrint('Error: $err (${StackTrace.current})');
    } finally {
      _fetching.value = false;
    }
  }

  void logout() async {
    await router.pushNamed(
      'webview',
      pathParameters: {'sourceId': uid},
      queryParameters: {'logout': 'true'},
    );

    try {
      await fetchUser();
      throw Exception('Logout failed');
    } on UserNotFoundException {
      _user.value = null;
      _error.value = null;
      _fetching.value = false;
    }
  }

  UserData getUserData() {
    if (!_initUserData) refreshUser();

    return UserData(user: _user, error: _error, fetching: _fetching);
  }
}

class UserData {
  final Ref<User?> user;
  final Ref<String?> error;
  final Ref<bool> fetching;

  const UserData({
    required this.user,
    required this.error,
    required this.fetching,
  });
}
