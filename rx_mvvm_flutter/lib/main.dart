import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rx_mvvm_flutter/pages/splash/splash_page.dart';
import 'package:rx_mvvm_flutter/provide/provider_manager.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: ProviderManager.providers,
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          debugShowCheckedModeBanner: false, // 去除debug旗标
          home: SplashPage(),
        ));
  }
}
