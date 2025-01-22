import 'package:flutter/widgets.dart';

mixin AutoDisposeNotifier<T extends StatefulWidget> on State<T> {
  final List<ValueNotifier> _notifiers = [];

  void registerNotifier(ValueNotifier notifier) {
    _notifiers.add(notifier);
  }

  @override
  void dispose() {
    for (var notifier in _notifiers) {
      notifier.dispose();
    }
    super.dispose();
  }
}
