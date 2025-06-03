import 'package:flutter/material.dart';

class ZoomViewer extends StatefulWidget {
  final Widget child;
  final bool panEnabled;
  final double minScale;
  final double maxScale;
  final bool trackpadScrollCausesScale;

  const ZoomViewer({
    super.key,
    required this.child,
    this.panEnabled = true,
    this.minScale = 0.8,
    this.maxScale = 2.5,
    this.trackpadScrollCausesScale = true,
  });

  @override
  State<ZoomViewer> createState() => _ZoomViewerState();
}

class _ZoomViewerState extends State<ZoomViewer> {
  final _transformationController = TransformationController();
  TapDownDetails? _doubleTapDetails;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTapDown: (d) => _doubleTapDetails = d,
      onDoubleTap: _handleDoubleTap,
      child: InteractiveViewer(
        transformationController: _transformationController,
        panEnabled: widget.panEnabled,
        minScale: widget.minScale,
        maxScale: widget.maxScale,
        trackpadScrollCausesScale: widget.trackpadScrollCausesScale,
        child: widget.child,
      ),
    );
  }

  void _handleDoubleTap() {
    if (_transformationController.value != Matrix4.identity()) {
      _transformationController.value = Matrix4.identity();
    } else {
      if (_doubleTapDetails == null) return;

      final position = _doubleTapDetails!.localPosition;
      // For a 3x zoom
      _transformationController.value =
          Matrix4.identity()
            ..translate(-position.dx * 2, -position.dy * 2)
            ..scale(3.0);
      // Fox a 2x zoom
      // ..translate(-position.dx, -position.dy)
      // ..scale(2.0);
    }
  }
}
