import 'package:shared_preferences/shared_preferences.dart';

class BaseSharedPreferences {
  BaseSharedPreferences._();

  static Future<bool> containKey(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(key);
  }

  static Future<bool> saveStringValue(String key, String value) async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.setString(key, value);
  }

  static Future<String> getStringValue(String key) async {
    final preferences = await SharedPreferences.getInstance();
    final value = preferences.getString(key) ?? '';
    return value;
  }

  static Future<bool> savedDoubleValue(String key, double value) async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.setDouble(key, value);
  }

  static Future<double?> getDoubleValue(String key) async {
    final preferences = await SharedPreferences.getInstance();
    final value = preferences.getDouble(key);
    return value;
  }

  static Future<void> remove(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }
}
