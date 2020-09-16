import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ctrip/navigator/tab_navigator.dart';
import 'package:flutter_ctrip/router/routers.dart';
import 'package:flutter_ctrip/util/app_util.dart';
import 'package:flutter_ctrip/util/navigator_util.dart';
import 'package:flutter_ctrip/util/shared_cache.dart';

/**
 * 新特性页
 */
class NewfeaturesPage extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<NewfeaturesPage> with WidgetsBindingObserver {
  AppLifecycleState _appLifecycleState;
  //屏幕的宽高
  double width;
  double height;

  //状态栏的高度
  double statebar_height;
  int pageViewIndex = 0;
  // 按钮点击变色--设置一个state值，按下的时候和抬起改变（跟react的state一样）(按钮的点击效果，更换背景色)
  bool isClicking1 = false;
  var images = [
    "images/welcome1.png",
    "images/welcome2.png",
    "images/welcome3.png"
  ];

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print(state);
    setState(() {
      _appLifecycleState = state;
    });
  }

  //Pageview的使用
  Widget _pageView() {
    PageView pageView;
    PageController pageController;
    pageController = new PageController();
    //加载asset目录下的图片===在项目中新建一个images文件夹，然后把文件放进去，在pubspec.yaml里面配置如下
    //  assets:
    //  - images/welcome1.png
    //调用使用 Image.Asset('images/a.png')或者下面的new AssetImage('images/a.png')
    pageView = new PageView.builder(
      itemBuilder: (context, index) => _rendRow(context, index),
      itemCount: images.length,
      scrollDirection: Axis.horizontal,
      reverse: false,
      //是右侧下一个还是左侧下一个
      controller: pageController,
      onPageChanged: (index) {
        print('点击滚动到的位置' + index.toString());
        setState(() {
          pageViewIndex = index;
        });
      },
      physics: PageScrollPhysics(parent: BouncingScrollPhysics()),
    );
    return pageView;
  }

  Widget _rendRow(BuildContext context, int index) {
    return new ConstrainedBox(
      child: new Image(
        image: CachedNetworkImageProvider(
            "https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2035750262,1361055912&fm=26&gp=0.jpg"),
        fit: BoxFit.fill,
      ),
      constraints: new BoxConstraints.expand(),
    );
  }

  Widget _skipButton() {
    return new Positioned(
      //给view添加点击事件，使用GestureDetector便签包裹
      child: new GestureDetector(
        child: new Container(
          padding:
              const EdgeInsets.only(left: 10, top: 2, right: 10, bottom: 2),
          decoration: new ShapeDecoration(
            color: !isClicking1 ? Colors.white : Color(0xff898989),
            shape: StadiumBorder(
                side: BorderSide(
                    color: Color(0xff898989),
                    style: BorderStyle.solid,
                    width: 1)),
          ),
          child: new Text('跳过'),
        ),
        onTap: () {
          CacheUtil.saveBoolToPreferences(PreferencesKeys.appIsFirstLauch, true);
          print('触发跳过');
          //Navigator.of(context).pop('测试');
          Routers.pushAndRemove(context, "/tabnavigator");
          AppUtil.setNewVersion();
        },
        onTapUp: (TapUpDetails) {
          print('触发onTapUp');
          upDataButtonState(false);
        },
        onTapDown: (TapUpDetails) {
          print('触发onTapDown');
          upDataButtonState(true);
        },
        onTapCancel: () {
          print('触发onTapCancel');
          upDataButtonState(false);
        },
      ),
      top: 10 + statebar_height,
      right: 10,
    );
  }

  Widget _startOpenButton() {
    return new Positioned(
      child: new GestureDetector(
        child: Text("开始体验"),
        onTap: () {
          CacheUtil.saveBoolToPreferences(PreferencesKeys.appIsFirstLauch, true);
          print('点击了立即开启');
        },
      ),
      height: pageViewIndex == 2 ? width / 10 : 0,
      bottom: width / 10 - 2,
      left: 0,
      right: 0,
    );
  }

  //StateFulWidget更新state，从而更新UI
  void upDataButtonState(bool clicked) {
    setState(() {
      isClicking1 = clicked;
    });
  }

  @override
  Widget build(BuildContext context) {
    //获取屏幕的尺寸信息：注意  只能写在这个方法，不能写在initstate
    //需要导入的包  import 'dart:ui';
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    statebar_height = MediaQuery.of(context).padding.top;
    print('手机信息' +
        width.toString() +
        "/" +
        height.toString() +
        "/" +
        statebar_height.toString());
    //stack布局:后进后显示原则。设置绝对定位使用Positined left top bottom right实现上下左右间距，可以只设置一个
    return new Scaffold(
        body: new Stack(
      children: <Widget>[
        new Positioned(
          child: _pageView(),
          left: 0,
          right: 0,
          top: 0,
          bottom: 0,
        ),
        _skipButton(),
        _startOpenButton()
      ],
    ));
  }
}
