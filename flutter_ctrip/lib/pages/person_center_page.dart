import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

/**
 * 个人中心
 */
class PersonCenterPage extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<PersonCenterPage> {
  static const double IMAGE_ICON_WIDTH = 30.0;
  static const double ARROW_ICON_WIDTH = 16.0;

  var userAvatar;
  var userName;
  var titles = ["我的消息", "阅读记录", "我的博客", "我的问答", "我的活动", "我的团队", "邀请好友"];
  var imagePaths = [
    "images/user1.png",
    "images/user1.png",
    "images/user1.png",
    "images/user1.png",
    "images/user1.png",
    "images/user1.png",
    "images/user1.png"
  ];

  var titleTextStyle = new TextStyle(fontSize: 16.0);
  var rightArrowIcon = new Image.asset(
    'images/user1.png',
    width: ARROW_ICON_WIDTH,
    height: ARROW_ICON_WIDTH,
  );

  final _picker = ImagePicker();
  File _image;

  // 放置到后面，找不到setState， 并且需要给与相应的权限
  Future getImage() async {
    PickedFile image = await _picker.getImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
    }
  }

  Future getLocalImage() async {
    PickedFile image = await _picker.getImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        this._image = File(image.path);
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var listView = new ListView.builder(
      itemBuilder: (context, i) => renderRow(context, i),
      itemCount: titles.length * 2,
    );
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: SafeArea(
          top: false,
          child: Offstage(),
        ),
      ),
      body: listView,
    );
    /*
    return new CustomScrollView(reverse: false, shrinkWrap: false, slivers: <
        Widget>[
      new SliverAppBar(
        pinned: false,
        backgroundColor: Colors.green,
        expandedHeight: 200.0,
        iconTheme: new IconThemeData(color: Colors.transparent),
        flexibleSpace: new InkWell(
            onTap: () {
              userAvatar == null ? debugPrint('登录') : debugPrint('用户信息');
            },
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                userAvatar == null
                    ? new Image.asset(
                        "images/ic_avatar_default.png",
                        width: 60.0,
                        height: 60.0,
                      )
                    : new Container(
                        width: 60.0,
                        height: 60.0,
                        decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.transparent,
                            image: new DecorationImage(
                                image: new NetworkImage(userAvatar),
                                fit: BoxFit.cover),
                            border: new Border.all(
                                color: Colors.white, width: 2.0)),
                      ),
                new Container(
                  margin: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                  child: new Text(
                    userName == null ? '点击头像登录' : userName,
                    style: new TextStyle(color: Colors.white, fontSize: 16.0),
                  ),
                )
              ],
            )),
      ),
      new SliverFixedExtentList(
          delegate:
              new SliverChildBuilderDelegate((BuildContext context, int index) {
            String title = titles[index];
            return new Container(
                alignment: Alignment.centerLeft,
                child: new InkWell(
                  onTap: () {
                    print("the is the item of $title");
                  },
                  child: new Column(
                    children: <Widget>[
                      new Padding(
                        padding:
                            const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
                        child: new Row(
                          children: <Widget>[
                            new Expanded(
                                child: new Text(
                              title,
                              style: titleTextStyle,
                            )),
                            rightArrowIcon
                          ],
                        ),
                      ),
                      new Divider(
                        height: 1.0,
                      )
                    ],
                  ),
                ));
          }, childCount: titles.length),
          itemExtent: 50.0),
    ]);
    */
  }

  renderRow(context, i) {
    final userHeaderHeight = 200.0;
    if (i == 0) {
      var userHeader = new Container(
          height: userHeaderHeight,
          color: Colors.green,
          child: new Center(
              child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              userAvatar == null
                  ? new Image.asset(
                      "images/user1.png",
                      width: 60.0,
                    )
                  : new Container(
                      width: 60.0,
                      height: 60.0,
                      decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.transparent,
                          image: new DecorationImage(
                              image: new NetworkImage(userAvatar),
                              fit: BoxFit.cover),
                          border:
                              new Border.all(color: Colors.white, width: 2.0)),
                    ),
              new Container(
                margin: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                child: new Text(
                  userName == null ? '点击头像登录' : userName,
                  style: new TextStyle(color: Colors.white, fontSize: 16.0),
                ),
              )
            ],
          )));
      return new GestureDetector(
        onTap: () {
          getLocalImage();
        },
        child: userHeader,
      );
    }
    --i;
    if (i.isOdd) {
      return new Divider(
        height: 1.0,
      );
    }
    i = i ~/ 2;
    String title = titles[i];
    var listItemContent = new Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
      child: new Row(
        children: <Widget>[
          new Expanded(
              child: new Text(
            title,
            style: titleTextStyle,
          )),
          rightArrowIcon
        ],
      ),
    );
    return new InkWell(
      child: listItemContent,
      onTap: () {},
    );
  }
}

Widget showCustomScrollView() {
  return new CustomScrollView(
    slivers: <Widget>[
      const SliverAppBar(
        pinned: true,
        expandedHeight: 250.0,
        flexibleSpace: const FlexibleSpaceBar(
          title: const Text('Demo'),
        ),
      ),
      new SliverGrid(
        gridDelegate: new SliverGridDelegateWithMaxCrossAxisExtent(
          //横轴的最大长度
          maxCrossAxisExtent: 200.0,
          //主轴间隔
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
          //横轴间隔
          childAspectRatio: 1.0,
        ),
        delegate: new SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return new Container(
              alignment: Alignment.center,
              color: Colors.teal[100 * (index % 9)],
              child: new Text('grid item $index'),
            );
          },
          childCount: 20,
        ),
      ),
      new SliverFixedExtentList(
        itemExtent: 50.0,
        delegate:
            new SliverChildBuilderDelegate((BuildContext context, int index) {
          return new Container(
            alignment: Alignment.center,
            color: Colors.lightBlue[100 * (index % 9)],
            child: new Text('list item $index'),
          );
        }, childCount: 10),
      ),
    ],
  );
}
