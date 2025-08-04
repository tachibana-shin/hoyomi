import 'dart:async';
import 'dart:ui' as ui;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hoyomi/constraints/x_platform.dart';
import 'package:hoyomi/core_services/eiga/interfaces/opening_ending.dart';
import 'package:hoyomi/core_services/interfaces/vtt.dart';
import 'package:hoyomi/plugins/export.dart';
import 'package:kaeru/kaeru.dart';
import 'package:subtitle/subtitle.dart';
import 'package:hoyomi/utils/format_duration.dart';

class _PreviewMeta {
  final Widget widget;
  final double width;

  _PreviewMeta({required this.widget, required this.width});
}

class SliderEiga extends StatefulWidget {
  static final double thumbSize = 5;

  final Ref<Duration> progress;
  final Ref<Duration> duration;
  final Ref<Duration> buffered;
  final Ref<bool> showThumb;
  final Ref<bool> pauseAutoHideControls;
  final Ref<bool> isHovering;
  final AsyncComputed<Vtt?> vttThumbnail;
  final AsyncComputed<OpeningEnding?> openingEnding;
  final ValueChanged<Duration> onSeek;

  const SliderEiga({
    super.key,
    required this.progress,
    required this.duration,
    required this.buffered,
    required this.onSeek,
    required this.vttThumbnail,
    required this.showThumb,
    required this.pauseAutoHideControls,
    required this.isHovering,
    required this.openingEnding,
  });

  @override
  createState() => _SliderEigaState();
}

class _SliderEigaState extends State<SliderEiga>
    with TickerProviderStateMixin, KaeruMixin, KaeruLifeMixin {
  late final AnimationController _controller;
  late final Animation<double> _barHeightAnimation;

  double get thumbSize => SliderEiga.thumbSize;
  final double sliderHeightMin = 2;
  final double sliderHeightMax = XPlatform.isAndroid || XPlatform.isIOS ? 4 : 3;

  late final _hoverPosition = ref(0.0);
  late final _isHovering = widget.isHovering;
  late final _preview = ref<Future<_PreviewMeta>?>(null);
  late final _previewBlank = ref<Widget?>(null);

  SubtitleController? _subtitleController;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 50),
      vsync: this,
    );
    onBeforeUnmount(_controller.dispose);
    _barHeightAnimation = Tween<double>(
      begin: sliderHeightMin,
      end: sliderHeightMax,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    watch([widget.vttThumbnail], () {
      final vtt = widget.vttThumbnail.value;
      if (vtt != null) {
        var url = Uri.parse(vtt.src);
        SubtitleProvider provider = NetworkSubtitle(url);
        _subtitleController = SubtitleController(provider: provider)
          ..initial().catchError((error, stack) {
            logger.i(error, stackTrace: stack);
          });
      } else {
        _subtitleController = null;
      }
    });
  }

  Future<_PreviewMeta> loadPreviewMeta(
    String spriteUrl,
    double x,
    double y,
    double w,
    double h,
  ) async {
    final imageProvider = CachedNetworkImageProvider(spriteUrl);
    final completer = Completer<ImageInfo>();
    final imageStream = imageProvider.resolve(ImageConfiguration.empty);
    final listener = ImageStreamListener((info, _) => completer.complete(info));
    imageStream.addListener(listener);
    final info = await completer.future;
    final image = info.image;
    return _PreviewMeta(
      width: w,
      widget: ClipRRect(
        borderRadius: BorderRadius.circular(3),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.3),
                offset: Offset(0, 1),
                blurRadius: 3,
              ),
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.3),
                offset: Offset(0, 1),
                blurRadius: 2,
                spreadRadius: -1,
              ),
            ],
          ),
          child: CustomPaint(
            size: Size(w, h),
            painter: _ImagePainter(
              image: image,
              srcRect: Rect.fromLTWH(x, y, w, h),
            ),
          ),
        ),
      ),
    );
  }

  void _onHoverUpdate(Offset localPosition) {
    final box = context.findRenderObject() as RenderBox;
    _isHovering.value = true;
    _hoverPosition.value = (localPosition.dx / box.size.width).clamp(0.0, 1.0);
    _controller.forward();

    final baseValue = _subtitleController?.durationSearch(
      widget.progress.value,
    );
    if (baseValue != null) {
      try {
        final parts = baseValue.data.split('#xywh=');
        if (parts.length != 2) return;
        final path = parts[0];
        final coords = parts[1].split(',');
        if (coords.length != 4) return;
        final x = double.parse(coords[0]);
        final y = double.parse(coords[1]);
        final w = double.parse(coords[2]);
        final h = double.parse(coords[3]);
        final spriteUrl = Uri.parse(
          widget.vttThumbnail.value!.src,
        ).resolve(path).toString();
        _previewBlank.value = Container(
          width: w,
          height: h,
          color: Colors.black,
        );
        _preview.value = loadPreviewMeta(spriteUrl, x, y, w, h);
      } catch (e, stack) {
        logger.e(e, stackTrace: stack);
      }
    } else {
      _previewBlank.value = null;
      _preview.value = null;
    }
  }

  void _onHoverEnd() {
    _isHovering.value = false;
    _controller.reverse();
  }

  void _onSeek(Offset localPosition) {
    final box = context.findRenderObject() as RenderBox;
    final position = (localPosition.dx / box.size.width).clamp(0.0, 1.0);
    widget.onSeek(widget.duration.value * position);
    logger.i('[video_player]: seek changed $position');
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final parentSize = constraints.biggest;
        return Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: MouseRegion(
                onEnter: (details) => _onHoverUpdate(details.localPosition),
                onExit: (details) => _onHoverEnd(),
                onHover: (details) => _onHoverUpdate(details.localPosition),
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  dragStartBehavior: DragStartBehavior.down,
                  onHorizontalDragUpdate: (details) {
                    _onSeek(details.localPosition);
                    _onHoverUpdate(details.localPosition);
                  },

                  /// hover event
                  onHorizontalDragStart: (details) {
                    _onSeek(details.localPosition);
                    _onHoverUpdate(details.localPosition);
                  },
                  onHorizontalDragEnd: (_) => _onHoverEnd(),
                  onHorizontalDragCancel: _onHoverEnd,

                  // progress
                  onTapDown: (details) {
                    _onSeek(details.localPosition);
                    _onHoverUpdate(details.localPosition);
                  },
                  onTapUp: (_) => _onHoverEnd(),
                  onTapCancel: _onHoverEnd,

                  // /// long press
                  // onLongPressDown: (details) {
                  //   _onSeek(details.localPosition);
                  //   _onHoverUpdate(details.localPosition);
                  // },
                  // onLongPressMoveUpdate: (details) {
                  //   _onSeek(details.localPosition);
                  //   _onHoverUpdate(details.localPosition);
                  // },
                  // onLongPressEnd: (details) =>   _onHoverEnd(),

                  /// pan
                  onPanStart: (details) {
                    _onSeek(details.localPosition);
                    _onHoverUpdate(details.localPosition);
                  },
                  onPanUpdate: (details) {
                    _onSeek(details.localPosition);
                    _onHoverUpdate(details.localPosition);
                  },
                  onPanEnd: (_) => _onHoverEnd(),
                  onPanCancel: _onHoverEnd,
                  child: Stack(
                    children: [
                      Container(
                        height: thumbSize * 2,
                        color: Colors.transparent,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [_buildSliderBar(parentSize)],
                        ),
                      ),
                      _buildSliderThumb(parentSize),
                    ],
                  ),
                ),
              ),
            ),

            Container(height: parentSize.height),
            // hover popover
            _buildHoverPreview(parentSize),
          ],
        );
      },
    );
  }

  Widget _buildSliderBar(Size parentSize) {
    return Watch(() {
      final openingEnding = widget.openingEnding.value;
      final duration = widget.duration.value;
      final progress = widget.progress.value;
      final buffered = widget.buffered.value;

      final opening = openingEnding?.opening;
      final ending = openingEnding?.ending;

      return AnimatedBuilder(
        animation: _barHeightAnimation,
        builder: (context, child) {
          return CustomPaint(
            size: Size(parentSize.width, _barHeightAnimation.value),
            painter: _ProgressBarPainter(
              progress: progress.inMilliseconds / duration.inMilliseconds,
              buffered: buffered.inMilliseconds / duration.inMilliseconds,
              range: [
                if (opening != null && duration.inMilliseconds > 0)
                  (
                    opening.start.inMilliseconds / duration.inMilliseconds,
                    opening.end.inMilliseconds / duration.inMilliseconds,
                  ),
                if (ending != null && duration.inMilliseconds > 0)
                  (
                    ending.start.inMilliseconds / duration.inMilliseconds,
                    ending.end.inMilliseconds / duration.inMilliseconds,
                  ),
              ],
              barHeight: _barHeightAnimation.value,
            ),
          );
        },
      );
    });
  }

  Widget _buildHoverPreview(Size parentSize) {
    return Watch(() {
      if (!_isHovering.value) return SizedBox.shrink();
      final String text = formatDuration(
        widget.duration.value * _hoverPosition.value,
      );
      const double fontSize = 14;
      const double paddingX = 5;
      return FutureBuilder(
        future: _preview.value,
        builder: (context, snapshot) {
          final preview = snapshot.data;
          final bool done = snapshot.connectionState != ConnectionState.waiting;
          double width =
              preview?.width ?? ((text.length * fontSize / 2) + paddingX * 2);
          final left = (_hoverPosition.value * parentSize.width - (width / 2))
              .clamp(3, parentSize.width - width - 3)
              .toDouble();
          final timeText = Container(
            padding: EdgeInsets.symmetric(vertical: 3, horizontal: paddingX),
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.7),
              borderRadius: BorderRadius.circular(3),
            ),
            child: Text(
              text,
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          );
          final previewWidget =
              preview?.widget ?? (done ? null : _previewBlank.value);
          return Positioned(
            left: left,
            bottom: sliderHeightMax + thumbSize / 2 + 7,
            child: previewWidget != null
                ? Stack(
                    children: [
                      previewWidget,
                      Positioned(
                        bottom: 10,
                        left: 0,
                        right: 0,
                        child: Center(child: timeText),
                      ),
                    ],
                  )
                : Center(child: timeText),
          );
        },
      );
    });
  }

  Widget _buildSliderThumb(Size parentSize) {
    final width = parentSize.width;
    return Watch(() {
      if (!widget.showThumb.value) return SizedBox.shrink();
      final double left =
          ((widget.duration.value.inMilliseconds == 0
                          ? 0
                          : (widget.progress.value.inMilliseconds /
                                widget.duration.value.inMilliseconds)) *
                      width -
                  thumbSize / 2)
              .clamp(thumbSize / 2, width - thumbSize);
      final double size = thumbSize;
      return Positioned(
        left: left,
        bottom: size,
        child: AnimatedScale(
          duration: const Duration(milliseconds: 111),
          curve: Curves.easeInOut,
          scale: widget.showThumb.value || _isHovering.value ? 1 : 0,
          child: IgnorePointer(
            ignoring: !(widget.showThumb.value || _isHovering.value),
            child: GestureDetector(
              onPanUpdate: (details) => _onSeek(details.localPosition),
              child: CustomPaint(
                size: Size(size, size),
                painter: _ThumbPainter(size: size),
              ),
            ),
          ),
        ),
      );
    });
  }
}

class _ProgressBarPainter extends CustomPainter {
  final double progress;
  final double buffered;
  final double barHeight;
  final List<(double, double)> range;

  _ProgressBarPainter({
    required this.progress,
    required this.buffered,
    required this.range,
    this.barHeight = 5.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final backgroundPaint = Paint()
      ..color = Colors.white.withValues(alpha: 0.3)
      ..style = PaintingStyle.fill;

    final progressPaint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill;

    final bufferedPaint = Paint()
      ..color = Colors.white.withValues(alpha: 0.3)
      ..style = PaintingStyle.fill;

    final rangePaint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    // Draw background
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, barHeight),
      backgroundPaint,
    );

    // Draw progress
    canvas.drawRect(
      Rect.fromLTWH(
        0,
        0,
        progress.isNaN ? 0 : progress * size.width,
        barHeight,
      ),
      progressPaint,
    );

    // Draw buffered
    canvas.drawRect(
      Rect.fromLTWH(
        0,
        0,
        buffered.isNaN ? 0 : buffered * size.width,
        barHeight,
      ),
      bufferedPaint,
    );

    // ranges
    for (final (start, end) in range) {
      canvas.drawRect(
        Rect.fromLTWH(
          start * size.width,
          0,
          (end - start) * size.width,
          barHeight,
        ),
        rangePaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class _ThumbPainter extends CustomPainter {
  final double size;

  _ThumbPainter({required this.size});

  @override
  void paint(Canvas canvas, Size size) {
    final thumbPaint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill;

    canvas.drawCircle(
      Offset(size.width / 2, size.height),
      this.size,
      thumbPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class _ImagePainter extends CustomPainter {
  final ui.Image image;
  final Rect srcRect;

  _ImagePainter({required this.image, required this.srcRect});

  @override
  void paint(Canvas canvas, Size size) {
    final dst = Rect.fromLTWH(0, 0, size.width, size.height);
    canvas.drawImageRect(image, srcRect, dst, Paint());
  }

  @override
  bool shouldRepaint(covariant _ImagePainter oldDelegate) {
    return image != oldDelegate.image || srcRect != oldDelegate.srcRect;
  }
}
