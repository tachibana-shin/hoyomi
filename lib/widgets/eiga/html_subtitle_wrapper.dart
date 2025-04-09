import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:hoyomi/core_services/eiga/interfaces/main.dart';
import 'package:hoyomi/core_services/service.dart';
import 'package:kaeru/kaeru.dart';
import 'package:subtitle/subtitle.dart' as lib_subtitle;
import 'package:video_player/video_player.dart';

class HtmlSubtitleWrapper extends StatefulWidget {
  final Service service;
  final Computed<Subtitle?> subtitle;
  final VideoPlayerController videoController;

  final Widget child;

  final TextStyle? textStyle;
  final Alignment alignment;
  final EdgeInsets padding;
  final double maxLines;

  const HtmlSubtitleWrapper({
    super.key,
    required this.service,
    required this.subtitle,
    required this.videoController,
    required this.child,
    this.textStyle,
    this.alignment = Alignment.bottomCenter,
    this.padding = const EdgeInsets.only(bottom: 30),
    this.maxLines = 3,
  });

  @override
  State<HtmlSubtitleWrapper> createState() => _HtmlSubtitleWrapperState();
}

class _HtmlSubtitleWrapperState extends State<HtmlSubtitleWrapper>
    with KaeruMixin, KaeruListenMixin {
  late final _controller = ref<lib_subtitle.SubtitleController?>(null);
  late final _position = ref<Duration?>(null);
  late VoidCallback _cancelListenUpdatePosition;

  @override
  void initState() {
    super.initState();

    watch([widget.subtitle], () async {
      _controller.value = null;

      final subtitle = widget.subtitle.value;
      if (subtitle == null) return;

      final data =
          await widget.service.fetch(subtitle.url, headers: subtitle.headers);

      if (!mounted) return;

      final controller = lib_subtitle.SubtitleController(
        provider: lib_subtitle.SubtitleProvider.fromString(
            data: data, type: subtitle.type),
      );
      await controller.initial();

      _controller.value = controller;
    }, immediate: true);

    _cancelListenUpdatePosition =
        listen(widget.videoController, _updatePosition);
  }

  @override
  void didUpdateWidget(oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.videoController != widget.videoController) {
      _cancelListenUpdatePosition();
      _cancelListenUpdatePosition =
          listen(widget.videoController, _updatePosition);
    }
  }

  void _updatePosition() {
    _position.value = widget.videoController.value.position;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      widget.child,
      Watch(
        () {
          final controller = _controller.value;
          final data = switch (_position.value) {
            null => null,
            final position => controller?.durationSearch(position)?.data,
          };

          if (controller == null || data == null) return SizedBox.shrink();

          return Align(
            alignment: widget.alignment,
            child: Padding(
              padding: widget.padding,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight:
                      (widget.textStyle?.fontSize ?? 18) * widget.maxLines,
                ),
                child: HtmlWidget(
                  '<center>$data</center>',
                  textStyle: TextStyle(
                    color: widget.textStyle?.color ?? Colors.white,
                    fontSize: widget.textStyle?.fontSize ?? 18,
                    backgroundColor:
                     widget.textStyle?.backgroundColor ??
                        Colors.black.withValues(alpha: 0.5),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    ]);
  }
}
