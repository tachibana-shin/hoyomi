import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:go_router/go_router.dart';
import 'package:honyomi/cache/get_user.dart';
import 'package:honyomi/core_services/main.dart';
import 'package:honyomi/globals.dart';
import 'package:honyomi/models/cookie_manager.dart' as model;
import 'package:honyomi/objectbox.g.dart';
import 'package:honyomi/plugins/objectbox.dart';

class CustomWebView extends StatefulWidget {
  final String serviceId;

  const CustomWebView({super.key, required this.serviceId});

  @override
  State<CustomWebView> createState() => _CustomWebViewState();
}

class _CustomWebViewState extends State<CustomWebView> {
  late InAppWebViewController _webViewController;
  final WebViewEnvironment _webViewEnvironment =
      WebViewEnvironment.fromPlatform(
          platform: PlatformWebViewEnvironment(
              PlatformWebViewEnvironmentCreationParams(
                  settings: WebViewEnvironmentSettings())));
  late final String _initialUrl;

  String _currentTitle = "Loading...";
  String _currentUrl = "";
  bool _isLoading = true;
  double _progress = 0.0; // Progress value for the loading bar

  @override
  void initState() {
    super.initState();

    final service = getService(widget.serviceId);
    _initialUrl = service.baseUrl;

    _currentTitle = _initialUrl;
    _currentUrl = _initialUrl;
  }

  // Method to collect cookies when the page finishes loading
  Future<void> _collectCookies() async {
    try {
      // Retrieve cookies for the current URL
      final cookies =
          await CookieManager.instance(webViewEnvironment: _webViewEnvironment)
              .getCookies(url: WebUri(_initialUrl));
      final cookiesText =
          cookies.map((cookie) => '${cookie.name}=${cookie.value}').join("; ");

      bool signed;
      try {
        await getUser(getService(widget.serviceId), cookie: cookiesText);
        signed = true;
      } catch (err) {
        signed = false;
      }

      final record = objectBox.store
          .box<model.CookieManager>()
          .query(CookieManager_.uid.equals(widget.serviceId))
          .build()
          .findFirst();
      if (record != null) {
        record.cookie = cookiesText;
        record.signed = signed;
        record.updatedAt = DateTime.now();

        objectBox.store.box<model.CookieManager>().put(record);
      } else {
        final record = model.CookieManager(
          uid: widget.serviceId,
          cookie: cookiesText,
          signed: signed,
        );

        objectBox.store.box<model.CookieManager>().put(record);
      }
    } catch (e) {
      showSnackBar(
        Text('Error while collecting cookies: $e'),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () async {
            await _collectCookies();
            _webViewController.dispose(isKeepAlive: false);
            context.pop();
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
              webViewEnvironment: _webViewEnvironment,
              onWebViewCreated: (controller) {
                _webViewController = controller;
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
