import 'package:flutter/material.dart';
import 'package:rx_mvvm_flutter/pages/login/login_page.dart';
import 'package:rx_mvvm_flutter/pages/login/register_page.dart';
import 'package:rx_mvvm_flutter/pages/main/main_tab.dart';
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
