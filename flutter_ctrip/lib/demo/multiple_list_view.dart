import 'package:flutter/material.dart';
import 'package:flutter_ctrip/demo/utils/base_list_view_model.dart';

class MultipleListView extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MultipleListView> {
  List<BaseListViewModel> datas = List();
  ScrollController _scrollController = ScrollController();

  Widget _buildItemWidget(BuildContext context, int index) {
    // 1、可以model继承(多个model)
    // 2、使用类型
    BaseListViewModel model = datas[index];
    if (model is Map) {}
  }

  // header内容
  Widget _randerHeaderWidget(BuildContext context, int index) {
    return new Text('我是header');
  }

  // footer内容
  Widget _randerFooterWidget(BuildContext context, int index) {
    return new Text('我是footer');
  }

  // SectionFooter
  Widget _randerSectionFooterWidget(BuildContext context, int index) {
    return new Text('SectionFooter');
  }

  // SectionHeader
  Widget _randerSectionHeaderWidget(BuildContext context, int index) {
    return new Text('SectionHeader');
  }

  // SectionHeader
  Widget _randerRowItemWidget(BuildContext context, int index) {
    return new Text('Item');
  }

  int _getItemListCount() {
    return datas.length;
  }

  Widget _listView() {
    return ListView.builder(
      controller: _scrollController,
      itemCount: _getItemListCount(),
      itemBuilder: (BuildContext context, int index) {
        return _buildItemWidget(context, index);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HeaderFooterListView"),
      ),
      body: _listView(),
    );
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
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
}
