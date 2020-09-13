import 'package:flutter/material.dart';
import 'package:flutter_ctrip/dialogs/loading_dialog.dart';

class LoadingUtil {

  static LoadingUtil _instance = LoadingUtil._init();
  List<BuildContext> _contexts;

  factory LoadingUtil() {
    return _instance;
  }

  LoadingUtil._init() {
    _contexts = List();
  }

  showLoadingDialog(BuildContext context, String loadingText) {
    if(context == null) {
      return;
    }
    Future.delayed(Duration(milliseconds: 200)).then((e) {
      if (_contexts.contains(context)) {
        hiddenDialog(context);
      } else {
        _contexts.add(context);
      }
      showDialog<Null>(
        context: context, //BuildContext对象
        barrierDismissible: false,
        builder: (BuildContext context) {
            return new LoadingDialog( //调用对话框
                text: loadingText ?? "",
            );
        });
      });
  }

  hiddenDialog(BuildContext context) {
    if(context != null) {
      if(_contexts.contains(context)) {
        Navigator.pop(context); //关闭对话框
        _contexts.remove(context);
      }
    }
  }

}