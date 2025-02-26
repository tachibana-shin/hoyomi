class Option {
  final String name;
  final String value;
  final bool selected;

  const Option({
    required this.name,
    required this.value,
    this.selected = false,
  });
}

class Filter {
  final String name;
  final String key;
  final bool multiple;
  final List<Option> options;

  const Filter({
    required this.name,
    required this.key,
    required this.multiple,
    required this.options,
  });
}
