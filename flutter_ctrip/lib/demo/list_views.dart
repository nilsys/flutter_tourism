import 'package:flutter/material.dart';
import 'package:flutter_ctrip/widgets/refresh_widget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

/**
 * 动态数据ListView
 */
class ListViews extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<ListViews> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  Widget _randerRow(context, index) {
    return Text(index.toString());
  }

  // 1
  Widget _dynamicListView() {
    return ListView.builder(
        itemBuilder: (context, index) => _randerRow(context, index));
  }

  // 2
  Widget _separatedListView() {
    return ListView.separated(
        itemBuilder: (context, index) => _randerRow(context, index),
        separatorBuilder: (BuildContext context, int index) {
          return new Container(height: 1.0, color: Colors.red);
        },
        itemCount: 40);
  }

  // 3
  Widget _staticListView() {
    return CustomScrollView(
      shrinkWrap: true,
      slivers: <Widget>[
        new SliverPadding(
          padding: const EdgeInsets.all(20.0),
          sliver: new SliverList(
              delegate: new SliverChildListDelegate(<Widget>[
            const Text('I\'m dedicating every day to you'),
            const Text('Domestic life was never quite my style'),
            const Text('When you smile, you knock me out, I fall apart'),
            const Text('And I thought I was so smart'),
            const Text('I\'m dedicating every day to you'),
            const Text('Domestic life was never quite my style'),
            const Text('When you smile, you knock me out, I fall apart'),
            const Text('And I thought I was so smart'),
          ])),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DynamicListView"),
      ),
      body: SmartRefresher(
        controller: _refreshController,
        enablePullDown: true,
        enablePullUp: true,
        header: RefresherHeader(),
        footer: RefresherFooter(),
        onRefresh: () {
          _refreshController.refreshCompleted();
        },
        onLoading: () {
          _refreshController.loadComplete();
          //_refreshController.loadNoData();
          //_refreshController.resetNoData();
        },
        child: _dynamicListView(),
      ),
    );
  }
}
