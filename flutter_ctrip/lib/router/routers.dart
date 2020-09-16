import 'package:flutter/material.dart';
import 'package:flutter_ctrip/navigator/tab_navigator.dart';
import 'package:flutter_ctrip/section/main/pages/splash_page.dart';
import 'package:flutter_ctrip/section/main/pages/newfeatures_page.dart';
import 'package:flutter_ctrip/section/login/pages/login_page.dart';

class Routers {
//  所有页面路由静态Map
  static final Map<String, Function> router = {
    '/splash': (BuildContext context, {Map argument}) => new SplashPage(),
    '/login': (BuildContext context, {Map argument}) =>
        new LoginPage(arguments: argument),
    '/newfeatures': (BuildContext context, {Map argument}) =>
        new NewfeaturesPage(),
    '/tabnavigator': (BuildContext context, {Map argument}) =>
        new TabNavigator(),
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
