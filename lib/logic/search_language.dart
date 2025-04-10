import 'package:sealed_languages/sealed_languages.dart';

NaturalLanguage? searchLanguage(String text) {
  text = text.toUpperCase().trim();

  for (final natural in NaturalLanguage.list) {
    final name = natural.name.toUpperCase();

    if (text == name) return natural;
    if ('${text}ESE' == name) return natural;
    if (natural.code == text || natural.codeShort == text) return natural;
    if (natural.namesNative.any((name) => name.toUpperCase() == text)) {
      return natural;
    }
  }

  return null;
}
