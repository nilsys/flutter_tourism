import 'package:flutter/material.dart';
import 'package:flutter_ctrip/pages/travel_tab_page.dart';

/**
 * 旅游页
 */
class TravelPage extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<TravelPage> with TickerProviderStateMixin {
  TabController _controller;
  List<String> tabs = [
    "测试一",
    "测试一",
    "测试一",
    "测试一",
    "测试一",
    "测试一",
    "测试一",
    "测试一",
    "测试一",
    "测试一"
  ];

  Widget _appBar() {
    return Container(
      padding: EdgeInsets.fromLTRB(8, 8, 6, 0),
      decoration: BoxDecoration(color: Colors.white),
      child: SafeArea(
        child: Text('appBar'),
      ),
    );
  }

  Widget _tabBar() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(left: 2),
      child: TabBar(
        controller: _controller,
        isScrollable: true,
        labelColor: Colors.black,
        labelPadding: EdgeInsets.fromLTRB(8, 6, 8, 0),
        indicatorColor: Color(0xff2FCFBB),
        indicatorPadding: EdgeInsets.all(6),
        indicatorSize: TabBarIndicatorSize.label,
        indicatorWeight: 2.2,
        labelStyle: TextStyle(fontSize: 15),
        unselectedLabelStyle: TextStyle(fontSize: 15),
        tabs: tabs.map<Tab>((String value) {
          return Tab(
            text: value,
          );
        }).toList(),
      ),
    );
  }

  Widget _tabPageContent() {
    return Flexible(
        child: Container(
      padding: EdgeInsets.fromLTRB(6, 3, 6, 0),
      child: TabBarView(
          controller: _controller,
          children: tabs.map((String value) {
            Map map = new Map();
            map['name'] = value;
            return TravelTabPage(
              arguments: map,
            );
          }).toList()),
    ));
  }

  void _loadParams() {
    /*
    TravelParamsDao.fetch().then((TravelParamsModel model) {
      setState(() {
        travelParamsModel = model;
      });
      _loadTab();
    }).catchError((e) {
      print(e);
    });
    */
  }

  void _loadTab() {
    /*
    TravelTabDao.fetch().then((TravelTabModel model) {
      _controller = TabController(
          length: model.district.groups.length,
          vsync: this); //fix tab label 空白问题
      setState(() {
        tabs = model.district.groups;
        travelTabModel = model;
      });
    }).catchError((e) {
      print(e);
    });
    */
  }

  @override
  void initState() {
    _controller = TabController(length: 0, vsync: this);
    _loadParams();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [_appBar(), _tabBar(), _tabPageContent()],
      ),
    );
  }
}
