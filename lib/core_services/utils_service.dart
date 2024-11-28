import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:honyomi/globals.dart';
import 'package:honyomi/router/index.dart';
import 'package:honyomi/shared_preferences/cookie.dart';
import 'package:honyomi/shared_preferences/signed.dart';
import 'package:html/dom.dart' as d;
import 'package:html/parser.dart';
import 'package:http/http.dart';

abstract class UtilsService {
  String get name;
  String get uid => name.toLowerCase().replaceAll(r"\s", "-");

  void showCaptchaResolve(BuildContext? context) {
    showSnackBar(templateCaptchaResolver(context, isSnackbar: true));
  }

  Widget templateCaptchaResolver(BuildContext? context,
      {bool isSnackbar = false}) {
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
                  Text('Please resolve Captcha to continue.')
                ],
              ),
              SizedBox(height: 8.0),
              ElevatedButton(
                child: Text('Go to Captcha'),
                onPressed: () {
                  router.push('/webview/$uid');
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
  /// [useCookie] Whether to use the cookie from the database if no cookie is provided. Defaults to null.
  ///
  /// Returns a string containing the fetched data, or throws an exception if the request fails.
  Future<String> fetch(String url,
      {String? cookie,
      bool? useCookie,
      Map<String, dynamic>? body,
      Map<String, String>? headers}) async {
    String? cookiesText = cookie;

    if (cookie == null && useCookie == true) {
      if (await getSigned(uid) ?? false) {
        cookiesText = await getCookie(uid);
      }
    }

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
    if (useCookie == true) {
      // update cookie
      await setCookie(
          uid,
          response.headers['set-cookie']
                  ?.split(",")
                  .map((cookie) => cookie.split(';')[0].trim())
                  .join(';') ??
              cookiesText ??
              '');
    }

    if ([429, 503, 403].contains(response.statusCode)) {
      // required captcha resolve
      showCaptchaResolve(null);
      return Future.error('Captcha required');
    }

    if (response.statusCode == 429) {
      // Tp 429, wait 1 seconds
      await Future.delayed(Duration(seconds: 1)); // Wait 1 second
      return fetch(url); // Retry fetching data
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
  /// [useCookie] Whether to use the cookie from the database if no cookie is provided. Defaults to null.
  ///
  /// Returns a parsed [Document] object.
  Future<d.Document> fetchDocument(String url,
      {String? cookie,
      bool? useCookie,
      Map<String, dynamic>? body,
      Map<String, String>? headers}) async {
    return parseDocument(await fetch(url,
        cookie: cookie, useCookie: useCookie, body: body, headers: headers));
  }
}
