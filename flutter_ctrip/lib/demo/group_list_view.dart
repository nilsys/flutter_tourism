import 'package:flutter/material.dart';
import 'package:flutter_ctrip/demo/utils/list_view_group.dart';

class GroupListView extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<GroupListView> {
  ListViewGroupHandler _groupHandler;
  List datas = ["1233", "1233"];

//每次刷新的时候调用
  void _reloadData() {
    _groupHandler = ListViewGroupHandler(
      numberOfSections: datas.length,
      numberOfRowsInSection: (section) {
        return 10;
      },
      headerForSection: (section) {
        return _listSectionHeaderWidget(section);
      },
      cellForRowAtIndexPath: (indexPath) {
        print(indexPath.section);
        print(indexPath.row);
        return _listRanderRowWidget(indexPath);
      },
      header: () {
        return Container(
          height: 50,
          width: double.infinity,
          color: Colors.redAccent,
        );
      },
      footer: () {
        return Container(
          height: 50,
          width: double.infinity,
          color: Colors.greenAccent,
        );
      },
    );
  }

  _listSectionHeaderWidget(section) {
    return Text("sectionHeader" + section.toString());
  }

  _listRanderRowWidget(indexPath) {
    return Text("row" + indexPath.row.toString());
  }

  _listViewWidget() {
    return ListView.builder(
      itemCount: _groupHandler.allItemCount,
      itemBuilder: (context, index) {
        return _groupHandler.cellAtIndex(index);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _listViewWidget(),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    _reloadData();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
