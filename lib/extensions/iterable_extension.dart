extension FoldWithIterableExtension<T> on Iterable<T> {
  R foldWithIterable<R>(
    R initialValue,
    R Function(R accumulator, T currentValue, Iterable<T> list) callback,
  ) {
    R accumulator = initialValue;
    for (int i = 0; i < length; i++) {
      accumulator = callback(accumulator, elementAt(i), this);
    }
    return accumulator;
  }

  Iterable<R> mapWithIterable<R>(
    R Function(T currentValue, Iterable<T> list) callback,
  ) {
    return map((currentValue) => callback(currentValue, this));
  }
}
