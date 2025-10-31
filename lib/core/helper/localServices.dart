import 'package:shared_preferences/shared_preferences.dart';

class LocalServices {
  static SharedPreferences? sharedPreferences;

  static Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }
}
