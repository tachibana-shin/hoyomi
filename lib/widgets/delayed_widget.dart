import 'package:flutter/material.dart';

class DelayedWidget extends StatelessWidget {
  final Widget Function(BuildContext context) builder;
  final Duration delay;

  const DelayedWidget({required this.builder, required this.delay, super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(delay),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return builder(context);
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }
}
