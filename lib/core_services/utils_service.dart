import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:honyomi/globals.dart';
import 'package:honyomi/models/cookie_manager.dart';
import 'package:honyomi/objectbox.g.dart';
import 'package:honyomi/plugins/objectbox.dart';
import 'package:honyomi/router/index.dart';
import 'package:html/dom.dart' as d;
import 'package:html/parser.dart';
import 'package:http/http.dart';

abstract class UtilsService {
  String get name;
  String get uid => name.toLowerCase().replaceAll(r"\s", "-");

  /// Called before inserting the cookie to the insert request. Override this method to modify the cookie
  /// before it is inserted. The default implementation simply returns the original cookie.
  ///
  /// [cookie] The cookie to be inserted.
  ///
  /// Returns the modified cookie.
  String? onBeforeInsertCookie(String? cookie) {
    return cookie;
  }

  void showCaptchaResolve(BuildContext? context, {String? url}) {
    showSnackBar(templateCaptchaResolver(context, isSnackbar: true, url: url));
  }

  Widget templateCaptchaResolver(BuildContext? context,
      {bool isSnackbar = false, String? url}) {
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
                  Icon(MaterialCommunityIcons.earth,
                      color: isSnackbar || context == null
                          ? Colors.black
                          : Theme.of(context).colorScheme.onSurface),
                  SizedBox(width: 8),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Please resolve Captcha to continue.'),
                        if (url != null)
                          Text(url,
                              style: TextStyle(fontSize: 14.0),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis)
                      ])
                ],
              ),
              SizedBox(height: 8.0),
              ElevatedButton(
                child: Text('Go to Captcha'),
                onPressed: () async {
                  await router.push('/webview/$uid');
                  router.refresh();
                },
              ),
            ]));
  }

  bool isCaptchaError(dynamic error) {
    return '$error' == 'Captcha required';
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

    if (cookie == null) {
      final row = await objectBox.store
          .box<CookieManager>()
          .query(CookieManager_.uid.equals(uid))
          .build()
          .findFirstAsync();
      cookiesText = row?.cookie;
    }

    cookiesText = onBeforeInsertCookie(cookiesText);

    final uri = Uri.parse(url);
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
      'cookie': cookiesText ?? '',
      'user-agent':
          'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36',
      ...headers ?? {}
    };

    Response response = body == null
        ? await get(uri, headers: $headers)
        : await post(uri, headers: $headers, body: body);
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
      // required captcha resolve
      showCaptchaResolve(null, url: url);
      return Future.error('Captcha required');
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
}
