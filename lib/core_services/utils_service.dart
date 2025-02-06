// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart' as inappwebview;
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hoyomi/controller/cookie.dart';
import 'package:hoyomi/core_services/exception/user_not_found_exception.dart';
import 'package:hoyomi/core_services/interfaces/basic_user.dart';
import 'package:hoyomi/core_services/main.dart';
import 'package:hoyomi/core_services/mixin/base_auth_mixin.dart';
import 'package:hoyomi/database/scheme/cookie_manager.dart';
import 'package:hoyomi/errors/captcha_required_exception.dart';
import 'package:html/dom.dart' as d;
import 'package:html/parser.dart';
import 'package:http/http.dart';

import 'package:hoyomi/globals.dart';
import 'package:hoyomi/router/index.dart';

class StackWebView {
  int _i = 0;
  bool _isFirstInit = true;

  final Map<int, Completer<dynamic>?> _stack = {};
  final Map<int, List<dynamic>?> _params = {};

  Future<inappwebview.InAppWebViewController>? _controllerFuture;
  inappwebview.InAppWebViewController? _controller;

  StackWebView({
    required String host,
  }) {
    debugPrint("[headless_webview]: create new page for $host");
    var promise = Completer<inappwebview.InAppWebViewController>();
    _controllerFuture = promise.future;

    inappwebview.HeadlessInAppWebView(
        initialSettings: inappwebview.InAppWebViewSettings(
            javaScriptEnabled: false,
            mediaPlaybackRequiresUserGesture: true,
            allowsInlineMediaPlayback: false,
            blockNetworkImage: true,
            blockNetworkLoads: true,
            loadsImagesAutomatically: false,
            supportMultipleWindows: true,
            javaScriptCanOpenWindowsAutomatically: false),
        // initialData: inappwebview.InAppWebViewInitialData(
        //     data: """ui""", baseUrl: inappwebview.WebUri(host)),
        initialUrlRequest: inappwebview.URLRequest(
            url: inappwebview.WebUri("https://$host/404.htmlx")),
        onWebViewCreated: (controller) {
          controller.addJavaScriptHandler(
              handlerName: 'fetch_done',
              callback: (arguments) async {
                if ([429, 503, 403].contains(arguments[2])) {
                  // re build stack because cloudflare;

                  promise = Completer<inappwebview.InAppWebViewController>();
                  await controller.evaluateJavascript(
                      source: "location.reload()");
                  return;
                }
                // future resolve

                _stack[arguments[0]]?.complete(arguments[1]);
                _stack[arguments[0]] = null;
                _params[arguments[0]] = null;
              });
          controller.addJavaScriptHandler(
              handlerName: 'fetch_err',
              callback: (arguments) {
                _stack[arguments[0]]?.completeError(arguments[1] as String);
                _stack[arguments[0]] = null;
                _params[arguments[0]] = null;
              });
        },
        onLoadStop: (controller, uri) async {
          if (promise.isCompleted) return;
          await Future.doWhile(() async {
            return await controller.evaluateJavascript(
                    source:
                        "document.head.innerHTML.includes('#challenge-success-text')") ==
                true;
          });

          promise.complete(controller);
          debugPrint("[headless_webview]: created controller");
          _controllerFuture = null;
          _controller = controller;

          if (!_isFirstInit) {
            _restartStack();
          } else {
            _isFirstInit = false;
          }

          // controller.loadUrl(
          //     urlRequest: inappwebview.URLRequest(
          //         url: inappwebview.WebUri.uri(Uri.parse('https://$host'))));
        },
        onReceivedError: (controller, request, error) async {
          if (promise.isCompleted) return;
          await Future.doWhile(() async {
            return await controller.evaluateJavascript(
                    source:
                        "document.head.innerHTML.includes('#challenge-success-text')") ==
                true;
          });

          promise.complete(controller);
          debugPrint("[headless_webview]: created controller");
          _controllerFuture = null;
          _controller = controller;

          if (!_isFirstInit) {
            _restartStack();
          } else {
            _isFirstInit = false;
          }
        },
        // shouldOverrideUrlLoading: (controller, navigation) async {
        //   if (!navigation.isForMainFrame) {
        //     return inappwebview.NavigationActionPolicy.CANCEL;
        //   }
        //   return null;
        // },
        onConsoleMessage: (controller, message) {
          debugPrint("[webview_console]: $message");
        }).run();
  }

  Future<inappwebview.InAppWebViewController> _getController() async {
    assert(_controller != null || _controllerFuture != null);

    if (_controller != null) return _controller!;

    return _controller = await _controllerFuture!;
  }

  Future<dynamic> _startStackItem(int id) async {
    final controller = await _getController();

    final url = _params[id]![0];
    final headers = _params[id]![1];
    final body = _params[id]![2];

    _stack[id] ??= Completer<dynamic>();
    Timer.periodic(Duration(seconds: 60), (_) {
      _stack[id]?.completeError(Exception('Timeout'));
      _stack[id] = null;
      _params[id] = null;
    });

    await controller.evaluateJavascript(source: """
fetch(${jsonEncode(url)}, { method: "${body == null ? "get" : "post"}", headers: ${jsonEncode(headers)}, body: ${jsonEncode(body)} })
.then(async response => {
  const buffer = await response.text();

  // let binaryString = "";
  // for (let i = 0; i < buffer.length; i++)
    // binaryString += String.fromCharCode(buffer[i]);

  const data =buffer// btoa(binaryString);
  const {status, statusText, headers} = response

  window.flutter_inappwebview.callHandler("fetch_done", $id, data, status, statusText, Array.from(headers.entries()))
})
.catch(err => {
  window.flutter_inappwebview.callHandler("fetch_err", $id, err + "")
})

""");
    // final

    return _stack[id]!.future;
  }

  void _restartStack() {
    for (final key in _params.keys) {
      _startStackItem(key);
    }
  }

  fetch(
      {required String url,
      Map<String, dynamic>? body,
      Map<String, String>? headers}) async {
    final $headers = {
      'accept-encoding': '*',
      'cache-control': 'no-cache',
      'pragma': 'no-cache',
      'priority': 'u=0, i',
      'sec-ch-ua':
          '"Google Chrome";v="131", "Chromium";v="131", "Not_A Brand";v="24"',
      'sec-ch-ua-mobile': '?0',
      'sec-ch-ua-platform': '"Windows"',
      'sec-fetch-dest': 'document',
      'sec-fetch-mode': 'navigate',
      'sec-fetch-site': 'none',
      'sec-fetch-user': '?1',
      'sec-gpc': '1',
      'upgrade-insecure-requests': '1',
      'user-agent':
          'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36',
      ...headers ?? {}
    };

    final id = _i++;

    _params[id] = [url, $headers, body];

    return _startStackItem(id);
  }
}

final Map<String, StackWebView> _stackWebViewStore = {};
StackWebView createWebView(Uri uri) {
  return _stackWebViewStore[uri.host] ??= StackWebView(host: uri.host);
}

abstract class UtilsService {
  String get name;
  String get uid => name.toLowerCase().replaceAll(r"\s", "-");
  Future<BasicUser>? _userFuture;

  static void showCaptchaResolve(BuildContext? context,
      {String? url, required CaptchaRequiredException error}) {
    showSnackBar(errorWidgetBuilder(context,
        isSnackbar: true,
        url: url,
        error: error,
        orElse: (error) => Text('An error occurred: $error')));
  }

  static Widget errorWidgetBuilder(BuildContext? context,
      {bool isSnackbar = false,
      String? url,
      required Object? error,
      required Widget Function(Object? error) orElse}) {
    return error is! CaptchaRequiredException
        ? orElse(error)
        : Padding(
            padding: isSnackbar
                ? EdgeInsets.zero
                : EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Icon(MaterialCommunityIcons.earth,
                          color: isSnackbar || context == null
                              ? Colors.black
                              : Theme.of(context).colorScheme.onSurface),
                      SizedBox(width: 8),
                      Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                            Text('Please resolve Captcha to continue.'),
                            if (url != null)
                              Text(url,
                                  style: TextStyle(fontSize: 14.0),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis)
                          ]))
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
                ]));
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
  Future<String> fetch(String url,
      {String? cookie,
      Map<String, dynamic>? body,
      Map<String, String>? headers}) async {
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
          'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'
    };

    Response response = body == null
        ? await get(uri, headers: $headers)
        : await post(uri,
            headers: $headers,
            body: Map.fromEntries(body.entries
                .where((entry) => entry.value != null)
                .toList()
                .map((entry) {
              if (entry.value is String) {
                return entry;
              } else {
                return MapEntry(entry.key, entry.value.toString());
              }
            })));
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
      final error = CaptchaRequiredException(getBaseService(uid));

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
  Future<d.Document> fetchDocument(String url,
      {String? cookie,
      Map<String, dynamic>? body,
      Map<String, String>? headers}) async {
    return parseDocument(
        await fetch(url, cookie: cookie, body: body, headers: headers));
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

    final existingParameters =
        Map<String, List<String>>.from(uri.queryParametersAll);

    filters?.forEach((key, value) {
      if (value != null && value.isNotEmpty) {
        existingParameters[key] = value;
      }
    });

    final newUri = uri.replace(
      queryParameters:
          existingParameters.map((k, v) => MapEntry(k, v.join(','))),
    );

    return newUri;
  }

  /// After a successful sign in, this function is called to update the cookie and other relevant information in the cache.
  ///
  /// This function is called by [BaseAuthMixin] after a successful sign in.
  ///
  /// [cookie] The cookie to save to the cache. Must not be null.
  ///
  /// [userAgent] The user agent to save to the cache. Must not be null.
  ///
  /// Returns the [BasicUser] object of the user who has just signed in.
  Future<BasicUser> onAfterSignIn(
      {required String cookie, required String userAgent}) async {
    if (this is! BaseAuthMixin) {
      throw Exception('Service must be an instance of auth service');
    }

    final service = this as BaseAuthMixin;
    // save to cache
    final oldData = await CookieController.getAsync(sourceId: uid) ??
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

  Future<BasicUser> fetchUser({CookieManager? row, bool? recordLoaded}) async {
    return _userFuture ??= _fetchUser(row: row, recordLoaded: recordLoaded);
  }

  Future<BasicUser> _fetchUser({CookieManager? row, bool? recordLoaded}) async {
    if (this is! BaseAuthMixin) {
      throw Exception('Service must be an instance of BaseAuthMixin');
    }
    final service = this as BaseAuthMixin;

    row = recordLoaded == true
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

      return BasicUser.fromJson(jsonDecode(user));
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
