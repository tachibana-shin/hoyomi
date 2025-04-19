import 'package:flutter/material.dart';

class StrokeText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color strokeColor;
  final Color fillColor;
  final double strokeWidth;

  const StrokeText(
    this.text, {
    super.key,
    this.fontSize = 14,
    this.strokeColor = Colors.black,
    this.fillColor = Colors.white,
    this.strokeWidth = 2,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = strokeWidth
              ..color = strokeColor,
          ),
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            color: fillColor,
          ),
        ),
      ],
    );
  }
}
