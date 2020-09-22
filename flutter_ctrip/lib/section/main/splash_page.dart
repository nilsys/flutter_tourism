import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ctrip/util/app_context.dart';
import 'package:flutter_ctrip/util/navigator_util.dart';
import 'package:flutter_ctrip/navigator/tab_navigator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ctrip/section/main/newfeatures_page.dart';
import 'package:flutter_ctrip/util/app_util.dart';
import 'package:flutter_ctrip/router/routers.dart';

/**
 * 闪屏页
 */
class SplashPage extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<SplashPage> {
  int timeCount = 3;
  Timer _timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // 定时器，3s自动跳转
    int count = 0;
    const period = const Duration(seconds: 1);
    print('currentTime=' + DateTime.now().toString());
    _timer = Timer.periodic(period, (timer) {
      //  到时回调
      print('afterTimer=' + DateTime.now().toString());
      count++;
      setState(() {
        timeCount = 3 - count;
      });
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

  _toRootPage() async {
    String currentVersion = await AppUtil.getVersion();
    String storageVersion = await AppUtil.getOldVersion();
    print(currentVersion + '/n' + storageVersion);
    if (storageVersion == currentVersion) {
      //版本号相同显示首页
      //NavigatorUtil.push(context, TabNavigator());
      Routers.pushAndRemove(context, "/tabnavigator");
    } else {
      //版本号不一致， 显示引导页
      Routers.pushAndRemove(context, "/newfeatures");

      /*
      Routers.pushName(context, "/newfeatures", callBack: (res) {
        Routers.pushAndRemove(context, "/tabnavigator");
        AppUtil.setNewVersion();
      });
      */

      /*
      NavigatorUtil.push(context, NewfeaturesPage(), callBack: (res) {
        print("callback" + res);
        NavigatorUtil.push(context, TabNavigator());
        //本地存储新的版本号
        AppUtil.setNewVersion();
      });
      */
    }
  }

  Widget _backgroundContent() {
    return new ConstrainedBox(
      constraints: BoxConstraints.expand(),
      child: CachedNetworkImage(
        imageUrl:
            "https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2035750262,1361055912&fm=26&gp=0.jpg",
        fit: BoxFit.cover,
        placeholder: (context, url) => new CircularProgressIndicator(),
        errorWidget: (context, url, error) => new Icon(Icons.error),
      ),
    );
  }

  Widget _skipButton() {
    return new Padding(
      padding: new EdgeInsets.fromLTRB(0.0, 30.0, 10.0, 0.0),
      child: new FlatButton(
        onPressed: () {
          _timer.cancel();
          _timer = null;
          _toRootPage();
        },
        color: Colors.grey,
        child: new Text(
          "$timeCount 跳过广告",
          style: new TextStyle(color: Colors.white, fontSize: 12.0),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);
    /*
    new Image.network(
            "https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2035750262,1361055912&fm=26&gp=0.jpg",
            fit: BoxFit.cover,
          )
     */
    return new Stack(
      alignment: const Alignment(1.0, -1.0), // 右上角对齐
      children: [_backgroundContent(), _skipButton()],
    );
  }
}
