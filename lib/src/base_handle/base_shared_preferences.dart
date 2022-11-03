import 'package:shared_preferences/shared_preferences.dart';

/// # [BaseSharedPreferences] is a base class for all shared preferences
class BaseSharedPreferences {
  BaseSharedPreferences._();

  /// # [containKey] Check if the key is exist
  ///[key] is the key of the shared preferences
  static Future<bool> containKey(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(key);
  }

  /// # [saveStringValue] Save string value to SharedPreferences
  ///[key] is key of value
  ///[value] is value of key
  static Future<bool> saveStringValue(String key, String value) async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.setString(key, value);
  }

  /// # [getStringValue] Get string value from SharedPreferences
  ///[key] is key of value
  static Future<String> getStringValue(String key) async {
    final preferences = await SharedPreferences.getInstance();
    final value = preferences.getString(key) ?? '';
    return value;
  }

  /// # [saveIntValue] Save int value to SharedPreferences
  /// * Param [value] The value to save
  /// * Param [key] The key to save the value
  static Future<bool> savedDoubleValue(String key, double value) async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.setDouble(key, value);
  }

  /// # [getIntValue] Get int value from SharedPreferences
  /// * Param [key] The key to get the value
  static Future<double?> getDoubleValue(String key) async {
    final preferences = await SharedPreferences.getInstance();
    final value = preferences.getDouble(key);
    return value;
  }

  /// # [saveBoolValue] Save bool value to SharedPreferences
  /// * Param [value] The value to save
  /// * Param [key] The key to save the value
  static Future<bool> savedBoolValue(String key, bool value) async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.setBool(key, value);
  }

  /// # [getIntValue] Get int value from SharedPreferences
  /// * Param [key] The key to get the value
  static Future<bool?> getBoolValue(String key) async {
    final preferences = await SharedPreferences.getInstance();
    final value = preferences.getBool(key);
    return value;
  }

  static Future<void> remove(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }
}
