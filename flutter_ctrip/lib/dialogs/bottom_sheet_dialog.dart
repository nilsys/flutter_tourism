import 'package:flutter/material.dart';

typedef BottomSheetCallback = void Function(String value);

class BottomSheetDialog extends Dialog {
  List<String> datas = [];
  String cancelTitle = '取消';
  BottomSheetCallback confirmCallback;
  VoidCallback cancelCallback;

  BottomSheetDialog(
      {this.datas,
      this.cancelTitle,
      this.cancelCallback,
      this.confirmCallback});

  Widget _randerRow(context, String item, int index) {
    print("index:" + index.toString());
    return Column(
      children: [
        GestureDetector(
          child: Container(
            height: 40,
            color: Colors.white,
            child: new Text(item),
            width: double.infinity,
            alignment: Alignment.center,
          ),
          onTap: () {
            if (confirmCallback != null) {
              confirmCallback(item);
            }
            Navigator.of(context).pop();
          },
        ),
        Container(
          color: Colors.grey,
          height: (index != datas.length - 1) ? 0.5 : 0.0,
        ),
      ],
    );
  }

  _items(context) {
    /*
    List<Widget> subItems = List<Widget>.from(datas
        .asMap()
        .keys
        .map((index) => _randerRow(datas[index], index))
        .toList());
        */

    List<Widget> subItems = datas.asMap().keys.map((i) {
      return _randerRow(context, datas[i], i);
    }).toList();

    List<Widget> items = new List();
    items.addAll(subItems);

    Widget sizeBox = Container(
      color: Colors.transparent,
      height: 10,
    );
    items.add(sizeBox);

    Widget cancel = GestureDetector(
      child: Container(
        height: 40,
        color: Colors.white,
        child: new Text(cancelTitle),
        width: double.infinity,
        alignment: Alignment.center,
      ),
      onTap: () {
        if (cancelCallback != null) {
          cancelCallback();
        }
        Navigator.of(context).pop();
      },
    );
    items.add(cancel);
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      shadowColor: Colors.transparent,
      child: Container(
        margin: EdgeInsets.only(left: 0, right: 0),
        color: Colors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: _items(context),
        ),
      ),
    );
  }
}
