import 'package:flutter/material.dart';

class IconButtonShare extends StatelessWidget {
  const IconButtonShare({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.share), // 共有ボタン
      onPressed: () {},
    );
  }
}
