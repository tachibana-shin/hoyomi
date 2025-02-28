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
  @override
  void initState() {
    super.initState();

    Listenable.merge(widget.depends).addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context);
  }
}
