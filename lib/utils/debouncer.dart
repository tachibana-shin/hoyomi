import 'dart:async';

class Debouncer<T> {
  final Duration duration;
  final void Function(T data) action;
  Timer? _timer;

  Debouncer(this.duration, this.action);

  void run(T data) {
    _timer?.cancel();
    _timer = Timer(duration, () => action(data));
  }

  void dispose() {
    _timer?.cancel();
  }
}
