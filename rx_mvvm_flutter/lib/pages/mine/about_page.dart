import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rx_mvvm_flutter/constant/string.dart';
import 'package:rx_mvvm_flutter/widgets/divider_v_line.dart';
import 'package:rx_mvvm_flutter/widgets/item_text.dart';

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.MINE_ABOUT_US),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(ScreenUtil.instance.setWidth(20.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              Strings.MINE_ABOUT_US_CONTENT,
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: ScreenUtil.instance.setSp(26.0)),
            ),
            Padding(
                padding: EdgeInsets.all(ScreenUtil.instance.setHeight(10.0))),
            DividerVLineView(),
            ItemTextView(
                Strings.MINE_ABOUT_AUTHOR_TITLE, Strings.MINE_ABOUT_AUTHOR),
            DividerVLineView(),
            ItemTextView(
                Strings.MINE_ABOUT_EMAIL_TITLE, Strings.MINE_ABOUT_EMAIL),
            DividerVLineView(),
            ItemTextView(Strings.MINE_ABOUT_QQ_TITLE, Strings.MINE_ABOUT_QQ),
            DividerVLineView(),
            ItemTextView(Strings.MINE_ABOUT_WX_TITLE, Strings.MINE_ABOUT_WX),
            DividerVLineView(),
          ],
        ),
      ),
    );
  }
}
