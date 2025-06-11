class ComicModes {
  static const String leftToRight = 'leftToRight';
  static const String rightToLeft = 'rightToLeft';
  static const String topToBottom = 'topToBottom';
  static const String webToon = 'webToon';

  static const List<String> values = [
    leftToRight,
    rightToLeft,
    topToBottom,
    webToon,
  ];

  static bool isValid(String? value) => values.contains(value);
}
