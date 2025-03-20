import 'package:flutter/material.dart';

class AnimatedIconForward extends StatefulWidget {
  const AnimatedIconForward({super.key});

  @override
  State<AnimatedIconForward> createState() => _AnimatedIconForwardState();
}

class _AnimatedIconForwardState extends State<AnimatedIconForward>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Animation<double>> _fadeAnimations;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat();
    _fadeAnimations = List.generate(3, (index) {
      return TweenSequence<double>([
        TweenSequenceItem(
            tween: Tween<double>(begin: 0, end: 1), weight: 50), // Fade-in
        TweenSequenceItem(
            tween: Tween<double>(begin: 1, end: 0), weight: 50), // Fade-out
      ]).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(
            index * 0.2,
            1.0,
            curve: Curves.easeInOut,
          ),
        ),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  /// Builds a triangle with fade animation
  Widget _buildTriangle(Animation<double> animation) {
    return FadeTransition(
      opacity: animation,
      child: CustomPaint(
        size: const Size(12, 12),
        painter: _TrianglePainter(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildTriangle(_fadeAnimations[0]),
        _buildTriangle(_fadeAnimations[1]),
        _buildTriangle(_fadeAnimations[2]),
      ],
    );
  }
}

/// Custom painter to draw a right-facing triangle
class _TrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.white;
    final path = Path();

    // path.moveTo(size.width, 0);
    // path.lineTo(0, size.height / 2);
    // path.lineTo(size.width, size.height);
    // path.close();

    path.moveTo(0, 0);
    path.lineTo(size.width * 0.8, size.height / 2);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
