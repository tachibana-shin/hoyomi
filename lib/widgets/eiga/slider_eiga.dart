import 'package:flutter/material.dart';

class SliderEiga extends StatefulWidget {
  final double progress; // Current progress (0.0 to 1.0)
  final double previewPosition; // Position to preview (0.0 to 1.0)
  final bool showThumb;
  final Function(double) onSeek; // Callback for seek

  const SliderEiga({
    super.key,
    required this.progress,
    required this.previewPosition,
    required this.onSeek,
    required this.showThumb,
  });

  @override
  createState() => _SliderEigaState();
}

class _SliderEigaState extends State<SliderEiga> with SingleTickerProviderStateMixin {
  double _hoverPosition = 0.0; // Hover position
  bool _isHovering = false;
  late AnimationController _controller;
  late Animation<double> _barHeightAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _barHeightAnimation = Tween<double>(begin: 3.0, end: 5.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onHoverUpdate(Offset localPosition, Size size) {
    setState(() {
      _isHovering = true;
      _hoverPosition = (localPosition.dx / size.width).clamp(0.0, 1.0);
      _controller.forward();
    });
  }

  void _onHoverEnd() {
    setState(() {
      _isHovering = false;
      _controller.reverse();
    });
  }

  void _onSeek(Offset localPosition, Size size) {
    final position = (localPosition.dx / size.width).clamp(0.0, 1.0);
    widget.onSeek(position);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        final box = context.findRenderObject() as RenderBox;
        _onSeek(details.localPosition, box.size);
      },
      onTapDown: (details) {
        final box = context.findRenderObject() as RenderBox;
        _onSeek(details.localPosition, box.size);
      },
      onTapUp: (_) => _onHoverEnd(),
      onPanDown: (details) {
        setState(() {
          _isHovering = true;
        });
      },
      onPanEnd: (_) {
        setState(() {
          _isHovering = false;
        });
      },
      // onTapCancel: _onHoverEnd,
      child: MouseRegion(
        onHover: (event) {
          final box = context.findRenderObject() as RenderBox;
          _onHoverUpdate(event.localPosition, box.size);
        },
        onEnter: (_) {
          setState(() {
            _isHovering = true;
          });
        },
        onExit: (_) => _onHoverEnd(),
        child: Stack(
          children: [
            AnimatedBuilder(
              animation: _barHeightAnimation,
              builder: (context, child) {
                return CustomPaint(
                  size: Size(double.infinity, 20), // Keep height to accommodate thumb
                  painter: _ProgressBarPainter(
                    progress: widget.progress,
                    hoverPosition: _hoverPosition,
                    isHovering: _isHovering,
                    previewPosition: widget.previewPosition,
                    barHeight: _barHeightAnimation.value, // Animate bar height
                  ),
                );
              },
            ),
            Positioned(
              left: widget.progress * MediaQuery.of(context).size.width - 10,
              top: 2.5, // Adjust position to center the thumb
              child: GestureDetector(
                onPanUpdate: (details) {
                  final box = context.findRenderObject() as RenderBox;
                  _onSeek(details.localPosition, box.size);
                },
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProgressBarPainter extends CustomPainter {
  final double progress; // Current progress
  final double hoverPosition; // Hover position
  final bool isHovering; // Whether the mouse is hovering
  final double previewPosition; // Preview position
  final double barHeight; // Height of the progress bar

  _ProgressBarPainter({
    required this.progress,
    required this.hoverPosition,
    required this.isHovering,
    required this.previewPosition,
    this.barHeight = 5.0, // Default bar height to 5px
  });

  @override
  void paint(Canvas canvas, Size size) {
    final backgroundPaint = Paint()
      ..color = Colors.grey
      ..style = PaintingStyle.fill;

    final progressPaint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    final hoverPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final previewPaint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill;

    // Draw background
    canvas.drawRect(
        Rect.fromLTWH(0, (size.height - barHeight) / 2, size.width, barHeight),
        backgroundPaint);

    // Draw progress
    canvas.drawRect(
        Rect.fromLTWH(
            0, (size.height - barHeight) / 2, progress * size.width, barHeight),
        progressPaint);

    // Draw hover indicator
    if (isHovering) {
      canvas.drawCircle(
          Offset(hoverPosition * size.width, size.height / 2), 5, hoverPaint);
    }

    // Draw preview indicator
    if (isHovering) {
      canvas.drawCircle(Offset(previewPosition * size.width, size.height / 2),
          5, previewPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
