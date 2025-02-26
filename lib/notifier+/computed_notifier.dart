import 'package:flutter/foundation.dart';

class ComputedNotifier<T> extends ChangeNotifier {
  late T _value;

  final T Function() compute;
  final List<ValueNotifier> depends;

  bool _initialized = false;

  ComputedNotifier(this.compute, {required this.depends});

  T get value {
    if (!_initialized) {
      _initialized = true;
      _value = this.compute();
      Listenable.merge(depends).addListener(() {
        _value = compute();
        notifyListeners();
      });
    }

    return _value;
  }

  @override
  String toString() => '${describeIdentity(this)}($value)';
}
