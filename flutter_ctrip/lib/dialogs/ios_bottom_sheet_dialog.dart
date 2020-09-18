import 'dart:ui';
import 'package:flutter/material.dart';

// 仿ios底部弹出选择视图 ActionSheet  参考地址 https://www.jianshu.com/p/905232502f33
typedef OnItemClickListener = void Function(int index);

class IOSStyleBottomSheetDialog extends StatefulWidget {
  IOSStyleBottomSheetDialog({Key key, this.list, this.onItemClickListener})
      : assert(list != null),
        super(key: key);
  final list;
  final OnItemClickListener onItemClickListener;
  @override
  _State createState() => _State();
}

class _State extends State<IOSStyleBottomSheetDialog> {
  OnItemClickListener onItemClickListener;
  var itemCount;
  double itemHeight = 50;
  var borderColor = Colors.white;
  double circular = 10;
  var textColor = Color(0xff007aff);

  @override
  void initState() {
    super.initState();
    onItemClickListener = widget.onItemClickListener;
  }

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    Size screenSize = MediaQuery.of(context).size;

    var deviceWidth = orientation == Orientation.portrait
        ? screenSize.width
        : screenSize.height;
    // print('devide width');
    // print(deviceWidth);

    /// *2-1是为了加分割线
    itemCount = (widget.list.length * 2 - 1);
    var height = ((widget.list.length + 1) * (itemHeight + 1) + 10).toDouble();
    var cancelContainer = SafeArea(
        bottom: true,
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
              height: itemHeight,
              margin: EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                color: Colors.white, // 底色
                borderRadius: BorderRadius.circular(circular),
              ),
              alignment: Alignment.center,
              child: Text(
                "取消",
                style: TextStyle(
                    fontFamily: 'Robot',
                    fontWeight: FontWeight.normal,
                    decoration: TextDecoration.none,
                    color: textColor,
                    fontSize: 18),
              )),
        ));
    var listview = ListView.builder(
        itemCount: itemCount,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return getItemContainer(context, index);
        });

    var totalContainer = Container(
      height: height + 10,
      width: deviceWidth * 0.98,
      // color: Colors.red,
      child: Column(
        children: <Widget>[
          new Expanded(child: listview),
          new Container(
            child: cancelContainer,
            margin: const EdgeInsets.only(top: 10, bottom: 10),
          )
        ],
      ),
    );

    var stack = Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Positioned(
          // bottom: 0,
          child: totalContainer,
        ),
      ],
    );
    return stack;
  }

  Widget getItemContainer(BuildContext context, int index) {
    if (widget.list == null) {
      return Container();
    }
    if (index.isOdd) {
      return Container(
        child: new Container(
          height: 1,
          margin: EdgeInsets.only(left: 10, right: 10),
          color: Color(0xffeeeeee),
        ),
      );
    }

    var borderRadius;
    var margin;
    var isFirst = false;
    var isLast = false;

    /// 只有一个元素
    if (widget.list.length == 1) {
      borderRadius = BorderRadius.circular(circular);
      margin = EdgeInsets.only(bottom: 10, left: 10, right: 10);
    } else if (widget.list.length > 1) {
      /// 第一个元素
      if (index == 0) {
        isFirst = true;
        borderRadius = BorderRadius.only(
            topLeft: Radius.circular(circular),
            topRight: Radius.circular(circular));
        margin = EdgeInsets.only(
          left: 10,
          right: 10,
        );
      } else if (index == itemCount - 1) {
        isLast = true;

        /// 最后一个元素
        borderRadius = BorderRadius.only(
            bottomLeft: Radius.circular(circular),
            bottomRight: Radius.circular(circular));
        margin = EdgeInsets.only(left: 10, right: 10);
      } else {
        /// 其他位置元素
        margin = EdgeInsets.only(left: 10, right: 10);
      }
    }
    var isFirstOrLast = isFirst || isLast;
    int listIndex = index ~/ 2;
    var text = widget.list[listIndex];
    var contentText = Text(
      text,
      style: TextStyle(
          fontWeight: FontWeight.normal,
          decoration: TextDecoration.none,
          color: textColor,
          fontSize: 18),
    );

    var center;
    if (!isFirstOrLast) {
      center = Center(
        child: contentText,
      );
    }
    var itemContainer = Container(
        height: itemHeight,
        margin: margin,
        decoration: BoxDecoration(
          color: Colors.white, // 底色
          borderRadius: borderRadius,
          // border: border,
        ),
        child: center);
    var onTap2 = () {
      if (onItemClickListener != null) {
        onItemClickListener(listIndex);
      }
    };
    var stack = Stack(
      alignment: Alignment.center,
      children: <Widget>[itemContainer, contentText],
    );
    var getsture = GestureDetector(
      onTap: onTap2,
      child: isFirstOrLast ? stack : itemContainer,
    );
    return getsture;
  }
}

/*
_showIOSStyleBottomSheet(context) {
var labelList = ['str1', 'str2', 'str3'];
showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return IOSStyleBottomSheetDialog(
          list: labelList,
          onItemClickListener: (index) async {
            String label = labelList[index];
            Navigator.pop(context);
          },
        );
      }
    );
}
*/
