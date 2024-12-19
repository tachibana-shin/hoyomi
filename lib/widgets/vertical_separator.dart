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
    this.margin = const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
  });

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: width,
      height: 8.0,
      color: color,
      margin: margin,
    );
  }
}
