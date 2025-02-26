import 'package:flutter/material.dart';

class CircularProgress extends StatelessWidget {
  final double value;
  final double strokeWidth;
  final TextStyle textStyle;
  final Animation<Color?> borderColor;
  final Color? backgroundBorder;
  final Color? backgroundColor;
  final double size;

  const CircularProgress({
    super.key,
    required this.value,
    this.strokeWidth = 4.0,
    required this.textStyle,
    required this.borderColor,
    required this.backgroundBorder,
    this.backgroundColor,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(size)),
      child: Container(
        height: size,
        width: size,
        color: backgroundColor,
        child: Padding(
          padding: EdgeInsets.all(1.0),
          child: Stack(
            alignment: Alignment.center,
            children: [
              CircularProgressIndicator(
                strokeWidth: strokeWidth - 2,
                value: value,
                valueColor: borderColor,
                backgroundColor: backgroundBorder,
              ),
              Center(
                child: Text((value * 100).round().toString(), style: textStyle),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
