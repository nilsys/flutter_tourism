import 'package:dio/dio.dart';
import 'http_request_method.dart';

class Request {
  String url;
  HttpRequestMethod requestMethod;
  Map<String, dynamic> header;
  dynamic params;
  int connectTimeout;
  int receiveTimeout;
  // 是否上传为json数据
  bool isPostJson;
  String savePath;
  String tag;

  Request() {
    isPostJson = false;
    this.connectTimeout = 10 * 1000;
    this.receiveTimeout = 20 * 1000;
  }
}
