import 'package:flutter/material.dart';

class AnimatedFadeIgnore extends StatelessWidget {
  final bool hide;
  final Widget child;
  final Duration duration;

  const AnimatedFadeIgnore({
    super.key,
    required this.hide,
    required this.child,
    this.duration = const Duration(milliseconds: 300),
  });

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: hide,
      child: AnimatedOpacity(
        opacity: hide ? 0 : 1,
        duration: duration,
        child: child,
      ),
    );
  }
}
