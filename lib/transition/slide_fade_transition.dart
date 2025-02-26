// slide_fade_transition.dart
import 'package:flutter/material.dart';

class SlideFadeTransition extends StatelessWidget {
  const SlideFadeTransition({
    super.key,
    required this.animation,
    required this.child,
  });

  final Animation<double> animation;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final fadeAnimation = animation.drive(CurveTween(curve: Curves.easeInOut));

    final slideAnimation = Tween<Offset>(
      begin: Offset(-1.0, 0.0),
      end: Offset(0.0, 0.0),
    ).animate(animation);

    return FadeTransition(
      opacity: fadeAnimation,
      child: SlideTransition(position: slideAnimation, child: child),
    );
  }
}
