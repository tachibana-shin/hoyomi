import 'package:flutter/foundation.dart';

class ComputedAsyncNotifier<T> extends ChangeNotifier {
  T? _value;
  dynamic _error;
  bool _loading = false;

  final Future<T> Function() compute;
  final List<ChangeNotifier> depends;
  final void Function(dynamic error)? onError;

  bool _initialized = false;

  ComputedAsyncNotifier(this.compute, {required this.depends, this.onError});

  T? get value {
    if (!_initialized) {
      _initialized = true;
      _loading = true;
      _updateValue()
          .catchError((error) => onError?.call(_error = error))
          .whenComplete(() => _loading = false);
      Listenable.merge(depends).addListener(() {
        _updateValue()
            .then((_) => notifyListeners())
            .catchError((error) => onError?.call(_error = error))
            .whenComplete(() => _loading = false);
      });
    }

    return _value;
  }

  dynamic get error => _error;
  bool get loading => _loading;

  Future<void> _updateValue() async {
    _value = await compute();
  }

  void forceValue(T value) {
    _value = value;
    notifyListeners();
  }

  @override
  String toString() => '${describeIdentity(this)}($value)';
}
