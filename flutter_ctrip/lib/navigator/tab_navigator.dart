import 'package:flutter/material.dart';
import 'package:flutter_ctrip/dialogs/user_agreement_dialog.dart';
import 'package:flutter_ctrip/pages/destination_page.dart';
import 'package:flutter_ctrip/pages/home_page.dart';
import 'package:flutter_ctrip/pages/my_page.dart';
import 'package:flutter_ctrip/pages/travel_page.dart';

/**
 * 底部导航页
 */
class TabNavigator extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<TabNavigator>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  final _defaultColor = Color(0xff8a8a8a);
  final _activeColor = Color(0xff50b4ed);
  int _currentIndex = 0;
  PageController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = PageController(
      initialPage: 0,
    );

    Future.delayed(Duration(seconds: 1)).then((_) {
      //showDialog();
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  showDialog() {
    showGeneralDialog(
        context: context,
        pageBuilder: (context, anim1, anim2) {},
        barrierColor: Colors.grey.withOpacity(.4),
        barrierDismissible: true,
        barrierLabel: "",
        transitionDuration: Duration(milliseconds: 125),
        transitionBuilder: (context, anim1, anim2, child) {
          return Transform.scale(
              scale: anim1.value,
              child: Opacity(
                  opacity: anim1.value,
                  child: UserAgreementDialog((value) {}, () {})));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: [
          HomePage(),
          DestinationPage(),
          TravelPage(),
          MyPage(),
        ],
        physics:
            NeverScrollableScrollPhysics(), // 列表中嵌套gridView时禁止gridView的滚动事件
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            _controller.animateToPage(index,
                duration: Duration(milliseconds: 260), curve: Curves.easeIn);
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            _tabBarItem(
                "首页", "images/xiecheng.png", "images/xiecheng_active.png", 0),
            _tabBarItem("目的地", "images/mude.png", "images/mude_active.png", 1),
            _tabBarItem("旅拍", "images/lvpai.png", "images/lvpai_active.png", 2),
            _tabBarItem("我的", "images/wode.png", "images/wode_active.png", 3),
          ]),
    );
  }

  _tabBarItem(String title, String imageURL, String activeImageURL, int index) {
    return BottomNavigationBarItem(
      icon: Image.asset(
        imageURL,
        width: 22,
        height: 22,
      ),
      activeIcon: Image.asset(
        activeImageURL,
        width: 22,
        height: 22,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: _currentIndex != index ? _defaultColor : _activeColor,
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
