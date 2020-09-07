import 'package:flutter/material.dart';

class IOSStyleAlertDialog extends Dialog {
  String title = '';
  String message = '';
  String confirmTitle = '确定';
  String cancelTitle = '取消';
  VoidCallback confirmCallback;
  VoidCallback cancelCallback;

  IOSStyleAlertDialog(
      {this.title,
      this.message,
      this.cancelCallback,
      this.confirmCallback,
      this.confirmTitle,
      this.cancelTitle});

  Widget _title() {
    return Text(
      title,
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
    );
  }

  Widget _message() {
    return Text(
      message,
    );
  }

  Widget _buttons(context) {
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
              flex: 1,
              child: Container(
                child: FlatButton(
                  child: Text(cancelTitle),
                  onPressed: cancelCallback == null
                      ? () {
                          Navigator.pop(context);
                        }
                      : cancelCallback,
                ),
                decoration: BoxDecoration(
                  border: Border(
                      right: BorderSide(width: 1, color: Color(0xffEFEFF4))),
                ),
              )),
          Expanded(
            flex: 1,
            child: FlatButton(
              child: Text(
                confirmTitle,
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () {
                Navigator.pop(context);
                confirmCallback();
              },
            ),
          )
        ],
      ),
    );
  }

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
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                height: 16,
              ),
              _title(),
              _message(),
              SizedBox(
                height: 16,
              ),
              Divider(
                height: 1,
              ),
              _buttons(context),
            ],
          ),
        ),
      ),
    );
  }
}
