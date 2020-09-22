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

/**
 使用：
 1、第二个页面发送通知(发送订阅消息传值)：EventBusUtil.getInstance().fire(PageEvent('login'));
 2、第一个页面监听和移除
   @override
  void initState() {
    super.initState();
    //监听登录事件
    _event = EventBusUtil.getInstance().on<PageEvent>().listen((data) {
      if (data.test == 'login') {
        setState(() {
          _lodinState = '通知我登录成功了';
        });
      }else{
        setState(() {
          _logoutState = '通知我退出登录成功了';
        });
      }
    });
  }

  EventBusUtil.getInstance().on<PageEvent>().listen((data) {
                print('${data.test}');
                sss.cancel();
              });

 @override
  void dispose() {
    super.dispose();
    //移除监听机制
    _event.cancel();
  }

 */
