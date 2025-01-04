import 'package:flutter/material.dart';
import 'package:hoyomi/screens/webview/custom_webview.dart';

class WebviewPage extends StatelessWidget {
  final String serviceId;

  const WebviewPage({super.key, required this.serviceId});

  @override
  Widget build(BuildContext context) {
    return CustomWebView(
      serviceId: serviceId,
    );
  }
}
