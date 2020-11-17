import 'package:flutter/material.dart';
import 'package:rx_mvvm_flutter/pages/login/login_page.dart';
import 'package:rx_mvvm_flutter/pages/login/register_page.dart';
import 'package:rx_mvvm_flutter/pages/main/main_tab.dart';
import 'package:rx_mvvm_flutter/pages/mine/about_page.dart';
import 'package:rx_mvvm_flutter/pages/mine/address_page.dart';
import 'package:rx_mvvm_flutter/pages/mine/edit_address_page.dart';
import 'package:rx_mvvm_flutter/pages/splash/splash_page.dart';
import 'package:rx_mvvm_flutter/router/route_paths.dart';

class Routers {
//  所有页面路由静态Map
  static final Map<String, Function> router = {
    RoutePaths.root: (BuildContext context, {Map argument}) => MainTab(),
    RoutePaths.splash: (BuildContext context, {Map argument}) => SplashPage(),
    RoutePaths.login: (BuildContext context, {Map argument}) => LoginPage(),
    RoutePaths.register: (BuildContext context, {Map argument}) =>
        RegisterPage(),
    RoutePaths.about: (BuildContext context, {Map argument}) => AboutUsPage(),
    RoutePaths.address: (BuildContext context, {Map argument}) => AddressPage(),
    RoutePaths.editAddress: (BuildContext context, {Map argument}) => EditAddressPage(),
    // '/login': (BuildContext context, {Map argument}) =>
    //     new LoginPage(arguments: argument),
    // '/newfeatures': (BuildContext context, {Map argument}) =>
    //     new NewfeaturesPage(),
    // '/tabnavigator': (BuildContext context, {Map argument}) =>
    //     new TabNavigator(),
  };

//  进入页面通用方法
  static pushName(BuildContext context, String key, {Map params, callBack}) {
    Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => router[key](context, argument: params)))
        .then((res) {
      if (callBack != null) {
        callBack(res);
      }
    });
  }

  static pushReplacement(BuildContext context, String key,
      {Map params, callBack}) {
    Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => router[key](context, argument: params)))
        .then((res) {
      if (callBack != null) {
        callBack(res);
      }
    });
  }

  static pushAndRemove(BuildContext context, String key,
      {Map params, callBack}) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (context) => router[key](context, argument: params)),
        (check) => false).then((res) {
      if (callBack != null) {
        callBack(res);
      }
    });
  }
}
