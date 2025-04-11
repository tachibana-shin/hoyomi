import 'iterable_extension.dart';

extension JoinWithListExtension<T> on List<List<T>> {
  List<T> joinWith(T separator) {
    return asMap().entries.foldWithIterable<List<T>>([], (arr, entry, list) {
      int index = entry.key;
      final item = entry.value;

      arr.addAll(item);

      if (index < list.length - 1) arr.add(separator);

      return arr;
    });
  }
}
