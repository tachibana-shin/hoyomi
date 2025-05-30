import 'dart:math';

import 'package:flutter/material.dart';

class AreaForward extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Paint settings
    final paint =
        Paint()
          ..color = Colors.white.withValues(alpha: 0.2)
          ..style = PaintingStyle.fill;
    final center = Offset(size.width, size.height / 2);
    canvas.drawCircle(center, min(size.width, size.height), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
