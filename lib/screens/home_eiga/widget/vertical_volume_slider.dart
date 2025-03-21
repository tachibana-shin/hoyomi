import 'package:flutter/material.dart';
import 'package:kaeru/kaeru.dart';

class VerticalVolumeSlider extends StatelessWidget {
  final Prop<double> volume;

  const VerticalVolumeSlider({super.key, required this.volume});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) => Watch(() => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  _getVolumeIcon(volume()),
                  color: Colors.white,
                  size: 25,
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
                        trackHeight: 5,
                      ),
                      child: Slider(
                        value: volume(),
                        onChanged: (value) => volume.emit(value),
                        activeColor: Colors.white,
                        inactiveColor: Colors.white.withAlpha(76),
                      ),
                    ),
                  ),
                ),
              ],
            )));
  }

  IconData _getVolumeIcon(double value) {
    if (value == 0.0) {
      return Icons.volume_off;
    } else if (value < 0.3) {
      return Icons.volume_mute;
    } else if (value < 0.7) {
      return Icons.volume_down;
    } else {
      return Icons.volume_up;
    }
  }
}
