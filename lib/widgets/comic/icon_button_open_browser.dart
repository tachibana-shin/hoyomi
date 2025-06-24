import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hoyomi/apis/show_snack_bar.dart';
import 'package:hoyomi/widgets/disabled.dart';
import 'package:hoyomi/widgets/iconify.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:url_launcher/url_launcher.dart';

class IconButtonOpenBrowser extends StatelessWidget {
  static Future<void> open(String url) async {
    if (!await launchUrl(Uri.parse(url), mode: LaunchMode.inAppBrowserView)) {
      showSnackBar(Text('Could not launch $url'));
    }
  }

  final FutureOr<String?> url;

  const IconButtonOpenBrowser({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Disabled(
      disabled: url == null,
      child: IconButton(
        icon: const Iconify(Mdi.earth),
        onPressed: () async {
          if (url != null) open((url is Future ? await url : url as String)!);
        },
      ),
    );
  }
}
