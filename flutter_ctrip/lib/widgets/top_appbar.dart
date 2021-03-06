import 'package:flutter/material.dart';

class TopAppBar extends AppBar {
  TopAppBar(
    BuildContext context, //上下文，必须
    String titleName, //页面标题，必须
    {
    bool isCenterTitle = true, //是否中间居中，默认中间居中，参数可选
    final actions, //右边部分，可能存放图标，文字等，可能还有点击事件，参数可选
    final backIcon = const Icon(
      Icons.arrow_back_ios,
      color: Colors.grey,
    ), //左边返回箭头图标，默认是<，可自定义，，参数可选也可以是文字
    final String rightText = '', //右边文字，参数可选
    final rightCallback, //右边文字或者图标的点击函数，参数可选
  }) : super(
          title: Text(titleName),
          elevation: 0.0, // 这里设置为0就没有阴影了
          leading: IconButton(
              icon: backIcon, onPressed: () => Navigator.of(context).pop()),
          centerTitle: isCenterTitle,
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    rightCallback();
                  },
                  child: Text(rightText),
                ),
              ),
            ),
          ],
        );
}
