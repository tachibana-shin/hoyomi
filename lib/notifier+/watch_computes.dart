import 'package:flutter/material.dart';
import 'package:hoyomi/notifier+/computed_notifier.dart';

import 'utils/one_call_task.dart';

class WatchComputes<T> extends StatefulWidget {
  final List<ComputedNotifier<T>> computes;
  final Widget Function(BuildContext context) builder;

  const WatchComputes({
    super.key,
    required this.builder,
    required this.computes,
  });

  @override
  State<WatchComputes> createState() => _WatchComputesState<T>();
}

class _WatchComputesState<T> extends State<WatchComputes<T>> {
  late final Noop _refresh;

  @override
  void initState() {
    super.initState();

    _refresh = oneCallTask(() => setState(() {}));
    for (final computed in widget.computes) {
      computed.addListener(_refresh);
    }
  }

  @override
  void didUpdateWidget(oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.computes != widget.computes) {
      for (final computed in oldWidget.computes) {
        computed.removeListener(_refresh);
      }
      for (final computed in widget.computes) {
        computed.addListener(_refresh);
      }
    }
  }

  @override
  void dispose() {
    for (final computed in widget.computes) {
      computed.removeListener(_refresh);
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context);
  }
}
