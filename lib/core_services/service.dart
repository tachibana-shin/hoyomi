import 'dart:async';
import 'dart:convert';

import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:event_bus/event_bus.dart';
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

import 'package:hoyomi/router/index.dart';
import 'package:http_cache_file_store/http_cache_file_store.dart';
import 'package:kaeru/kaeru.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import 'http_adapter/headless_webview_adapter.dart';
import 'interfaces/export.dart';
import 'base_service.dart';

export 'service_init.dart';

export 'package:hoyomi/rust/api/image/unscramble_image.dart';
export 'package:hoyomi/rust/api/image/unscramble_image_columns.dart';
export 'package:hoyomi/rust/api/image/unscramble_image_rows.dart';

Future<Dio> _createDioClientCache({
  String baseUrl = '',
  bool headless = false,
  bool followRedirects = true,
  required Service fromService,
}) async {
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

  if (!headless) {
    return await createDioClient(
        BaseOptions(
          baseUrl: baseUrl,
          responseType: ResponseType.plain,
          followRedirects: followRedirects,
        ), // only followRedirects for web
        followRedirects: followRedirects, // this skip followRedirects in io
      )
      ..interceptors.add(DioCacheInterceptor(options: options));
  }

  final dio =
      Dio(
          BaseOptions(
            baseUrl: baseUrl,
            responseType: ResponseType.plain,
            followRedirects: followRedirects,
          ),
        )
        ..httpClientAdapter = HeadlessWebViewAdapter(fromService)
        ..interceptors.add(DioCacheInterceptor(options: options));

  return dio;
}

class HeadlessModeChanged {}

abstract class Service extends BaseService
    with SettingsMixin, CaptchaResolverMixin {
  static final List<SettingField> settingsDefault = [
    FieldInput(
      name: 'URL',
      key: 'url',
      defaultValue: '{BASE_URL}',
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

  final String writeWith = 'dart';

  final _user = Ref<User?>(null);
  final _error = Ref<String?>(null);
  final _fetching = Ref<bool>(true);

  final bus = EventBus();

  bool _initUserData = false;

  @override
  String get baseUrl {
    final inSetting = getSetting(key: 'url');
    if (inSetting == null || inSetting.isEmpty) {
      return init.rootUrl.replaceFirst(RegExp(r'/$'), '');
    }

    return inSetting.replaceFirst(RegExp(r'/$'), '');
  }

  OImage? _faviconUrl;
  OImage get faviconUrl =>
      _faviconUrl ??= OImage(
        src: Uri.parse(baseUrl).resolve(init.faviconUrl.src).toString(),
        headers: Headers({
          'referer': baseUrl,
        }).merge(init.faviconUrl.headers ?? Headers({})),
      );
  String? _$fetchBaseUrl;
  String get _fetchBaseUrl {
    if (init.fetchBaseUrl == null) return baseUrl;

    return _$fetchBaseUrl ??= init.fetchBaseUrl!.replaceFirst(
      '{BASE_URL}',
      baseUrl,
    );
  }

  final Map<String, ({DateTime? expire, Future<String> response})> _cacheFetch =
      {};
  Dio? _dioCache;
  Dio? _dioHeadless;
  Future<Dio>? _dioHeadlessFuture;

  Dio get dioCache => headlessMode ? _dioHeadless! : _dioCache!;

  Future<Dio> getDioHeadless() {
    if (_dioHeadless != null) return Future.value(_dioHeadless);
    if (_dioHeadlessFuture != null) return _dioHeadlessFuture!;

    _dioHeadlessFuture = _createDioClientCache(
          baseUrl: _fetchBaseUrl,
          headless: true,
          fromService: this,
        )
        .then((dio) {
          _dioHeadless = dio;
          return dio;
        })
        .whenComplete(() {
          _dioHeadlessFuture = null;
        });

    return _dioHeadlessFuture!;
  }

  bool _initialize = false;
  bool _tempHeadless = false;

  @override
  Future<void> initState() async {
    if (_initialize) return;
    _initialize = true;

    if (headlessMode) {
      await getDioHeadless();
    } else {
      _dioCache = await _createDioClientCache(
        baseUrl: _fetchBaseUrl,
        fromService: this,
      );
    }

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
                  await router.pushNamed(
                    'webview',
                    pathParameters: {'sourceId': service.uid},
                  );
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
        Opacity(opacity: 0.8, child: Text('$trace', maxLines: 2).fontSize(12)),
      ],
    );
  }

  bool get headlessMode => init.fetchHeadless || _tempHeadless;

  Future<String> fetch(
    String url, {
    String? method,
    String? cookie,
    UrlSearchParams? query,
    Map<String, dynamic>? body,
    Headers? headers,
    bool notify = true,
    bool headless = false,
    bool cache = true,
  }) async {
    if (headlessMode) headless = true;

    if (!url.contains('://') && !url.startsWith('/')) url = '/$url';

    final record = await ServiceSettingsController.instance.get(uid);
    String? cookiesText = cookie ?? record?.settings?['cookie'] as String?;

    cookiesText =
        init.customCookie?.replaceFirst('{OLD_COOKIE}', cookiesText ?? '') ??
        cookiesText;

    // final host = Uri.tryParse(url)?.host ?? Uri.tryParse(_fetchBaseUrl)?.host;
    // print('Host = $host');
    final $headers = Headers({
      'accept':
          'text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7',
      // 'accept-language': 'vi',
      'cache-control': 'max-age=0',
      if (cookiesText != null) 'cookie': cookiesText,
      // 'pragma': 'no-cache',
      // 'priority': 'u=0, i',
      // if (host != null) 'host': host,

      // 'upgrade-insecure-requests': '1',
      'user-agent':
          record?.settings?['user_agent'] as String? ??
          'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36',
      if (headers != null) ...headers.toMap(),
    });

    if (headless && _dioHeadless == null) {
      await getDioHeadless();
    }

    final DateTime? startTime = kDebugMode ? DateTime.now() : null;
    if (kDebugMode) {
      print('🔵 [HTTP] Request Started');
      print('➡️ URL: $url');
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
      response = await dioCache.fetch(
        RequestOptions(
          baseUrl: _fetchBaseUrl,
          path: url,
          method: method ?? (body == null ? 'GET' : 'POST'),
          queryParameters: query?.toSingleMap(),
          data: body == null ? null : FormData.fromMap(body),
          responseType: ResponseType.plain,
          headers: {
            ...$headers.toMap(),
            if (!cache) ...{
              'Cache-Control': 'no-cache, no-store, must-revalidate',
              'Pragma': 'no-cache',
              'Expires': '0',
            },
          },
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
    } catch (error, trace) {
      if (!headlessMode) {
        _tempHeadless = true;
        bus.fire(HeadlessModeChanged());

        if (!kIsWeb && !headless) {
          return fetch(
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
      }

      if (error is DioException) {
        if (kDebugMode) {
          print('URL = ${error.response?.realUri.toString()}');
          print('Status = ${error.response?.statusCode}');
          print('Response = ${error.response?.data.toString()}');
        }

        if (error.response != null &&
            CaptchaResolverMixin.responseIsCaptchaResolve(error.response!)) {
          // return Future.error(response);
          final captchaError = CaptchaRequiredException(getService(uid));

          // // required captcha resolve
          if (notify) {
            CaptchaResolverMixin.showSnackCaptcha(
              null,
              url: url,
              error: captchaError,
              trace: trace,
            );
          }
          
          throw captchaError;
        }
        rethrow;
      }

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

    return response.data.toString();
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

  final _beforeUnmountCb = <VoidCallback>{};
  void onBeforeUnmount(VoidCallback cb) {
    _beforeUnmountCb.add(cb);
  }

  void dispose() {
    for (final cb in _beforeUnmountCb) {
      cb();
    }
    _beforeUnmountCb.clear();
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
