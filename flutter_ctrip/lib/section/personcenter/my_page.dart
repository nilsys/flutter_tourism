import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ctrip/widgets/webview.dart';

/**
 * 我的
 */
class MyPage extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return Scaffold(
      body: SafeArea(
          child: WebView(
        url: 'https://m.ctrip.com/webapp/myctrip/',
        hideAppBar: true,
        backForbid: true,
        hideHead: true,
      )),
    );
  }
}
