// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hoyomi/controller/cookie.dart';
import 'package:hoyomi/core_services/exception/user_not_found_exception.dart';
import 'package:hoyomi/core_services/interfaces/user.dart';
import 'package:hoyomi/core_services/main.dart';
import 'package:hoyomi/core_services/mixin/auth_mixin.dart';
import 'package:hoyomi/core_services/service.dart';
import 'package:hoyomi/database/scheme/cookie_manager.dart';
import 'package:hoyomi/errors/captcha_required_exception.dart';
import 'package:html/dom.dart' as d;
import 'package:html/parser.dart';
import 'package:http/http.dart';

import 'package:hoyomi/apis/show_snack_bar.dart';
import 'package:hoyomi/router/index.dart';

abstract class UtilsService {
  String get name;
  String get uid => name.toLowerCase().replaceAll(r"\s", "-");
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
                Icon(
                  MaterialCommunityIcons.earth,
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
                await router.push('/signin/${service!.uid}');
                router.refresh();
              },
            ),
          ],
        ),
      );
    }

    return orElse(error);
  }

  /// Called before inserting the cookie to the insert request. Override this method to modify the cookie
  /// before it is inserted. The default implementation simply returns the original cookie.
  ///
  /// [cookie] The cookie to be inserted.
  ///
  /// Returns the modified cookie.
  String? onBeforeInsertCookie(String? cookie) {
    return cookie;
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
    String? cookiesText = cookie;

    final row = await CookieController.getAsync(sourceId: uid);
    if (cookie == null) {
      cookiesText = row?.cookie;
    }

    cookiesText = onBeforeInsertCookie(cookiesText);

    final uri = Uri.parse(url);
    final $headers = {
      'accept':
          'text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7',
      'accept-language': 'vi',
      'cache-control': 'no-cache',
      'cookie': cookiesText ?? '',
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
      'user-agent': // row?.userAgent ??
          'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36',
    };

    Response response =
        body == null
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
  /// [userAgent] The user agent to save to the cache. Must not be null.
  ///
  /// Returns the [User] object of the user who has just signed in.
  Future<User> onAfterSignIn({
    required String cookie,
    required String userAgent,
  }) async {
    if (this is! AuthMixin) {
      throw Exception('Service must be an instance of auth service');
    }

    final service = this as AuthMixin;
    // save to cache
    final oldData =
        await CookieController.getAsync(sourceId: uid) ??
        CookieManager(
          sourceId: uid,
          cookie: cookie,
          userAgent: userAgent,
          user: null, // jsonEncode(user.toJson()),
          createdAt: DateTime.now(),
          userUpdatedAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );
    try {
      final user = await service.getUser(cookie: cookie);

      if (oldData.user != jsonEncode(user.toJson())) {
        oldData.userUpdatedAt = DateTime.now();
      }

      oldData
        ..cookie = cookie
        ..userAgent = userAgent
        ..user = jsonEncode(user.toJson())
        ..updatedAt = DateTime.now();

      _userFuture = Future.value(user);

      await CookieController.save(oldData);

      return user;
    } on UserNotFoundException catch (_) {
      oldData.cookie = cookie;
      oldData.user = null;

      await CookieController.save(oldData);

      rethrow;
    }
  }

  Future<User> fetchUser({CookieManager? row, bool? recordLoaded}) async {
    return _userFuture ??= _fetchUser(row: row, recordLoaded: recordLoaded);
  }

  Future<User> _fetchUser({CookieManager? row, bool? recordLoaded}) async {
    if (this is! AuthMixin) {
      throw Exception('Service must be an instance of AuthMixin');
    }
    final service = this as AuthMixin;

    row =
        recordLoaded == true
            ? row
            : await CookieController.getAsync(sourceId: uid);
    final cookie = row?.cookie;
    var user = row?.user;

    try {
      if (cookie == null) throw UserNotFoundException();
      // if (user == null) {
      user = jsonEncode((await service.getUser(cookie: cookie)).toJson());

      row ??= CookieManager(
        sourceId: uid,
        cookie: cookie,
        userAgent: null,
        user: user,
        createdAt: DateTime.now(),
        userUpdatedAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      row.user = user;

      await CookieController.save(row);
      // }

      return User.fromJson(jsonDecode(user));
    } on UserNotFoundException catch (_) {
      if (row != null) {
        row.cookie = cookie;
        row.user = null;

        await CookieController.save(row);
      }

      rethrow;
    }
  }
}
