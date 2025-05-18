import 'package:flutter/material.dart';

class Disabled extends StatelessWidget {
  final bool disabled;
  final double opacity;
  final Widget child;

  const Disabled({
    super.key,
    this.disabled = true,
    this.opacity = 0.5,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: disabled ? opacity : 1.0,
      child: IgnorePointer(ignoring: disabled, child: child),
    );
  }
}
