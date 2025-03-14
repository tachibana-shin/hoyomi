import 'package:flutter/foundation.dart';
import 'package:hoyomi/notifier+/utils/one_call_task.dart';

class ComputedNotifier<T> extends ChangeNotifier {
  late T _value;

  final T Function() compute;
  final List<ChangeNotifier> depends;

  bool _initialized = false;
  Listenable? _listenable;
  late final Noop _onChange;

  ComputedNotifier(this.compute, {required this.depends}) {
    _onChange = oneCallTask(() {
      _value = compute();
      notifyListeners();
    });
  }

  T get value {
    if (!_initialized) {
      _initialized = true;
      _value = this.compute();
      _listenable = Listenable.merge(depends)..addListener(_onChange);
    }

    return _value;
  }

  void forceValue(T value) {
    _value = value;
    notifyListeners();
  }

  @override
  void dispose() {
    _listenable?.removeListener(_onChange);
    super.dispose();
  }

  @override
  String toString() => '${describeIdentity(this)}($value)';
}
