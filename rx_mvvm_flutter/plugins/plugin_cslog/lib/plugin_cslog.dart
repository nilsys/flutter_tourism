import 'dart:async';
import 'package:flutter/services.dart';

class PluginCslog {
  static const MethodChannel _channel = const MethodChannel('plugin_cslog');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static void d(Object message) {
    _channel.invokeMethod('debugLog', {'msg': message});
  }
}
