import 'package:dio/dio.dart';
import 'request_method.dart';

class Request {
  String url;
  Method requestMethod;
  Map<String, dynamic> header;
  Map<String, dynamic> params;
  FormData formData;
  int connectTimeout;
  int receiveTimeout;

  Request() {
    this.connectTimeout = 10 * 1000;
    this.receiveTimeout = 20 * 1000;
  }
}
