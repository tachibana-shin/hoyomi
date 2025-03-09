import 'package:flutter/material.dart';
import 'package:hoyomi/utils/debouncer.dart';

class WatchNotifier<T> extends StatefulWidget {
  final List<ValueNotifier> depends;
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

  @override
  void initState() {
    super.initState();

    if (widget.throttle == null) {
      _refresh = () => setState(() {});
    } else {
      final debouncer = Debouncer(milliseconds: widget.throttle!.inMilliseconds);
      _refresh = () => debouncer.run(() => setState(() {}));
    }

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

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context);
  }
}
