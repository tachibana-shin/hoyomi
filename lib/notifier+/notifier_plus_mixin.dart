import 'dart:collection';

import 'package:flutter/widgets.dart';

mixin NotifierPlusMixin<T extends StatefulWidget> on State<T> {
  final _listenersStore = HashMap<ChangeNotifier, void Function()>();

  void listenNotifier(ChangeNotifier notifier, void Function() listener,
      {bool immediate = false}) {
    if (immediate) listener();
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
