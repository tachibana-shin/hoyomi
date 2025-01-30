import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:go_router/go_router.dart';
import 'package:hoyomi/core_services/exception/user_not_found_exception.dart';
import 'package:hoyomi/core_services/main.dart';
import 'package:hoyomi/core_services/base_service.dart'; // Add this import
import 'package:hoyomi/globals.dart';

class CustomWebView extends StatefulWidget {
  final String serviceId;

  const CustomWebView({super.key, required this.serviceId});

  @override
  State<CustomWebView> createState() => _CustomWebViewState();
}

class _CustomWebViewState extends State<CustomWebView> {
  late InAppWebViewController _webViewController;
  late final BaseService _service;
  late final String _initialUrl;

  String _currentTitle = "Loading...";
  String _currentUrl = "";
  bool _isLoading = true;
  double _progress = 0.0; // Progress value for the loading bar

  @override
  void initState() {
    super.initState();

    _service = getBaseService(widget.serviceId);
    _initialUrl = _service.baseUrl;
    _currentTitle = _initialUrl;
    _currentUrl = _initialUrl;
  }

  // Method to collect cookies when the page finishes loading
  Future<void> _collectCookies() async {
    try {
      // Retrieve cookies for the current URL
      final cookies = await CookieManager.instance().getCookies(
          url: WebUri(_initialUrl), webViewController: _webViewController);
      final cookiesText =
          cookies.map((cookie) => '${cookie.name}=${cookie.value}').join("; ");
      final userAgent = await _webViewController.evaluateJavascript(
          source: "navigator.userAgent");

      final user = await _service.onAfterSignIn(
          cookie: cookiesText, userAgent: userAgent);

      showSnackBar(Text('Signed in to ${_service.name} as ${user.fullName}'));
    } on UserNotFoundException catch (_) {
      showSnackBar(
        Text('Sign in ${_service.name} failed.'),
      );
    } catch (e) {
      showSnackBar(
        Text('Error while collecting cookies: $e'),
      );
      debugPrint('Error: $e');
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        scrolledUnderElevation: 0.0,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () async {
            await _collectCookies();
            _webViewController.dispose(isKeepAlive: false);
            if (mounted) {
              // ignore: use_build_context_synchronously
              context.pop();
            }
          },
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _currentTitle,
              style:
                  const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              _currentUrl,
              style: const TextStyle(fontSize: 12.0),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
            color: Theme.of(context).colorScheme.onSurface,
            onPressed: () async {
              if (await _webViewController.canGoBack()) {
                _webViewController.goBack();
              }
            },
          ),
          IconButton(
            icon: const Icon(Icons.arrow_forward),
            color: Theme.of(context).colorScheme.onSurface,
            onPressed: () async {
              if (await _webViewController.canGoForward()) {
                _webViewController.goForward();
              }
            },
          ),
          IconButton(
            icon: Icon(_isLoading ? Icons.close : Icons.refresh),
            color: Theme.of(context).colorScheme.onSurface,
            onPressed: () async {
              if (_isLoading) {
                _webViewController.pause(); // Pause loading
              } else {
                _webViewController
                    .reload(); // Reload the page if it's not loading
              }
            },
          ),
        ],
      ),
      body: Column(
        children: [
          LinearProgressIndicator(
            value: _isLoading ? _progress : 0.0,
            minHeight: 3.0,
            backgroundColor: Colors.transparent,
          ),
          Expanded(
            child: InAppWebView(
              initialUrlRequest: URLRequest(url: WebUri(_initialUrl)),
              onWebViewCreated: (controller) {
                _webViewController =
                    controller; //..loadUrl(urlRequest: URLRequest());
              },
              onTitleChanged: (controller, title) {
                setState(() {
                  _currentTitle = title ?? "Untitled";
                });
              },
              onLoadStart: (controller, url) {
                setState(() {
                  _isLoading = true;
                  _currentUrl = url.toString();
                });
              },
              onLoadStop: (controller, url) {
                setState(() {
                  _isLoading = false;
                  _currentUrl = url.toString();
                });
              },
              onProgressChanged: (controller, progress) {
                setState(() {
                  _progress = progress / 100; // Update the progress value
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}

Future<CustomResponse> fetchCustomResponse(Uri url) async {
  final httpClient = HttpClient();
  final request = await httpClient.getUrl(url);
  final response = await request.close();

  final bodyBytes = await response.fold<List<int>>([], (b, d) => b..addAll(d));

  return CustomResponse(
    statusCode: response.statusCode,
    reasonPhrase: response.reasonPhrase,
    headers: response.headers,
    bodyBytes: bodyBytes,
    contentType: response.headers.contentType?.mimeType ?? "text/html",
  );
}

class CustomResponse {
  final int statusCode;
  final String? reasonPhrase;
  final HttpHeaders headers;
  final List<int> bodyBytes;
  final String contentType;

  CustomResponse({
    required this.statusCode,
    this.reasonPhrase,
    required this.headers,
    required this.bodyBytes,
    required this.contentType,
  });
}

Map<String, String> httpHeadersToMap(HttpHeaders headers) {
  final Map<String, String> headersMap = {};

  headers.forEach((key, values) {
    // Kết hợp các giá trị header thành một chuỗi duy nhất nếu có nhiều giá trị
    headersMap[key] = values.join(", ");
  });

  return headersMap;
}
