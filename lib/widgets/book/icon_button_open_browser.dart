import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:honyomi/globals.dart';
import 'package:url_launcher/url_launcher.dart';

class IconButtonOpenBrowser extends StatelessWidget {
  static Future<void> open(String url) async {
    if (!await launchUrl(Uri.parse(url),
        mode: LaunchMode.externalApplication)) {
      showSnackBar(Text('Could not launch $url'));
    }
  }

  final String url;

  const IconButtonOpenBrowser({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(MaterialCommunityIcons.earth),
      onPressed: () async {
        open(url);
      },
    );
  }
}
