import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ctrip/util/navigator_util.dart';
import 'package:flutter_ctrip/navigator/tab_navigator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/**
 * 闪屏页
 */
class SplashPage extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // 定时器，3s自动跳转
    int count = 0;
    const period = const Duration(seconds: 1);
    print('currentTime=' + DateTime.now().toString());
    Timer.periodic(period, (timer) {
      //  到时回调
      print('afterTimer=' + DateTime.now().toString());
      count++;
      if (count >= 3) {
        //  取消定时器，避免无限回调
        timer.cancel();
        timer = null;
        _toRootPage();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  _toRootPage() {
    NavigatorUtil.push(context, TabNavigator());
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);
    return Container(
      color: const Color(0xFF0099ff),
    );
  }
}
