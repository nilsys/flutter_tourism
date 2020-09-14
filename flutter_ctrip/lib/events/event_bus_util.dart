import 'package:event_bus/event_bus.dart';
export 'dart:async';

// 参考：https://www.jianshu.com/p/06de35647b6f
class EventBusUtil {
  static EventBus _eventBus;

  static EventBus getInstance() {
    if (_eventBus == null) {
      _eventBus = new EventBus();
    }
    return _eventBus;
  }
}

class PageEvent {
  String test;
  PageEvent(this.test);
}
