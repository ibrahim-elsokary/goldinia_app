import 'package:shared_preferences/shared_preferences.dart';

abstract class SharedPreferencesHelper {
  static late final SharedPreferences prefs;

  static Future<void> initSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
  }

  static Future<void> initSharedPreferencesValues() async {
    if (get(key: 'country') == null) {
      await put(key: 'country', value: 'egypt');
    }
    if (get(key: 'isGram') == null) {
      await put(key: 'isGram', value: true);
    }
    if (get(key: 'bottomNavBarIndex') == null) {
      await put(key: 'bottomNavBarIndex', value: 4);
    }
    if (get(key: 'isWalletEmpty') == null) {
      await put(key: 'isWalletEmpty', value: true);
    }
    if (get(key: 'walletValues') == null) {
      await put(key: 'walletValues', value: [].cast<String>().toList());
    }
  }

  static Future<void> put({required String key, required value}) async {
    switch (value.runtimeType) {
      case int:
        await prefs.setInt(key, value);
        break;

      case bool:
        await prefs.setBool(key, value);
        break;

      case double:
        await prefs.setDouble(key, value);
        break;

      case String:
        await prefs.setString(key, value);
        break;

      case List<String>:
        List<String> stringList = value.cast<String>().toList();
        await prefs.setStringList(key, stringList);
        break;

      default:
        await prefs.setString(key, value.toString());
    }
  }

  static dynamic get({required String key}) {
    return prefs.get(key);
  }

  static dynamic getStringList({required String key}) {
    return prefs.getStringList(key);
  }

  static Future<bool> delete({required String key}) async {
    return await prefs.remove(key);
  }

  static Future<bool> clear() async {
    return await prefs.clear();
  }
}
