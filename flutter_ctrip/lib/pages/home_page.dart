import 'package:flutter/material.dart';
import 'package:flutter_ctrip/generated/i18n.dart';

/**
 * 首页
 */
class HomePage extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(I18n.of(context).text),
    );
  }
}
