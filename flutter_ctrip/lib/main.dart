import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';
import 'package:flutter_ctrip/pages/splash_page.dart';
import 'package:flutter_ctrip/provider/app_store.dart';
import 'package:provider/provider.dart';
import 'package:flutter_ctrip/provider/provider_manager.dart';

void main() async {
  /*
  if (Platform.isAndroid) {
    // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
  */
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemUiOverlayStyle style = SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,

        ///这是设置状态栏的图标和字体的颜色
        ///Brightness.light  一般都是显示为白色
        ///Brightness.dark 一般都是显示为黑色
        statusBarIconBrightness: Brightness.dark);
    SystemChrome.setSystemUIOverlayStyle(style);

    return MultiProvider(
      providers: providers,
      child: Consumer<AppStore>(builder: (context, userStore, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'FCtrip',
          theme: Provider.of<AppStore>(context, listen: false).themeData,
          home: SplashPage(),
        );
      }),
    );
  }
}
