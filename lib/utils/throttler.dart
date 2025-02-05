import 'dart:async';
import 'dart:ui';

class Throttler {
  final int milliseconds;
  bool _isReady = true;

  Throttler({required this.milliseconds});

  void run(VoidCallback action) {
    if (_isReady) {
      _isReady = false;
      action();
      Timer(Duration(milliseconds: milliseconds), () {
        _isReady = true;
      });
    }
  }
}
