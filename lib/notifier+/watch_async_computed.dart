import 'package:flutter/material.dart';
import 'package:hoyomi/notifier+/computed_async_notifier.dart';

class WatchAsyncComputed<T> extends StatefulWidget {
  final ComputedAsyncNotifier<T> computed;
  final Widget Function(BuildContext context, T? value) builder;

  const WatchAsyncComputed({
    super.key,
    required this.builder,
    required this.computed,
  });

  @override
  State<WatchAsyncComputed> createState() => _WatchAsyncComputedState<T>();
}

class _WatchAsyncComputedState<T> extends State<WatchAsyncComputed<T>> {
  @override
  void initState() {
    super.initState();
    widget.computed.addListener(_refresh);
  }

  @override
  void didUpdateWidget(oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.computed != widget.computed) {
      oldWidget.computed.removeListener(_refresh);
      widget.computed.addListener(_refresh);
    }
  }

  @override
  void dispose() {
    widget.computed.removeListener(_refresh);
    super.dispose();
  }

  void _refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, widget.computed.value);
  }
}
