import 'package:flutter/material.dart';

// 可参考：https://www.cnblogs.com/wangjunwei/p/10797864.html
class CurrentIndexProvide with ChangeNotifier {
  int currentIndex = 0;

  changeIndex(int newIndex) {
    currentIndex = newIndex;
    notifyListeners(); //通知
  }
}
