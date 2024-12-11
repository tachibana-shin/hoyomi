import 'package:flutter/material.dart';

class CircularProgress extends StatelessWidget {
  final double value;
  final double strokeWidth;
  final TextStyle textStyle;
  final Animation<Color?> borderColor;
  final Color? backgroundBorder;
  final Color? backgroundColor;
  final double size;

  const CircularProgress(
      {super.key,
      required this.value,
      required this.strokeWidth,
      required this.textStyle,
      required this.borderColor,
      required this.backgroundBorder,
      this.backgroundColor,
      required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      color: backgroundColor,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircularProgressIndicator(
              strokeWidth: strokeWidth,
              value: value,
              valueColor: borderColor,
              backgroundColor: backgroundBorder),
          Center(
            child: Text((value * 100).round().toString(), style: textStyle),
          ),
        ],
      ),
    );
  }
}
