import 'package:flutter/material.dart';
import 'package:flutter_ctrip/util/app_context.dart';

class CoverScreen {
  static int _coverCount = 0;
  static int get coverCount => _coverCount;

  static Duration _duration = Duration(milliseconds: 300);

  OverlayEntry _entry;
  double _opacity = 0;
  bool _isShow = false;

  CoverScreen({@required Widget child, Color bgColor}) {
    _entry = OverlayEntry(builder: (ctx) {
      return AnimatedOpacity(
        opacity: _opacity,
        duration: _duration,
        child: Container(
          width: MediaQuery.of(APPContext.context).size.width, //换成你的屏幕宽
          height: MediaQuery.of(APPContext.context).size.height, //换成你的屏幕高
          color: bgColor,
          child: child,
        ),
      );
    });
  }

  bool get isShow => _isShow;

  //true：正常显示
  //false：本身就已经显示
  bool show() {
    if (_isShow) return false;
    _isShow = true;
    _coverCount++;
    insert();
    Future.delayed(Duration(milliseconds: 30), () {
      _opacity = 1;
      _entry.markNeedsBuild();
    });
    return true;
  }

  //true：正常隐藏
  //false：本身就已经隐藏
  bool hidden() {
    if (_isShow == false) return false;
    _isShow = false;
    _coverCount--;
    _opacity = 0;
    _entry.markNeedsBuild();
    Future.delayed(_duration, () {
      remove();
    });
    return true;
  }

  void insert() {
    //换成你的全局context
    Overlay.of(APPContext.context).insert(_entry);
  }

  void remove() {
    _entry.remove();
  }
}
