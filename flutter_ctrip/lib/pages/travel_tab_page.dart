import 'package:flutter/material.dart';

class TravelTabPage extends StatefulWidget {
  final Map arguments;

  const TravelTabPage({Key key, this.arguments}) : super(key: key);
  @override
  _State createState() => _State();
}

class _State extends State<TravelTabPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(widget.arguments["name"]),
    );
  }
}
