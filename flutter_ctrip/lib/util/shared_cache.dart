/**
 * File : shared_cache
 * tips : 缓存工具类
 * @author : karl.wei
 * @date : 2020-04-06 17:51
 **/

import 'package:shared_preferences/shared_preferences.dart';

class PreferencesKeys {
    static final token = "token";
    static final userName = "userName";
    static final password = "password";
    static final appIsFirstLauch = "appIsFirstLauch";
}

class CacheUtil {

  static saveStringToPreferences(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  static saveBoolToPreferences(String key, bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
  }

  static Future<String> getStringFromPreferences(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  static Future<bool> getBoolFromPreferences(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key);
  }

}


