import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rx_mvvm_flutter/router/route_paths.dart';
import 'package:rx_mvvm_flutter/router/routers.dart';

class SplashPage extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // 启动图三秒
    Future.delayed(Duration(seconds: 3), () {
      Routers.pushAndRemove(context, RoutePaths.root);
    });
  }

  @override
  Widget build(BuildContext context) {
    // 设计图的尺寸
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Scaffold(
      body: Container(
        color: Colors.deepOrangeAccent,
        child: Image.asset(
          "images/splash.png",
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
