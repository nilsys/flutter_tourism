import 'package:flutter/material.dart';

class ScrollViews extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<ScrollViews> {
  // 解决滚动视图冲突问题
  Widget _embeddedScrollViews() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          GridView.count(
            crossAxisCount: 2,
            children: <Widget>[],
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
          ),
          ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return Text("test");
            },
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
