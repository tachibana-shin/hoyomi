import 'package:honyomi/preferences.dart';

Future<bool?> getSigned(String name) async {
  final pref = await getPreferences();

  return pref.getBool('signed_$name');
}

Future<bool> setSigned(String name, bool value) async {
  final pref = await getPreferences();

  return pref.setBool('signed_$name', value);
}
