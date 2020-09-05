import 'package:flutter/material.dart';

class AppBarActions {
  AppBar getAppBar(String title) {
    return AppBar(
      title: Text(title, style: TextStyle(color: Colors.white)),
      backgroundColor: Color(0xffF65C0A),
      centerTitle: false,
      actions: <Widget>[
        Row(
          children: <Widget>[
            Text("4006820016"),
            IconButton(
                icon:
                    Image(image: AssetImage("assets/images/appbar_phone.png")),
                onPressed: () {}),
          ],
        ),
        IconButton(
            icon: Image(image: AssetImage("assets/images/appbar_suggest.png")),
            onPressed: () {
              // do nothing
            }),
        IconButton(
            icon: Image(image: AssetImage("assets/images/appbar_message.png")),
            onPressed: () {
              // do nothing
            }),
      ],
    );
  }
}
