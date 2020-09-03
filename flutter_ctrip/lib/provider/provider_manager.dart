import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:flutter_ctrip/provider/app_store.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (_) => AppStore()),
];
