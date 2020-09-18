import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ctrip/model/travel_params_model.dart';
import 'package:flutter_ctrip/network/request_service.dart';
import 'package:flutter_ctrip/section/travel_tab_page.dart';
import 'package:flutter_ctrip/viewmodel/travelParamsViewModel.dart';
import 'package:flutter_ctrip/widgets/top_appbar.dart';
import 'package:provider/provider.dart';
import 'package:flutter_ctrip/util/loading_util.dart';

/**
 * 旅游页
 */
class TravelPage extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<TravelPage> with TickerProviderStateMixin {
  TabController _controller;
  TravelParamsViewModel travelParamsVM;

  Widget _tabBar() {
    return Container(
      color: Colors.white,
      width: double.infinity,
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
        tabs: travelParamsVM.tabs.map<Tab>((Tabs value) {
          return Tab(
            text: value.labelName,
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
          children: travelParamsVM.tabs.map((Tabs value) {
            Map map = new Map();
            map['name'] = value.labelName;
            return TravelTabPage(
              arguments: map,
            );
          }).toList()),
    ));
  }

  @override
  void initState() {
    _controller = TabController(length: 0, vsync: this);
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    if (travelParamsVM == null) {
      LoadingUtil().showLoadingDialog(context, "加载中...");
      travelParamsVM = Provider.of<TravelParamsViewModel>(context);
      // 发起网络请求
      travelParamsVM.loadParamsHandel(context, (bool status) {
        LoadingUtil().hiddenDialog(context);
        if (status == true) {
          _controller = TabController(
              length: travelParamsVM.tabs.length,
              vsync: this); //fix tab label 空白问题
        } else {}
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //travelParamsVM = Provider.of<TravelParamsViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("appBar"),
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        children: [_tabBar(), _tabPageContent()],
      ),
    );
  }
}
