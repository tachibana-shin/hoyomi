import 'package:flutter/material.dart';
import 'package:kaeru/kaeru.dart';

class VerticalBrightnessSlider extends StatelessWidget {
  final Prop<double> brightness;

  const VerticalBrightnessSlider({super.key, required this.brightness});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) => Watch((c) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  _getBrightnessIcon(brightness()),
                  color: Colors.white,
                  size: 20,
                ),
                const SizedBox(height: 8),
                SizedBox(
                  height: constraints.biggest.height * 150 / 256,
                  child: RotatedBox(
                    quarterTurns: -1,
                    child: SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbShape:
                            const RoundSliderThumbShape(enabledThumbRadius: 0),
                        overlayShape: SliderComponentShape.noOverlay,
                        trackHeight: 2,
                      ),
                      child: Slider(
                        value: brightness(),
                        onChanged: (value) => brightness.emit(value),
                        activeColor: Colors.white,
                        inactiveColor: Colors.white.withAlpha(76),
                      ),
                    ),
                  ),
                ),
              ],
            )));
  }

  IconData _getBrightnessIcon(double value) {
    if (value < 0.3) {
      return Icons.brightness_2;
    } else if (value < 0.6) {
      return Icons.brightness_5;
    }

    return Icons.brightness_7;
  }
}
