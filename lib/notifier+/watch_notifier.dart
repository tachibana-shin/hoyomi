import 'package:flutter/material.dart';
import 'package:hoyomi/utils/debouncer.dart';

import 'utils/one_call_task.dart';

class WatchNotifier<T> extends StatefulWidget {
  final List<ChangeNotifier> depends;
  final Duration? throttle;
  final Widget Function(BuildContext context) builder;

  const WatchNotifier({
    super.key,
    required this.depends,
    this.throttle,
    required this.builder,
  });

  @override
  State<WatchNotifier> createState() => _WatchNotifierState<T>();
}

class _WatchNotifierState<T> extends State<WatchNotifier<T>> {
  late Listenable _listenable;
  late final VoidCallback _refresh;
  late final Debouncer? _debouncer;

  @override
  void initState() {
    super.initState();

    late final Noop refreshRoot;
    if (widget.throttle == null) {
      _debouncer = null;
      refreshRoot = () => setState(() {});
    } else {
      _debouncer = Debouncer(milliseconds: widget.throttle!.inMilliseconds);
      refreshRoot = () => _debouncer!.run(() => setState(() {}));
    }

    _refresh = oneCallTask(refreshRoot);
    _listenable = Listenable.merge(widget.depends)..addListener(_refresh);
  }

  @override
  void didUpdateWidget(oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.depends != widget.depends) {
      _listenable.removeListener(_refresh);
      _listenable = Listenable.merge(widget.depends)..addListener(_refresh);
    }
  }

  @override
  void dispose() {
    _listenable.removeListener(_refresh);
    _debouncer?.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context);
  }
}
