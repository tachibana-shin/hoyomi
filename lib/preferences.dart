import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? preferences;

Future<SharedPreferences> getPreferences() async {
  preferences ??= await SharedPreferences.getInstance();

  return preferences!;
}