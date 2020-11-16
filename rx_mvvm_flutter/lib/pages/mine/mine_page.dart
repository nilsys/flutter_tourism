import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rx_mvvm_flutter/constant/string.dart';
import 'package:rx_mvvm_flutter/event/login_event.dart';
import 'package:rx_mvvm_flutter/router/route_paths.dart';
import 'package:rx_mvvm_flutter/router/routers.dart';
import 'package:rx_mvvm_flutter/service/user_service.dart';
import 'package:rx_mvvm_flutter/utils/shared_preferences_util.dart';
import 'package:rx_mvvm_flutter/utils/toast_util.dart';
import 'package:rx_mvvm_flutter/widgets/app_icons.dart';
import 'package:rx_mvvm_flutter/widgets/icon_text_arrow.dart';

class MinePage extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MinePage> {
  bool isLogin = false;
  var imageHeadUrl;
  var nickName;
  UserService _userService = UserService();

  @override
  void initState() {
    super.initState();
    _getUserInfo();
  }

  _refreshEvent() {
    loginEventBus.on<LoginEvent>().listen((LoginEvent loginEvent) {
      if (loginEvent.isLogin) {
        setState(() {
          isLogin = true;
          imageHeadUrl = loginEvent.url;
          nickName = loginEvent.nickName;
        });
      } else {
        setState(() {
          isLogin = false;
        });
      }
    });
  }

  _getUserInfo() {
    SharedPreferencesUtils.getToken().then((token) {
      if (token != null) {
        setState(() {
          isLogin = true;
        });
        SharedPreferencesUtils.getImageHead().then((imageHeadAddress) {
          setState(() {
            imageHeadUrl = imageHeadAddress;
          });
        });
        SharedPreferencesUtils.getUserName().then((name) {
          setState(() {
            nickName = name;
          });
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _refreshEvent();
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.MINE),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: ScreenUtil.getInstance().setHeight(160.0),
            width: double.infinity,
            color: Colors.deepOrangeAccent,
            alignment: Alignment.center,
            child: isLogin
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: ScreenUtil.getInstance().setWidth(100),
                        height: ScreenUtil.getInstance().setHeight(100),
                        margin: EdgeInsets.only(
                            left: ScreenUtil.getInstance().setWidth(30.0)),
                        child: CircleAvatar(
                          radius: ScreenUtil.getInstance().setWidth(50),
                          foregroundColor: Colors.deepOrangeAccent,
                          backgroundImage: NetworkImage(
                            imageHeadUrl,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: ScreenUtil.getInstance().setWidth(10.0)),
                      ),
                      Text(
                        nickName,
                        style: TextStyle(
                            fontSize: ScreenUtil.getInstance().setSp(26.0),
                            color: Colors.white),
                      ),
                      Expanded(
                        child: InkWell(
                            onTap: () => _loginOutDialog(),
                            child: Offstage(
                              offstage: !isLogin,
                              child: Container(
                                padding: EdgeInsets.only(
                                    right:
                                        ScreenUtil.getInstance().setWidth(30)),
                                alignment: Alignment.centerRight,
                                child: Text(
                                  Strings.LOGIN_OUT,
                                  style: TextStyle(
                                      fontSize:
                                          ScreenUtil.getInstance().setSp(26),
                                      color: Colors.white),
                                ),
                              ),
                            )),
                      ),
                    ],
                  )
                : InkWell(
                    onTap: () => _toLogin(),
                    child: Text(
                      Strings.CLICK_LOGIN,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: ScreenUtil.getInstance().setSp(30.0)),
                    ),
                  ),
          ),
          Padding(
            padding:
                EdgeInsets.only(top: ScreenUtil.getInstance().setHeight(20.0)),
          ),
          IconTextArrowView(
              APPIcons.ORDER, Strings.ORDER, Colors.deepPurpleAccent, order),
          Divider(
            height: ScreenUtil.getInstance().setHeight(1.0),
            color: Color(0xffd3d3d3),
          ),
          IconTextArrowView(
              APPIcons.COUPON, Strings.COUPON, Colors.green, mineCoupon),
          Divider(
            height: ScreenUtil.getInstance().setHeight(1.0),
            color: Color(0xffd3d3d3),
          ),
          IconTextArrowView(
              APPIcons.COLLECTION, Strings.COLLECTION, Colors.red, collect),
          Divider(
            height: ScreenUtil.getInstance().setHeight(1.0),
            color: Color(0xffd3d3d3),
          ),
          IconTextArrowView(
              APPIcons.ADDRESS, Strings.ADDRESS, Colors.amber, address),
          Divider(
            height: ScreenUtil.getInstance().setHeight(1.0),
            color: Color(0xffd3d3d3),
          ),
          IconTextArrowView(
              APPIcons.FOOTPRINT, Strings.FOOTPRINT, Colors.pink, footprint),
          Divider(
            height: ScreenUtil.getInstance().setHeight(1.0),
            color: Color(0xffd3d3d3),
          ),
          IconTextArrowView(APPIcons.FEED_BACK, Strings.FEED_BACK,
              Colors.blueAccent, feedbackCallback),
          Divider(
            height: ScreenUtil.getInstance().setHeight(1.0),
            color: Color(0xffd3d3d3),
          ),
          IconTextArrowView(
              APPIcons.ABOUT_US, Strings.ABOUT_US, Colors.teal, aboutUs),
          Divider(
            height: ScreenUtil.getInstance().setHeight(1.0),
            color: Color(0xffd3d3d3),
          ),
        ],
      ),
    );
  }

  _loginOutDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              Strings.TIPS,
              style: TextStyle(
                  fontSize: ScreenUtil.getInstance().setSp(30),
                  color: Colors.black54),
            ),
            content: Text(
              Strings.LOGIN_OUT_TIPS,
              style: TextStyle(
                  fontSize: ScreenUtil.getInstance().setSp(30),
                  color: Colors.black54),
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  Strings.CANCEL,
                  style: TextStyle(color: Colors.black54),
                ),
              ),
              FlatButton(
                onPressed: () => _loginOut(),
                child: Text(
                  Strings.CONFIRM,
                  style: TextStyle(color: Colors.deepOrangeAccent),
                ),
              )
            ],
          );
        });
  }

  _loginOut() {
    _userService.loginOut((success) {
      loginEventBus.fire(LoginEvent(false));
    }, (error) {
      loginEventBus.fire(LoginEvent(false));
      ToastUtil.showToast(error);
    });
    Navigator.pop(context);
  }

  void feedbackCallback() {
    if (isLogin) {
      //NavigatorUtils.goFeedback(context);
    } else {
      _toLogin();
    }
  }

  void mineCoupon() {
    if (isLogin) {
      //NavigatorUtils.goCoupon(context);
    } else {
      _toLogin();
    }
  }

  void footprint() {
    if (isLogin) {
      //NavigatorUtils.goFootprint(context);
    } else {
      _toLogin();
    }
  }

  void collect() {
    if (isLogin) {
      //NavigatorUtils.goCollect(context);
    } else {
      _toLogin();
    }
  }

  void address() {
    if (isLogin) {
      //NavigatorUtils.goAddress(context);
    } else {
      _toLogin();
    }
  }

  void aboutUs() {
    if (isLogin) {
      Routers.pushName(context, RoutePaths.about);
    } else {
      _toLogin();
    }
  }

  void order() {
    if (isLogin) {
      //NavigatorUtils.goOrder(context);

    } else {
      _toLogin();
    }
  }

  _toLogin() {
    Routers.pushName(context, RoutePaths.login);
  }
}
