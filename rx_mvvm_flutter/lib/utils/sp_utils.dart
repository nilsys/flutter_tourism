import 'package:shared_preferences/shared_preferences.dart';

typedef SPCallback = void Function(dynamic result); //泛型回调

class SPUtils {
  static Future<bool> setData(String key, Object data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (data is int) {
      return prefs.setInt(key, data);
    } else if (data is double) {
      return prefs.setDouble(key, data);
    } else if (data is bool) {
      return prefs.setBool(key, data);
    } else if (data is List<String>) {
      return prefs.setStringList(key, data);
    } else {
      return prefs.setString(key, data);
    }
  }

  static get<T>(String key, T def, SPCallback callback) {
    getData(key, def).then((value) {
      callback(value);
    });
  }

  static Future<T> getData<T>(String key, T def) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (def is int) {
      return prefs.getInt(key) as T ?? def;
    } else if (def is double) {
      return prefs.getDouble(key) as T ?? def;
    } else if (def is bool) {
      return prefs.getBool(key) as T ?? def;
    } else if (def is List<String>) {
      return prefs.getStringList(key) as T ?? def;
    } else {
      return prefs.getString(key) as T ?? def;
    }
  }
}
