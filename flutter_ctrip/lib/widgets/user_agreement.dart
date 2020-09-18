import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/// 用户协议中“低调”文本的样式。
final TextStyle _lowProfileStyle = TextStyle(
  fontSize: 12.0,
  color: Color(0xFF4A4A4A),
);

/// 用户协议中“高调”文本的样式。
final TextStyle _highProfileStyle = TextStyle(
  fontSize: 12.0,
  color: Color(0xFF00CED2),
);

/// 自定义的用户协议组件。
class UserAgreement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 文本（`Text`）组件，是一系列具有单一样式的文本。
    // 文本.丰富（`Text.rich`）构造函数，则是使用文字跨度（`TextSpan`）组件创建文本。
    return Text.rich(
      // 文字跨度（`TextSpan`）组件，不可变的文本范围。
      TextSpan(
        // 文本（`text`）属性，跨度中包含的文本。
        text: '登录即同意',
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
            text: '“服务条款”',
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
            text: '“隐私政策”',
            style: _highProfileStyle,
          ),
        ],
      ),
    );
  }
}
