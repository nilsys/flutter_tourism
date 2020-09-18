import 'package:flutter/material.dart';

class ExpandableListView extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<ExpandableListView> {
  final list = List.generate(10, (i) => "这是第$i个item数据");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        //build的item为header的内容
        itemBuilder: (context, index) {
          return ExpansionTile(
            title: Text("这是第$index个"),
            children: list.map((f) => ListTile(title: Text(f))).toList(),
          );
        },
        itemCount: 5,
      ),
    );
  }
}
