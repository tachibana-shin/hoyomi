import 'package:flutter/material.dart';
import 'package:hoyomi/screens/webview/custom_webview.dart';

class WebviewPage extends StatelessWidget {
  final String sourceId;

  const WebviewPage({super.key, required this.sourceId});

  @override
  Widget build(BuildContext context) {
    return CustomWebView(
      sourceId: sourceId,
    );
  }
}
