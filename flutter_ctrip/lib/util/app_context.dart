import 'package:flutter/material.dart';
import 'package:flutter_ctrip/util/navigator_state.dart';

class APPContext {
  static BuildContext get context => _context;
  static final _context = navigatorKey.currentState.overlay.context;
}
