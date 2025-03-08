import 'package:flutter/material.dart';

class WatchNotifier<T> extends StatefulWidget {
  final List<ValueNotifier> depends;
  final Widget Function(BuildContext context) builder;

  const WatchNotifier({
    super.key,
    required this.depends,
    required this.builder,
  });

  @override
  State<WatchNotifier> createState() => _WatchNotifierState<T>();
}

class _WatchNotifierState<T> extends State<WatchNotifier<T>> {
  late Listenable _listenable;

  @override
  void initState() {
    super.initState();

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

  void _refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context);
  }
}
