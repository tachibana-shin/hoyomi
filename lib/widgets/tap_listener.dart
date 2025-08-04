import 'package:flutter/material.dart';

class TapListener extends StatelessWidget {
  final Widget child;
  final int rows;
  final int columns;
  final bool showArea;
  final Function(int row, int column) onTap;

  const TapListener({
    super.key,
    required this.child,
    required this.rows,
    required this.columns,
    required this.onTap,
    this.showArea = false,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final cellWidth = screenSize.width / rows;
    final cellHeight = screenSize.height / columns;

    return GestureDetector(
      onTapUp: (TapUpDetails details) {
        final tapX = details.localPosition.dx;
        final tapY = details.localPosition.dy;

        final row = (tapX ~/ cellWidth); // Column (0, 1, 2)
        final column = (tapY ~/ cellHeight); // Row (0, 1, 2)

        onTap(row, column);
      },
      child: Stack(
        children: [
          child,
          if (showArea)
            CustomPaint(
              size: screenSize,
              painter: _GridPainter(rows: rows, columns: columns),
            ),
        ],
      ),
    );
  }
}

class _GridPainter extends CustomPainter {
  final int rows;
  final int columns;

  _GridPainter({required this.rows, required this.columns});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 1;

    for (int i = 1; i < 3; i++) {
      canvas.drawLine(
        Offset(size.width * i / rows, 0),
        Offset(size.width * i / columns, size.height),
        paint,
      );
    }

    for (int i = 1; i < 3; i++) {
      canvas.drawLine(
        Offset(0, size.height * i / rows),
        Offset(size.width, size.height * i / columns),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
