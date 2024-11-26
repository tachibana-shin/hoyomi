import 'package:honyomi/preferences.dart';

Future<String?> getCookie(String name) async {
  final pref = await getPreferences();

  return pref.getString('cookie_$name');
}

Future<bool> setCookie(String name, String data) async {
  final pref = await getPreferences();

  return pref.setString('cookie_$name', data);
}
