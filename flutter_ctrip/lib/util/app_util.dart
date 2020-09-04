import 'package:package_info/package_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppUtil {
  //获取当前版本号
  static Future<String> getVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String appName = packageInfo.appName;
    String packageName = packageInfo.packageName;
    String version = packageInfo.version;
    String buildNumber = packageInfo.buildNumber;
    return version;
  }

  //获取旧版本号
  static Future<String> getOldVersion() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String version = sharedPreferences.getString('OLD_VERSION') ?? "";
    return version;
  }

  //设置新的版本号
  static setNewVersion() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String version = packageInfo.version;
    sharedPreferences.setString("OLD_VERSION", version);
  }
}
