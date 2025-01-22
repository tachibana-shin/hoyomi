import 'package:flutter/foundation.dart';

ValueNotifier<T> computedNotifier<T>(
  List<ValueNotifier> notifiers,
  T Function() compute,
) {
  final computedNotifier = ValueNotifier<T>(compute());

  void update() {
    final newValue = compute();
    if (computedNotifier.value != newValue) {
      computedNotifier.value = newValue;
    }
  }

  for (var notifier in notifiers) {
    notifier.addListener(update);
  }

  return computedNotifier;
}
