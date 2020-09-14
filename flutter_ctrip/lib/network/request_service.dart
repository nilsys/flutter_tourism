/**
 * File : request_service
 * tips : 网络请求实现类
 * @author : karl.wei
 * @date : 2020-04-06 18:06
 **/

import 'dart:async';
import 'dart:convert';

import 'package:flutter_ctrip/network/http_request_method.dart';

import 'http_api.dart';
import 'http_callbacks.dart';
import 'service_interface.dart';
import 'http_util.dart';
import 'http_request.dart';

class RequestManagement implements NetWorkApi {
  static RequestManagement _internal;

//  工厂模式暴露一个对象
  factory RequestManagement() => _getInternal();

  static RequestManagement _getInternal() {
    if (_internal == null) {
      _internal = new RequestManagement.internal();
    }
    return _internal;
  }

  RequestManagement.internal();

  @override
  Future<Null> toLogin(
      params, HttpSuccessCallback callBack, HttpFailureCallback errorCallback) async {
    Map<String, dynamic> headers = Map<String, dynamic>();
    headers['Accept'] = 'application/json';
    // TODO: implement toLogin
    Request request = new Request();
    request.url = HttpApi.baseApi + HttpApi.login;
    request.params = params;
    request.header = headers;
    // json.encode(params);
    request.requestMethod = HttpRequestMethod.POST;
    HttpUtil()
        .sendRequest(request, successCallback: callBack, errorCallback: errorCallback);
  }

  @override
  Future<Null> travelParams(
      Map<String, dynamic> params, HttpSuccessCallback callBack, HttpFailureCallback errorCallback) {
    // TODO: implement travelParams
    Request request = new Request();
    request.url = "http://www.devio.org/io/flutter_app/json/travel_page.json";
    //request.params = params;
    request.requestMethod = HttpRequestMethod.GET;
    HttpUtil()
        .sendRequest(request, successCallback: callBack, errorCallback: errorCallback);
  }
}
