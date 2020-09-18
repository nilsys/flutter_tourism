import 'package:flutter/material.dart';

class GridViews extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<GridViews> {
  Widget _randerItem(context, index) {
    return Text(index.toString());
  }

  Widget _gridView() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //横轴元素个数
          crossAxisCount: 2,
          //纵轴间距
          mainAxisSpacing: 10.0,
          //横轴间距
          crossAxisSpacing: 10.0,
          //子组件宽高长度比例
          childAspectRatio: 1.4),
      itemBuilder: (context, index) => _randerItem(context, index),
      itemCount: 10,
    );
  }

  /**
   1、gridView 嵌套进ListView 不能滚动：增加 physics: new NeverScrollableScrollPhysics();
   2、gridView 嵌套进ListView 报错： 增加shrinkWrap: true,
   */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GridViews"),
      ),
      body: _gridView(),
    );
  }
}
