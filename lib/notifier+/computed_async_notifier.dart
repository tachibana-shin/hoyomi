import 'package:flutter/foundation.dart';

class ComputedAsyncNotifier<T> extends ChangeNotifier {
  late T _value;

  final Future<T> Function() compute;
  final List<ChangeNotifier> depends;
  final void Function(dynamic error)? onError;

  bool _initialized = false;

  ComputedAsyncNotifier(this.compute, {required this.depends, this.onError});

  T get value {
    if (!_initialized) {
      _initialized = true;
      _updateValue();
      Listenable.merge(depends).addListener(() {
        _updateValue()
            .then((_) => notifyListeners())
            .catchError((error) => onError?.call(error));
      });
    }

    return _value;
  }

  Future<void> _updateValue() async {
    _value = await compute();
  }

  @override
  String toString() => '${describeIdentity(this)}($value)';
}
