import 'package:flutter/material.dart';

class UIUtil {
  static double getSafeBottomPadding(BuildContext context) {
    return MediaQuery.of(context).padding.bottom;
  }

  static double getSafeTopPadding(BuildContext context) {
    return MediaQuery.of(context).padding.top;
  }
}
