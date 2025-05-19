import 'package:flutter/material.dart';
import 'package:hoyomi/screens/webview/custom_webview.dart';

class WebviewPage extends StatelessWidget {
  final String sourceId;
  final bool logout;

  const WebviewPage({super.key, required this.sourceId, required this.logout});

  @override
  Widget build(BuildContext context) {
    return CustomWebView(sourceId: sourceId, logout: logout);
  }
}
