import 'package:flutter/material.dart';
import 'package:hoyomi/notifier+/computed_notifier.dart';

class WatchComputed<T> extends StatefulWidget {
  final ComputedNotifier<T> computed;
  final Widget Function(BuildContext context, T value) builder;

  const WatchComputed({
    super.key,
    required this.builder,
    required this.computed,
  });

  @override
  State<WatchComputed> createState() => _WatchComputedState<T>();
}

class _WatchComputedState<T> extends State<WatchComputed<T>> {
  @override
  void initState() {
    super.initState();
    widget.computed.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, widget.computed.value);
  }
}
