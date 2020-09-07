import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/**
 * 首页启动app 用户协议和隐私政策的弹窗
 */
// 自定义block
typedef UserAgreementCallback = void Function(String value);

class UserAgreementDialog extends Dialog {
  final UserAgreementCallback tapCallback;
  final VoidCallback cancelCallback;

  UserAgreementDialog(this.tapCallback, this.cancelCallback);

  /// 用户协议中“低调”文本的样式。
  final TextStyle _lowProfileStyle = TextStyle(
    fontSize: 13.0,
    color: Color(0xFF4A4A4A),
  );

  /// 用户协议中“高调”文本的样式。
  final TextStyle _highProfileStyle = TextStyle(
    fontSize: 13.0,
    color: Color(0xFF00CED2),
  );

  Widget _title() {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(top: 20, left: 15),
      child: Text(
        "个人信息保护指引",
        textAlign: TextAlign.left,
        style: TextStyle(fontSize: 15),
      ),
    );
  }

  Widget _content() {
    return Container(
      margin: EdgeInsets.only(top: 15, left: 15, right: 15),
      child: SingleChildScrollView(
        child: Text.rich(
          // 文字跨度（`TextSpan`）组件，不可变的文本范围。
          TextSpan(
            text: '1.在浏览使用时，我们会收集、使用设备标识信息用于推荐。\n2.你可以查看完整版',
            // 样式（`style`）属性，应用于文本和子组件的样式。
            style: _lowProfileStyle,
            children: [
              TextSpan(
                // 识别（`recognizer`）属性，一个手势识别器，它将接收触及此文本范围的事件。
                // 手势（`gestures`）库的点击手势识别器（`TapGestureRecognizer`）类，识别点击手势。
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    print('点击了“服务条款”');
                  },
                text: '《用户协议》',
                style: _highProfileStyle,
              ),
              TextSpan(
                text: '和',
                style: _lowProfileStyle,
              ),
              TextSpan(
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    print('点击了“隐私政策”');
                  },
                text: '《隐私政策》',
                style: _highProfileStyle,
              ),
              TextSpan(
                text:
                    '以便了解我们收集、使用、共享、存储信息的情况，以及对信息的保护措施。\n如你同意，请点击“同意”开始接受我们的服务。\n',
                style: _lowProfileStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buttons(context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FlatButton(
              child: Text('不同意'),
              color: Colors.orange,
              onPressed: () {
                exit(0);
              }),
          FlatButton(
              child: Text('同意'),
              color: Colors.blue,
              onPressed: () {
                Navigator.pop(context);
              }),
        ],
      ),
    );
  }

  /*
  // 取消和确定按钮
  Widget _buttons(context) {
    return Container(
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: Container(
                child: FlatButton(
                    child: Text('不同意'),
                    onPressed: () {
                      exit(0);
                    }),
                decoration: BoxDecoration(
                  border: Border(
                      right: BorderSide(width: 1, color: Color(0xffEFEFF4))),
                ),
              )),
          Expanded(
              flex: 1,
              child: Container(
                child: FlatButton(
                    child: Text('同意'),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
              )),
        ],
      ),
    );
  }
  */

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      shadowColor: Colors.transparent,
      child: Center(
          child: Container(
        margin: EdgeInsets.only(left: 40, right: 40),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [_title(), _content(), _buttons(context)],
        ),
      )),
    );
  }
}
