import 'package:flutter/foundation.dart';

import 'utils/one_call_task.dart';

class ComputedAsyncNotifier<T> extends ChangeNotifier {
  T? _value;
  dynamic _error;
  bool _loading = false;

  final Future<T> Function() compute;
  final List<ChangeNotifier> depends;
  final void Function(dynamic error)? onError;
  final T? Function()? onBeforeUpdate;

  late final Noop _onChange;
  Listenable? _listenable;
  bool _initialized = false;

  ComputedAsyncNotifier(this.compute,
      {required this.depends, this.onError, this.onBeforeUpdate}) {
    _onChange = oneCallTask(() {
      _loading = true;

      if (onBeforeUpdate != null) {
        _value = onBeforeUpdate!();
      }

      _updateValue()
          .then((_) => notifyListeners())
          .catchError((error) => onError?.call(_error = error))
          .whenComplete(() => _loading = false);
    });
  }

  T? get value {
    if (!_initialized) {
      _initialized = true;

      _onChange();
      _listenable = Listenable.merge(depends)..addListener(_onChange);
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
  void dispose() {
    _listenable?.removeListener(_onChange);
    super.dispose();
  }

  @override
  String toString() => '${describeIdentity(this)}($value)';
}
