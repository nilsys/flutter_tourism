import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ctrip/pages/splash_page.dart';
import 'package:flutter_ctrip/provider/app_store.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:flutter_ctrip/provider/provider_manager.dart';

import 'generated/i18n.dart';

void main() async {
  // 沉浸式状态栏
  if (Platform.isAndroid) {
    // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
  runZoned(() {
    ErrorWidget.builder = (FlutterErrorDetails details) {
      Zone.current.handleUncaughtError(details.exception, details.stack);
      return Center(
        child: Text('出错啦'),
      );
    };
    FlutterError.onError = (FlutterErrorDetails details) {
      FlutterError.dumpErrorToConsole(details);
      Zone.current.handleUncaughtError(details.exception, details.stack);
    };
    runApp(MyApp());
  }, onError: (Object obj, StackTrace stack) {
    // 上传错误日志
    print(obj);
    print(stack);
  });
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
      providers: ProviderManager.providers,
      child: Consumer<AppStore>(builder: (context, userStore, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'trip',
          builder: (context, child) => Scaffold(
              // 点击空白出缩下键盘
              body: GestureDetector(
            onTap: () {
              FocusScopeNode currentFocus = FocusScope.of(context);
              if (!currentFocus.hasPrimaryFocus &&
                  currentFocus.focusedChild != null) {
                FocusManager.instance.primaryFocus.unfocus();
              }
            },
            child: child,
          )),
          localizationsDelegates: [
            I18n.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: I18n.delegate.supportedLocales,
          theme: Provider.of<AppStore>(context, listen: false).themeData,
          home: SplashPage(),
        );
      }),
    );
  }
}
