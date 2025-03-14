import 'dart:collection';

import 'package:flutter/widgets.dart';

import 'utils/one_call_task.dart';

mixin NotifierPlusMixin<T extends StatefulWidget> on State<T> {
  final _listenersStore = HashMap<Listenable, VoidCallback>();
  final _fbBeforeUnloadStore = <VoidCallback>{};

  void listenNotifier(ChangeNotifier notifier, VoidCallback listener,
      {bool immediate = false}) {
    listener = oneCallTask(listener);

    if (immediate) listener();
    notifier.addListener(listener);
    _listenersStore[notifier] = listener;
  }

  void listenNotifiers(List<ChangeNotifier> notifiers, VoidCallback listener,
      {bool immediate = false}) {
    final notifier = Listenable.merge(notifiers);

    listener = oneCallTask(listener);

    if (immediate) listener();
    notifier.addListener(listener);
    _listenersStore[notifier] = listener;
  }

  void onBeforeUnload(VoidCallback cb) {
    _fbBeforeUnloadStore.add(cb);
  }

  @override
  void dispose() {
    _fbBeforeUnloadStore
      ..forEach((cb) => cb())
      ..clear();
    _listenersStore
      ..forEach((notifier, listener) {
        notifier.removeListener(listener);
      })
      ..clear();

    super.dispose();
  }
}
