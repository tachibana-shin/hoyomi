import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as st;

class SpeechToText extends StatefulWidget {
  final void Function(String text) onChanged;
  final void Function(dynamic error) onError;

  const SpeechToText(
      {super.key, required this.onChanged, required this.onError});

  @override
  createState() => _SpeechToTextState();
}

class _SpeechToTextState extends State<SpeechToText>
    with SingleTickerProviderStateMixin {
  late st.SpeechToText _speech;

  bool _isListening = false;
  String _text = "Tap to speak...";
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _speech = st.SpeechToText();
    // マイク周りの波形エフェクト用のアニメーションコントローラーを初期化する。
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    )..addListener(() {
        setState(() {});
      });
  }

  Future<void> _startListening() async {
    bool available = await _speech.initialize(
      onStatus: (status) => debugPrint("Status: $status"),
      onError: (error) {
        widget.onError(error);
        Navigator.of(context).pop();
        debugPrint("Error: $error");
      },
    );

    if (available) {
      setState(() => _isListening = true);
      _animationController.repeat();
      _speech.listen(
        onResult: (result) {
          setState(() {
            _text = result.recognizedWords;
          });
        },
      );
    } else {
      setState(() => _text = "Unable to use speech recognition");
    }
  }

  void _stopListening() {
    _speech.stop();
    setState(() => _isListening = false);
    _animationController.stop();
    _animationController.reset();
    widget.onChanged(_text);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Speech to text"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(_text),
          const SizedBox(height: 20),
          Stack(
            alignment: Alignment.center,
            children: [
              if (_isListening)
                CustomPaint(
                  painter: CircleWavePainter(_animationController.value),
                  child: SizedBox(
                    width: 100,
                    height: 100,
                  ),
                ),
              IconButton(
                icon: Icon(
                  _isListening ? Icons.mic_off : Icons.mic,
                  size: 40,
                ),
                onPressed: () {
                  if (_isListening) {
                    _stopListening();
                  } else {
                    _startListening();
                  }
                },
              ),
            ],
          ),
        ],
      ),
      actions: [
        TextButton(
          child: const Text("Done"),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
    );
  }
}

/// 複数の拡大しながらフェードする円を描画し、ウェーブエフェクトを実現する。
class CircleWavePainter extends CustomPainter {
  final double progress;
  CircleWavePainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final waveCount = 3;
    for (int i = 0; i < waveCount; i++) {
      final value = ((progress + i / waveCount) % 1.0);
      final radius = (size.width / 2) * value;
      final opacity = (1.0 - value).clamp(0.0, 1.0);
      final paint = Paint()
        ..color = Colors.blueAccent.withValues(alpha: opacity)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2.0;
      canvas.drawCircle(center, radius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CircleWavePainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
