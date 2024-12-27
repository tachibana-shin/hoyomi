import 'package:flutter/material.dart';

class Reactive<T> {
  late final ValueNotifier<T> _value;

  Reactive(T value) {
    _value = ValueNotifier<T>(value);
  }

  T get value => _value.value;

  set value(T newValue) {
    _value.value = newValue;
  }

  Widget builder(ValueWidgetBuilder<T> builder) =>
      ValueListenableBuilder<T>(valueListenable: _value, builder: builder);

  void dispose() {
    _value.dispose();
  }
}
