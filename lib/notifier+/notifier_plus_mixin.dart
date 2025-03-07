import 'dart:collection';

import 'package:flutter/widgets.dart';

mixin NotifierPlusMixin<T extends StatefulWidget> on State<T> {
  final _listenersStore = HashMap<ValueNotifier, void Function()>();

  void listenerNotifier(ValueNotifier notifier, void Function() listener) {
    notifier.addListener(listener);
  }

  @override
  void dispose() {
    _listenersStore.forEach((notifier, listener) {
      notifier.removeListener(listener);
    });
    _listenersStore.clear();

    super.dispose();
  }
}
