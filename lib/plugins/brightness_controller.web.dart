// brightness_overlay_web.dart
import 'package:web/web.dart';

HTMLDivElement? _overlayDiv;

void _ensureOverlay() {
  if (_overlayDiv != null) return;

  _overlayDiv = HTMLDivElement()
    ..style.position = 'fixed'
    ..style.top = '0'
    ..style.left = '0'
    ..style.width = '100vw'
    ..style.height = '100vh'
    ..style.zIndex = '999999'
    ..style.pointerEvents = 'none'
    ..style.transition = 'opacity 0.3s ease';

  document.body!.append(_overlayDiv!);
}

Future<void> setApplicationScreenBrightness(double brightness) async {
  _ensureOverlay();

  final value = brightness.clamp(0.0, 1.0);
  final opacity = 1.0 - value; // càng thấp càng sáng
  _overlayDiv!.style
    ..backgroundColor = 'black'
    ..opacity = opacity.toString();
}

Future<double> getApplicationScreenBrightness() async {
  if (_overlayDiv == null) return 1.0;
  return 1.0 - double.tryParse(_overlayDiv!.style.opacity)!;
}

Future<void> resetApplicationScreenBrightness() async {
  if (_overlayDiv != null) {
    _overlayDiv!.remove();
    _overlayDiv = null;
  }
}
