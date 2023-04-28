import 'dart:ffi';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static late final SharedPreferences prefs;

  static Future<void> initSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
  }

  static Future<void> put({required String key, required value}) async {
    switch (value.runtimeType) {
      case Int:
        await prefs.setInt(key, value);
        break;

      case Bool:
        await prefs.setBool(key, value);
        break;

      case Double:
        await prefs.setDouble(key, value);
        break;

      case String:
        await prefs.setString(key, value);
        break;

      default:
        await prefs.setString(key, value.toString());
    }
  }

  static dynamic get({required String key}) {
    return prefs.get(key);
  }

  static Future<bool> delete({required String key}) async {
    return await prefs.remove(key);
  }

  static Future<bool> clear({required String key}) async {
    return await prefs.clear();
  }

  
}
