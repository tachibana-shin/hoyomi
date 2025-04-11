import 'package:flutter/material.dart';

// VerticalSeparator Widget
class VerticalSeparator extends StatelessWidget {
  final double width;
  final Color color;
  final EdgeInsetsGeometry margin;

  const VerticalSeparator({
    super.key,
    this.width = 1.0,
    this.color = Colors.grey,
    this.margin = const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
  });

  @override
  Widget build(BuildContext context) {
    return Container(width: width, height: 10.0, color: color, margin: margin);
  }
}
