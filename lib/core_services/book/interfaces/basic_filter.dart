class BasicOption {
  final String name;
  final String value;
  final bool selected;

  const BasicOption(
      {required this.name, required this.value, this.selected = false});
}

class BasicFilter {
  final String name;
  final String key;
  final bool multiple;
  final List<BasicOption> options;

  const BasicFilter(
      {required this.name,
      required this.key,
      required this.multiple,
      required this.options});
}
